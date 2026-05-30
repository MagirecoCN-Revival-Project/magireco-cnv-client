package io.kamihama.cnv;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/**
 * 基于 {@link HttpURLConnection} 的轻量 HTTP 工具。
 *
 * <p>提供三个能力：
 * <ul>
 *   <li>{@link #getString(String, int)} —— 同步 GET 拿 UTF-8 文本，
 *       用于小配置/JSON/XML。</li>
 *   <li>{@link #downloadResume(String, File, long, int, ProgressSink)}
 *       —— 单线程 HTTP Range 断点续传下载。</li>
 *   <li>{@link #downloadChunked(String, File, long, int, int, ProgressSink)}
 *       —— 多线程分片并行下载。先 HEAD 探测服务端是否支持
 *       Range 请求；不支持 / 不能确定总大小时自动回落到
 *       {@link #downloadResume}。</li>
 * </ul>
 *
 * <p>下载文件的断点状态写到同目录 {@code <target>.cnvprog} 元数据
 * 文件中（每分片已下载字节数），下次启动可基于它恢复。下载
 * 成功后元数据文件被删除。
 */
public final class Net {
    /** 所有请求统一带这个 User-Agent。 */
    public static final String UA = "Magireco-CNV-Bootstrap/1.0";

    /**
     * getString / postJson / getStringWithToken 读入内存的响应体上限（64 MB）。
     * 这些接口只用于控制面 JSON / S3 清单，正常体量在 KB~MB 级；
     * 设上限防止被攻陷的服务端用超大响应耗尽内存（OOM crash）。
     */
    private static final long MAX_IN_MEMORY_RESPONSE = 64L * 1024 * 1024;

    /** 把 InputStream 读成 UTF-8 字符串，超过 {@link #MAX_IN_MEMORY_RESPONSE} 抛 IOException。 */
    private static String readCapped(InputStream is) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        long total = 0;
        while ((n = is.read(buf)) > 0) {
            total += n;
            if (total > MAX_IN_MEMORY_RESPONSE) {
                throw new IOException("响应体超过上限 " + MAX_IN_MEMORY_RESPONSE + " 字节");
            }
            baos.write(buf, 0, n);
        }
        return baos.toString("UTF-8");
    }

    private Net() {}

    /**
     * 下载进度回调。下载器会以 ~500ms 节流的频率调 {@link #onProgress}，
     * 让 UI 端从中拿到当前已下载字节、总字节（未知时为 -1）和瞬时速率。
     */
    public interface ProgressSink {
        /**
         * @param soFar           已下载字节数
         * @param total           总字节数；未知时为 -1
         * @param instantSpeedBps 瞬时速率（字节/秒）
         */
        void onProgress(long soFar, long total, long instantSpeedBps);

        /** UI 端反馈是否已取消（按 back / 主动退出等）。返回 {@code true} 会让下载抛 IOException。 */
        boolean isCancelled();
    }

    /** GET 一个 URL，把响应体当 UTF-8 字符串返回。 */
    public static String getString(String url, int timeoutMs) throws IOException {
        HttpURLConnection c = openConnection(url, timeoutMs);
        c.setRequestMethod("GET");
        int code = c.getResponseCode();
        if (code >= 400) {
            try { c.disconnect(); } catch (Throwable ignore) {}
            throw new IOException("HTTP " + code + " for " + url);
        }
        try (InputStream is = c.getInputStream()) {
            return readCapped(is);
        } finally {
            try { c.disconnect(); } catch (Throwable ignore) {}
        }
    }

    /**
     * POST 一段 UTF-8 JSON 字符串，把响应体当 UTF-8 字符串返回。
     *
     * <p>HTTP &ge; 400 时把 errorStream 的内容塞进抛出的 {@link IOException}
     * 的 message——便于上层把"服务端拒绝 + 拒绝理由"一起转给用户。
     */
    public static String postJson(String url, String jsonBody, int timeoutMs) throws IOException {
        HttpURLConnection c = openConnection(url, timeoutMs);
        c.setRequestMethod("POST");
        c.setDoOutput(true);
        c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
        c.setRequestProperty("Accept", "application/json");
        byte[] payload = jsonBody.getBytes("UTF-8");
        c.setFixedLengthStreamingMode(payload.length);
        try {
            try (java.io.OutputStream os = c.getOutputStream()) {
                os.write(payload);
            }
            int code = c.getResponseCode();
            InputStream is = (code >= 400) ? c.getErrorStream() : c.getInputStream();
            String body = "";
            if (is != null) {
                try {
                    body = readCapped(is);
                } finally {
                    try { is.close(); } catch (Throwable ignore) {}
                }
            }
            if (code >= 400) {
                throw new IOException("HTTP " + code + " for " + url
                        + (body.isEmpty() ? "" : " : " + body));
            }
            return body;
        } finally {
            try { c.disconnect(); } catch (Throwable ignore) {}
        }
    }

    /**
     * 单线程带断点续传的下载。
     *
     * <p>若 {@code target} 已存在则发起 {@code Range: bytes=existing-} 请求
     * 续传；服务端不支持时返回 200 而非 206，本方法会清空文件从头开始。
     *
     * <p>"已完成"的判定：仅在 {@code expectedTotal > 0} **且**
     * {@code target.length() == expectedTotal} 时认为已经下载完毕，
     * 不再发起请求。当 expectedTotal 未知（{@code -1}）时，永远不
     * 把"文件已存在但不知道是否完整"当成完成状态。
     *
         */
    public static void downloadResume(String url, File target, long expectedTotal,
                                      int connectTimeoutMs, ProgressSink sink) throws IOException {
        File parent = target.getParentFile();
        if (parent != null && !parent.exists()) parent.mkdirs();
        // 如果之前 downloadChunked 跑过一半留下了 .cnvprog 残骸，target
        // 文件就是被 raf.setLength 撑出来的零字节占位、不是真实数据；
        // 这种情况下不能按"已有 existing 字节"续传——会把零字节当成
        // 真实内容拼到末尾。一律截断 + 删 meta，从头来过。
        File chunkMeta = new File(target.getAbsolutePath() + ".cnvprog");
        if (chunkMeta.exists()) {
            try { new RandomAccessFile(target, "rw").setLength(0); } catch (Throwable ignore) {}
            try { chunkMeta.delete(); } catch (Throwable ignore) {}
        }
        long existing = target.exists() ? target.length() : 0L;
        if (expectedTotal > 0 && existing == expectedTotal) {
            // 严格相等才算完成；半下载文件不会被误判
            if (sink != null) sink.onProgress(expectedTotal, expectedTotal, 0L);
            return;
        }
        // 如果本地文件比期望还大，说明上次写入有异常，重新来过
        if (expectedTotal > 0 && existing > expectedTotal) {
            existing = 0;
            try { new RandomAccessFile(target, "rw").setLength(0); } catch (Throwable ignore) {}
        }
        HttpURLConnection c = openConnection(url, connectTimeoutMs);
        c.setRequestMethod("GET");
        if (existing > 0) c.setRequestProperty("Range", "bytes=" + existing + "-");
        c.connect();
        int code = c.getResponseCode();
        if (existing > 0 && code != 206 && code != 200) {
            try { c.disconnect(); } catch (Throwable ignore) {}
            throw new IOException("HTTP " + code + " for resume " + url);
        }
        if (existing == 0 && code != 200) {
            try { c.disconnect(); } catch (Throwable ignore) {}
            throw new IOException("HTTP " + code + " for " + url);
        }
        long total = expectedTotal;
        if (total <= 0) {
            long contentLen = parseLongHeader(c, "Content-Length");
            if (contentLen > 0) total = existing + contentLen;
        }

        try (InputStream is = new BufferedInputStream(c.getInputStream(), 1 << 16);
             RandomAccessFile out = new RandomAccessFile(target, "rw")) {
            if (existing > 0 && code == 206) {
                out.seek(existing);
            } else {
                out.setLength(0);
                existing = 0;
            }

            byte[] buf = new byte[1 << 15];
            long soFar = existing;
            long windowStart = System.nanoTime();
            long windowBytes = 0;
            int n;
            while ((n = is.read(buf)) > 0) {
                if (sink != null && sink.isCancelled()) {
                    throw new IOException("已取消");
                }
                out.write(buf, 0, n);
                soFar += n;
                windowBytes += n;
                long now = System.nanoTime();
                long elapsedMs = (now - windowStart) / 1_000_000L;
                if (elapsedMs >= 500) {
                    long bps = elapsedMs > 0 ? (windowBytes * 1000L / elapsedMs) : 0L;
                    if (sink != null) sink.onProgress(soFar, total, bps);
                    windowStart = now;
                    windowBytes = 0;
                }
            }
            if (sink != null) sink.onProgress(soFar, total > 0 ? total : soFar, 0L);
            // 收尾健全性检查：实际下载字节数必须达到 expectedTotal
            if (expectedTotal > 0 && soFar < expectedTotal) {
                throw new IOException("下载提前结束：" + soFar + " / " + expectedTotal);
            }
        } finally {
            try { c.disconnect(); } catch (Throwable ignore) {}
        }
    }

    /**
     * 多线程分片并行下载。
     *
     * <p>步骤：
     * <ol>
     *   <li>HEAD 探测服务端是否支持 Range（{@code Accept-Ranges: bytes}）；
     *       若不支持 / Content-Length 未知 / 期望大小未知 / chunks &le; 1
     *       则直接走 {@link #downloadResume} 单线程逻辑。</li>
     *   <li>提前预分配 {@code target} 的长度为 {@code expectedTotal}。</li>
     *   <li>创建 {@code chunks} 个工作线程，每个线程负责一段
     *       {@code [start, end]} 字节，独立 {@link RandomAccessFile}
     *       打开 {@code target} 并 {@code seek} 到自己的起点写入；
     *       多线程对同一个文件不重叠区域并发写入对 ext4/F2FS 都安全。</li>
     *   <li>每个分片把已下载字节数实时写到同目录的 {@code <target>.cnvprog}
     *       元数据中，重启时可基于该文件恢复已经下完的分片。</li>
     *   <li>所有分片完成后删除元数据文件，并对实际文件大小做一次
     *       collectionequal-to-expected 校验。</li>
     * </ol>
     *
     * <p>任何分片失败都会抛 {@link IOException}，调用方应在外层做"换
     * 镜像/换线路"重试。
     */
    public static void downloadChunked(String url, File target,
                                       long expectedTotal, int chunks,
                                       int connectTimeoutMs,
                                       ProgressSink sink) throws IOException {
        if (chunks <= 1 || expectedTotal <= 0) {
            downloadResume(url, target, expectedTotal, connectTimeoutMs, sink);
            return;
        }
        if (!serverSupportsRange(url, connectTimeoutMs)) {
            // 服务端不支持 Range，退回到单线程
            downloadResume(url, target, expectedTotal, connectTimeoutMs, sink);
            return;
        }

        File parent = target.getParentFile();
        if (parent != null && !parent.exists()) parent.mkdirs();
        File meta = new File(target.getAbsolutePath() + ".cnvprog");

        // 校正旧状态：若本地已存在的文件大小恰好等于 expectedTotal 且
        // 没有元数据残留，说明上一次完整跑完。直接报完成。
        //
        // ⚠ 注意：这条早退分支严格依赖"成功完成后才删 meta、开始任何
        // 写盘前先创建 meta"——见下面 raf.setLength 后立刻 saveProgressMeta
        // 的那一行。否则会出现"上次没下完但 meta 没来得及写盘 → 这次
        // target 已经被 pre-allocate 到 expectedTotal → 被误判为完成"
        // 的 bug。
        if (target.exists() && target.length() == expectedTotal && !meta.exists()) {
            if (sink != null) sink.onProgress(expectedTotal, expectedTotal, 0L);
            return;
        }

        // 计算每分片大小
        final long chunkSize = (expectedTotal + chunks - 1) / chunks;
        final long[] starts = new long[chunks];
        final long[] ends   = new long[chunks];
        final long[] done   = new long[chunks];
        for (int i = 0; i < chunks; i++) {
            starts[i] = i * chunkSize;
            ends[i]   = Math.min(starts[i] + chunkSize - 1, expectedTotal - 1);
            done[i]   = 0;
        }
        loadProgressMeta(meta, expectedTotal, chunks, done);

        // 预分配
        try (RandomAccessFile raf = new RandomAccessFile(target, "rw")) {
            raf.setLength(expectedTotal);
        }
        // ✅ 立刻把 meta 落盘——这一步是上面"早退判定"正确性的前提：
        // 只要预分配做过，meta 就必须存在；只有最后真正下完才会
        // 在 `meta.delete()` 那里清掉它。中间任何快速失败的场景，
        // meta 留着，下一次再调进来才会真正走重试逻辑。
        saveProgressMeta(meta, expectedTotal, done);

        final AtomicLong totalDone = new AtomicLong(0);
        for (int i = 0; i < chunks; i++) totalDone.addAndGet(done[i]);
        final long initialDone = totalDone.get();

        final AtomicReference<IOException> firstErr = new AtomicReference<>(null);
        final AtomicLong windowStart = new AtomicLong(System.nanoTime());
        final AtomicLong windowBytes = new AtomicLong(0L);

        ExecutorService pool = Executors.newFixedThreadPool(chunks, r -> {
            Thread t = new Thread(r, "cnv-chunk");
            t.setDaemon(true);
            return t;
        });
        CountDownLatch latch = new CountDownLatch(chunks);
        for (int i = 0; i < chunks; i++) {
            final int idx = i;
            pool.submit(() -> {
                try {
                    downloadOneChunk(url, target, starts[idx], ends[idx], done, idx,
                            connectTimeoutMs, meta, expectedTotal,
                            totalDone, windowStart, windowBytes,
                            sink);
                } catch (Throwable t) {
                    firstErr.compareAndSet(null,
                            t instanceof IOException ? (IOException) t :
                                    new IOException(t.getMessage(), t));
                } finally {
                    latch.countDown();
                }
            });
        }
        try { latch.await(); } catch (InterruptedException ie) {
            Thread.currentThread().interrupt();
            firstErr.compareAndSet(null, new IOException("已取消"));
        }
        pool.shutdown();
        try { pool.awaitTermination(5, TimeUnit.SECONDS); } catch (InterruptedException ignore) {}

        if (firstErr.get() != null) {
            // 保留元数据文件，下一轮可以从断点处继续
            throw firstErr.get();
        }

        // 严格校验
        long actual = target.length();
        if (actual != expectedTotal) {
            throw new IOException("下载完成后大小不一致：" + actual + " / " + expectedTotal);
        }
        try { meta.delete(); } catch (Throwable ignore) {}
        if (sink != null) sink.onProgress(expectedTotal, expectedTotal, 0L);
    }

    private static void downloadOneChunk(String url, File target,
                                         long chunkStart, long chunkEnd,
                                         long[] done, int idx,
                                         int connectTimeoutMs,
                                         File metaFile, long expectedTotal,
                                         AtomicLong totalDone,
                                         AtomicLong windowStart,
                                         AtomicLong windowBytes,
                                         ProgressSink sink) throws IOException {
        long chunkLen = chunkEnd - chunkStart + 1;
        if (done[idx] >= chunkLen) return; // 已经下完了

        long startByte = chunkStart + done[idx];
        HttpURLConnection c = openConnection(url, connectTimeoutMs);
        c.setRequestMethod("GET");
        c.setRequestProperty("Range", "bytes=" + startByte + "-" + chunkEnd);
        c.connect();
        int code = c.getResponseCode();
        if (code != 206 && code != 200) {
            try { c.disconnect(); } catch (Throwable ignore) {}
            throw new IOException("HTTP " + code + " for chunk " + idx + " of " + url);
        }
        try (InputStream is = new BufferedInputStream(c.getInputStream(), 1 << 16);
             RandomAccessFile raf = new RandomAccessFile(target, "rw")) {
            raf.seek(startByte);
            byte[] buf = new byte[1 << 15];
            int n;
            long lastSave = System.currentTimeMillis();
            while ((n = is.read(buf)) > 0) {
                if (sink != null && sink.isCancelled()) {
                    throw new IOException("已取消");
                }
                raf.write(buf, 0, n);
                done[idx] += n;
                long sumSoFar = totalDone.addAndGet(n);
                long wb = windowBytes.addAndGet(n);
                long ws = windowStart.get();
                long now = System.nanoTime();
                long elapsedMs = (now - ws) / 1_000_000L;
                if (elapsedMs >= 500 && windowStart.compareAndSet(ws, now)) {
                    long bps = elapsedMs > 0 ? (wb * 1000L / elapsedMs) : 0L;
                    windowBytes.set(0);
                    if (sink != null) sink.onProgress(sumSoFar, expectedTotal, bps);
                }
                if (System.currentTimeMillis() - lastSave > 2000L) {
                    saveProgressMeta(metaFile, expectedTotal, done);
                    lastSave = System.currentTimeMillis();
                }
                if (done[idx] >= chunkLen) break;
            }
        } finally {
            // 不论是正常结束、网络断开、IOException 还是 sink 取消，都把
            // 当前 done[] 落盘——否则在"网速很快、< 2s 就失败"的窗口里
            // 一次也没存过的话，下一次进来时 meta 还停留在初值上，进度
            // 会丢失（但不会再被误判成"已完成"，因为前面已经强制把
            // 初值 meta 写入过）。
            saveProgressMeta(metaFile, expectedTotal, done);
            try { c.disconnect(); } catch (Throwable ignore) {}
        }
    }

    /** 试探一次 HEAD 请求，看服务端是否同时报告 Accept-Ranges: bytes
     *  以及一个 &gt; 0 的 Content-Length。任何异常视作"不支持"。 */
    private static boolean serverSupportsRange(String url, int timeoutMs) {
        HttpURLConnection c = null;
        try {
            c = openConnection(url, timeoutMs);
            c.setRequestMethod("HEAD");
            int code = c.getResponseCode();
            if (code >= 400) return false;
            String ar = c.getHeaderField("Accept-Ranges");
            long cl = parseLongHeader(c, "Content-Length");
            return cl > 0 && ar != null && ar.toLowerCase(java.util.Locale.US).contains("bytes");
        } catch (Throwable t) {
            return false;
        } finally {
            if (c != null) try { c.disconnect(); } catch (Throwable ignore) {}
        }
    }

    /** 元数据格式：每行一个 chunk 的已下字节数，UTF-8 文本，便于阅读。
     *  首行为 "total chunks"。
     *
     *  <p>原子写：先写到 {@code <meta>.tmp}，再用 {@link File#renameTo}
     *  原子替换正式文件。这样即使进程在写到一半被杀（OOM kill / 用户
     *  强退 / 系统重启），磁盘上要么是完整的旧 meta、要么是完整的新
     *  meta，绝不会是半截损坏的内容——避免下次 {@code loadProgressMeta}
     *  把它当成"损坏数据"清掉、把 meta 文件搞没。
     */
    private static synchronized void saveProgressMeta(File meta, long total, long[] done) {
        File tmp = new File(meta.getAbsolutePath() + ".tmp");
        try (java.io.PrintWriter pw = new java.io.PrintWriter(tmp, "UTF-8")) {
            pw.println(total + " " + done.length);
            for (long d : done) pw.println(d);
        } catch (Throwable ignore) {
            // 写 tmp 失败：不动正式 meta，保留旧内容
            try { tmp.delete(); } catch (Throwable ignore2) {}
            return;
        }
        // 在多数文件系统上 rename 是原子的；rename 失败时退化到删旧+改名
        if (!tmp.renameTo(meta)) {
            try { meta.delete(); } catch (Throwable ignore) {}
            if (!tmp.renameTo(meta)) {
                // 实在 rename 不动 → 尽量保住 tmp 别让它残留
                try { tmp.delete(); } catch (Throwable ignore) {}
            }
        }
    }

    private static synchronized void loadProgressMeta(File meta, long expectedTotal,
                                                      int expectedChunks, long[] out) {
        if (!meta.exists()) return;
        try (java.io.BufferedReader br = new java.io.BufferedReader(
                new java.io.InputStreamReader(new java.io.FileInputStream(meta), "UTF-8"))) {
            String head = br.readLine();
            if (head == null) return;
            String[] tk = head.trim().split("\\s+");
            if (tk.length < 2) return;
            long total = Long.parseLong(tk[0]);
            int chunks = Integer.parseInt(tk[1]);
            if (total != expectedTotal || chunks != expectedChunks) {
                // 期望参数变了，整体重来（done[] 已经是全 0）；保留旧
                // meta 文件本身——不要 delete，否则在 raf.setLength 已经
                // 把 target 撑到 expectedTotal 的前提下，下次进来会被
                // 早退分支误判成"已完成"。下一步 saveProgressMeta 会用
                // 新 schema 覆盖它。
                return;
            }
            for (int i = 0; i < chunks; i++) {
                String line = br.readLine();
                if (line == null) break;
                out[i] = Long.parseLong(line.trim());
            }
        } catch (Throwable t) {
            // 元数据损坏：把 done[] 重置为 0，但 **保留 meta 文件**
            // （上一版本会 delete 然后让早退判定误判，是已修复 bug）。
            // 下一步 saveProgressMeta 会用新内容覆盖它。
            for (int i = 0; i < out.length; i++) out[i] = 0;
        }
    }

    /** 解析 HTTP header，把值解释为 long（缺失或不合法时返回 -1）。 */
    private static long parseLongHeader(HttpURLConnection c, String name) {
        String v = c.getHeaderField(name);
        if (v == null) return -1L;
        try { return Long.parseLong(v.trim()); }
        catch (NumberFormatException e) { return -1L; }
    }

    /**
     * GET 请求，附带 {@code Authorization: Bearer <token>} 头。
     * 用于需要令牌鉴权的 S3/CDN 资源清单拉取。
     */
    public static String getStringWithToken(String url, String token,
                                            int timeoutMs) throws IOException {
        HttpURLConnection c = openConnection(url, timeoutMs);
        c.setRequestMethod("GET");
        if (token != null && !token.isEmpty()) {
            c.setRequestProperty("Authorization", "Bearer " + token);
        }
        int code = c.getResponseCode();
        if (code >= 400) {
            try { c.disconnect(); } catch (Throwable ignore) {}
            throw new IOException("HTTP " + code + " for " + url);
        }
        try (InputStream is = c.getInputStream()) {
            return readCapped(is);
        } finally {
            try { c.disconnect(); } catch (Throwable ignore) {}
        }
    }

    /**
     * 打开一个统一配置好超时、UA、跟随重定向的 HttpURLConnection。
     * HTTPS 连接由 Android 系统 TLS 栈处理（CA 证书链 + 域名验证），
     * 与浏览器安全级别一致，无需额外配置。
     */
    private static HttpURLConnection openConnection(String url, int timeoutMs) throws IOException {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(timeoutMs > 0 ? timeoutMs : 10_000);
        c.setReadTimeout(60_000);
        c.setInstanceFollowRedirects(true);
        c.setRequestProperty("User-Agent", UA);
        c.setRequestProperty("Accept", "*/*");
        return c;
    }
}
