package io.kamihama.cnv;

import android.content.Context;

import org.json.JSONObject;

import java.util.Iterator;

/**
 * 云端存档同步工具：读取本地 PlayerStateCache、与服务端对比，
 * 按比对结果决定是否上传、下载或展示冲突对话框。
 */
public final class SaveSyncHelper {

    public enum SyncState {
        IN_SYNC,    // 一致或均为空
        CLOUD_ONLY, // 本地无存档，云端有
        LOCAL_ONLY, // 本地有存档，云端无（静默上传）
        CONFLICT,   // 两端均有且内容不同
    }

    public static final class SaveData {
        public final String  json;
        public final boolean empty;
        public SaveData(String json, boolean empty) { this.json = json; this.empty = empty; }
    }

    /** 从本地 SQLite 读取当前账号的全量状态。 */
    public static SaveData loadLocal(Context ctx, String accountId) {
        String json = io.kamihama.magianative.PlayerStateCache.get(ctx).loadAll(accountId);
        return new SaveData(json, json == null || json.equals("{}"));
    }

    /**
     * 从云端拉取存档。网络不可用或服务端返回 success=false 时视为云端空档。
     * 可能抛出 IOException（调用方负责捕获并降级处理）。
     */
    public static SaveData fetchCloud(Context ctx, String accountToken) throws Exception {
        // C-M5: 用 JSONObject 构造请求体，避免手工拼接 untrusted token 字符串
        JSONObject reqBody = new JSONObject();
        reqBody.put("token", accountToken);
        String resp = Net.postJson(CloudEndpoint.ACCOUNT_SAVE_GET, reqBody.toString(), 15_000);
        JSONObject json = new JSONObject(resp);
        if (!json.optBoolean("success", false)) return new SaveData("{}", true);
        String data = json.optString("data", "{}");
        return new SaveData(data, data.equals("{}") || data.isEmpty());
    }

    /** 将本地 SQLite 存档上传到云端。 */
    public static void upload(Context ctx, String accountId, String accountToken) throws Exception {
        String data = io.kamihama.magianative.PlayerStateCache.get(ctx).loadAll(accountId);
        // C-M5: 使用 JSONObject 构造请求体，避免直接拼接 untrusted JSON 字符串
        JSONObject body = new JSONObject();
        body.put("token", accountToken);
        body.put("data",  new JSONObject(data != null ? data : "{}"));
        Net.postJson(CloudEndpoint.ACCOUNT_SAVE_PUT, body.toString(), 15_000);
    }

    /**
     * 将云端存档写入本地 SQLite（覆盖）。
     * 先清空当前账号的本地记录，再逐条写入。
     */
    public static void applyCloud(Context ctx, String accountId, String cloudJson) throws Exception {
        io.kamihama.magianative.PlayerStateCache cache =
                io.kamihama.magianative.PlayerStateCache.get(ctx);
        cache.clearAccount(accountId);
        JSONObject states = new JSONObject(cloudJson);
        Iterator<String> keys = states.keys();
        while (keys.hasNext()) {
            String endpoint = keys.next();
            // 与 JS 桥 saveState 用同一份白名单：丢弃非法 endpoint，避免云端
            // （即便己方服务端）写入越界 / 超长 key 影响 WebView 注入逻辑。
            if (!io.kamihama.magianative.CnvJsBridge.isValidEndpoint(endpoint)) continue;
            JSONObject entry = states.optJSONObject(endpoint);
            if (entry == null) continue;
            String req  = entry.has("req")  ? entry.getString("req")  : null;
            String resp = entry.has("resp") ? entry.getString("resp") : null;
            cache.save(accountId, endpoint, req, resp);
        }
    }

    /** 比较本地与云端存档，返回同步状态。 */
    public static SyncState compare(SaveData local, SaveData cloud) {
        if (local.empty && cloud.empty)      return SyncState.IN_SYNC;
        if (local.empty)                     return SyncState.CLOUD_ONLY;
        if (cloud.empty)                     return SyncState.LOCAL_ONLY;
        if (local.json.equals(cloud.json))   return SyncState.IN_SYNC;
        return SyncState.CONFLICT;
    }

    private SaveSyncHelper() {}
}
