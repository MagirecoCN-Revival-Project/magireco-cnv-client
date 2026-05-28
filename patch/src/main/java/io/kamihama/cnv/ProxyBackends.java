package io.kamihama.cnv;

import java.util.List;

/**
 * 游戏代理后端列表的 Java 侧静态持有者。
 *
 * <p>BootstrapActivity 在 handleCloudInit() 成功后调用 {@link #set}，
 * 将服务端下发的代理后端列表写入此处。libMagiaClient.so 的 setURINew 钩子
 * 在首次被触发时通过 JNI 读取此列表，完成游戏原版后端 → 代理后端的 URL 替换。
 *
 * <p>服务端可选下发 {@code game_server_host}（原版游戏服务器 scheme+host）用于精确匹配；
 * 未下发时 native 层退化为路径前缀匹配（含 {@code /magica/api/} 的请求才替换）。
 */
public final class ProxyBackends {

    private static volatile String[] items          = new String[0];
    private static volatile String   gameServerHost = "";

    private ProxyBackends() {}

    /**
     * 写入代理后端列表；传 null 或空列表等同于清空（不启用代理）。
     *
     * @param list 代理后端 URL 列表，每条均含协议、不含末尾斜杠
     */
    public static void set(List<String> list) {
        items = (list != null && !list.isEmpty())
            ? list.toArray(new String[0])
            : new String[0];
    }

    /**
     * 写入游戏原版服务器 scheme+host（如 {@code https://api.magi-reco.com}）；
     * native 层用此值做精确匹配，仅重写发往该 host 的请求。
     */
    public static void setGameServerHost(String host) {
        gameServerHost = (host != null) ? host : "";
    }

    /**
     * 返回当前代理后端列表快照；供 native 层 JNI 调用，不得修改返回的数组。
     */
    public static String[] get() { return items; }

    /**
     * 返回游戏原版服务器 host；供 native 层 JNI 调用。
     */
    public static String getGameServerHost() { return gameServerHost; }
}

