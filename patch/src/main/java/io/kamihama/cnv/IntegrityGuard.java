package io.kamihama.cnv;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.util.Log;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 客户端自防篡改门禁——在启动最早期运行，拦截重打包 / 组件注入攻击。
 *
 * <p>威胁：攻击者反编译我们的 APK，向 manifest 注入一个 exported 的
 * {@code ContentProvider}（或冒充 DocumentsProvider），把私有数据目录
 * （账号 token / 存档 SQLite / 游戏资源）暴露给系统文件选择器或其他 App，
 * 直接撬走数据；随后重新签名分发。
 *
 * <p>双层防御：
 * <ol>
 *   <li><b>Provider 白名单审计</b>（始终生效，含本地构建）：枚举本包声明的
 *       全部 {@code ContentProvider}，凡 authority 不在白名单、或我方
 *       provider 被改成 {@code exported} 的，一律判定为被注入。这正面命中
 *       "注入 DocumentProvider 撬数据"这一攻击。</li>
 *   <li><b>签名 pin</b>（仅当 {@link #EXPECTED_SIGNATURE_SHA256} 被 CI 注入时生效）：
 *       比对运行时 APK 签名证书 SHA-256 与发布签名。任何重打包都必须重新
 *       签名 → 证书变化 → pin 失败。这是 provider 注入攻击的根因防御
 *       （注入组件必然要重打包重签）。</li>
 * </ol>
 *
 * <p>检测到篡改时返回 {@link Verdict#tampered}=true，调用方应立即终止启动、
 * 绝不可继续暴露 / 加载任何敏感数据。本类自身不读写敏感数据。
 */
public final class IntegrityGuard {

    private static final String TAG = "CnvIntegrityGuard";

    /**
     * 本 APK 合法声明的全部 ContentProvider authority。
     * 运行时若发现白名单之外的 authority，视为被注入（篡改）。
     * 如未来确需新增 provider，必须同步更新此白名单。
     */
    private static final Set<String> ALLOWED_PROVIDER_AUTHORITIES = new HashSet<>(Arrays.asList(
            "io.kamihama.totentanz.cnvupdate",          // io.kamihama.cnv.UpdateProvider（exported=false）
            "io.kamihama.totentanz.androidx-startup",   // androidx.startup.InitializationProvider
            "io.kamihama.totentanz.firebaseinitprovider" // com.google.firebase.provider.FirebaseInitProvider
    ));

    /**
     * 期望的发布签名证书 SHA-256（64 位小写十六进制）；由 CI 在编译前从 keystore 注入。
     * 空串 = 未注入（本地开发构建），跳过签名 pin（provider 审计仍生效）。
     */
    static final String EXPECTED_SIGNATURE_SHA256 = "";

    // ── Result ──────────────────────────────────────────────────────────────

    public static final class Verdict {
        public final boolean tampered;
        public final String  reason; // tampered=true 时为可记录的原因（不展示给用户）
        private Verdict(boolean tampered, String reason) {
            this.tampered = tampered;
            this.reason   = reason;
        }
    }

    private static Verdict ok()              { return new Verdict(false, null); }
    private static Verdict tampered(String r) { return new Verdict(true,  r);   }

    // ── Check ─────────────────────────────────────────────────────────────────

    /** 执行全部完整性检查。在工作线程调用。 */
    public static Verdict check(Context ctx) {
        Verdict v = checkProviders(ctx);
        if (v.tampered) return v;
        return checkSignature(ctx);
    }

    /** Provider 注入审计：白名单外 authority、或我方 provider 被改 exported → 篡改。 */
    private static Verdict checkProviders(Context ctx) {
        try {
            PackageManager pm = ctx.getApplicationContext().getPackageManager();
            String pkg = ctx.getApplicationContext().getPackageName();
            PackageInfo pi = pm.getPackageInfo(pkg, PackageManager.GET_PROVIDERS);
            if (pi.providers == null) return ok();
            for (ProviderInfo p : pi.providers) {
                String authority = p.authority;
                if (authority == null || authority.isEmpty()) {
                    return tampered("provider 无 authority: " + p.name);
                }
                // authority 可声明为分号分隔的多个
                for (String auth : authority.split(";")) {
                    String a = auth.trim();
                    if (a.isEmpty()) continue;
                    if (!ALLOWED_PROVIDER_AUTHORITIES.contains(a)) {
                        return tampered("检测到未授权 ContentProvider: " + a + " (" + p.name + ")");
                    }
                }
                // 白名单内的 provider 本应全部 exported=false；被翻成 true 即篡改
                if (p.exported) {
                    return tampered("ContentProvider 被改为 exported: " + authority + " (" + p.name + ")");
                }
            }
            return ok();
        } catch (Throwable t) {
            // PackageManager 异常极罕见；保守不放行（这是安全门禁，宁可拦截）
            Log.e(TAG, "provider 审计异常：" + t.getMessage());
            return tampered("provider 审计执行失败: " + t.getClass().getSimpleName());
        }
    }

    /** 签名 pin：仅当 CI 注入了期望值时强制比对。 */
    private static Verdict checkSignature(Context ctx) {
        if (EXPECTED_SIGNATURE_SHA256 == null || EXPECTED_SIGNATURE_SHA256.isEmpty()) {
            return ok(); // 本地构建未注入，跳过
        }
        String actual = ClientSignature.get(ctx);
        if (actual == null || actual.isEmpty()) {
            return tampered("无法获取运行时签名");
        }
        if (!EXPECTED_SIGNATURE_SHA256.equalsIgnoreCase(actual)) {
            return tampered("APK 签名与发布签名不符");
        }
        return ok();
    }

    private IntegrityGuard() {}
}
