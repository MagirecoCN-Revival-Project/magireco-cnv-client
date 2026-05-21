package io.kamihama.cnv;

import android.content.Context;
import android.net.Uri;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/**
 * 资源准备流水线：在线多线程下载或离线 zip 注入，完成后写 ready-flag。
 *
 * <p>在线流程：调 /client/init 拿镜像列表 → S3 列表 → 多线程分片续传。
 * <p>离线流程：让用户选 zip → 校验 → 解压到 filesDir。
 */
public final class ResourceFlow {

    /** 客户端版本号；从 PackageManager 读取，报给服务端做版本闸门。 */
    public static volatile String BUILD_VERSION;

    static {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Object app = at.getMethod("currentApplication").invoke(null);
            if (app instanceof Context) {
                Context ctx = (Context) app;
                BUILD_VERSION = ctx.getPackageManager()
                        .getPackageInfo(ctx.getPackageName(), 0).versionName;
            }
        } catch (Throwable t) {
            android.util.Log.w("ResourceFlow", "BUILD_VERSION 读取失败: " + t.getMessage());
        }
        if (BUILD_VERSION == null) BUILD_VERSION = "unknown";
    }

    public static final String MODE_ONLINE  = "online";
    public static final String MODE_OFFLINE = "offline";

    /**
     * 配置致命错误：镜像 / 访问令牌缺失等不可恢复的配置问题。
     * BootstrapActivity 捕获此异常后静默返回（showFatalAndExit 已经弹过弹窗）。
     */
    public static final class FatalConfigException extends RuntimeException {
        public FatalConfigException(String msg) { super(msg); }
    }

    /**
     * UI 回调接口。所有方法可能在工作线程调用；实现方需自行 post 到 UI 线程。
     * 阻塞型方法（requestXxx、showXxx）在用户操作完成前不应返回。
     */
    public interface Reporter {
        /** 弹对话框让用户在在线/离线模式中选一个；返回 MODE_ONLINE 或 MODE_OFFLINE。 */
        String requestModeChoice(boolean onlineEnabled, boolean offlineEnabled);

        /** 询问并发下载数量；returned = 用户选择值；recommended 供 UI 高亮默认项。 */
        int requestConcurrency(int recommended);

        /**
         * 在多条线路中让用户选一条。
         * @param lines 线路名 → 镜像 URL 列表（保持插入顺序）
         * @return 用户选择的线路名（lines 的 key）
         */
        String requestLineChoice(LinkedHashMap<String, List<String>> lines);

        /** 询问是否开启自动换线；返回 true = 开启。 */
        boolean requestAutoSwitch();

        /** 弹系统文件选择器，阻塞到用户选完；取消时返回 null。 */
        Uri requestFilePick();

        /** 更新当前阶段标签（init / download / extract / offline-pick / done 等）。 */
        void setPhase(String phase);

        /** 更新单行状态文本（可空）。 */
        void setStatus(String status);

        /** 重建 count 个下载槽位 UI。 */
        void initSlots(int count);

        /** 更新第 slot 个槽位的进度信息。 */
        void setSlot(int slot, String fileName, long soFar, long total, long instantBps);

        /** 把第 slot 个槽位复位为"待命"状态。 */
        void clearSlot(int slot);

        /** 更新聚合进度（已完成文件数 / 总数 + 合计速率）。 */
        void setAggregate(int completed, int total, long instantBpsTotal);

        /** 更新整体字节进度条。 */
        void setOverallProgress(long soFar, long total);

        /** 用户是否已取消；下载过程中轮询，返回 true 后下载会抛 IOException。 */
        boolean isCancelled();

        /** 输出一条日志；type 为 INFO / WARN / ERROR / FATAL。 */
        void log(String type, String msg);

        /** 弹纯信息对话框，阻塞到用户点确定。 */
        void showInfoDialog(String title, String message);

        /**
         * 弹带外链按钮的信息对话框，阻塞到用户点确定。
         * jumpLabel / jumpUrl = 跳转按钮文字和目标 URL（可用浏览器打开）。
         */
        void showInfoDialogWithJump(String title, String message,
                                    String jumpLabel, String jumpUrl);

        /** 弹致命错误对话框，用户确认后 killProcess；此方法本身会阻塞。 */
        void showFatalAndExit(String title, String message);
    }

    // ---- 实例字段 ----
    private final Context  ctx;
    private final Reporter reporter;
    private final String   mode;

    public ResourceFlow(Context ctx, Reporter reporter, String mode) {
        this.ctx      = ctx;
        this.reporter = reporter;
        this.mode     = MODE_OFFLINE.equals(mode) ? MODE_OFFLINE : MODE_ONLINE;
    }

    /**
     * 执行资源准备流程（阻塞，在工作线程调用）。
     *
     * <p>成功返回：{@code filesDir/cnv_inject/cn_resources_ready.flag} 已写出。
     * <p>失败：抛出异常（调用方处理 UI 提示）或已调用 reporter.showFatalAndExit。
     *
     * @throws FatalConfigException 配置致命错误（镜像缺失等）
     * @throws Exception            网络或 IO 错误
     */
    public void run() throws Exception {
        reporter.setPhase("init");
        reporter.log("INFO", "ResourceFlow 启动，模式=" + mode);

        if (MODE_OFFLINE.equals(mode)) {
            runOffline();
        } else {
            runOnline();
        }
    }

    // ── 在线流程 ──────────────────────────────────────────────────────────

    private void runOnline() throws Exception {
        // 1. 取镜像列表
        reporter.setPhase("init");
        reporter.setStatus("正在连接服务器…");

        ClientInit.Response init;
        try {
            init = ClientInit.fetch(ctx, BUILD_VERSION);
        } catch (Exception e) {
            reporter.showFatalAndExit("无法取得资源清单",
                    "连接资源服务器失败：" + e.getMessage()
                            + "\n\n请检查网络后重试。");
            throw new FatalConfigException("ClientInit failed");
        }

        if (init.downloadMirrors == null || init.downloadMirrors.isEmpty()
                || init.downloadAccessToken == null || init.downloadAccessToken.isEmpty()) {
            reporter.showFatalAndExit("资源配置缺失",
                    "服务端未返回资源下载地址或令牌，无法在线下载。\n\n请联系管理员。");
            throw new FatalConfigException("no mirrors");
        }

        // 2. 构建线路表（当前只有一条"默认线路"）
        LinkedHashMap<String, List<String>> lines = new LinkedHashMap<>();
        lines.put("默认线路", new ArrayList<>(init.downloadMirrors));

        String selectedLine = lines.size() > 1
                ? reporter.requestLineChoice(lines)
                : lines.keySet().iterator().next();

        List<String> mirrors = lines.get(selectedLine);
        if (mirrors == null || mirrors.isEmpty()) {
            throw new FatalConfigException("empty mirrors for line: " + selectedLine);
        }

        boolean autoSwitch = reporter.requestAutoSwitch();

        // 3. 获取文件清单（从第一个可用镜像）
        reporter.setPhase("download");
        reporter.setStatus("正在获取资源清单…");
        reporter.log("INFO", "使用线路：" + selectedLine + "，镜像数=" + mirrors.size());

        List<S3List.Entry> entries = fetchManifest(mirrors, init.downloadAccessToken);
        if (entries.isEmpty()) {
            reporter.showFatalAndExit("资源清单为空",
                    "从服务端拿到的资源清单是空的，无法继续下载。\n\n请联系管理员。");
            throw new FatalConfigException("empty manifest");
        }
        reporter.log("INFO", "清单条目数=" + entries.size());

        // 4. 并发数
        int concurrency = reporter.requestConcurrency(Math.min(4, mirrors.size()));
        reporter.initSlots(concurrency);

        // 5. 下载所有文件
        downloadAll(entries, mirrors, init.downloadAccessToken, concurrency, autoSwitch);

        // 6. 完成
        reporter.setPhase("done");
        reporter.setStatus("下载完成");
        reporter.log("INFO", "所有资源下载完成");
        writeReadyFlag();
    }

    /**
     * 从镜像列表中轮询获取 S3 XML 清单，返回 Entry 列表。
     * 每个镜像最多尝试一次；全部失败时抛 IOException。
     */
    private List<S3List.Entry> fetchManifest(List<String> mirrors, String token) throws Exception {
        Exception last = null;
        for (String mirror : mirrors) {
            try {
                // S3 list endpoint：直接 GET 镜像根路径（ListBucketResult）
                String url = mirror.endsWith("/") ? mirror : mirror + "/";
                reporter.log("INFO", "拉取清单：" + url);
                // 把 token 附在 Authorization header 里由 openConnection 完成
                // Net.getString 不支持额外 header，改用 openAuthConnection
                String xml = getWithToken(url, token, 20_000);
                List<S3List.Entry> result = S3List.parse(xml);
                if (!result.isEmpty()) return result;
                reporter.log("WARN", "清单 XML 解析结果为空，尝试下一个镜像");
            } catch (Exception e) {
                reporter.log("WARN", "清单拉取失败(" + mirror + "): " + e.getMessage());
                last = e;
            }
        }
        throw last != null ? last : new java.io.IOException("所有镜像均无法拉取清单");
    }

    /** GET 请求，附带 Authorization: Bearer <token> 头部。 */
    private static String getWithToken(String url, String token, int timeoutMs) throws java.io.IOException {
        java.net.HttpURLConnection c = (java.net.HttpURLConnection) new java.net.URL(url).openConnection();
        c.setConnectTimeout(timeoutMs > 0 ? timeoutMs : 15_000);
        c.setReadTimeout(30_000);
        c.setInstanceFollowRedirects(true);
        c.setRequestProperty("User-Agent", Net.UA);
        c.setRequestProperty("Accept", "*/*");
        if (token != null && !token.isEmpty()) {
            c.setRequestProperty("Authorization", "Bearer " + token);
        }
        c.setRequestMethod("GET");
        int code = c.getResponseCode();
        if (code >= 400) {
            try { c.disconnect(); } catch (Throwable ignore) {}
            throw new java.io.IOException("HTTP " + code + " for " + url);
        }
        try (InputStream is = c.getInputStream()) {
            java.io.ByteArrayOutputStream baos = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = is.read(buf)) > 0) baos.write(buf, 0, n);
            return baos.toString("UTF-8");
        } finally {
            try { c.disconnect(); } catch (Throwable ignore) {}
        }
    }

    /**
     * 多线程并发下载所有条目。
     * autoSwitch = true 时，某个镜像连续失败超过阈值后自动切换到下一个。
     */
    private void downloadAll(List<S3List.Entry> entries,
                             List<String> mirrors,
                             String token,
                             int concurrency,
                             boolean autoSwitch) throws Exception {
        File destDir = ctx.getFilesDir();
        long totalBytes = 0L;
        for (S3List.Entry e : entries) totalBytes += Math.max(0, e.size);
        final long totalBytesF = totalBytes;
        final int  total       = entries.size();

        AtomicInteger completed     = new AtomicInteger(0);
        AtomicLong    bytesFinished = new AtomicLong(0L);
        AtomicLong    instantBpsAll = new AtomicLong(0L);
        AtomicInteger mirrorIdx     = new AtomicInteger(0);
        ConcurrentHashMap<Integer, Integer> mirrorFails = new ConcurrentHashMap<>();
        AtomicReference<Exception> firstErr = new AtomicReference<>(null);

        // 共享槽位 — 用 AtomicInteger 在 workers 间轮转
        AtomicInteger nextSlot = new AtomicInteger(0);

        ExecutorService pool = Executors.newFixedThreadPool(concurrency, r -> {
            Thread t = new Thread(r, "cnv-dl");
            t.setDaemon(true);
            return t;
        });

        // 每个条目对应一个独立 Future；pool 以 concurrency 限制并发。
        // 用 BlockingQueue + semaphore-style submit 保证不超过 concurrency 个同时在飞。
        java.util.concurrent.Semaphore sem = new java.util.concurrent.Semaphore(concurrency);
        CountDownLatch latch = new CountDownLatch(total);

        for (int i = 0; i < total; i++) {
            final S3List.Entry entry = entries.get(i);
            // 如果已经出错，把剩余任务的 latch 全部减掉后退出
            if (firstErr.get() != null || reporter.isCancelled()) {
                latch.countDown();   // for this entry
                continue;
            }
            try { sem.acquire(); } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                latch.countDown();
                firstErr.compareAndSet(null, new java.io.IOException("已取消"));
                continue;
            }
            final int slot = nextSlot.getAndIncrement() % concurrency;
            pool.submit(() -> {
                try {
                    if (firstErr.get() != null || reporter.isCancelled()) return;

                    int mi = mirrorIdx.get() % mirrors.size();
                    String baseUrl = mirrors.get(mi);
                    String fileUrl = (baseUrl.endsWith("/") ? baseUrl : baseUrl + "/") + entry.key;

                    File target = new File(destDir, entry.key);
                    File parent = target.getParentFile();
                    if (parent != null && !parent.exists()) parent.mkdirs();

                    reporter.setSlot(slot, entry.key, 0, entry.size, 0);

                    Net.ProgressSink sink = new Net.ProgressSink() {
                        @Override public void onProgress(long soFar, long total2, long bps) {
                            reporter.setSlot(slot, entry.key, soFar, total2, bps);
                            instantBpsAll.set(bps);
                            reporter.setOverallProgress(bytesFinished.get() + soFar, totalBytesF);
                            reporter.setAggregate(completed.get(), total, instantBpsAll.get());
                        }
                        @Override public boolean isCancelled() { return reporter.isCancelled(); }
                    };

                    Net.downloadResume(fileUrl, target, entry.size, 15_000, sink);

                    int done = completed.incrementAndGet();
                    bytesFinished.addAndGet(Math.max(0, entry.size));
                    reporter.clearSlot(slot);
                    reporter.setAggregate(done, total, 0);
                    reporter.setOverallProgress(bytesFinished.get(), totalBytesF);
                    reporter.log("INFO", "下载完成: " + entry.key);
                    if (autoSwitch) mirrorFails.put(mi, 0);
                } catch (Exception e) {
                    if (!reporter.isCancelled()) {
                        reporter.log("WARN", "下载失败(" + entry.key + "): " + e.getMessage());
                        if (autoSwitch) {
                            int mi = mirrorIdx.get() % mirrors.size();
                            int fails = mirrorFails.merge(mi, 1, Integer::sum);
                            if (fails >= 3 && mirrors.size() > 1) {
                                int next = (mi + 1) % mirrors.size();
                                mirrorIdx.compareAndSet(mi, next);
                                reporter.log("INFO", "自动切换镜像 → " + mirrors.get(next));
                            }
                        }
                    }
                    firstErr.compareAndSet(null,
                            reporter.isCancelled()
                                    ? new java.io.IOException("已取消")
                                    : new java.io.IOException("下载失败: " + entry.key + ": " + e.getMessage()));
                } finally {
                    sem.release();
                    latch.countDown();
                }
            });
        }

        try {
            latch.await();
        } catch (InterruptedException ie) {
            Thread.currentThread().interrupt();
            firstErr.compareAndSet(null, new java.io.IOException("已取消"));
        }
        pool.shutdown();
        try { pool.awaitTermination(5, TimeUnit.SECONDS); } catch (InterruptedException ignore) {}

        if (firstErr.get() != null) throw firstErr.get();
    }

    // ── 离线流程 ──────────────────────────────────────────────────────────

    private void runOffline() throws Exception {
        reporter.setPhase("offline-pick");
        reporter.setStatus("请选择离线资源 zip 文件…");

        Uri zipUri = reporter.requestFilePick();
        if (zipUri == null) {
            reporter.showFatalAndExit("已取消", "未选择文件，无法完成离线资源注入。");
            throw new FatalConfigException("no file picked");
        }

        reporter.setPhase("offline-verify");
        reporter.setStatus("正在校验 zip 格式…");
        reporter.log("INFO", "离线包 URI: " + zipUri);

        // 简单校验：能打开且包含至少一个条目
        verifyZip(zipUri);

        reporter.setPhase("offline-extract");
        reporter.setStatus("正在解压资源…");

        File destDir = ctx.getFilesDir();
        long totalBytes = queryStreamLength(zipUri);

        try (InputStream is = ctx.getContentResolver().openInputStream(zipUri)) {
            if (is == null) throw new java.io.IOException("无法打开文件流");

            Unzip.extractFromStream(is, destDir, totalBytes, new Unzip.ProgressSink() {
                long idx = 0;
                @Override public void onEntry(String name, long entryIndex, long entryTotalEstimate) {
                    idx = entryIndex;
                    reporter.setStatus("解压: " + name);
                    reporter.setSlot(0, name, 0, -1, 0);
                }
                @Override public void onBytes(long bytesProcessed, long bytesTotal) {
                    reporter.setOverallProgress(bytesProcessed,
                            bytesTotal > 0 ? bytesTotal : totalBytes);
                }
                @Override public boolean isCancelled() {
                    return reporter.isCancelled();
                }
            });
        }

        reporter.setPhase("done");
        reporter.setStatus("离线资源注入完成");
        reporter.log("INFO", "离线资源解压完成，写入 ready flag");
        writeReadyFlag();
    }

    private void verifyZip(Uri uri) throws java.io.IOException {
        try (InputStream is = ctx.getContentResolver().openInputStream(uri)) {
            if (is == null) throw new java.io.IOException("无法读取所选文件");
            java.util.zip.ZipInputStream zis = new java.util.zip.ZipInputStream(is);
            java.util.zip.ZipEntry ze = zis.getNextEntry();
            if (ze == null) throw new java.io.IOException("zip 文件为空或格式不正确");
            zis.closeEntry();
        } catch (java.util.zip.ZipException ze) {
            throw new java.io.IOException("不是有效的 zip 文件: " + ze.getMessage(), ze);
        }
    }

    private long queryStreamLength(Uri uri) {
        try (android.database.Cursor c = ctx.getContentResolver().query(
                uri, new String[]{android.provider.OpenableColumns.SIZE}, null, null, null)) {
            if (c != null && c.moveToFirst()) {
                int col = c.getColumnIndex(android.provider.OpenableColumns.SIZE);
                if (col >= 0) return c.getLong(col);
            }
        } catch (Throwable ignore) {}
        return -1L;
    }

    // ── 工具方法 ──────────────────────────────────────────────────────────

    private void writeReadyFlag() throws java.io.IOException {
        File dir  = new File(ctx.getFilesDir(), "cnv_inject");
        if (!dir.exists() && !dir.mkdirs()) {
            throw new java.io.IOException("无法创建 cnv_inject 目录");
        }
        File flag = new File(dir, "cn_resources_ready.flag");
        try (FileOutputStream fos = new FileOutputStream(flag)) {
            fos.write(("ok:" + System.currentTimeMillis() + "\n").getBytes("UTF-8"));
        }
        reporter.log("INFO", "已写出 ready flag: " + flag.getAbsolutePath());
    }

    private ResourceFlow() { throw new AssertionError(); }
}
