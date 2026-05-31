package io.kamihama.cnv;

import android.content.Context;

import org.json.JSONObject;

import java.io.IOException;
import java.net.ConnectException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayDeque;
import java.util.Iterator;

/**
 * 云端存档同步工具：读取本地 PlayerStateCache、与服务端对比，
 * 按比对结果决定是否上传、下载或展示冲突对话框。
 */
public final class SaveSyncHelper {

    /** 上传被限速时抛出的异常，调用方可据此向用户展示友好提示而非记录为错误。 */
    public static final class RateLimitedException extends java.io.IOException {
        RateLimitedException(String msg) { super(msg); }
    }

    /** 上传滑动窗口：60 秒内最多 2 次。 */
    private static final long UPLOAD_WINDOW_MS  = 60_000L;
    private static final int  UPLOAD_MAX_CALLS  = 2;
    private static final ArrayDeque<Long> uploadCallTimes = new ArrayDeque<>();

    /**
     * 滑动窗口限速检查。调用前持有类锁，通过后记录本次时间戳。
     * 超出限额时抛 {@link IOException}，附带剩余等待秒数，
     * 让调用方可以直接向用户展示或记录日志。
     */
    private static synchronized void checkUploadRateLimit() throws IOException {
        long now = System.currentTimeMillis();
        while (!uploadCallTimes.isEmpty() && now - uploadCallTimes.peek() >= UPLOAD_WINDOW_MS) {
            uploadCallTimes.poll();
        }
        if (uploadCallTimes.size() >= UPLOAD_MAX_CALLS) {
            long waitSec = (UPLOAD_WINDOW_MS - (now - uploadCallTimes.peek())) / 1000 + 1;
            throw new RateLimitedException("上传过快，请 " + waitSec + " 秒后重试");
        }
        uploadCallTimes.offer(now);
    }

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
        checkUploadRateLimit();
        String data = io.kamihama.magianative.PlayerStateCache.get(ctx).loadAll(accountId);
        // C-M5: 使用 JSONObject 构造请求体，避免直接拼接 untrusted JSON 字符串
        JSONObject body = new JSONObject();
        body.put("token", accountToken);
        body.put("data",  new JSONObject(data != null ? data : "{}"));
        String resp = Net.postJson(CloudEndpoint.ACCOUNT_SAVE_PUT, body.toString(), 15_000);
        // 服务端 HTTP 200 但明确返回 success:false（如存储配额超限、token 已失效等）
        try {
            JSONObject obj = new JSONObject(resp);
            if (!obj.optBoolean("success", true)) {
                String reason = obj.optString("message", "");
                throw new IOException("服务端拒绝存档上传"
                        + (reason.isEmpty() ? "" : "：" + reason));
            }
        } catch (org.json.JSONException ignore) {
            // 响应体非 JSON（服务端未返回 JSON），视为成功
        }
    }

    /**
     * 将上传失败的异常翻译为适合向用户展示的单行中文提示。
     * 所有调用方统一走这里，避免在 UI 层重复判断异常类型。
     */
    public static String friendlyUploadError(Exception e) {
        if (e instanceof RateLimitedException)   return "存档上传过快，请稍后再试";
        if (e instanceof SocketTimeoutException) return "服务器未响应，请稍后重试";
        if (e instanceof UnknownHostException)   return "网络不可用，请检查网络连接";
        if (e instanceof ConnectException)       return "无法连接到服务器，请稍后重试";
        if (e instanceof javax.net.ssl.SSLException)
                                                 return "网络安全验证失败，请检查系统时间";
        if (e instanceof IOException) {
            String msg = e.getMessage();
            if (msg != null) {
                if (msg.contains("HTTP 503"))                    return "服务器维护中，请稍后重试";
                if (msg.contains("HTTP 429"))                    return "上传请求过于频繁，请稍后重试";
                if (msg.contains("HTTP 401") || msg.contains("HTTP 403"))
                                                                 return "账号验证失败，请重新登录";
                if (msg.contains("HTTP 5"))                      return "服务器出现错误，请稍后重试";
                if (msg.startsWith("服务端拒绝存档上传"))           return msg;
            }
            return "网络错误，存档上传失败";
        }
        return "存档上传失败，请稍后重试";
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
