package io.kamihama.cnv;

import android.content.Context;
import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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

        /**
         * 设置指定槽位的状态阶段，驱动进度条颜色变化。
         * @param phase "pending" | "downloading" | "extracting" | "done" | "failed"
         */
        void setSlotPhase(int slot, String phase);

        /** 更新聚合进度（已完成文件数 / 总数 + 合计速率）。 */
        void setAggregate(int completed, int total, long instantBpsTotal);

        /** 更新整体字节进度条。 */
        void setOverallProgress(long soFar, long total);

        /** 用户是否已取消；下载过程中轮询，返回 true 后下载会抛 IOException。 */
        boolean isCancelled();

        /** 输出一条日志；type 为 INFO / WARN / ERROR / FATAL。 */
        void log(String type, String msg);

        /** 输出带组件标签的日志；默认委托给无组件版本。 */
        default void log(String component, String type, String msg) {
            log(type, "[" + component + "] " + msg);
        }

        /**
         * SHA-256 校验不通过时弹确认对话框。
         * @return true = 用户选择强行继续；false = 取消注入
         */
        boolean confirmSha256Mismatch(String expected, String actual);

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

        /**
         * 离线包来源选择对话框。
         *
         * <p>展示"本地文件"和（若 cloudUrl 不为 null）"云端下载"两个选项。
         * 若用户选云端下载，实现方应打开浏览器并以 Toast / 说明文字告知
         * 下载后返回此界面再选择文件。
         *
         * @param cloudUrl     云端离线包下载地址；{@code null} = 服务端未提供，仅显示本地选项
         * @param cloudVersion 云端离线包版本号；{@code null} = 未知
         * @return {@code true} = 继续（无论哪种来源，后续会弹文件选择器）；
         *         {@code false} = 用户取消，中止流程
         */
        boolean requestOfflineSourceDialog(String cloudUrl, String cloudVersion);
    }

    // ---- 实例字段 ----
    private final Context  ctx;
    private final Reporter reporter;
    private final String   mode;
    private final String   sessionToken;

    public ResourceFlow(Context ctx, Reporter reporter, String mode, String sessionToken) {
        this.ctx          = ctx;
        this.reporter     = reporter;
        this.mode         = MODE_OFFLINE.equals(mode) ? MODE_OFFLINE : MODE_ONLINE;
        this.sessionToken = sessionToken != null ? sessionToken : "";
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
        reporter.setPhase("init");
        reporter.setStatus("正在连接服务器…");

        // 1. 上报用户选择的下载方式（忽略失败，服务端容错）
        try {
            ClientInit.postMethodSelect(ctx, sessionToken, MODE_ONLINE);
        } catch (Throwable t) {
            reporter.log("WARN", "method-select 上报失败（忽略）: " + t.getMessage());
        }

        // 2. 获取镜像组列表和 S3 资源令牌
        reporter.setStatus("正在获取镜像列表…");
        ClientInit.OnlineDownloadInfo dlInfo;
        try {
            dlInfo = ClientInit.fetchOnlineDownload(ctx, sessionToken);
        } catch (Exception e) {
            reporter.showFatalAndExit("无法取得资源清单",
                    "连接资源服务器失败：" + e.getMessage()
                            + "\n\n请检查网络后重试。");
            throw new FatalConfigException("fetchOnlineDownload failed");
        }

        if (dlInfo.groups == null || dlInfo.groups.isEmpty()
                || dlInfo.resourceToken == null || dlInfo.resourceToken.isEmpty()) {
            reporter.showFatalAndExit("资源配置缺失",
                    "服务端未返回资源下载地址或令牌，无法在线下载。\n\n请联系管理员。");
            throw new FatalConfigException("no mirrors");
        }

        // 3. 构建线路表（每个 MirrorGroup 对应一条线路）
        LinkedHashMap<String, List<String>> lines = new LinkedHashMap<>();
        Map<String, ClientInit.OnlineDownloadInfo.MirrorGroup> groupByName = new LinkedHashMap<>();
        for (ClientInit.OnlineDownloadInfo.MirrorGroup g : dlInfo.groups) {
            lines.put(g.name, g.urls());
            groupByName.put(g.name, g);
        }

        String selectedLine = lines.size() > 1
                ? reporter.requestLineChoice(lines)
                : lines.keySet().iterator().next();

        ClientInit.OnlineDownloadInfo.MirrorGroup selectedGroup = groupByName.get(selectedLine);
        if (selectedGroup == null || selectedGroup.entries.isEmpty()) {
            throw new FatalConfigException("empty mirrors for line: " + selectedLine);
        }

        // 4. 获取文件清单
        reporter.setPhase("download");
        reporter.setStatus("正在获取资源清单…");
        reporter.log("INFO", "下载线路已选定，镜像数=" + selectedGroup.entries.size());

        List<FileEntry> entries = fetchManifestForGroup(selectedGroup, dlInfo.resourceToken);
        entries = filterHotUpdateFiles(entries);
        if (entries.isEmpty()) {
            reporter.showFatalAndExit("资源清单为空",
                    "从服务端拿到的资源清单是空的，无法继续下载。\n\n请联系管理员。");
            throw new FatalConfigException("empty manifest");
        }
        reporter.log("INFO", "清单条目数=" + entries.size());

        // 5. 预建所有文件槽位（每文件固定一个，灰色待命状态）
        reporter.initSlots(entries.size());
        for (int pi = 0; pi < entries.size(); pi++) {
            reporter.setSlot(pi, entries.get(pi).entry.key, 0, entries.get(pi).entry.size, 0);
        }

        // 6. 并发数
        int concurrency = reporter.requestConcurrency(Math.min(4, selectedGroup.entries.size()));

        // 7. 下载所有文件
        downloadAll(entries, dlInfo.resourceToken, concurrency);

        // 8. 完成
        reporter.setPhase("done");
        reporter.setStatus("下载完成");
        reporter.log("INFO", "所有资源下载完成");
        writeReadyFlag();
    }

    /**
     * 获取镜像组的文件清单，返回 FileEntry 列表。
     *
     * <p>若该组镜像提供了文件列表，则直接合并各镜像的文件列表（同一 key 首次出现者胜）；
     * 否则对每个镜像 URL 根目录请求 S3 XML 并合并结果。
     */
    private List<FileEntry> fetchManifestForGroup(
            ClientInit.OnlineDownloadInfo.MirrorGroup group, String resourceToken) throws Exception {
        Map<String, FileEntry> byKey = new LinkedHashMap<>();
        if (group.hasFileLists()) {
            for (ClientInit.OnlineDownloadInfo.MirrorEntry me : group.entries) {
                if (me.files == null) continue;
                for (S3List.Entry e : me.files)
                    if (!byKey.containsKey(e.key))
                        byKey.put(e.key, new FileEntry(e, me.url));
            }
        } else {
            Exception last = null;
            for (ClientInit.OnlineDownloadInfo.MirrorEntry me : group.entries) {
                try {
                    String url = me.url.endsWith("/") ? me.url : me.url + "/";
                    reporter.log("INFO", "正在拉取资源清单…");
                    String xml = Net.getStringWithToken(url, resourceToken, 20_000);
                    List<S3List.Entry> result = S3List.parse(xml);
                    if (result.isEmpty()) {
                        reporter.log("WARN", "清单 XML 解析结果为空，尝试下一个镜像");
                        continue;
                    }
                    for (S3List.Entry e : result)
                        if (!byKey.containsKey(e.key))
                            byKey.put(e.key, new FileEntry(e, me.url));
                } catch (Exception e) {
                    reporter.log("WARN", "清单拉取失败，尝试下一个镜像：" + e.getMessage());
                    last = e;
                }
            }
            if (byKey.isEmpty())
                throw last != null ? last : new java.io.IOException("所有镜像均无法拉取清单");
        }
        return new ArrayList<>(byKey.values());
    }

    /** 多线程并发下载所有条目，同时启动心跳线程向服务端汇报进度。 */
    private void downloadAll(List<FileEntry> entries,
                             String resourceToken,
                             int concurrency) throws Exception {
        File destDir = ctx.getFilesDir();
        long totalBytes = 0L;
        for (FileEntry fe : entries) totalBytes += Math.max(0, fe.entry.size);
        final long totalBytesF = totalBytes;
        final int  total       = entries.size();

        AtomicInteger completed     = new AtomicInteger(0);
        AtomicLong    bytesFinished = new AtomicLong(0L);
        AtomicLong    instantBpsAll = new AtomicLong(0L);
        AtomicReference<Exception> firstErr = new AtomicReference<>(null);

        // 每个文件的下载状态（心跳读取；download worker 写入）
        ConcurrentHashMap<String, DownloadState> fileStates = new ConcurrentHashMap<>();
        for (FileEntry fe : entries) {
            fileStates.put(fe.entry.key, new DownloadState(fe.entry.key, fe.mirror));
        }

        // 启动心跳线程
        String deviceId;
        try { deviceId = DeviceId.get(ctx); } catch (Throwable t) { deviceId = ""; }
        HeartbeatSender hb = new HeartbeatSender(fileStates, deviceId, sessionToken);
        Thread hbThread = new Thread(hb, "cnv-heartbeat");
        hbThread.setDaemon(true);
        hbThread.start();

        ExecutorService pool = Executors.newFixedThreadPool(concurrency, r -> {
            Thread t = new Thread(r, "cnv-dl");
            t.setDaemon(true);
            return t;
        });

        java.util.concurrent.Semaphore sem = new java.util.concurrent.Semaphore(concurrency);
        CountDownLatch latch = new CountDownLatch(total);

        for (int i = 0; i < total; i++) {
            final FileEntry fe = entries.get(i);
            final S3List.Entry entry = fe.entry;
            if (firstErr.get() != null || reporter.isCancelled()) {
                latch.countDown();
                continue;
            }
            try { sem.acquire(); } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                latch.countDown();
                firstErr.compareAndSet(null, new java.io.IOException("已取消"));
                continue;
            }
            final int slot = i;
            pool.submit(() -> {
                try {
                    if (firstErr.get() != null || reporter.isCancelled()) return;

                    DownloadState state = fileStates.get(entry.key);
                    // C-H6: 拒绝路径遍历（server-controlled entry.key）
                    if (entry.key.startsWith("/") || entry.key.contains("\0")
                            || entry.key.contains("\n")) {
                        throw new java.io.IOException("非法 key（非法字符）：" + entry.key);
                    }
                    File target = new File(destDir, entry.key);
                    String tCanon = target.getCanonicalPath();
                    String dCanon = destDir.getCanonicalPath();
                    if (!tCanon.equals(dCanon)
                            && !tCanon.startsWith(dCanon + File.separator)) {
                        throw new java.io.IOException("拒绝路径遍历 key：" + entry.key);
                    }
                    File parent = target.getParentFile();
                    if (parent != null && !parent.exists()) parent.mkdirs();

                    reporter.setSlotPhase(slot, "downloading");

                    // 带服务端换线重试的下载循环
                    while (true) {
                        if (firstErr.get() != null || reporter.isCancelled()) return;
                        state.status = DownloadState.Status.DOWNLOADING;

                        String baseUrl = state.currentMirror;
                        String fileUrl = (baseUrl.endsWith("/") ? baseUrl : baseUrl + "/") + entry.key;

                        try {
                            Net.ProgressSink sink = new Net.ProgressSink() {
                                @Override public void onProgress(long soFar, long total2, long bps) {
                                    state.soFar = soFar;
                                    state.total = total2 > 0 ? total2 : entry.size;
                                    state.bps   = bps;
                                    reporter.setSlot(slot, entry.key, soFar, total2, bps);
                                    instantBpsAll.set(bps);
                                    reporter.setOverallProgress(
                                            bytesFinished.get() + soFar, totalBytesF);
                                    reporter.setAggregate(
                                            completed.get(), total, instantBpsAll.get());
                                }
                                @Override public boolean isCancelled() {
                                    return reporter.isCancelled() || state.switchPending;
                                }
                            };
                            Net.downloadResume(fileUrl, target, entry.size, 15_000, sink);

                            // 下载成功
                            state.status = DownloadState.Status.DONE;
                            int done = completed.incrementAndGet();
                            bytesFinished.addAndGet(Math.max(0, entry.size));
                            reporter.setSlotPhase(slot, "done");
                            reporter.setSlot(slot, entry.key, entry.size, entry.size, 0);
                            reporter.setAggregate(done, total, 0);
                            reporter.setOverallProgress(bytesFinished.get(), totalBytesF);
                            reporter.log("INFO", "下载完成: " + entry.key);
                            break;

                        } catch (java.io.IOException ioEx) {
                            if (state.switchPending && !reporter.isCancelled()) {
                                // 服务端心跳触发换线：清标志，用新镜像重试
                                state.switchPending = false;
                                reporter.log("INFO", "心跳换线: " + entry.key);
                                // 继续 while 循环，用更新后的 currentMirror 重试
                            } else {
                                // 真实网络错误或用户取消
                                state.status = DownloadState.Status.FAILED;
                                throw ioEx;
                            }
                        }
                    }
                } catch (Exception e) {
                    if (!reporter.isCancelled()) {
                        reporter.log("WARN", "下载失败(" + entry.key + "): " + e.getMessage());
                    }
                    firstErr.compareAndSet(null,
                            reporter.isCancelled()
                                    ? new java.io.IOException("已取消")
                                    : new java.io.IOException(
                                            "下载失败: " + entry.key + ": " + e.getMessage()));
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
        } finally {
            hb.stop();
            pool.shutdown();
            try { pool.awaitTermination(5, TimeUnit.SECONDS); } catch (InterruptedException ignore) {}
        }

        if (firstErr.get() != null) throw firstErr.get();
    }

    // ── 心跳系统内部类 ────────────────────────────────────────────────────

    /** 文件条目：S3 Entry + 该文件归属的初始镜像 URL。 */
    private static final class FileEntry {
        final S3List.Entry entry;
        final String       mirror;
        FileEntry(S3List.Entry e, String m) { entry = e; mirror = m; }
    }

    /** 单个文件的实时下载状态，由 download worker 写入，HeartbeatSender 读取。 */
    private static final class DownloadState {
        enum Status { PENDING, DOWNLOADING, DONE, FAILED }

        final String fileName;
        volatile Status  status        = Status.PENDING;
        volatile long    soFar         = 0L;
        volatile long    total         = -1L;
        volatile long    bps           = 0L;
        /** 心跳收到换线指令后更新为新镜像 URL，再设置 switchPending = true。 */
        volatile String  currentMirror;
        /** download worker 在 ProgressSink.isCancelled() 中检测此标志触发重试。 */
        volatile boolean switchPending = false;

        DownloadState(String fileName, String initialMirror) {
            this.fileName      = fileName;
            this.currentMirror = initialMirror;
        }
    }

    /**
     * 每 5 秒向 /client/heartbeat 上报所有文件的下载状态。
     *
     * <p>服务端响应 {@code action=switch_mirrors} 时：更新受影响文件的
     * {@link DownloadState#currentMirror} 并置 {@link DownloadState#switchPending}，
     * 触发 download worker 的协作式取消 + 重试。
     *
     * <p>服务端响应 {@code action=ban} 时：持久化封禁信息，阻塞显示致命弹窗。
     */
    private final class HeartbeatSender implements Runnable {
        private final ConcurrentHashMap<String, DownloadState> states;
        private final String deviceId;
        private final String sessionToken;
        private volatile boolean stopped = false;

        HeartbeatSender(ConcurrentHashMap<String, DownloadState> states,
                        String deviceId, String sessionToken) {
            this.states       = states;
            this.deviceId     = deviceId;
            this.sessionToken = sessionToken != null ? sessionToken : "";
        }

        void stop() { stopped = true; }

        @Override public void run() {
            while (!stopped) {
                try { Thread.sleep(5_000); } catch (InterruptedException ie) { break; }
                if (stopped) break;
                try {
                    sendHeartbeat();
                } catch (Throwable t) {
                    reporter.log("WARN", "心跳发送失败: " + t.getMessage());
                }
            }
        }

        private void sendHeartbeat() throws Exception {
            JSONObject body = ClientInit.authTriple(ctx, sessionToken);
            JSONArray files = new JSONArray();
            for (DownloadState s : states.values()) {
                JSONObject f = new JSONObject();
                f.put("name",      s.fileName);
                f.put("status",    s.status.name().toLowerCase(Locale.US));
                f.put("percent",   s.total > 0 ? (s.soFar * 100.0 / s.total) : 0.0);
                f.put("speed_bps", s.bps);
                files.put(f);
            }
            body.put("files", files);

            String raw = Net.postJson(
                    CloudEndpoint.CLIENT_HEARTBEAT, body.toString(), 10_000);
            if (raw == null || raw.isEmpty()) return;

            JSONObject resp = new JSONObject(raw);
            String action = resp.optString("action", "ok");

            if ("switch_mirrors".equals(action)) {
                JSONArray assignments = resp.optJSONArray("assignments");
                if (assignments == null) return;
                for (int i = 0; i < assignments.length(); i++) {
                    JSONObject a    = assignments.getJSONObject(i);
                    String mirror   = a.optString("mirror", "");
                    JSONArray fList = a.optJSONArray("files");
                    if (mirror.isEmpty() || fList == null) continue;
                    for (int j = 0; j < fList.length(); j++) {
                        String fname = fList.getString(j);
                        DownloadState st = states.get(fname);
                        if (st != null && st.status == DownloadState.Status.DOWNLOADING) {
                            // volatile write order matters: mirror before pending flag
                            st.currentMirror = mirror;
                            st.switchPending = true;
                        }
                    }
                }
                reporter.log("INFO", "服务端触发换线，已更新受影响文件的镜像分配");

            } else if ("ban".equals(action)) {
                stopped = true;
                String reason     = resp.optString("reason", "（服务端未提供原因）");
                long   expireTime = resp.optLong("expire_time", 0L);
                BanInfo.save(ctx, reason, expireTime);

                String msg = "原因：" + reason;
                if (expireTime > 0L) {
                    try {
                        String ts = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault())
                                .format(new Date(expireTime * 1000L));
                        msg += "\n解封时间：" + ts;
                    } catch (Throwable ignore) {
                        msg += "\n解封时间戳：" + expireTime;
                    }
                } else {
                    msg += "\n封禁类型：永久";
                }
                reporter.showFatalAndExit("账号已被封禁", msg);
            }
        }
    }

    // ── 离线流程 ──────────────────────────────────────────────────────────

    private void runOffline() throws Exception {
        reporter.setPhase("init");
        reporter.setStatus("正在上报下载方式…");

        try {
            ClientInit.postMethodSelect(ctx, sessionToken, MODE_OFFLINE);
        } catch (Throwable t) {
            reporter.log("WARN", "method-select 上报失败（忽略）: " + t.getMessage());
        }

        // 尝试获取云端离线包信息（供用户参考；失败不阻断离线流程）
        String cloudUrl = null, cloudVersion = null, cloudSha256 = null;
        try {
            reporter.setStatus("正在获取云端离线包信息…");
            ClientInit.OfflinePackageInfo pkg = ClientInit.fetchOfflinePackage(ctx, sessionToken);
            cloudUrl     = pkg.downloadUrl;
            cloudVersion = pkg.packageVersion;
            cloudSha256  = pkg.sha256;
            reporter.log("INFO", "云端离线包版本=" + cloudVersion
                    + (cloudSha256 != null ? "，SHA-256 已获取" : "，SHA-256 未下发"));
        } catch (Throwable t) {
            reporter.log("WARN", "获取云端离线包信息失败（忽略）: " + t.getMessage());
        }

        // 来源选择 + 文件选择 + 校验 + 解压（正式安装，写永久就绪标记）
        injectFromPicker(cloudUrl, cloudVersion, cloudSha256, false);
    }

    /**
     * 临时离线包注入（应急路径）：服务器不可达且本机尚无资源时，仅凭本地
     * 离线包让玩家临时进入游戏。在工作线程调用。
     *
     * <p>与 {@link #runOffline()} 的区别：
     * <ul>
     *   <li><b>不联系服务端</b>——不 method-select、不 fetchOfflinePackage、
     *       无云端 SHA-256（服务端本就不可达）。</li>
     *   <li><b>只做离线包"包内"本地校验</b>——zip 格式合法性 + 解压时逐条
     *       CRC32 校验（{@link Unzip} 基于 ZipInputStream，CRC 不符直接抛异常）。</li>
     *   <li><b>写临时标记</b> {@code cn_resources_provisional.flag} 而非正式就绪
     *       标记，因此"不算数"：服务端恢复后 BootstrapActivity 会清除它、
     *       要求重新下载或重新载入离线包完成正式安装。</li>
     * </ul>
     */
    public void runProvisionalOffline() throws Exception {
        reporter.setPhase("init");
        reporter.log("INFO", "ResourceFlow 启动，模式=临时离线注入（provisional，仅本地校验）");
        // cloudUrl/version/sha256 全为 null：来源对话框仅展示本地文件、跳过云端 SHA-256
        injectFromPicker(null, null, null, true);
    }

    /**
     * 公共注入流水线：来源对话框 → 文件选择器 → 缓存到私有临时文件 →
     * zip 格式校验 →（可选）云端 SHA-256 硬校验 → 两阶段解压 → 写就绪标记。
     *
     * @param cloudUrl     云端离线包地址（{@code null}=仅本地来源）
     * @param cloudVersion 云端离线包版本（仅用于对话框展示）
     * @param cloudSha256  云端 SHA-256（{@code null}/空=跳过云端校验，只做包内本地校验）
     * @param provisional  {@code true}=临时注入，写 provisional 标记，不计入正式安装；
     *                     {@code false}=正式安装，写永久就绪标记并生成完整性清单
     */
    private void injectFromPicker(String cloudUrl, String cloudVersion,
                                  String cloudSha256, boolean provisional) throws Exception {
        // 展示来源选择对话框
        reporter.setPhase("offline-pick");
        reporter.setStatus("选择离线包来源…");
        if (!reporter.requestOfflineSourceDialog(cloudUrl, cloudVersion)) {
            reporter.showFatalAndExit("已取消", "未选择文件，无法完成离线资源注入。");
            throw new FatalConfigException("user cancelled offline source dialog");
        }

        reporter.setStatus("请选择离线资源 zip 文件…");
        Uri zipUri = reporter.requestFilePick();
        if (zipUri == null) {
            reporter.showFatalAndExit("已取消", "未选择文件，无法完成离线资源注入。");
            throw new FatalConfigException("no file picked");
        }

        reporter.setPhase("offline-verify");
        reporter.setStatus("正在缓存离线包到私有临时目录…");
        reporter.log("INFO", "离线包 URI: " + zipUri);

        // C-C3: TOCTOU 防护——将 content:// URI 一次性拷到私有临时文件，
        // 后续所有操作（验证、SHA-256、解压）均读此临时文件，
        // 避免恶意 ContentProvider 在两次 openInputStream 之间返回不同字节。
        File importedZip = new File(ctx.getCacheDir(), "cnv_import_" + System.currentTimeMillis() + ".zip");
        try {
            // ── 拷贝 ─────────────────────────────────────────────────────────────
            try (InputStream src = ctx.getContentResolver().openInputStream(zipUri);
                 FileOutputStream dst = new FileOutputStream(importedZip)) {
                if (src == null) throw new java.io.IOException("无法打开离线包文件流");
                byte[] cpBuf = new byte[65536];
                int cpN;
                while ((cpN = src.read(cpBuf)) != -1) dst.write(cpBuf, 0, cpN);
            }
            reporter.log("INFO", "离线包已缓存到临时文件: " + importedZip.length() + " 字节");

            reporter.setStatus("正在校验 zip 格式…");
            verifyZipFile(importedZip);

            // SHA-256 校验：C-L1/C-L2: 必须硬失败，不允许跳过或用户覆盖
            if (cloudSha256 != null && !cloudSha256.isEmpty()) {
                reporter.setStatus("正在计算文件 SHA-256…");
                reporter.log("INFO", "开始计算离线包 SHA-256，期望值=" + cloudSha256);
                // C-L2: 异常不再捕获——SHA-256 计算失败视为致命错误
                String actualSha256 = sha256HexFromFile(importedZip);
                if (!cloudSha256.equalsIgnoreCase(actualSha256)) {
                    // C-L1: 校验不通过时硬失败，不向用户提供继续选项
                    reporter.log("ERROR", "SHA-256 校验失败：期望=" + cloudSha256 + "，实际=" + actualSha256);
                    throw new FatalConfigException(
                            "离线包 SHA-256 校验失败，已拒绝注入。期望=" + cloudSha256 + " 实际=" + actualSha256);
                }
                reporter.log("INFO", "SHA-256 校验通过：" + cloudSha256);
            }

            // ── 第一阶段：解压外层 zip 到暂存目录（避免直接覆盖 filesDir）──────────
            File stagingDir = new File(ctx.getFilesDir(), "cnv_staging");
            deleteRecursive(stagingDir);  // 清理可能残留的旧暂存
            stagingDir.mkdirs();

            try {
                reporter.initSlots(1);
                reporter.setSlot(0, "外层 zip（暂存解压）", 0, -1, 0);
                reporter.setSlotPhase(0, "extracting");
                reporter.setPhase("offline-stage1");
                reporter.setStatus("正在解压外层 zip 到暂存目录…");

                long totalBytes = importedZip.length();
                try (InputStream is = new java.io.FileInputStream(importedZip)) {
                    // 不剥离前缀，保留外层 zip 的原始目录结构，便于找到内层 zip
                    Unzip.extractFromStream(is, stagingDir, totalBytes, "", new Unzip.ProgressSink() {
                        @Override public void onEntry(String name, long idx, long est) {
                            reporter.setStatus("暂存: " + name);
                        }
                        @Override public void onEntryBytes(long written, long uncompressedSize) {
                            reporter.setSlot(0, null, written, uncompressedSize, 0);
                        }
                        @Override public void onEntryDone(String name) {}
                        @Override public void onBytes(long bytesProcessed, long bytesTotal) {
                            reporter.setOverallProgress(bytesProcessed,
                                    bytesTotal > 0 ? bytesTotal : totalBytes);
                        }
                        @Override public boolean isCancelled() { return reporter.isCancelled(); }
                    });
                }
                reporter.setSlotPhase(0, "done");
                reporter.log("INFO", "第一阶段完成，扫描暂存目录中的内层 zip…");

                // ── 第二阶段：找到所有内层 zip，逐一解压到 filesDir ─────────────────────
                List<File> innerZips = findInnerZipsRecursive(stagingDir);
                reporter.log("INFO", "发现内层 zip 数量=" + innerZips.size());

                File destDir = ctx.getFilesDir();
                if (innerZips.isEmpty()) {
                    // 外层 zip 内无嵌套 zip，将暂存内容复制到目标目录
                    reporter.log("INFO", "未发现内层 zip，直接复制暂存内容到目标目录");
                    reporter.setPhase("offline-stage2");
                    reporter.setStatus("正在复制资源到目标目录…");
                    copyDirectoryRecursive(stagingDir, destDir);
                } else {
                    reporter.initSlots(innerZips.size());
                    reporter.setPhase("offline-stage2");
                    reporter.setStatus("正在解压内层 zip…");

                    for (int i = 0; i < innerZips.size(); i++) {
                        File innerZip = innerZips.get(i);
                        String name   = innerZip.getName();
                        reporter.setSlot(i, name, 0, innerZip.length(), 0);
                        reporter.setSlotPhase(i, "extracting");
                        reporter.log("INFO", "第二阶段[" + i + "]: 解压 " + name);
                        final int slot = i;
                        Unzip.extract(innerZip, destDir, new Unzip.ProgressSink() {
                            @Override public void onEntry(String n, long idx, long est) {
                                reporter.setStatus("解压: " + n);
                            }
                            @Override public void onEntryBytes(long written, long uncompressedSize) {
                                reporter.setSlot(slot, null, written, uncompressedSize, 0);
                            }
                            @Override public void onEntryDone(String n) {}
                            @Override public void onBytes(long bytesProcessed, long bytesTotal) {
                                reporter.setOverallProgress(bytesProcessed,
                                        bytesTotal > 0 ? bytesTotal : innerZip.length());
                            }
                            @Override public boolean isCancelled() { return reporter.isCancelled(); }
                        });
                        reporter.setSlotPhase(slot, "done");
                        reporter.log("INFO", "第二阶段[" + i + "]: " + name + " 解压完成");
                    }
                }
            } finally {
                // 无论成功失败，始终清理暂存目录，避免占用存储空间
                deleteRecursive(stagingDir);
                reporter.log("INFO", "暂存目录已清理");
            }
            // 写标记仅在 try 块全部正常完成后执行（finally 无法阻止 throw）
            reporter.setPhase("done");
            if (provisional) {
                reporter.setStatus("临时离线资源注入完成");
                reporter.log("INFO", "两阶段解压完成，写入临时标记（不计入正式安装）");
                writeProvisionalFlag();
            } else {
                reporter.setStatus("离线资源注入完成");
                reporter.log("INFO", "两阶段离线资源解压完成，写入 ready flag");
                writeReadyFlag();
            }
        } finally {
            // 外层 finally：无论何种失败路径（拷贝/校验/解压），都清理临时导入文件
            importedZip.delete();
        }
    }

    /** 递归查找目录中所有 .zip 文件。 */
    private static List<File> findInnerZipsRecursive(File dir) {
        List<File> result = new ArrayList<>();
        File[] entries = dir.listFiles();
        if (entries == null) return result;
        for (File f : entries) {
            if (f.isDirectory()) {
                result.addAll(findInnerZipsRecursive(f));
            } else if (f.getName().toLowerCase(Locale.US).endsWith(".zip")) {
                result.add(f);
            }
        }
        return result;
    }

    /** 递归删除文件或目录。 */
    private static void deleteRecursive(File f) {
        if (f.isDirectory()) {
            File[] children = f.listFiles();
            if (children != null) for (File c : children) deleteRecursive(c);
        }
        f.delete();
    }

    /** 递归将 src 目录树复制到 dest（dest 不存在则自动创建）。 */
    private static void copyDirectoryRecursive(File src, File dest) throws java.io.IOException {
        dest.mkdirs();
        File[] entries = src.listFiles();
        if (entries == null) return;
        for (File f : entries) {
            File target = new File(dest, f.getName());
            if (f.isDirectory()) {
                copyDirectoryRecursive(f, target);
            } else {
                try (java.io.FileInputStream fis  = new java.io.FileInputStream(f);
                     java.io.FileOutputStream fos = new java.io.FileOutputStream(target)) {
                    byte[] buf = new byte[65536];
                    int n;
                    while ((n = fis.read(buf)) != -1) fos.write(buf, 0, n);
                }
            }
        }
    }

    private static void verifyZipFile(File f) throws java.io.IOException {
        try (java.util.zip.ZipInputStream zis = new java.util.zip.ZipInputStream(
                new java.io.BufferedInputStream(new java.io.FileInputStream(f)))) {
            java.util.zip.ZipEntry ze = zis.getNextEntry();
            if (ze == null) throw new java.io.IOException("zip 文件为空或格式不正确");
            zis.closeEntry();
        } catch (java.util.zip.ZipException ze) {
            throw new java.io.IOException("不是有效的 zip 文件: " + ze.getMessage(), ze);
        }
    }

    // ── 热更新 ────────────────────────────────────────────────────────────

    private static final String HOT_UPDATE_PREFS = "cnv_hot_update";
    private static final String KEY_JS_VER       = "js_version";
    private static final String KEY_SC_VER       = "scenario_version";

    // 在线全量下载时跳过这两个文件，由 runHotUpdate 处理
    private static final java.util.Set<String> HOT_UPDATE_FILES =
            new java.util.HashSet<>(java.util.Arrays.asList(
                    "cn_js_update.zip", "cn_scenario_update.zip"));

    private static List<FileEntry> filterHotUpdateFiles(List<FileEntry> entries) {
        List<FileEntry> out = new ArrayList<>();
        for (FileEntry fe : entries) {
            String name = fe.entry.key.contains("/")
                    ? fe.entry.key.substring(fe.entry.key.lastIndexOf('/') + 1) : fe.entry.key;
            if (!HOT_UPDATE_FILES.contains(name)) out.add(fe);
        }
        return out;
    }

    /**
     * 检查并应用 js / scenario 热更新包。每次进游戏前调用，非致命。
     *
     * <p>复用下载槽位 UI（initSlots(2)）和心跳体系（HeartbeatSender），
     * 行为与在线下载一致：有更新 → 下载 → SHA-256 校验 → 解压；无更新直接标 done。
     * 心跳向服务端上报热更进度，服务端可响应 switch_mirrors / ban。
     */
    public void runHotUpdate() {
        reporter.setPhase("hot-update");
        reporter.setStatus("正在检查热更新…");
        reporter.log("热更", "INFO", "开始热更新检查");

        ClientInit.HotUpdateInfo info;
        try {
            info = ClientInit.fetchHotUpdate(ctx, sessionToken);
        } catch (Throwable t) {
            reporter.log("热更", "WARN", "热更新接口请求失败（跳过）：" + t.getMessage());
            return;
        }

        reporter.initSlots(2);
        reporter.setSlot(0, "cn_js_update.zip",      0, 0, 0);
        reporter.setSlot(1, "cn_scenario_update.zip", 0, 0, 0);
        reporter.setSlotPhase(0, "pending");
        reporter.setSlotPhase(1, "pending");

        // 为热更新的两个文件建立心跳状态（热更 currentMirror = 完整下载 URL）
        ConcurrentHashMap<String, DownloadState> hotStates = new ConcurrentHashMap<>();
        hotStates.put("cn_js_update.zip",
                new DownloadState("cn_js_update.zip",
                        info.js.downloadUrl != null ? info.js.downloadUrl : ""));
        hotStates.put("cn_scenario_update.zip",
                new DownloadState("cn_scenario_update.zip",
                        info.scenario.downloadUrl != null ? info.scenario.downloadUrl : ""));

        String deviceId;
        try { deviceId = DeviceId.get(ctx); } catch (Throwable t) { deviceId = ""; }
        HeartbeatSender hb = new HeartbeatSender(hotStates, deviceId, sessionToken);
        Thread hbThread = new Thread(hb, "cnv-hot-heartbeat");
        hbThread.setDaemon(true);
        hbThread.start();

        android.content.SharedPreferences prefs =
                ctx.getSharedPreferences(HOT_UPDATE_PREFS, 0);

        try {
            applyHotPatch(0, "cn_js_update.zip",       info.js,       prefs, KEY_JS_VER,
                          hotStates.get("cn_js_update.zip"));
            applyHotPatch(1, "cn_scenario_update.zip",  info.scenario, prefs, KEY_SC_VER,
                          hotStates.get("cn_scenario_update.zip"));
        } finally {
            hb.stop();
        }

        reporter.setStatus("热更新检查完成");
        reporter.log("热更", "INFO", "热更新检查完成");
    }

    /**
     * 下载并应用单个热更新包。
     *
     * <p>{@code state} 由调用方提供，供心跳线程实时读取；
     * 方法内通过 {@link DownloadState#switchPending} 协作式取消当前下载并换线重试，
     * 与 {@link #downloadAll} 中的 worker 机制对称。
     */
    private void applyHotPatch(int slot, String fileName,
                                ClientInit.HotUpdateInfo.Entry entry,
                                android.content.SharedPreferences prefs, String versionKey,
                                DownloadState state) {
        int localVer  = prefs.getInt(versionKey, 0);
        int serverVer = entry.version;
        reporter.log("热更", "INFO",
                "[" + fileName + "] 本地=" + localVer + " 服务端=" + serverVer);

        if (serverVer <= localVer) {
            reporter.log("热更", "INFO", "[" + fileName + "] 无需更新");
            state.status = DownloadState.Status.DONE;
            reporter.setSlotPhase(slot, "done");
            return;
        }
        if (entry.downloadUrl == null || entry.downloadUrl.isEmpty()) {
            reporter.log("热更", "WARN", "[" + fileName + "] 服务端未提供下载地址，跳过");
            state.status = DownloadState.Status.DONE;
            reporter.setSlotPhase(slot, "done");
            return;
        }

        reporter.setSlotPhase(slot, "downloading");
        state.status = DownloadState.Status.DOWNLOADING;

        File zipFile = new File(ctx.getCacheDir(), "cnv_hot_" + slot + ".zip");

        // 带心跳换线的下载重试循环（与 downloadAll worker 对称）
        while (true) {
            if (zipFile.exists()) zipFile.delete();
            String downloadUrl = state.currentMirror;
            reporter.log("热更", "INFO", "[" + fileName + "] 开始下载");

            Net.ProgressSink sink = new Net.ProgressSink() {
                @Override public void onProgress(long soFar, long total, long bps) {
                    state.soFar = soFar;
                    state.total = total > 0 ? total : -1L;
                    state.bps   = bps;
                    reporter.setSlot(slot, fileName, soFar, total, bps);
                }
                @Override public boolean isCancelled() {
                    return reporter.isCancelled() || state.switchPending;
                }
            };

            try {
                // fileSize > 0 时启用多线程分片下载（4 线程），否则退化为单线程续传
                if (entry.fileSize > 0) {
                    Net.downloadChunked(downloadUrl, zipFile, entry.fileSize, 4, 30_000, sink);
                } else {
                    Net.downloadResume(downloadUrl, zipFile, -1L, 30_000, sink);
                }
                break;  // 下载成功，退出重试循环
            } catch (java.io.IOException e) {
                if (state.switchPending && !reporter.isCancelled()) {
                    // 心跳触发换线：清标志，用新 URL 重试
                    state.switchPending = false;
                    reporter.log("热更", "INFO", "[" + fileName + "] 心跳换线，重试下载");
                } else {
                    state.status = DownloadState.Status.FAILED;
                    reporter.log("热更", "WARN", "[" + fileName + "] 下载失败：" + e.getMessage());
                    reporter.setSlotPhase(slot, "failed");
                    zipFile.delete();
                    return;
                }
            }
        }

        if (entry.sha256 != null && !entry.sha256.isEmpty()) {
            String actual = sha256Hex(zipFile);
            if (!entry.sha256.equalsIgnoreCase(actual)) {
                reporter.log("热更", "WARN", "[" + fileName + "] SHA-256 校验失败"
                        + "（期望=" + entry.sha256 + " 实际=" + actual + "），跳过");
                state.status = DownloadState.Status.FAILED;
                reporter.setSlotPhase(slot, "failed");
                zipFile.delete();
                return;
            }
            reporter.log("热更", "INFO", "[" + fileName + "] SHA-256 校验通过");
        }

        reporter.setSlotPhase(slot, "extracting");
        reporter.log("热更", "INFO", "[" + fileName + "] 开始解压");

        try {
            unzipHotPatch(zipFile, ctx.getFilesDir());
        } catch (java.io.IOException e) {
            reporter.log("热更", "WARN", "[" + fileName + "] 解压失败：" + e.getMessage());
            state.status = DownloadState.Status.FAILED;
            reporter.setSlotPhase(slot, "failed");
            zipFile.delete();
            return;
        }

        zipFile.delete();
        prefs.edit().putInt(versionKey, serverVer).apply();
        state.status = DownloadState.Status.DONE;
        reporter.setSlotPhase(slot, "done");
        reporter.log("热更", "INFO", "[" + fileName + "] 更新完成，版本=" + serverVer);
        // 热更新改变了脚本文件，异步重建清单
        File manifestFile = new File(new File(ctx.getFilesDir(), "cnv_inject"),
                ResourceIntegrityChecker.MANIFEST_NAME);
        File baseDir = ctx.getFilesDir();
        new Thread(() -> ResourceIntegrityChecker.generate(baseDir, manifestFile),
                "cnv-manifest-hotupdate").start();
    }

    private static void unzipHotPatch(File zipFile, File destDir) throws java.io.IOException {
        // C-H1: 委托给 Unzip.extract()，内置 zip-slip（canonical-path）防护。
        // 热更新 zip 条目形如 magica/js/libs/foo.json，需保留 magica/ 前缀落到
        // filesDir/magica/js/libs/foo.json，供 WebViewInterceptor 在该路径服务。
        // 因此 stripPrefix 传 "" 不剥离（区别于主资源包用 DEFAULT_STRIP_PREFIX）。
        Unzip.extract(zipFile, destDir, "", new Unzip.ProgressSink() {
            @Override public void onEntry(String n, long idx, long est) {}
            @Override public void onBytes(long p, long t) {}
            @Override public boolean isCancelled() { return false; }
        });
    }

    /** 计算文件的 SHA-256，失败时抛出 IOException（C-L2: 不再静默跳过）。 */
    private static String sha256HexFromFile(File file) throws java.io.IOException {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            try (java.io.FileInputStream fis = new java.io.FileInputStream(file)) {
                byte[] buf = new byte[65536];
                int n;
                while ((n = fis.read(buf)) != -1) md.update(buf, 0, n);
            }
            byte[] hash = md.digest();
            StringBuilder sb = new StringBuilder(hash.length * 2);
            for (byte b : hash) {
                int v = b & 0xff;
                if (v < 0x10) sb.append('0');
                sb.append(Integer.toHexString(v));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
            throw new java.io.IOException("SHA-256 算法不可用", e);
        }
    }

    /** 计算文件的 SHA-256，失败时返回空字符串（用于热更新等非致命校验场景）。 */
    private static String sha256Hex(File file) {
        try {
            return sha256HexFromFile(file);
        } catch (Exception e) {
            return "";
        }
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
        // 生成脚本/配置文件完整性清单（异步，不阻塞调用方）
        File manifestFile = new File(dir, ResourceIntegrityChecker.MANIFEST_NAME);
        File baseDir      = ctx.getFilesDir();
        new Thread(() -> ResourceIntegrityChecker.generate(baseDir, manifestFile),
                "cnv-manifest-gen").start();
    }

    /**
     * 写出临时离线注入标记 {@code cn_resources_provisional.flag}。
     *
     * <p>故意不写正式就绪标记、也不生成完整性清单：临时资源"不算数"，
     * 服务端恢复后须重新下载或重新载入离线包，无需对它做后续完整性校验。
     * {@code BootstrapActivity.isResourcesAlreadyReady()} 只认正式标记，
     * 因此本标记不会让下次启动误判为已完成正式安装。
     */
    private void writeProvisionalFlag() throws java.io.IOException {
        File dir  = new File(ctx.getFilesDir(), "cnv_inject");
        if (!dir.exists() && !dir.mkdirs()) {
            throw new java.io.IOException("无法创建 cnv_inject 目录");
        }
        File flag = new File(dir, "cn_resources_provisional.flag");
        try (FileOutputStream fos = new FileOutputStream(flag)) {
            fos.write(("provisional:" + System.currentTimeMillis() + "\n").getBytes("UTF-8"));
        }
        reporter.log("INFO", "已写出临时离线标记: " + flag.getAbsolutePath());
    }

    private ResourceFlow() { throw new AssertionError(); }
}
