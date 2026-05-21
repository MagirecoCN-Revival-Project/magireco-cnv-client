package io.kamihama.cnv;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * /client/init 握手接口客户端。
 *
 * <p>请求：POST application/json，body 含 version / signature / device_id / channel。
 * <p>响应 schema 见 {@link Response}。
 */
public final class ClientInit {

    public static final class Response {
        public boolean      bannedFlag;
        public String       bannedReason;
        /** null / "normal" = 正常；"maintenance" = 维护；"error" = 故障。 */
        public String       serverStatus;
        public String       maintenanceMessage;
        /** 维护预计结束时间（Unix 秒；0 = 未知）。 */
        public long         maintenanceEndTime;
        /** 服务端允许的版本列表；空 = 不限制。 */
        public List<String> allowedVersions       = new ArrayList<>();
        public String       updateUrlNormal;
        public String       updateUrlInternalTest;
        /** 资源下载镜像 URL 列表（按优先级排列）。 */
        public List<String> downloadMirrors       = new ArrayList<>();
        public String       downloadAccessToken;
        public String       reportApi;
        /** 向游戏 native 层伪造的版本号；null 表示服务端未配置，退化为真实版本。 */
        public String       fakeVersion;
        /** 向游戏 native 层伪造的应用名；null 表示服务端未配置。 */
        public String       fakeName;
    }

    /**
     * 同步发送握手请求，返回解析后的 {@link Response}。
     *
     * @param ctx           用于读 PackageManager / Assets 的 Context
     * @param clientVersion 本次携带的客户端版本号（来自 {@link ResourceFlow#BUILD_VERSION}）
     * @throws Exception    网络错误 / JSON 解析失败 / HTTP &ge; 400
     */
    public static Response fetch(Context ctx, String clientVersion) throws Exception {
        JSONObject body = new JSONObject();
        body.put("version",    clientVersion);
        body.put("signature",  ClientSignature.get(ctx));
        body.put("device_id",  DeviceId.get(ctx));
        body.put("channel",    BuildChannel.get(ctx));

        String raw = Net.postJson(CloudEndpoint.CLIENT_INIT, body.toString(), 15_000);
        return parse(raw);
    }

    private static Response parse(String raw) throws Exception {
        Response r = new Response();
        if (raw == null || raw.isEmpty()) return r;
        JSONObject obj = new JSONObject(raw);

        r.bannedFlag   = obj.optBoolean("banned",     false);
        r.bannedReason = obj.optString("ban_reason",  null);

        JSONObject srv = obj.optJSONObject("server");
        if (srv != null) {
            r.serverStatus       = srv.optString("status",   null);
            r.maintenanceMessage = srv.optString("message",  null);
            r.maintenanceEndTime = srv.optLong("end_time",   0L);
        }

        JSONObject client = obj.optJSONObject("client");
        if (client != null) {
            JSONArray av = client.optJSONArray("allowed_versions");
            if (av != null) for (int i = 0; i < av.length(); i++) r.allowedVersions.add(av.getString(i));
            r.updateUrlNormal       = client.optString("update_url_normal",        null);
            r.updateUrlInternalTest = client.optString("update_url_internal_test", null);
        }

        JSONObject dl = obj.optJSONObject("download");
        if (dl != null) {
            JSONArray mirrors = dl.optJSONArray("mirrors");
            if (mirrors != null) for (int i = 0; i < mirrors.length(); i++) r.downloadMirrors.add(mirrors.getString(i));
            r.downloadAccessToken = dl.optString("access_token", null);
            r.reportApi           = dl.optString("report_api",   null);
        }

        JSONObject spoof = obj.optJSONObject("spoof");
        if (spoof != null) {
            r.fakeVersion = spoof.optString("fake_version", null);
            r.fakeName    = spoof.optString("fake_name",    null);
        }

        return r;
    }

    private ClientInit() {}
}
