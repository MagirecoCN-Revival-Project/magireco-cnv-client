package io.kamihama.cnv;

/**
 * 用于向服务端伪造客户端身份的静态缓存。
 *
 * <p>bootstrap 启动时会从 S3 端 versions.json 里读取 {@code client-fake-name}
 * 和 {@code client-fake-version} 两个字段，调一次 {@link #set} 把值写到下面
 * 两个 volatile 静态字段。
 *
 * <p>原版 Totentanz 的 smali 代码（{@code jp.f4samurai.bridge.NativeBridge.getAppVersion}）
 * 已经被 patch 成方法体最前面先 {@code invoke-static} 调本类的 {@link #getFakeVersion}，
 * 非 null 时直接 return，否则继续走原 {@code PackageManager} 路径。这样：
 * <ul>
 *   <li>桌面 / 设置 / 应用商店看到的是真实 APK 的 {@code versionName} = 4.0.0；</li>
 *   <li>游戏 native 层通过 JNI 拿到的 / 服务端 handshake 上报的版本号 = {@code client-fake-version}。</li>
 * </ul>
 *
 * <p>如果 S3 端没有提供这两个字段、解析失败或网络异常，{@link #getFakeVersion}
 * / {@link #getFakeName} 会返回 {@code null}，spoof 自动关闭，patch 退化为
 * 不影响原版行为的"透传"。
 */
public final class Spoof {
    /** 上报给服务端的伪造版本号；为 null 表示未配置，走原版 {@code PackageManager}。 */
    private static volatile String fakeVersion;
    /** 上报给服务端的伪造应用名；预留字段，目前 native 侧无对应查询接口。 */
    private static volatile String fakeName;

    private Spoof() {}

    /**
     * 写入 spoof 数据。空字符串视同未设置。
     * @param name    伪造的应用名
     * @param version 伪造的版本号
     */
    public static void set(String name, String version) {
        // 空串等价于"未配置"
        fakeName    = (name    != null && !name.isEmpty())    ? name    : null;
        fakeVersion = (version != null && !version.isEmpty()) ? version : null;
        android.util.Log.i("CNVSpoof",
                "[身份伪造] 已写入 fakeName=" + fakeName + " fakeVersion=" + fakeVersion);
    }

    /**
     * @return 投喂给游戏 native 层的伪造版本号；为 {@code null} 时
     *         patch 后的 smali 钩子会走原 PackageManager 路径。
     */
    public static String getFakeVersion() { return fakeVersion; }

    /**
     * @return 伪造的应用名。当前仅作为缓存保留，若后续发现 native
     *         有调用 {@code getApplicationLabel} 的代码路径，可加挂相应钩子。
     */
    public static String getFakeName() { return fakeName; }
}
