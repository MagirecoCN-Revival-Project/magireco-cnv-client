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

    private CloudEndpoint() {}
}
