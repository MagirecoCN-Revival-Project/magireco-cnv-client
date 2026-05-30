package io.kamihama.magianative;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/**
 * WebView 补丁集中地，由 smali 补丁 (WebViewImpl$WebViewClientImpl) 调用。
 *
 * <p><b>静态文件拦截（{@link #intercept}）：</b>
 * WebView 发出含 "/magica/" 路径的请求时，优先从本地
 * {@code /data/data/io.kamihama.totentanz/files/magica/<相对路径>} 提供文件；
 * 不存在时尝试 APK assets/cnv/；API 请求（{@code api/} 前缀）直接放行走网络。
 *
 * <p><b>页面加载完成（{@link #onPageFinished}）：</b>
 * 在所有 /magica/ 页面注入 cnv_shadow.js，用于 WebView 编队/昵称/配置的本地备份
 * 和会话回放。API 级别的文字汉化由同一脚本内的 jQuery 劫持层在内存中完成，
 * 不依赖本类的文件替换机制。
 */
public class WebViewInterceptor {

    private static final String TAG       = "MagiaHook-URL";
    private static final String LOCAL_DIR = "/data/data/io.kamihama.totentanz/files/magica/";

    // ── JS 桥安装 ──────────────────────────────────────────────────────────────

    /**
     * 在 WebView 初始化完成后调用，注入 CnvBridge JavascriptInterface。
     * 由 WebViewImpl smali 补丁在 addJavascriptInterface("androidCommand") 之后调用。
     */
    public static void installJsBridge(WebView view) {
        Context ctx = view.getContext().getApplicationContext();
        CnvJsBridge bridge = new CnvJsBridge(PlayerStateCache.get(ctx), resolveAccountId(ctx));
        view.addJavascriptInterface(bridge, "CnvBridge");
    }

    /**
     * 账号 ID 解析优先级：
     * 1. SharedPreferences cnv_account/account_id（登录成功后写入）
     * 2. 硬件绑定设备 ID（未登录时的匿名标识）
     */
    private static String resolveAccountId(Context ctx) {
        SharedPreferences prefs = ctx.getSharedPreferences("cnv_account", Context.MODE_PRIVATE);
        String saved = prefs.getString("account_id", null);
        if (saved != null && !saved.isEmpty()) return saved;
        try { return io.kamihama.cnv.DeviceId.get(ctx); }
        catch (Throwable t) { return "default"; }
    }

    // ── 完整请求拦截（含 GET API 缓存注入）──────────────────────────────────────

    /**
     * 带 WebResourceRequest 的拦截入口，由 smali 补丁的
     * shouldInterceptRequest(WebView, WebResourceRequest) 调用。
     *
     * 相比 String 版多了一个能力：对 GET /magica/api/user/ 请求，
     * 优先从 SQLite 返回上次 POST 确认的玩家状态，解决回放时序问题。
     */
    public static WebResourceResponse interceptFull(WebView view, WebResourceRequest request) {
        String url    = request.getUrl().toString();
        String method = request.getMethod();

        if ("GET".equals(method) && url.contains("/magica/api/user/")) {
            String endpoint = normalizeEndpoint(url);
            // 必须与 installJsBridge / CnvJsBridge 用同一个 accountId 来源：
            // 登录后桥用 cnv_account/account_id 写缓存，这里若退化成 DeviceId 查，
            // 两个 key 命名空间不一致 → 登录态下 GET 注入永远查不到刚写入的缓存。
            String accountId = resolveAccountId(view.getContext());
            String cached = PlayerStateCache.get(view.getContext())
                                            .loadRespJson(accountId, endpoint);
            if (cached != null) {
                Log.i("MagiaHook-Cache", "GET hit: " + endpoint);
                return new WebResourceResponse(
                    "application/json", "utf-8",
                    new ByteArrayInputStream(cached.getBytes(StandardCharsets.UTF_8)));
            }
        }

        return intercept(view, url);
    }

    /** 去掉 scheme+host 和 query string，与 JS 侧规范化逻辑保持一致。 */
    private static String normalizeEndpoint(String url) {
        String path = url.replaceAll("\\?.*$", "");
        int idx = path.indexOf("/magica/");
        return idx >= 0 ? path.substring(idx) : path;
    }

    /** cnv_shadow.js 注入片段，避免重复加载。 */
    private static final String SHADOW_JS =
            "(function(){" +
            "if(window.__cnvShadowLoaded)return;" +
            "var s=document.createElement('script');" +
            "s.src='/magica/cnv/cnv_shadow.js';" +
            "document.documentElement.appendChild(s);" +
            "})()";

    /**
     * 页面加载完成回调：在 /magica/ 页面注入 cnv_shadow.js。
     *
     * <p>由 smali 补丁在 {@code onPageFinished} 里调用，调用原始
     * {@code _didFinishLoading} 之前执行。
     */
    public static void onPageFinished(WebView view, String url) {
        if (url == null || !url.contains("/magica/")) return;
        view.evaluateJavascript(SHADOW_JS, null);
    }

    /**
     * 尝试拦截请求并返回本地文件响应。
     *
     * @return 命中本地文件或 APK asset 时返回 WebResourceResponse；否则返回 null（由调用方走原始逻辑）。
     */
    public static WebResourceResponse intercept(WebView view, String url) {
        Log.i(TAG, url);

        if (!url.contains("/magica/")) return null;

        // 提取 /magica/ 之后的相对路径，并去掉 query string
        int start = url.indexOf("/magica/") + "/magica/".length();
        String relPath = url.substring(start);
        int qIdx = relPath.indexOf('?');
        if (qIdx != -1) relPath = relPath.substring(0, qIdx);

        // API 请求不走本地文件
        if (relPath.startsWith("api/")) return null;

        String localPath = LOCAL_DIR + relPath;
        Log.i("MagiaHook-Path", localPath);

        File localFile = new File(localPath);
        // 路径穿越防御：规范化后必须仍在 LOCAL_DIR 之内。
        // 否则恶意服务端页面可请求 /magica/../../shared_prefs/cnv_account.xml
        // 之类路径，把账号 token 等私有文件读出来回传给（同源）WebView。
        if (!isWithinLocalDir(localFile)) {
            Log.w(TAG, "拒绝越界路径: " + localPath);
            return null;
        }
        if (localFile.exists()) {
            Log.i("MagiaHook-Found", localPath);
            String mimeType = guessMimeType(relPath);
            try {
                FileInputStream fis = new FileInputStream(localFile);
                return new WebResourceResponse(mimeType, "utf-8", fis);
            } catch (Exception e) {
                Log.e("MagiaHook-Err", e.toString());
                return null;
            }
        }

        // 本地文件不存在时，尝试从 APK assets 提供（仅限 cnv/ 路径，即内置 CNV 脚本）
        if (relPath.startsWith("cnv/")) {
            try {
                InputStream is = view.getContext().getAssets().open("cnv/" + relPath.substring("cnv/".length()));
                String mimeType = guessMimeType(relPath);
                Log.i("MagiaHook-Asset", relPath);
                return new WebResourceResponse(mimeType, "utf-8", is);
            } catch (Exception e) {
                Log.e("MagiaHook-Err", "asset not found: " + relPath);
                return null;
            }
        }

        return null;
    }

    /** 校验文件规范化路径仍位于 LOCAL_DIR 之内（zip-slip 同款防御）。 */
    private static boolean isWithinLocalDir(File f) {
        try {
            String base   = new File(LOCAL_DIR).getCanonicalPath();
            String target = f.getCanonicalPath();
            return target.equals(base) || target.startsWith(base + File.separator);
        } catch (Exception e) {
            return false; // 规范化失败一律拒绝
        }
    }

    private static String guessMimeType(String path) {
        if (path.endsWith(".png"))  return "image/png";
        if (path.endsWith(".jpg"))  return "image/jpeg";
        if (path.endsWith(".jpeg")) return "image/jpeg";
        if (path.endsWith(".json")) return "application/json";
        if (path.endsWith(".js"))   return "application/javascript";
        if (path.endsWith(".css"))  return "text/css";
        if (path.endsWith(".html")) return "text/html";
        return "application/octet-stream";
    }
}
