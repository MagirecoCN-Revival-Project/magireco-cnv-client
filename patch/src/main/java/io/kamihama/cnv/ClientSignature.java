package io.kamihama.cnv;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.os.Build;

import java.security.MessageDigest;

/**
 * APK 签名证书 SHA-256 摘要。
 *
 * <p>用于 {@code /client/init} 请求里的 {@code client_signature} 字段，
 * 让服务端能识别"本次请求来自我们签发的客户端"——任何重打包 / 二次
 * 修改的 APK 签名会不同、摘要也不同，云端会拒绝。
 *
 * <p>API 28+ 走 {@link PackageManager#GET_SIGNING_CERTIFICATES} + {@link SigningInfo}
 * （旧 API 已废弃）；28 以下退化用 {@link PackageManager#GET_SIGNATURES}。
 *
 * <p>摘要算一次后缓存到静态变量，整个进程生命周期内不会重算。
 */
public final class ClientSignature {

    private static volatile String cached;

    /**
     * 取本 APK 主签名证书的 SHA-256 摘要（64 字符小写十六进制）。
     * 取不到（极端情况：PackageManager 抛异常）时返回空串，
     * 让调用方在 JSON 里发空串，由服务端按需拒绝。
     */
    public static String get(Context ctx) {
        String c = cached;
        if (c != null) return c;
        synchronized (ClientSignature.class) {
            if (cached != null) return cached;
            cached = compute(ctx);
            return cached;
        }
    }

    private static String compute(Context ctx) {
        try {
            PackageManager pm = ctx.getApplicationContext().getPackageManager();
            String pkg = ctx.getApplicationContext().getPackageName();
            Signature[] sigs = null;

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                PackageInfo pi = pm.getPackageInfo(pkg, PackageManager.GET_SIGNING_CERTIFICATES);
                SigningInfo si = pi.signingInfo;
                if (si != null) {
                    // 关键：用 getApkContentsSigners() 而不是
                    // getSigningCertificateHistory()。
                    //
                    // - getApkContentsSigners() = "本 APK 此刻实际生效的签名者"。
                    //   APK 用任何不同的 key 重签都会让这个集合的内容变。
                    //
                    // - getSigningCertificateHistory() = "v3+ 旋转血缘的历史链"。
                    //   即使用新 key 重签，链头的旧 cert 还在；取 sigs[0]
                    //   会拿到一个永远不变的"原始 cert"，达不到"签名变
                    //   → hash 变"的目的。
                    sigs = si.getApkContentsSigners();
                }
            }
            if (sigs == null || sigs.length == 0) {
                // 兜底：旧 API（API 28 以下、或 28+ 但拿不到 SigningInfo）。
                // Lint 会警告 PackageManagerGetSignatures，但这条路径走的
                // 是 platform 自带的解析逻辑，安全模型一致；本项目不会
                // 因此引入"伪装签名"漏洞。
                @SuppressWarnings("deprecation")
                PackageInfo pi = pm.getPackageInfo(pkg, PackageManager.GET_SIGNATURES);
                @SuppressWarnings("deprecation")
                Signature[] s = pi.signatures;
                sigs = s;
            }
            if (sigs == null || sigs.length == 0) return "";

            // 把所有签名者证书 bytes 按下标顺序串到同一个 SHA-256 里。
            // - 单签名 APK（最常见）：等价于"hash(那个 cert 的 bytes)"。
            // - 多签名 / 集合中任意一员变化：最终 hash 必然变化。
            // 服务端只关心"和上次见过的字符串一不一样"，不需要"识别是
            // 哪个 cert 变了"，所以单一 hash 串足够。
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            for (Signature s : sigs) {
                if (s != null) md.update(s.toByteArray());
            }
            return toHex(md.digest());
        } catch (Throwable t) {
            return "";
        }
    }

    private static String toHex(byte[] h) {
        StringBuilder sb = new StringBuilder(h.length * 2);
        for (byte b : h) {
            int v = b & 0xff;
            if (v < 0x10) sb.append('0');
            sb.append(Integer.toHexString(v));
        }
        return sb.toString();
    }

    private ClientSignature() {}
}
