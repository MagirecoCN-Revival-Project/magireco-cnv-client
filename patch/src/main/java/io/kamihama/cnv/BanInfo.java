package io.kamihama.cnv;

import android.content.Context;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * 本地封禁记录：由心跳响应触发写入，启动时 init 握手前读取。
 *
 * <p>持久化路径：{@code {filesDir}/cnv_inject/ban.json}
 * <p>JSON schema：{@code { "reason": "...", "expire_time": 0 }}
 * （{@code expire_time} 为 Unix 秒；0 表示永久）
 */
public final class BanInfo {

    public final String reason;
    /** 解封时间（Unix 秒）；0 表示永久封禁。 */
    public final long expireTime;

    private BanInfo(String reason, long expireTime) {
        this.reason     = reason;
        this.expireTime = expireTime;
    }

    /** 若封禁仍在有效期内返回 {@code true}。 */
    public boolean isActive() {
        return expireTime == 0L || System.currentTimeMillis() / 1000L < expireTime;
    }

    /** 生成展示给用户的封禁说明文本。 */
    public String buildMessage() {
        StringBuilder sb = new StringBuilder("原因：").append(reason);
        if (expireTime > 0L) {
            try {
                String ts = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault())
                        .format(new Date(expireTime * 1000L));
                sb.append("\n解封时间：").append(ts);
            } catch (Throwable ignore) {
                sb.append("\n解封时间戳：").append(expireTime);
            }
        } else {
            sb.append("\n封禁类型：永久");
        }
        return sb.toString();
    }

    // ── 持久化 ─────────────────────────────────────────────────────────────

    private static File banFile(Context ctx) {
        return new File(new File(ctx.getFilesDir(), "cnv_inject"), "ban.json");
    }

    /**
     * 从磁盘加载封禁记录。
     *
     * @return 已保存的 {@link BanInfo}；文件不存在或解析失败时返回 {@code null}。
     */
    public static BanInfo load(Context ctx) {
        File f = banFile(ctx);
        if (!f.exists()) return null;
        try {
            JSONObject obj = new JSONObject(new String(readBytes(f), "UTF-8"));
            String reason     = obj.optString("reason", "（未提供原因）");
            long   expireTime = obj.optLong("expire_time", 0L);
            return new BanInfo(reason, expireTime);
        } catch (Throwable t) {
            android.util.Log.w("BanInfo", "读取 ban.json 失败: " + t.getMessage());
            return null;
        }
    }

    /** 将封禁信息写入磁盘。 */
    public static void save(Context ctx, String reason, long expireTime) {
        try {
            File dir = new File(ctx.getFilesDir(), "cnv_inject");
            if (!dir.exists()) dir.mkdirs();
            JSONObject obj = new JSONObject();
            obj.put("reason",      reason != null ? reason : "");
            obj.put("expire_time", expireTime);
            byte[] bytes = obj.toString().getBytes("UTF-8");
            try (FileOutputStream fos = new FileOutputStream(banFile(ctx))) {
                fos.write(bytes);
            }
            android.util.Log.i("BanInfo",
                    "已写入 ban.json: reason=" + reason + " expire=" + expireTime);
        } catch (Throwable t) {
            android.util.Log.e("BanInfo", "写入 ban.json 失败: " + t.getMessage());
        }
    }

    /** 清除本地封禁记录（例如服务端解封后主动下发清除指令时使用）。 */
    public static void clear(Context ctx) {
        try { banFile(ctx).delete(); } catch (Throwable ignore) {}
    }

    private static byte[] readBytes(File f) throws java.io.IOException {
        try (FileInputStream fis = new FileInputStream(f)) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = fis.read(buf)) > 0) baos.write(buf, 0, n);
            return baos.toByteArray();
        }
    }
}
