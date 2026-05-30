package io.kamihama.cnv;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.util.Log;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * 客户端自防篡改门禁——在启动最早期运行，拦截重打包 / 组件注入攻击。
 *
 * <p>威胁：攻击者反编译我们的 APK，向 manifest 注入一个 exported 的
 * {@code ContentProvider}（或冒充 DocumentsProvider），把私有数据目录
 * （账号 token / 存档 SQLite / 游戏资源）暴露给系统文件选择器或其他 App，
 * 直接撬走数据；随后重新签名分发。
 *
 * <p><b>多层防御</b>（自上而下，任一层判定篡改即拦截）：
 * <ol>
 *   <li><b>包名 pin</b>（始终生效）：运行时包名必须等于 {@link #EXPECTED_PACKAGE}。
 *       原生 {@code libMagiaClient.so} 的 FLAG_PATH 也硬编码此包名，二者一致才能跑通；
 *       此检查在签名 pin 关闭（本地构建）时也能挡住"换包名重打包"。</li>
 *   <li><b>Provider 注入审计</b>（始终生效）：枚举本包声明的全部
 *       {@code ContentProvider}，凡 authority 不在白名单、白名单内 authority 的
 *       实现类被替换、或我方 provider 被改成 {@code exported} 的，一律判定为
 *       被注入。这正面命中"注入 DocumentProvider 撬数据"这一攻击。</li>
 *   <li><b>debuggable 检测</b>（仅发布构建）：发布构建绝不应是 debuggable；
 *       运行时 {@code FLAG_DEBUGGABLE} 被置位 = 被重打包用于调试 / 注入。</li>
 *   <li><b>签名 pin</b>（仅当 {@link #EXPECTED_SIGNATURE_SHA256} 被 CI 注入时生效）：
 *       比对运行时 APK 签名证书 SHA-256 与发布签名。任何重打包都必须重新
 *       签名 → 证书变化 → pin 失败。这是 provider 注入攻击的根因防御
 *       （注入组件必然要重打包重签）。</li>
 * </ol>
 *
 * <p><b>边界声明（务必清楚本类能与不能做什么）：</b>客户端自防篡改终究可被
 * 有 smali 编辑能力的攻击者绕过（直接 patch 本类的判定、或改 LAUNCHER 跳过
 * BootstrapActivity）。本门禁的价值是<em>抬高门槛</em>；针对重打包的<b>根因防御
 * 是服务端签名校验</b>——{@link ClientSignature} 计算的证书摘要随 {@code /client/init}
 * 等请求上送，服务端对不匹配的签名拒发会话令牌，重打包客户端无法获得有效会话。
 * 二者配合形成纵深防御。
 *
 * <p>检测到篡改时返回 {@link Verdict#tampered}=true，调用方应立即终止启动、
 * 绝不可继续暴露 / 加载任何敏感数据。本类自身不读写敏感数据。
 */
public final class IntegrityGuard {

    private static final String TAG = "CnvIntegrityGuard";

    /**
     * 期望的应用包名（与 AndroidManifest 的 {@code package=} 一致）。
     * 原生 hook 的 FLAG_PATH 同样硬编码此包名，改包名重打包会同时触发此 pin。
     */
    private static final String EXPECTED_PACKAGE = "io.kamihama.totentanz";

    /**
     * 本 APK 合法声明的全部 ContentProvider：{@code authority → 实现类全限定名}。
     * 运行时若发现白名单外 authority、或白名单内 authority 的实现类被替换，
     * 即视为被注入（篡改）。
     *
     * <p><b>⚠ 白名单维护规约（改这里前必读）：</b>
     * <ol>
     *   <li><b>唯一真相源是 AndroidManifest.xml。</b> 本表必须与 manifest 中
     *       全部 {@code <provider android:authorities="…" android:name="…">} 逐一
     *       对应、不多不少。校验命令：
     *       {@code grep -o '<provider[^>]*>' AndroidManifest.xml}</li>
     *   <li><b>少了会误锁正版</b>：manifest 有、白名单无 → 正版启动即被判篡改、
     *       无法进入。新增任何依赖（尤其引入 androidx/Firebase 等会自动塞
     *       InitializationProvider 的库）后，务必回来补全对应 authority 与实现类。</li>
     *   <li><b>多了会放过攻击</b>：白名单写了 manifest 里没有的 authority，
     *       等于给攻击者留了一个可注入而不报警的 authority 名。只加确实存在的。</li>
     *   <li><b>authority 用包名前缀</b>（manifest 里 {@code package="io.kamihama.totentanz"}）。
     *       新条目按 {@code io.kamihama.totentanz.xxx} 的实际声明值原样抄，不要臆造。</li>
     *   <li><b>实现类（value）必须填 manifest 里 {@code android:name} 的全限定名</b>，
     *       不要写错——写错会误锁正版。{@link #checkProviders} 会逐一比对，挡住
     *       "借用合法 authority、替换恶意实现类"的注入变体。</li>
     *   <li>本应用所有 provider 都应保持 {@code exported=false}；
     *       {@link #checkProviders} 还会把"被改成 exported"也判为篡改，
     *       因此白名单内的条目无需、也不应被声明为 exported。</li>
     *   <li>改完务必在真机/模拟器跑一次冷启动，确认 "完整性门禁通过" 日志出现，
     *       再发版——避免白名单回归导致全量用户被锁在门外。</li>
     * </ol>
     */
    private static final Map<String, String> ALLOWED_PROVIDERS;
    static {
        Map<String, String> m = new HashMap<>();
        m.put("io.kamihama.totentanz.cnvupdate",           "io.kamihama.cnv.UpdateProvider");
        m.put("io.kamihama.totentanz.androidx-startup",    "androidx.startup.InitializationProvider");
        m.put("io.kamihama.totentanz.firebaseinitprovider","com.google.firebase.provider.FirebaseInitProvider");
        ALLOWED_PROVIDERS = Collections.unmodifiableMap(m);
    }

    /**
     * 期望的发布签名证书 SHA-256（64 位小写十六进制）；由 CI 在编译前从 keystore 注入。
     * 空串 = 未注入（本地开发构建），跳过签名 pin（包名 pin 与 provider 审计仍生效）。
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
        Verdict v = checkPackage(ctx);
        if (v.tampered) return v;
        v = checkProviders(ctx);
        if (v.tampered) return v;
        v = checkDebuggable(ctx);
        if (v.tampered) return v;
        return checkSignature(ctx);
    }

    /** 包名 pin：运行时包名必须等于发布包名，挡住改包名重打包。 */
    private static Verdict checkPackage(Context ctx) {
        try {
            String pkg = ctx.getApplicationContext().getPackageName();
            if (!EXPECTED_PACKAGE.equals(pkg)) {
                return tampered("包名被篡改: 期望=" + EXPECTED_PACKAGE + " 实际=" + pkg);
            }
            return ok();
        } catch (Throwable t) {
            Log.e(TAG, "包名检查异常：" + t.getMessage());
            return tampered("包名检查执行失败: " + t.getClass().getSimpleName());
        }
    }

    /**
     * Provider 注入审计：白名单外 authority、白名单内 authority 实现类被替换、
     * 或我方 provider 被改 exported → 篡改。
     */
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
                    String expectedClass = ALLOWED_PROVIDERS.get(a);
                    if (expectedClass == null) {
                        return tampered("检测到未授权 ContentProvider: " + a + " (" + p.name + ")");
                    }
                    // 借用合法 authority、替换恶意实现类的注入变体
                    if (!expectedClass.equals(p.name)) {
                        return tampered("ContentProvider 实现类被替换: authority=" + a
                                + " 期望=" + expectedClass + " 实际=" + p.name);
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

    /**
     * debuggable 检测：发布构建绝不应是 debuggable。
     * 仅在发布构建（签名 pin 已注入）时强制；本地 / CI 未签名构建跳过，
     * 避免误伤开发者用 debuggable 包调试。
     */
    private static Verdict checkDebuggable(Context ctx) {
        if (EXPECTED_SIGNATURE_SHA256 == null || EXPECTED_SIGNATURE_SHA256.isEmpty()) {
            return ok(); // 本地构建未注入签名 pin，跳过
        }
        try {
            int flags = ctx.getApplicationContext().getApplicationInfo().flags;
            if ((flags & ApplicationInfo.FLAG_DEBUGGABLE) != 0) {
                return tampered("发布构建被改为 debuggable");
            }
            return ok();
        } catch (Throwable t) {
            Log.e(TAG, "debuggable 检查异常：" + t.getMessage());
            return tampered("debuggable 检查执行失败: " + t.getClass().getSimpleName());
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
