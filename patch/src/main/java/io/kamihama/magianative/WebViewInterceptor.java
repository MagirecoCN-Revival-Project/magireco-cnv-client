package io.kamihama.magianative;

import android.util.Log;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

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
