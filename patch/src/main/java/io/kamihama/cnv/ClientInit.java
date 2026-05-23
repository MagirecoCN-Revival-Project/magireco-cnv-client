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

    /** /client/init 握手响应：封禁 / 维护 / 版本闸门 / 伪造版本 / 会话令牌 / 功能开关。 */
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
        /** 更新 APK 的 SHA-256（64 位小写十六进制）；null 表示服务端未提供。 */
        public String       updateApkSha256;
        /** 向游戏 native 层伪造的版本号；null 表示服务端未配置，退化为真实版本。 */
        public String       fakeVersion;
        /** 向游戏 native 层伪造的应用名；null 表示服务端未配置。 */
        public String       fakeName;
        /** 服务端签发的会话令牌；后续所有 API 请求的鉴权三件套之一。 */
        public String       accessToken;

        // ── 功能开关（features 字段组）────────────────────────────────
        /**
         * 是否开放在线下载功能；默认 true（服务端不返回 features 时退化为开放）。
         * false 时客户端不显示在线下载选项。
         */
        public boolean      onlineDownloadEnabled  = true;
        /**
         * 是否开放离线包注入功能；默认 true。
         * false 时客户端不显示离线包选项。
         */
        public boolean      offlinePackageEnabled  = true;
        /**
         * 当两个功能均关闭时向用户显示的提示文本。
         * null 时展示默认维护提示。
         */
        public String       featureDisabledMessage;
    }

    /** /client/online-download 响应：镜像组列表 + S3 资源令牌。 */
    public static final class OnlineDownloadInfo {

        /** 单个镜像条目：一个 URL，可选附带该镜像提供的文件列表。 */
        public static final class MirrorEntry {
            public String url;
            /** null = 服务端未提供，需用 S3 XML 发现；非 null = 直接使用此列表。 */
            public List<S3List.Entry> files;
        }

        /** 一组镜像（同一线路的多个 CDN 节点）。 */
        public static final class MirrorGroup {
            public String name = "默认线路";
            public List<MirrorEntry> entries = new ArrayList<>();

            /** 返回该组所有镜像的 URL 列表（供 UI 展示）。 */
            public List<String> urls() {
                List<String> out = new ArrayList<>();
                for (MirrorEntry e : entries) if (e.url != null) out.add(e.url);
                return out;
            }

            /** 该组内是否至少有一个镜像附带了文件列表。 */
            public boolean hasFileLists() {
                for (MirrorEntry e : entries) if (e.files != null) return true;
                return false;
            }
        }

        /** 按线路分组的镜像列表。 */
        public List<MirrorGroup> groups = new ArrayList<>();
        /** S3/CDN 资源访问令牌，用于 Authorization: Bearer 头（与会话令牌独立）。 */
        public String            resourceToken;
    }

    /** /client/offline-package 响应：离线包下载 URL + 版本 + SHA-256。 */
    public static final class OfflinePackageInfo {
        public String downloadUrl;
        public String packageVersion;
        public String sha256;
    }

    /** /client/hot-update 响应：js 包和 scenario 包各自的版本 / SHA-256 / 下载地址。 */
    public static final class HotUpdateInfo {
        public static final class Entry {
            /** 服务端版本号（整数递增）；0 表示服务端未返回。 */
            public int    version;
            public String sha256;
            public String downloadUrl;
            /** 压缩包字节数；-1 表示服务端未返回（退化为单线程 downloadResume）。 */
            public long   fileSize = -1L;
        }
        public Entry js       = new Entry();
        public Entry scenario = new Entry();
    }

    /**
     * 同步发送握手请求，返回解析后的 {@link Response}。
     *
     * @param ctx           用于读 PackageManager / Assets 的 Context
     * @param clientVersion 本次携带的客户端版本号（来自 {@link ResourceFlow#BUILD_VERSION}）
     * @throws Exception    网络错误 / JSON 解析失败 / HTTP &ge; 400
     */
    /**
     * 同步发送握手请求，返回解析后的 {@link Response}。
     * 握手是首次调用，此时尚无会话令牌；server 通过 device_id + signature 验证合法性
     * 并在响应体内签发 access_token 供后续请求使用。
     */
    public static Response fetch(Context ctx, String clientVersion) throws Exception {
        JSONObject body = new JSONObject();
        body.put("version",   clientVersion);
        body.put("device_id", DeviceId.get(ctx));
        body.put("signature", ClientSignature.get(ctx));
        body.put("channel",   BuildChannel.get(ctx));

        String raw = Net.postJson(CloudEndpoint.CLIENT_INIT, body.toString(), 15_000);
        return parse(raw);
    }

    private static Response parse(String raw) throws Exception {
        Response r = new Response();
        if (raw == null || raw.isEmpty()) return r;
        JSONObject obj = new JSONObject(raw);

        r.bannedFlag   = obj.optBoolean("banned",      false);
        r.bannedReason = obj.optString("ban_reason",   null);
        r.accessToken  = obj.optString("access_token", null);

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
            r.updateApkSha256       = client.optString("update_apk_sha256",        null);
        }

        JSONObject spoof = obj.optJSONObject("spoof");
        if (spoof != null) {
            r.fakeVersion = spoof.optString("fake_version", null);
            r.fakeName    = spoof.optString("fake_name",    null);
        }

        JSONObject features = obj.optJSONObject("features");
        if (features != null) {
            r.onlineDownloadEnabled  = features.optBoolean("online_download",  true);
            r.offlinePackageEnabled  = features.optBoolean("offline_package",  true);
            r.featureDisabledMessage = features.optString("disabled_message",  null);
        }

        return r;
    }

    /**
     * 上报用户选择的下载方式；忽略响应体（服务端只需知晓）。
     *
     * @param ctx         Context
     * @param sessionToken 握手阶段获取的会话令牌
     * @param method       {@link io.kamihama.cnv.ResourceFlow#MODE_ONLINE} 或 OFFLINE
     */
    public static void postMethodSelect(Context ctx, String sessionToken,
                                        String method) throws Exception {
        JSONObject body = authTriple(ctx, sessionToken);
        body.put("method", method);
        Net.postJson(CloudEndpoint.CLIENT_METHOD_SELECT, body.toString(), 10_000);
    }

    /**
     * 获取在线下载所需的镜像列表和 S3 资源令牌。
     *
     * @param sessionToken 握手阶段获取的会话令牌
     * @throws Exception   网络错误 / HTTP &ge; 400
     */
    public static OnlineDownloadInfo fetchOnlineDownload(Context ctx,
                                                         String sessionToken) throws Exception {
        String raw = Net.postJson(CloudEndpoint.CLIENT_ONLINE_DOWNLOAD,
                authTriple(ctx, sessionToken).toString(), 15_000);
        OnlineDownloadInfo info = new OnlineDownloadInfo();
        if (raw == null || raw.isEmpty()) return info;
        JSONObject obj = new JSONObject(raw);
        info.resourceToken = obj.optString("resource_token", null);

        JSONArray groups = obj.optJSONArray("groups");
        if (groups != null && groups.length() > 0) {
            // 新格式：groups 数组
            for (int gi = 0; gi < groups.length(); gi++) {
                JSONObject gObj = groups.getJSONObject(gi);
                OnlineDownloadInfo.MirrorGroup group = new OnlineDownloadInfo.MirrorGroup();
                group.name = gObj.optString("name", "线路" + (gi + 1));
                JSONArray entries = gObj.optJSONArray("mirrors");
                if (entries != null) {
                    for (int ei = 0; ei < entries.length(); ei++) {
                        Object item = entries.get(ei);
                        OnlineDownloadInfo.MirrorEntry me = new OnlineDownloadInfo.MirrorEntry();
                        if (item instanceof String) {
                            me.url = (String) item;
                        } else if (item instanceof JSONObject) {
                            JSONObject mObj = (JSONObject) item;
                            me.url = mObj.optString("url", null);
                            JSONArray files = mObj.optJSONArray("files");
                            if (files != null) {
                                me.files = new ArrayList<>();
                                for (int fi = 0; fi < files.length(); fi++) {
                                    Object fItem = files.get(fi);
                                    if (fItem instanceof String) {
                                        me.files.add(new S3List.Entry((String) fItem, -1L));
                                    } else if (fItem instanceof JSONObject) {
                                        JSONObject fObj = (JSONObject) fItem;
                                        String key = fObj.optString("key", null);
                                        long size   = fObj.optLong("size", -1L);
                                        if (key != null && !key.isEmpty())
                                            me.files.add(new S3List.Entry(key, size));
                                    }
                                }
                            }
                        }
                        if (me.url != null && !me.url.isEmpty()) group.entries.add(me);
                    }
                }
                if (!group.entries.isEmpty()) info.groups.add(group);
            }
        } else {
            // 旧格式兼容：平铺的 mirrors 字符串数组 → 包装为单组，无文件列表（触发 S3 XML 发现）
            JSONArray mirrors = obj.optJSONArray("mirrors");
            if (mirrors != null && mirrors.length() > 0) {
                OnlineDownloadInfo.MirrorGroup group = new OnlineDownloadInfo.MirrorGroup();
                group.name = "默认线路";
                for (int i = 0; i < mirrors.length(); i++) {
                    OnlineDownloadInfo.MirrorEntry me = new OnlineDownloadInfo.MirrorEntry();
                    me.url = mirrors.getString(i);
                    group.entries.add(me);
                }
                info.groups.add(group);
            }
        }
        return info;
    }

    /**
     * 获取云端离线包的下载地址、版本号和 SHA-256。
     *
     * @param sessionToken 握手阶段获取的会话令牌
     * @throws Exception   网络错误 / HTTP &ge; 400
     */
    public static OfflinePackageInfo fetchOfflinePackage(Context ctx,
                                                         String sessionToken) throws Exception {
        String raw = Net.postJson(CloudEndpoint.CLIENT_OFFLINE_PACKAGE,
                authTriple(ctx, sessionToken).toString(), 15_000);
        OfflinePackageInfo info = new OfflinePackageInfo();
        if (raw == null || raw.isEmpty()) return info;
        JSONObject obj = new JSONObject(raw);
        info.downloadUrl    = obj.optString("download_url",    null);
        info.packageVersion = obj.optString("package_version", null);
        info.sha256         = obj.optString("sha256",          null);
        return info;
    }

    /**
     * 获取热更新版本信息（js + scenario 两个包）。
     *
     * <p>失败时抛异常；调用方应视为非致命错误，记录日志后跳过热更。
     *
     * @param sessionToken 握手阶段获取的会话令牌
     * @throws Exception   网络错误 / HTTP &ge; 400
     */
    public static HotUpdateInfo fetchHotUpdate(Context ctx, String sessionToken) throws Exception {
        String raw = Net.postJson(CloudEndpoint.CLIENT_HOT_UPDATE,
                authTriple(ctx, sessionToken).toString(), 15_000);
        HotUpdateInfo info = new HotUpdateInfo();
        if (raw == null || raw.isEmpty()) return info;
        JSONObject obj = new JSONObject(raw);

        JSONObject js = obj.optJSONObject("js");
        if (js != null) {
            info.js.version     = js.optInt("version",        0);
            info.js.sha256      = js.optString("sha256",      null);
            info.js.downloadUrl = js.optString("download_url", null);
            info.js.fileSize    = js.optLong("size",          -1L);
        }
        JSONObject sc = obj.optJSONObject("scenario");
        if (sc != null) {
            info.scenario.version     = sc.optInt("version",        0);
            info.scenario.sha256      = sc.optString("sha256",      null);
            info.scenario.downloadUrl = sc.optString("download_url", null);
            info.scenario.fileSize    = sc.optLong("size",          -1L);
        }
        return info;
    }

    /**
     * 构建包含鉴权三件套的基础请求体：
     * {@code device_id}、{@code access_token}、{@code signature}。
     */
    static JSONObject authTriple(Context ctx, String sessionToken) throws Exception {
        JSONObject body = new JSONObject();
        body.put("device_id",    DeviceId.get(ctx));
        body.put("access_token", sessionToken != null ? sessionToken : "");
        body.put("signature",    ClientSignature.get(ctx));
        return body;
    }

    private ClientInit() {}
}
