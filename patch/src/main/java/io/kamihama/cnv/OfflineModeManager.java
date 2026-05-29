package io.kamihama.cnv;

/** 离线模式全局标志——服务器连续握手失败后由 BootstrapActivity 激活。 */
public final class OfflineModeManager {
    private static volatile boolean sActive = false;
    private OfflineModeManager() {}
    public static void activate()        { sActive = true;  }
    public static boolean isActive()     { return sActive;  }
}
