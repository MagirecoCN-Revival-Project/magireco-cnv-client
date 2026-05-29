package io.kamihama.magianative;

import android.webkit.JavascriptInterface;

/**
 * WebView JavascriptInterface，JS 名 "CnvBridge"。
 *
 * 由 WebViewInterceptor.installJsBridge() 在 WebView 初始化时注入。
 * JS 侧通过 window.CnvBridge.* 访问所有方法。
 */
public final class CnvJsBridge {

    /** 端点白名单前缀；只接受游戏 API 路径，防止 JS 把任意 key 写进缓存。 */
    private static final String ENDPOINT_PREFIX = "/magica/api/";
    /** 端点字符串长度上限，防止超长 key 撑爆 SQLite。 */
    private static final int    ENDPOINT_MAX_LEN = 512;

    private final PlayerStateCache cache;
    private final String           accountId;

    CnvJsBridge(PlayerStateCache cache, String accountId) {
        this.cache     = cache;
        this.accountId = accountId;
    }

    /** 校验端点合法：非空、长度有界、以 /magica/api/ 开头、不含路径穿越。 */
    private static boolean isValidEndpoint(String endpoint) {
        return endpoint != null
            && !endpoint.isEmpty()
            && endpoint.length() <= ENDPOINT_MAX_LEN
            && endpoint.startsWith(ENDPOINT_PREFIX)
            && !endpoint.contains("..");
    }

    /**
     * 保存某端点的请求体和响应体。
     * 由 cnv_shadow.js 在 POST 成功后调用。
     *
     * @param endpoint  规范化的路径（不含 scheme/host/query），如 /magica/api/user/deck/1
     * @param reqJson   发出的请求体 JSON 字符串（可为空）
     * @param respJson  服务端返回的响应体 JSON 字符串（可为空）
     */
    @JavascriptInterface
    public void saveState(String endpoint, String reqJson, String respJson) {
        if (!isValidEndpoint(endpoint)) return;
        cache.save(accountId, endpoint, reqJson, respJson);
    }

    /**
     * 加载当前账号所有已缓存的状态。
     *
     * @return JSON 对象字符串，格式见 PlayerStateCache.loadAll() 文档。
     */
    @JavascriptInterface
    public String loadAllState() {
        return cache.loadAll(accountId);
    }

    /** 删除某端点缓存（服务端拒绝时由 JS 调用）。 */
    @JavascriptInterface
    public void deleteState(String endpoint) {
        if (isValidEndpoint(endpoint)) {
            cache.delete(accountId, endpoint);
        }
    }

    /** 返回当前账号 ID（设备绑定，或未来账号系统登录后更新）。 */
    @JavascriptInterface
    public String getAccountId() {
        return accountId;
    }
}
