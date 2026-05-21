package io.kamihama.cnv;

import android.content.Context;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

/**
 * 构建渠道——决定客户端从哪个 URL 拉自更新 APK。
 *
 * <p>取值：
 * <ul>
 *   <li>{@link #NORMAL} ({@code "normal"}) —— 正常版。
 *       本地手动构建（开发者用 {@code python tools/build.py} 自行打包）
 *       默认走这个渠道。
 *   <li>{@link #INTERNAL_TEST} ({@code "internal-test"}) —— 内测版。
 *       CI 自动构建（GitHub Actions push 触发）打出来的产物走这个渠道。
 * </ul>
 *
 * <p>实现机制：APK 内带一个 {@code assets/cnv_build_channel.txt}
 * （仓库默认值是 {@code normal}）。CI 工作流在打包步骤里会把这个
 * 文件覆盖写成 {@code internal-test}，本地手工构建不会改它。
 * 运行时通过 {@link android.content.res.AssetManager} 读这个文件，
 * 决定 {@link ClientInit.Response#updateUrlNormal} 还是
 * {@link ClientInit.Response#updateUrlInternalTest} 用哪个。
 *
 * <p>文件读不到（找不到 / IO 异常）一律按 {@link #NORMAL} 处理——
 * 安全侧默认：宁可"用稳定渠道"，也别让没标记的本地构建去拉内测包。
 */
public final class BuildChannel {

    public static final String NORMAL        = "normal";
    public static final String INTERNAL_TEST = "internal-test";

    /** 仓库内默认值 / 资产文件中应当出现的内容。 */
    private static final String ASSET_NAME = "cnv_build_channel.txt";

    private static volatile String cached;

    /** 返回当前构建渠道字符串。永不返回 null。 */
    public static String get(Context ctx) {
        String c = cached;
        if (c != null) return c;
        synchronized (BuildChannel.class) {
            if (cached != null) return cached;
            cached = load(ctx);
            return cached;
        }
    }

    /** 当前是否是内测构建。 */
    public static boolean isInternalTest(Context ctx) {
        return INTERNAL_TEST.equals(get(ctx));
    }

    private static String load(Context ctx) {
        try (InputStream is = ctx.getApplicationContext()
                                  .getAssets()
                                  .open(ASSET_NAME);
             BufferedReader br = new BufferedReader(
                     new InputStreamReader(is, StandardCharsets.UTF_8))) {
            String line = br.readLine();
            if (line == null) return NORMAL;
            String trimmed = line.trim();
            if (trimmed.isEmpty()) return NORMAL;
            // 只承认我们定义过的两个值；其他写法一律视为正常版。
            if (INTERNAL_TEST.equalsIgnoreCase(trimmed)) return INTERNAL_TEST;
            return NORMAL;
        } catch (Throwable t) {
            return NORMAL;
        }
    }

    private BuildChannel() {}
}
