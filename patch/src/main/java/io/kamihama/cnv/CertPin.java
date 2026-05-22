package io.kamihama.cnv;

import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 * api.magi-reco.top 的 HTTPS 证书 SPKI Pin 验证。
 *
 * <p>比对服务器证书链中任意一项的 SPKI SHA-256（Base64）是否在白名单内，
 * 防止中间人证书替换攻击。只对 {@link #PINNED_HOSTS} 内的主机名生效；
 * 镜像 / CDN 地址不受影响。
 *
 * <p><b>获取真实 Pin 值：</b>
 * <pre>
 * openssl s_client -connect api.magi-reco.top:443 \
 *     -servername api.magi-reco.top 2>/dev/null \
 *   | openssl x509 -pubkey -noout \
 *   | openssl pkey -pubin -outform DER \
 *   | openssl dgst -sha256 -binary \
 *   | base64
 * </pre>
 *
 * <p><b>证书轮换策略：</b>
 * 至少同时保留主证书和备用证书的 Pin，新证书部署后再移除旧 Pin。
 */
public final class CertPin {

    /**
     * 允许的 SPKI SHA-256（Base64 无换行）。
     *
     * ⚠ 上线前必须替换为 api.magi-reco.top 的真实值。
     *    当前为占位符，连接会被故意拒绝，以防误上线未锁定版本。
     */
    private static final Set<String> PINNED_HASHES = Collections.unmodifiableSet(
            new HashSet<>(Arrays.asList(
                    // TODO: 执行上方 openssl 命令取得真实值后替换以下两行
                    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=",  // 主证书
                    "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB="   // 备用证书
            )));

    /** 只对这些主机名启用 Pin 校验；CDN / 镜像域名不在此列。 */
    private static final Set<String> PINNED_HOSTS = Collections.unmodifiableSet(
            new HashSet<>(Collections.singletonList("api.magi-reco.top")));

    /**
     * 若目标主机在 {@link #PINNED_HOSTS} 内，为连接安装 Pin 验证 SSLSocketFactory。
     * 必须在 {@link HttpsURLConnection#connect()} 之前调用。
     *
     * @throws RuntimeException TLS 上下文初始化失败（平台不支持 TLS，极罕见）
     */
    public static void applyIfNeeded(HttpsURLConnection conn) {
        if (!PINNED_HOSTS.contains(conn.getURL().getHost())) return;
        try {
            SSLContext sc = SSLContext.getInstance("TLS");
            sc.init(null, new TrustManager[]{ new PinTrustManager() }, null);
            conn.setSSLSocketFactory(sc.getSocketFactory());
        } catch (GeneralSecurityException e) {
            throw new RuntimeException("CertPin 初始化失败: " + e.getMessage(), e);
        }
    }

    private static final class PinTrustManager implements X509TrustManager {
        @Override public void checkClientTrusted(X509Certificate[] c, String t) {}

        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType)
                throws CertificateException {
            if (chain == null || chain.length == 0)
                throw new CertificateException("证书链为空");
            for (X509Certificate cert : chain) {
                if (PINNED_HASHES.contains(spkiSha256Base64(cert))) return;
            }
            throw new CertificateException(
                    "证书 Pin 验证失败：服务端证书的 SPKI 不在可信列表内");
        }

        @Override public X509Certificate[] getAcceptedIssuers() {
            return new X509Certificate[0];
        }
    }

    /** 计算证书 SPKI 的 SHA-256，Base64（无换行）编码返回。 */
    private static String spkiSha256Base64(X509Certificate cert) {
        try {
            byte[] spki = cert.getPublicKey().getEncoded();
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(spki);
            return android.util.Base64.encodeToString(hash, android.util.Base64.NO_WRAP);
        } catch (Throwable t) {
            return "";
        }
    }

    private CertPin() {}
}
