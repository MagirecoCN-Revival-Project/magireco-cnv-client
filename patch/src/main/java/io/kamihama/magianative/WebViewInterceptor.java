package io.kamihama.magianative;

import android.util.Log;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.File;
import java.io.FileInputStream;

/**
 * WebView 本地资源拦截器。
 *
 * 游戏内嵌 WebView 发出含 "/magica/" 路径的请求时，优先从本地
 * /data/data/io.kamihama.totentanz/files/magica/<相对路径> 目录提供文件。
 * 本地文件不存在，或请求路径以 "api/" 开头时，放行由上层走网络。
 *
 * 由 smali 补丁 (WebViewImpl$WebViewClientImpl.shouldInterceptRequest) 调用。
 */
public class WebViewInterceptor {

    private static final String TAG       = "MagiaHook-URL";
    private static final String LOCAL_DIR = "/data/data/io.kamihama.totentanz/files/magica/";

    /**
     * 尝试拦截请求并返回本地文件响应。
     *
     * @return 命中本地文件时返回 WebResourceResponse；否则返回 null（由调用方走原始逻辑）。
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
        if (!localFile.exists()) return null;

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
