package io.kamihama.magianative;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.Intent;
import android.os.Process;
import android.util.ArrayMap;
import android.util.Log;

import org.json.JSONObject;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import okhttp3.Call;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * 游戏网络客户端。
 *
 * 原始职责：向游戏服务器发送 JSON POST 请求并处理重定向。
 * 新增职责：CN 资源初次全量下载、热更新检查、断点续传工具方法。
 *
 * 所有 CN 下载方法均为 public static，由 libcn_hook.so 通过 JNI 直接调用。
 */
public class RestClient {

    private static final String TAG  = "MagiaClientJNI";
    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    // 主用 CDN 基础 URL（供 downloadAllFiles 使用）
    private static final String CDN_PRIMARY   = "https://magireco-assets.magireco.top";
    private static final String CDN_SECONDARY = "https://magireco-assets.madeinmagius.top";

    // 游戏数据目录
    private static final String FILES_DIR  = "/data/data/io.kamihama.totentanz/files/";
    private static final String FLAG_FILE  = FILES_DIR + "madomagi/magica/cn_base_done.flag";
    private static final String MAGICA_DIR = FILES_DIR + "madomagi/magica";

    // SharedPreferences 名称（存储本地版本号）
    private static final String PREFS_NAME = "MagiaCN";

    // 热更新版本检查 URL（GitHub Raw）
    private static final String VER_URL_SCENARIO =
        "https://raw.githubusercontent.com/HiiragiNemu/magireco-cn-patch/main/version_scenario.json";
    private static final String VER_URL_JS =
        "https://raw.githubusercontent.com/HiiragiNemu/magireco-cn-patch/main/version_js.json";

    // HTTP/1.1 专用客户端（部分 CDN 不支持 HTTP/2，懒初始化）
    private static OkHttpClient http1Client;

    // -------------------------------------------------------------------------
    // 实例字段（供游戏原有逻辑使用）
    // -------------------------------------------------------------------------

    private final String Endpoint;
    private final String LogTag;
    private final String UserAgent;
    private OkHttpClient client;

    public RestClient() {
        Endpoint  = "https://totentanz-9b.magica-us.com";
        LogTag    = TAG;
        UserAgent = "okhttp3 " + System.getProperty("http.agent");
        client    = getUnsafeOkHttpClient();
    }

    // -------------------------------------------------------------------------
    // 原始游戏接口
    // -------------------------------------------------------------------------

    public String GetEndpoint(int version) {
        JSONObject body = new JSONObject();
        try { body.put("version", version); } catch (Exception e) {
            Log.e(TAG, "Error adding version: " + e);
            return "";
        }
        try {
            return postRequest("https://totentanz-9b.magica-us.com/magica/api/snaa", body.toString());
        } catch (IOException e) {
            Log.e(TAG, "Error with request: " + e);
            return "";
        }
    }

    // -------------------------------------------------------------------------
    // CN 入口（由 libcn_hook.so 通过 JNI 调用）
    // -------------------------------------------------------------------------

    /**
     * 首次安装时调用，全量下载 15 个 CN 资源包。
     * 若 flag 文件已存在，则直接返回。
     */
    public static void startCNDownload() {
        Log.i(TAG, "[CN] startCNDownload 被调用");

        Activity activity = getCurrentActivity();
        try {
            if (activity != null) CNCNDownloadUI.show(activity);
        } catch (Exception e) {
            Log.e(TAG, e.toString());
        }

        if (new File(FLAG_FILE).exists()) {
            CNCNDownloadUI.hide();
            return;
        }

        Log.i(TAG, "[CN] 开始全新安装(14线程并发模式)");
        new File(MAGICA_DIR).mkdirs();
        downloadAllFiles();

        // 等待所有文件完成
        while (true) {
            int[] status = CNCNDownloadUI.fileStatus;
            if (status == null) break;
            boolean allDone = true;
            for (int s : status) if (s < CNCNDownloadUI.fileStatus.length) { allDone = false; break; }
            // 检查是否全部为 STATUS_DONE(2)
            allDone = true;
            for (int s : status) { if (s < 2) { allDone = false; break; } }
            if (allDone) break;
            try { Thread.sleep(200); } catch (InterruptedException ignored) {}
        }

        CNCNDownloadUI.updateSimple("✅ 安装完成！写入标记...", "🔗 游戏即将重启", 100);

        // 写入 done flag
        try {
            File flag = new File(FLAG_FILE);
            flag.getParentFile().mkdirs();
            FileOutputStream fos = new FileOutputStream(flag);
            fos.write("done".getBytes());
            fos.close();
        } catch (Exception e) {
            Log.e(TAG, e.getMessage());
            CNCNDownloadUI.hide();
            return;
        }

        CNCNDownloadUI.hide();
        Log.i(TAG, "[CN] ★ 安装完成，准备重启");
        try { Thread.sleep(2000); } catch (InterruptedException ignored) {}
        restartApp();
    }

    /**
     * 每次启动时调用，检查 GitHub 上 scenario 与 JS 的版本号，
     * 如有更新则下载对应 zip 并解压。
     */
    public static void checkAndApplyHotUpdate() {
        if (!new File(FLAG_FILE).exists()) {
            Log.i(TAG, "[热更] flag不存在，跳过");
            return;
        }

        // 等待 Activity 就绪（最多等 30 × 100ms = 3s）
        Activity activity = null;
        for (int i = 0; i < 30; i++) {
            activity = getCurrentActivity();
            if (activity != null) break;
            try { Thread.sleep(100); } catch (InterruptedException ignored) {}
        }
        if (activity != null) {
            CNCNDownloadUI.show(activity);
            Log.i(TAG, "[热更] UI已显示");
        }

        // --- scenario 热更 ---
        try {
            JSONObject verJson = fetchVersionJson(VER_URL_SCENARIO);
            if (verJson != null) {
                int serverVer = verJson.getInt("version");
                int localVer  = readLocalVersionInt("scenario_version");
                Log.i(TAG, "[热更] scenario server=" + serverVer + " local=" + localVer);
                if (serverVer > localVer) {
                    Log.i(TAG, "[热更] scenario需要更新，开始下载");
                    String zipPath = FILES_DIR + "cn_scenario_update.zip";
                    boolean ok = cnDownloadFileFull(
                        CDN_SECONDARY + "/cn_scenario_update.zip",
                        zipPath, "cn_scenario_update.zip", 14);
                    if (ok) {
                        Log.i(TAG, "[热更] scenario解压中...");
                        unzip(zipPath, FILES_DIR);
                        new File(zipPath).delete();
                        saveLocalVersionInt("scenario_version", serverVer);
                        Log.i(TAG, "[热更] scenario更新完成");
                    }
                } else {
                    Log.i(TAG, "[热更] scenario无需更新");
                }
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString());
        }

        // --- JS 热更 ---
        try {
            JSONObject verJson = fetchVersionJson(VER_URL_JS);
            if (verJson != null) {
                int serverVer = verJson.getInt("version");
                int localVer  = readLocalVersionInt("js_version");
                Log.i(TAG, "[热更] js server=" + serverVer + " local=" + localVer);
                if (serverVer > localVer) {
                    Log.i(TAG, "[热更] js需要更新，开始下载");
                    String zipPath = FILES_DIR + "cn_js_update_hot.zip";
                    boolean ok = cnDownloadFileFull(
                        CDN_PRIMARY + "/cn_js_update.zip",
                        zipPath, "cn_js_update.zip", 11);
                    if (ok) {
                        Log.i(TAG, "[热更] js解压中...");
                        unzip(zipPath, FILES_DIR);
                        new File(zipPath).delete();
                        saveLocalVersionInt("js_version", serverVer);
                        Log.i(TAG, "[热更] js更新完成");
                    }
                } else {
                    Log.i(TAG, "[热更] js无需更新");
                }
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString());
        }

        Log.i(TAG, "[热更] 检查完毕，关闭UI");
        CNCNDownloadUI.hide();
    }

    // -------------------------------------------------------------------------
    // 下载核心
    // -------------------------------------------------------------------------

    /**
     * 断点续传下载单个文件。
     *
     * @param url         主 URL
     * @param destPath    目标文件路径（下载完成后 .part 改名为此）
     * @param displayName 显示名称
     * @param fileIndex   文件在进度数组中的下标
     * @return 成功返回 true
     */
    public static boolean cnDownloadFileFull(String url, String destPath, String displayName, int fileIndex) {
        // 文件已存在则直接标记完成
        if (new File(destPath).exists()) {
            Log.i(TAG, "[cnDL] 已存在跳过");
            CNCNDownloadUI.markFileDone(fileIndex);
            return true;
        }

        String partPath = destPath + ".part";
        int resumeFrom = 0;

        File partFile = new File(partPath);
        if (partFile.exists()) {
            resumeFrom = (int) partFile.length();
        }

        try {
            String rangeHeader = resumeFrom > 0 ? ("bytes=" + resumeFrom + "-") : "";

            // 先尝试主 URL
            Response response = doGet(url, rangeHeader);
            if (response == null || (!response.isSuccessful() && response.code() != 206)) {
                // 切换备用 CDN
                String fallback = getFallbackUrl(fileIndex);
                if (fallback != null) {
                    Log.w(TAG, "[cnDL] 切换备用");
                    response = doGet(fallback, rangeHeader);
                }
            }

            if (response == null || response.body() == null) {
                Log.e(TAG, "[cnDL] ✗ 全部失败");
                return false;
            }

            ResponseBody body = response.body();
            long contentLength = body.contentLength();
            int totalSize = contentLength > 0 ? (int) contentLength : 0;

            float totalMb = (resumeFrom + totalSize) / 1_000_000f;
            CNCNDownloadUI.setFileSize(fileIndex, totalMb);

            InputStream in = body.byteStream();
            new File(partPath).getParentFile().mkdirs();
            FileOutputStream out = new FileOutputStream(partPath, true);

            byte[] buf = new byte[256 * 1024];
            int bytesThisSession = 0;
            int bytesThisInterval = 0;
            long intervalStart = System.currentTimeMillis();

            CNCNDownloadUI.updateFileProgress(fileIndex, resumeFrom);

            int n;
            while ((n = in.read(buf)) != -1) {
                out.write(buf, 0, n);
                bytesThisSession  += n;
                bytesThisInterval += n;

                if (bytesThisInterval >= 256 * 1024) {
                    long now = System.currentTimeMillis();
                    long elapsed = now - intervalStart;
                    if (elapsed > 50) {
                        float speedMbps = (bytesThisInterval * 1000f) / (elapsed * 1_000_000f);
                        CNCNDownloadUI.setDownloadSpeed(fileIndex, speedMbps);
                        intervalStart = now;
                        bytesThisInterval = 0;
                    }
                    float downloadedMb = (resumeFrom + bytesThisSession) / 1_000_000f;
                    CNCNDownloadUI.setFileDownloaded(fileIndex, downloadedMb);
                }

                if (totalSize > 0 && (resumeFrom + bytesThisSession + resumeFrom) > 0) {
                    int pct = (int) ((resumeFrom + bytesThisSession) * 100f / (resumeFrom + totalSize));
                    pct = Math.max(0, Math.min(100, pct));
                    CNCNDownloadUI.updateFileProgress(fileIndex, pct);
                }
            }

            out.close();
            in.close();
            new File(partPath).renameTo(new File(destPath));
            Log.i(TAG, "[cnDL] ✓ 完成");
            return true;

        } catch (Exception e) {
            Log.e(TAG, "[cnDL] 异常(已不再重试)");
            return false;
        }
    }

    /** 并发下载所有 15 个 CN 资源包（每个文件一个线程）。 */
    private static void downloadAllFiles() {
        String[][] files = {
            { CDN_PRIMARY   + "/cn_base_00_db.zip",       FILES_DIR + "cn_base_00_db.zip",       "cn_base_00_db.zip"       },
            { CDN_PRIMARY   + "/cn_base_01_json.zip",     FILES_DIR + "cn_base_01_json.zip",     "cn_base_01_json.zip"     },
            { CDN_PRIMARY   + "/cn_base_02.zip",          FILES_DIR + "cn_base_02.zip",          "cn_base_02.zip"          },
            { CDN_PRIMARY   + "/cn_base_03.zip",          FILES_DIR + "cn_base_03.zip",          "cn_base_03.zip"          },
            { CDN_PRIMARY   + "/cn_base_04.zip",          FILES_DIR + "cn_base_04.zip",          "cn_base_04.zip"          },
            { CDN_PRIMARY   + "/cn_base_05.zip",          FILES_DIR + "cn_base_05.zip",          "cn_base_05.zip"          },
            { CDN_PRIMARY   + "/cn_base_06.zip",          FILES_DIR + "cn_base_06.zip",          "cn_base_06.zip"          },
            { CDN_PRIMARY   + "/cn_magica_resource.zip",  FILES_DIR + "cn_magica_resource.zip",  "cn_magica_resource.zip"  },
            { CDN_SECONDARY + "/cn_scenario_img.zip",     FILES_DIR + "cn_scenario_img.zip",     "cn_scenario_img.zip"     },
            { CDN_SECONDARY + "/cn_voice_01.zip",         FILES_DIR + "cn_voice_01.zip",         "cn_voice_01.zip"         },
            { CDN_SECONDARY + "/cn_voice_02_done.zip",    FILES_DIR + "cn_voice_02_done.zip",    "cn_voice_02_done.zip"    },
            { CDN_PRIMARY   + "/cn_js_update.zip",        FILES_DIR + "cn_js_update.zip",        "cn_js_update.zip"        },
            { CDN_SECONDARY + "/movie.zip",               FILES_DIR + "movie.zip",               "movie.zip"               },
            { CDN_SECONDARY + "/movie2.zip",              FILES_DIR + "movie2.zip",              "movie2.zip"              },
            { CDN_SECONDARY + "/cn_scenario_update.zip",  FILES_DIR + "cn_scenario_update.zip",  "cn_scenario_update.zip"  },
        };

        Thread[] threads = new Thread[files.length];
        for (int i = 0; i < files.length; i++) {
            final DownloadRunnable r = new DownloadRunnable(files[i][0], files[i][1], files[i][2], i);
            threads[i] = new Thread(r);
            threads[i].start();
        }
        for (Thread t : threads) joinThread(t);
    }

    // -------------------------------------------------------------------------
    // 工具方法
    // -------------------------------------------------------------------------

    /** 获取当前文件索引对应的备用 CDN URL。 */
    public static String getFallbackUrl(int fileIndex) {
        String[] urls = CNCNDownloadUI.FILE_URLS;
        if (urls == null || fileIndex >= urls.length) return null;
        return urls[fileIndex];
    }

    /** 通过反射从 ActivityThread 获取当前 Activity。 */
    public static Activity getCurrentActivity() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Method m = at.getMethod("currentActivityThread");
            Object thread = m.invoke(null);
            Field f = at.getDeclaredField("mActivities");
            f.setAccessible(true);
            ArrayMap<?, ?> activities = (ArrayMap<?, ?>) f.get(thread);
            if (activities == null || activities.isEmpty()) return null;
            Object record = activities.valueAt(0);
            Field fa = record.getClass().getDeclaredField("activity");
            fa.setAccessible(true);
            return (Activity) fa.get(record);
        } catch (Exception e) {
            Log.e(TAG, e.getMessage());
            return null;
        }
    }

    /** 读取 SharedPreferences 中存储的版本号（整数）。 */
    private static int readLocalVersionInt(String key) {
        try {
            Context ctx = getAppContext();
            if (ctx == null) return 0;
            return ctx.getSharedPreferences(PREFS_NAME, 0).getInt(key, 0);
        } catch (Exception e) {
            return 0;
        }
    }

    /** 保存版本号到 SharedPreferences。 */
    private static void saveLocalVersionInt(String key, int value) {
        try {
            Context ctx = getAppContext();
            if (ctx == null) return;
            ctx.getSharedPreferences(PREFS_NAME, 0).edit().putInt(key, value).apply();
        } catch (Exception ignored) {}
    }

    /** 通过反射从 ActivityThread 获取 Application Context。 */
    private static Context getAppContext() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Method currentThread = at.getMethod("currentActivityThread");
            Object thread = currentThread.invoke(null);
            Method getApp = at.getMethod("getApplication");
            return (Context) getApp.invoke(thread);
        } catch (Exception e) {
            return null;
        }
    }

    /** 从 GitHub Raw 获取版本 JSON。 */
    private static JSONObject fetchVersionJson(String url) {
        try {
            OkHttpClient client = new OkHttpClient();
            Request req = new Request.Builder().url(url).build();
            Response resp = client.newCall(req).execute();
            if (!resp.isSuccessful()) return null;
            ResponseBody body = resp.body();
            if (body == null) return null;
            return new JSONObject(body.string());
        } catch (Exception e) {
            return null;
        }
    }

    /** 重启应用（finish → startActivity → killProcess）。 */
    public static void restartApp() {
        Log.i(TAG, "[CN] restartApp 开始");
        try {
            Activity activity = getCurrentActivity();
            if (activity != null) {
                Intent intent = activity.getPackageManager()
                        .getLaunchIntentForPackage(activity.getPackageName());
                if (intent != null) {
                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
                    activity.finish();
                    try { Thread.sleep(500); } catch (InterruptedException ignored) {}
                    activity.startActivity(intent);
                    try { Thread.sleep(1000); } catch (InterruptedException ignored) {}
                }
            }
        } catch (Exception ignored) {}
        Process.killProcess(Process.myPid());
    }

    /** 解压 zip 文件到目标目录。 */
    public static void unzip(String zipFilePath, String destPath) {
        Log.i(TAG, "unzip: " + zipFilePath + " → " + destPath);
        try {
            File dest = new File(destPath);
            if (!dest.exists()) dest.mkdirs();

            try (ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFilePath))) {
                ZipEntry entry;
                byte[] buf = new byte[4096];
                while ((entry = zis.getNextEntry()) != null) {
                    String entryPath = destPath + File.separator + entry.getName();
                    if (entry.isDirectory()) {
                        new File(entryPath).mkdirs();
                    } else {
                        File outFile = new File(entryPath);
                        outFile.getParentFile().mkdirs();
                        try (BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(entryPath))) {
                            int n;
                            while ((n = zis.read(buf)) != -1) bos.write(buf, 0, n);
                        }
                    }
                    zis.closeEntry();
                }
            }
            Log.i(TAG, "【解压】成功: " + zipFilePath);
        } catch (Exception e) {
            Log.e(TAG, "【解压】失败: " + e.getMessage());
        }
    }

    public static void joinThread(Thread t) {
        if (t == null) return;
        try { t.join(); } catch (InterruptedException ignored) {}
    }

    // -------------------------------------------------------------------------
    // OkHttpClient 工厂
    // -------------------------------------------------------------------------

    /** 获取（懒初始化）强制 HTTP/1.1 的下载客户端。 */
    private static OkHttpClient getHttp1Client() {
        if (http1Client != null) return http1Client;
        List<Protocol> protocols = new ArrayList<>();
        protocols.add(Protocol.HTTP_1_1);
        http1Client = new OkHttpClient.Builder()
                .connectTimeout(30_000, TimeUnit.MILLISECONDS)
                .readTimeout(120_000, TimeUnit.MILLISECONDS)
                .writeTimeout(120_000, TimeUnit.MILLISECONDS)
                .protocols(protocols)
                .build();
        return http1Client;
    }

    /** 创建信任所有证书的 OkHttpClient（供游戏原始 API 使用）。 */
    private static OkHttpClient getUnsafeOkHttpClient() {
        try {
            TrustManager[] trustAll = new TrustManager[]{
                new X509TrustManager() {
                    public void checkClientTrusted(X509Certificate[] chain, String authType) {}
                    public void checkServerTrusted(X509Certificate[] chain, String authType) {}
                    public X509Certificate[] getAcceptedIssuers() { return new X509Certificate[0]; }
                }
            };
            SSLContext ctx = SSLContext.getInstance("SSL");
            ctx.init(null, trustAll, new SecureRandom());
            List<Protocol> protocols = new ArrayList<>();
            protocols.add(Protocol.HTTP_1_1);
            return new OkHttpClient.Builder()
                    .sslSocketFactory(ctx.getSocketFactory(), (X509TrustManager) trustAll[0])
                    .hostnameVerifier((hostname, session) -> true)
                    .connectTimeout(30_000, TimeUnit.MILLISECONDS)
                    .readTimeout(120_000, TimeUnit.MILLISECONDS)
                    .writeTimeout(120_000, TimeUnit.MILLISECONDS)
                    .protocols(protocols)
                    .build();
        } catch (Throwable t) {
            Log.e(TAG, t.toString());
            return null;
        }
    }

    /** 执行 GET 请求，支持 Range 断点续传头。 */
    private static Response doGet(String url, String rangeHeader) {
        try {
            OkHttpClient client = getHttp1Client();
            if (client == null) return null;
            Request.Builder builder = new Request.Builder().url(url);
            if (rangeHeader != null && !rangeHeader.isEmpty())
                builder.addHeader("Range", rangeHeader);
            return client.newCall(builder.build()).execute();
        } catch (Exception e) {
            return null;
        }
    }

    // -------------------------------------------------------------------------
    // 原始游戏 HTTP 方法
    // -------------------------------------------------------------------------

    private String postRequest(String url, String json) throws IOException {
        RequestBody body = RequestBody.create(JSON, json);
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .removeHeader("User-Agent")
                .addHeader("User-Agent", UserAgent)
                .build();

        Response response = client.newCall(request).execute();

        // 手动处理 301 / 302 重定向（保留请求体）
        if (response.code() == 301 || response.code() == 302) {
            String location = response.header("Location");
            if (location != null) {
                Request redirected = request.newBuilder()
                        .url(location)
                        .post(body)
                        .removeHeader("User-Agent")
                        .addHeader("User-Agent", UserAgent)
                        .build();
                response = client.newCall(redirected).execute();
            }
        }

        ResponseBody rb = response.body();
        return rb != null ? rb.string() : "";
    }

    // -------------------------------------------------------------------------
    // 内部 Runnable
    // -------------------------------------------------------------------------

    /** 单文件下载任务：下载完成后启动 UnzipRunnable。 */
    public static class DownloadRunnable implements Runnable {
        private final String url;
        private final String destPath;
        private final String displayName;
        private final int    fileIndex;
        public        boolean result;

        public DownloadRunnable(String url, String destPath, String displayName, int fileIndex) {
            this.url         = url;
            this.destPath    = destPath;
            this.displayName = displayName;
            this.fileIndex   = fileIndex;
        }

        @Override
        public void run() {
            result = cnDownloadFileFull(url, destPath, displayName, fileIndex);
            if (result) {
                UnzipRunnable unzip = new UnzipRunnable(destPath, FILES_DIR, fileIndex, true);
                new Thread(unzip).start();
            }
        }
    }

    /** 单文件解压任务：解压完成后调用 CNCNDownloadUI.markFileDone。 */
    public static class UnzipRunnable implements Runnable {
        private final String  zipPath;
        private final String  destPath;
        private final int     fileIndex;
        private final boolean deleteAfterUnzip;

        public UnzipRunnable(String zipPath, String destPath, int fileIndex, boolean deleteAfterUnzip) {
            this.zipPath          = zipPath;
            this.destPath         = destPath;
            this.fileIndex        = fileIndex;
            this.deleteAfterUnzip = deleteAfterUnzip;
        }

        @Override
        public void run() {
            String name = zipPath.substring(zipPath.lastIndexOf('/') + 1);
            CNCNDownloadUI.updateSimple("⏳ 解压中: " + name, "⏳ 正在解压...", 80);
            unzip(zipPath, destPath);
            if (deleteAfterUnzip) new File(zipPath).delete();
            CNCNDownloadUI.markFileDone(fileIndex);
        }
    }
}
