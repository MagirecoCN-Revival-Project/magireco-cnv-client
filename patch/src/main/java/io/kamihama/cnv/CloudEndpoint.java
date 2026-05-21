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

    private CloudEndpoint() {}
}
