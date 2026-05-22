package io.kamihama.cnv;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 硬件绑定的匿名设备 ID。
 *
 * <p>每次进程启动时从硬件 / 系统属性实时计算 SHA-256 摘要，
 * 结果缓存到进程级静态 volatile（不写 SharedPreferences）。
 *
 * <p>"硬件绑定"——基于 MANUFACTURER / BRAND / MODEL / DEVICE /
 * BOARD / HARDWARE + ANDROID_ID 计算，与 APP 数据存储无关：
 * 清除应用数据、卸载重装后计算结果不变（Android 8+ 上 ANDROID_ID
 * 按应用签名密钥作用域，不因重装而改变）；只有出厂重置才会变更。
 *
 * <p>不读 IMEI / MAC / 序列号等需要特权权限或可直接定位真人的信息。
 *
 * <p>线程安全：double-checked locking + volatile。
 */
public final class DeviceId {

    private static volatile String cached;

    /**
     * 取本机硬件绑定设备 ID（64 字符小写十六进制 SHA-256）。
     * 永不返回 null；硬件信息读不到时退化成空串参与摘要，
     * 摘要本身始终能算出来。
     */
    public static String get(Context ctx) {
        String c = cached;
        if (c != null) return c;
        synchronized (DeviceId.class) {
            if (cached != null) return cached;
            cached = generate(ctx);
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
