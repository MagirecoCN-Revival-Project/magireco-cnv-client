package io.kamihama.cnv;

/**
 * 云端 API 地址集中地。
 *
 * <p>把所有指向云端的常量字符串放到本文件，
 * 服务端域名 / 路径若有变更只需改动本类，
 * 业务代码不会被牵动。
 *
 * <p>不打算把它放到 assets/ 里做运行时可改，是为了：
 * 防止"线上 init API 被替换" → "整套客户端被劫持"。
 * 这一类 URL 视为客户端可信链一部分，跟 APK 同寿命。
 */
public final class CloudEndpoint {

    /**
     * 客户端启动握手接口。
     *
     * <p>请求：POST，{@code application/json}，body 见
     * {@link ClientInit#fetch(android.content.Context, String)}。
     *
     * <p>响应：{@code application/json}，schema 见
     * {@link ClientInit.Response}。
     */
    public static final String CLIENT_INIT = "https://api.magi-reco.top/client/init";

    /**
     * 用户确认下载方式后上报服务端。
     *
     * <p>请求：POST，{@code application/json}。Body：
     * <pre>{ "device_id": "...", "method": "online" | "offline" }</pre>
     *
     * <p>响应：200 OK（无关键字段，忽略即可）。
     */
    public static final String CLIENT_METHOD_SELECT   = "https://api.magi-reco.top/client/method-select";

    /**
     * 在线下载模式：获取镜像列表和访问令牌。
     *
     * <p>请求：POST，{@code application/json}。Body：
     * <pre>{ "device_id": "..." }</pre>
     *
     * <p>响应：{@code application/json}，schema 见
     * {@link ClientInit#fetchOnlineDownload(android.content.Context)}。
     */
    public static final String CLIENT_ONLINE_DOWNLOAD = "https://api.magi-reco.top/client/online-download";

    /**
     * 离线包模式：获取离线包下载 URL、版本号和 MD5。
     *
     * <p>请求：POST，{@code application/json}。Body：
     * <pre>{ "device_id": "..." }</pre>
     *
     * <p>响应：{@code application/json}，schema 见
     * {@link ClientInit#fetchOfflinePackage(android.content.Context)}。
     */
    public static final String CLIENT_OFFLINE_PACKAGE = "https://api.magi-reco.top/client/offline-package";

    /**
     * 下载过程心跳接口。
     *
     * <p>请求：POST，{@code application/json}。Body：
     * <pre>
     * {
     *   "device_id": "...",
     *   "files": [
     *     { "name": "res/...", "status": "downloading|pending|done|failed",
     *       "percent": 45.2, "speed_bps": 102400 }
     *   ]
     * }
     * </pre>
     *
     * <p>响应 {@code action} 字段含义：
     * <ul>
     *   <li>{@code "ok"} / 无 action —— 继续，无需操作。</li>
     *   <li>{@code "switch_mirrors"} —— 服务端检测到低速异常，下发新的文件→镜像
     *       分配方案；客户端实时换线并重置受影响文件的下载任务。</li>
     *   <li>{@code "ban"} —— 服务端封禁该设备；客户端持久化封禁信息并中止下载。</li>
     * </ul>
     */
    public static final String CLIENT_HEARTBEAT = "https://api.magi-reco.top/client/heartbeat";

    /**
     * 热更新版本检查接口。每次进游戏前调用，检查 js / scenario 包是否有新版本。
     *
     * <p>请求：POST，{@code application/json}。Body：auth triple。
     *
     * <p>响应 schema：
     * <pre>
     * {
     *   "js":       { "version": 3, "md5": "abc...", "download_url": "https://..." },
     *   "scenario": { "version": 5, "md5": "def...", "download_url": "https://..." }
     * }
     * </pre>
     * version 为服务端整数版本号，客户端本地版本存于 SharedPreferences cnv_hot_update。
     */
    public static final String CLIENT_HOT_UPDATE = "https://api.magi-reco.top/client/hot-update";

    // ── 账号系统 ──────────────────────────────────────────────────────────────

    /**
     * 账号登录接口。
     *
     * <p>请求：POST，{@code application/json}。Body：
     * <pre>{ "username": "...", "password": "...", "cap_token": "..." }</pre>
     *
     * <p>成功响应（200）：
     * <pre>{ "success": true, "account_id": "...", "token": "..." }</pre>
     *
     * <p>失败响应（401/403 等）：
     * <pre>{ "success": false, "error": "..." }</pre>
     */
    public static final String ACCOUNT_LOGIN = "https://api.magi-reco.top/account/login";

    /** 注册账号页面（浏览器打开）。 */
    public static final String ACCOUNT_REGISTER = "https://api.magi-reco.top/account/register";

    /** 忘记密码页面（浏览器打开）。 */
    public static final String ACCOUNT_FORGOT = "https://api.magi-reco.top/account/forgot";

    /**
     * cap-worker 部署 URL（不含末尾斜杠），用于人机验证。
     *
     * @see <a href="https://github.com/xyTom/cap-worker">cap-worker</a>
     */
    public static final String CAP_WORKER_URL = "https://captcha.magireco.top";

    // ── 云端存档 ──────────────────────────────────────────────────────────────

    /**
     * 云端存档上传接口。
     *
     * <p>请求：POST，{@code application/json}。Body：
     * <pre>{ "token": "...", "data": { "/magica/api/...": { "req": "...", "resp": "..." }, ... } }</pre>
     *
     * <p>响应：{@code application/json}，{@code { "success": true }}。
     */
    public static final String ACCOUNT_SAVE_PUT = "https://api.magi-reco.top/account/save/put";

    /**
     * 云端存档下载接口。
     *
     * <p>请求：POST，{@code application/json}。Body：{@code { "token": "..." }}。
     *
     * <p>响应：{@code { "success": true, "data": { ... } }}，data 格式同上传 body 的 data 字段。
     * 无存档时 data 为 {@code {}}。
     */
    public static final String ACCOUNT_SAVE_GET = "https://api.magi-reco.top/account/save/get";

    private CloudEndpoint() {}
}
