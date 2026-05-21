package io.kamihama.cnv;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.provider.Settings;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 持久化的匿名设备 ID。
 *
 * <p>第一次启动时根据硬件 / 系统属性算出一个 SHA-256 摘要、
 * 写入 SharedPreferences；之后所有调用都返回这个固定值。
 *
 * <p>"匿名"——只采集设备的"型号 + 厂商 + ANDROID_ID"维度，
 * 不读 IMEI / MAC / 序列号等任何可定位真人身份的信息。
 *
 * <p>"不变动"——一旦写到 SharedPreferences 就不再重算：
 * 即使 OTA 后 {@link Build} 的某个字段被刷新，也以本机首次
 * 记录的为准。除非用户主动清除 APP 数据 / 卸载重装。
 *
 * <p>线程安全：使用 double-checked locking 缓存到静态 volatile。
 */
public final class DeviceId {

    /** SharedPreferences 名称（与其他 cnv 配置分开避免冲突）。 */
    private static final String PREFS = "cnv_device";
    /** 缓存键名。 */
    private static final String KEY   = "device_id";

    private static volatile String cached;

    /**
     * 取本机匿名设备 ID（64 字符小写十六进制 SHA-256）。
     * 永不返回 null；硬件信息读不到时退化成空串参与摘要，
     * 摘要本身始终能算出来。
     */
    public static String get(Context ctx) {
        String c = cached;
        if (c != null) return c;
        synchronized (DeviceId.class) {
            if (cached != null) return cached;
            SharedPreferences sp = ctx.getApplicationContext()
                    .getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String saved = sp.getString(KEY, null);
            if (saved != null && !saved.isEmpty()) {
                cached = saved;
                return cached;
            }
            String generated = generate(ctx);
            sp.edit().putString(KEY, generated).apply();
            cached = generated;
            return cached;
        }
    }

    /**
     * 把硬件指纹 + ANDROID_ID 拼成一行字符串，SHA-256 摘要后转十六进制。
     *
     * <p>选这些字段的理由：
     * <ul>
     *   <li>MANUFACTURER / BRAND / MODEL / DEVICE / BOARD / HARDWARE —
     *       这几个在同一台设备的整个生命周期内基本不变；不同型号设备
     *       之间会变。
     *   <li>ANDROID_ID —— 自 Android 8 起按 (设备 + APP 签名 + user) 唯一，
     *       恢复出厂会变；与本 APP 强绑定，足以区分两台同型号设备。
     * </ul>
     */
    private static String generate(Context ctx) {
        StringBuilder sb = new StringBuilder(256);
        sb.append(safe(Build.MANUFACTURER)).append('|');
        sb.append(safe(Build.BRAND)).append('|');
        sb.append(safe(Build.MODEL)).append('|');
        sb.append(safe(Build.DEVICE)).append('|');
        sb.append(safe(Build.BOARD)).append('|');
        sb.append(safe(Build.HARDWARE)).append('|');
        try {
            String aid = Settings.Secure.getString(
                    ctx.getApplicationContext().getContentResolver(),
                    Settings.Secure.ANDROID_ID);
            sb.append(safe(aid));
        } catch (Throwable ignore) {
            sb.append("no-android-id");
        }
        return sha256Hex(sb.toString().getBytes(StandardCharsets.UTF_8));
    }

    private static String safe(String s) { return s == null ? "" : s; }

    private static String sha256Hex(byte[] data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] h = md.digest(data);
            StringBuilder sb = new StringBuilder(h.length * 2);
            for (byte b : h) {
                int v = b & 0xff;
                if (v < 0x10) sb.append('0');
                sb.append(Integer.toHexString(v));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            // 不可能：SHA-256 是 Java 平台标配。
            throw new IllegalStateException(e);
        }
    }

    private DeviceId() {}
}
