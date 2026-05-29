package io.kamihama.cnv;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;

/**
 * 在隐藏 WebView 里运行 cap-worker 的 challenge → PoW solve → redeem 流程，
 * 通过 JavascriptInterface 把最终 token 回传给 Java。
 *
 * cap-worker API (https://github.com/xyTom/cap-worker):
 *   POST /api/challenge → {token, challenge:{c,s,d}, expires}
 *   POST /api/redeem    → {success, token, expires}
 *
 * PoW 算法：对每个 i ∈ [0,c) 找最小非负整数 nonce，
 * 使 SHA-256(challengeToken + "." + i + "." + nonce) 的前 d 个二进制位均为 0。
 *
 * 用 crypto.subtle（Chromium 安全上下文）做 SHA-256，
 * 以 HTTPS cap-worker base URL 加载 data 页面，满足安全上下文要求。
 */
public final class CapWorkerSolver {

    public interface Callback {
        /** 成功，token 可直接附在登录请求里。 */
        void onToken(String token);
        /** 失败，错误描述不含敏感数据，可展示给用户。 */
        void onError(String error);
    }

    private static final Handler UI = new Handler(Looper.getMainLooper());

    /**
     * 异步求解 cap-worker 挑战。必须在主线程调用。
     *
     * @param activity    用于创建 WebView 的 Activity
     * @param root        临时 WebView 的容器（BootstrapActivity 的 vRoot）
     * @param capUrl      cap-worker 部署 URL（不含末尾斜杠）
     * @param callback    回调在主线程触发
     */
    public static void solve(Activity activity, FrameLayout root,
                             String capUrl, Callback callback) {
        WebView wv = new WebView(activity);
        WebSettings ws = wv.getSettings();
        ws.setJavaScriptEnabled(true);
        ws.setDomStorageEnabled(false);
        // C-C2: 关闭所有不需要的文件/内容访问能力，限制混合内容
        ws.setAllowFileAccess(false);
        ws.setAllowContentAccess(false);
        ws.setAllowFileAccessFromFileURLs(false);
        ws.setAllowUniversalAccessFromFileURLs(false);
        ws.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);

        wv.addJavascriptInterface(new JsBridge(root, wv, callback), "Android");
        // C-C2: 限制 WebView 只能导航到 cap-worker 同源 HTTPS 页面
        final String capHost = android.net.Uri.parse(capUrl).getHost();
        wv.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView v, String url) {
                try {
                    android.net.Uri u = android.net.Uri.parse(url);
                    return !("https".equals(u.getScheme())
                            && capHost != null
                            && capHost.equalsIgnoreCase(u.getHost()));
                } catch (Throwable t) {
                    return true; // 解析失败则拒绝
                }
            }
        });

        // 1×1 像素不可见，不影响布局
        root.addView(wv, new FrameLayout.LayoutParams(1, 1));

        // 以 HTTPS cap-worker URL 为 base，页面进入安全上下文，crypto.subtle 可用
        wv.loadDataWithBaseURL(capUrl, buildHtml(capUrl), "text/html", "utf-8", null);
    }

    // ── JavascriptInterface ───────────────────────────────────────────────────

    private static final class JsBridge {
        private final FrameLayout root;
        private final WebView     wv;
        private final Callback    cb;

        JsBridge(FrameLayout root, WebView wv, Callback cb) {
            this.root = root;
            this.wv   = wv;
            this.cb   = cb;
        }

        @JavascriptInterface
        public void onToken(String token) {
            UI.post(() -> {
                root.removeView(wv);
                wv.destroy();
                cb.onToken(token);
            });
        }

        @JavascriptInterface
        public void onError(String error) {
            UI.post(() -> {
                root.removeView(wv);
                wv.destroy();
                cb.onError(error);
            });
        }
    }

    // ── 内嵌 HTML ──────────────────────────────────────────────────────────────

    private static String buildHtml(String capUrl) {
        // capUrl 来自服务端 /client/init 下发，用 JSONObject.quote 做完整 JS 字符串
        // 转义（处理引号 / 反斜杠 / 控制字符），避免手工 replace("'") 被 \ 或换行绕过。
        String capLiteral = org.json.JSONObject.quote(capUrl);
        // language=HTML
        return "<!DOCTYPE html><html><head><meta charset='utf-8'></head><body><script>\n" +
            "const CAP = " + capLiteral + ";\n" +
            "\n" +
            "async function sha256hex(str) {\n" +
            "    const buf = await crypto.subtle.digest(\n" +
            "        'SHA-256', new TextEncoder().encode(str));\n" +
            "    return Array.from(new Uint8Array(buf))\n" +
            "        .map(b => b.toString(16).padStart(2,'0')).join('');\n" +
            "}\n" +
            "\n" +
            "function leadingZeroBits(hex) {\n" +
            "    let bits = 0;\n" +
            "    for (let i = 0; i < hex.length; i += 2) {\n" +
            "        const b = parseInt(hex.substr(i, 2), 16);\n" +
            "        if (b === 0) { bits += 8; continue; }\n" +
            "        bits += Math.clz32(b) - 24;\n" +
            "        break;\n" +
            "    }\n" +
            "    return bits;\n" +
            "}\n" +
            "\n" +
            "async function run() {\n" +
            "    try {\n" +
            "        // 1. 获取挑战\n" +
            "        const r1 = await fetch(CAP + '/api/challenge', {method:'POST'});\n" +
            "        if (!r1.ok) throw new Error('challenge HTTP ' + r1.status);\n" +
            "        const {token, challenge: {c, s, d}} = await r1.json();\n" +
            "\n" +
            "        // 2. PoW：对每个子挑战 i 求解最小 nonce\n" +
            "        const solutions = [];\n" +
            "        for (let i = 0; i < c; i++) {\n" +
            "            for (let nonce = 0; ; nonce++) {\n" +
            "                const h = await sha256hex(token + '.' + i + '.' + nonce);\n" +
            "                if (leadingZeroBits(h) >= d) { solutions.push(nonce); break; }\n" +
            "            }\n" +
            "        }\n" +
            "\n" +
            "        // 3. 兑换 token\n" +
            "        const r2 = await fetch(CAP + '/api/redeem', {\n" +
            "            method: 'POST',\n" +
            "            headers: {'Content-Type': 'application/json'},\n" +
            "            body: JSON.stringify({token, solutions})\n" +
            "        });\n" +
            "        const data = await r2.json();\n" +
            "        if (data.success) Android.onToken(data.token);\n" +
            "        else Android.onError(data.error || 'redeem failed');\n" +
            "    } catch(e) {\n" +
            "        Android.onError(String(e));\n" +
            "    }\n" +
            "}\n" +
            "\n" +
            "run();\n" +
            "</script></body></html>";
    }

    private CapWorkerSolver() {}
}
