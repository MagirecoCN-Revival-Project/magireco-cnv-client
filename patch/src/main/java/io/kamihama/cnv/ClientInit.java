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

    /** /client/init 握手响应：封禁 / 维护 / 版本闸门 / 伪造版本。 */
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
        /** 向游戏 native 层伪造的版本号；null 表示服务端未配置，退化为真实版本。 */
        public String       fakeVersion;
        /** 向游戏 native 层伪造的应用名；null 表示服务端未配置。 */
        public String       fakeName;
    }

    /** /client/online-download 响应：镜像列表 + 访问令牌 + 进度上报接口。 */
    public static final class OnlineDownloadInfo {
        /** 资源下载镜像 URL 列表（按优先级排列）。 */
        public List<String> mirrors       = new ArrayList<>();
        public String       accessToken;
        public String       reportApi;
    }

    /** /client/offline-package 响应：离线包下载 URL + 版本 + MD5。 */
    public static final class OfflinePackageInfo {
        public String downloadUrl;
        public String packageVersion;
        public String md5;
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

        JSONObject spoof = obj.optJSONObject("spoof");
        if (spoof != null) {
            r.fakeVersion = spoof.optString("fake_version", null);
            r.fakeName    = spoof.optString("fake_name",    null);
        }

        return r;
    }

    /**
     * 上报用户选择的下载方式；忽略响应体（服务端只需知晓）。
     *
     * @param ctx    Context
     * @param method {@link io.kamihama.cnv.ResourceFlow#MODE_ONLINE} 或 {@link io.kamihama.cnv.ResourceFlow#MODE_OFFLINE}
     */
    public static void postMethodSelect(Context ctx, String method) throws Exception {
        JSONObject body = new JSONObject();
        body.put("device_id", DeviceId.get(ctx));
        body.put("method",    method);
        Net.postJson(CloudEndpoint.CLIENT_METHOD_SELECT, body.toString(), 10_000);
    }

    /**
     * 获取在线下载所需的镜像列表和访问令牌。
     *
     * @throws Exception 网络错误 / HTTP &ge; 400
     */
    public static OnlineDownloadInfo fetchOnlineDownload(Context ctx) throws Exception {
        JSONObject body = new JSONObject();
        body.put("device_id", DeviceId.get(ctx));
        String raw = Net.postJson(CloudEndpoint.CLIENT_ONLINE_DOWNLOAD, body.toString(), 15_000);
        OnlineDownloadInfo info = new OnlineDownloadInfo();
        if (raw == null || raw.isEmpty()) return info;
        JSONObject obj = new JSONObject(raw);
        JSONArray mirrors = obj.optJSONArray("mirrors");
        if (mirrors != null) {
            for (int i = 0; i < mirrors.length(); i++) info.mirrors.add(mirrors.getString(i));
        }
        info.accessToken = obj.optString("access_token", null);
        info.reportApi   = obj.optString("report_api",   null);
        return info;
    }

    /**
     * 获取离线包下载 URL、版本号和 MD5。
     *
     * @throws Exception 网络错误 / HTTP &ge; 400
     */
    public static OfflinePackageInfo fetchOfflinePackage(Context ctx) throws Exception {
        JSONObject body = new JSONObject();
        body.put("device_id", DeviceId.get(ctx));
        String raw = Net.postJson(CloudEndpoint.CLIENT_OFFLINE_PACKAGE, body.toString(), 15_000);
        OfflinePackageInfo info = new OfflinePackageInfo();
        if (raw == null || raw.isEmpty()) return info;
        JSONObject obj = new JSONObject(raw);
        info.downloadUrl     = obj.optString("download_url",     null);
        info.packageVersion  = obj.optString("package_version",  null);
        info.md5             = obj.optString("md5",              null);
        return info;
    }

    private ClientInit() {}
}
