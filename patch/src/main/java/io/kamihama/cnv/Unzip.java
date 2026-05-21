package io.kamihama.cnv;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * 流式 zip 解压工具。
 *
 * <p>支持从本地 {@link File} 或任意 {@link InputStream}（含
 * {@code content://} URI）解压；同名条目直接覆盖；带 zip-slip 防护；
 * 通过 {@link ProgressSink#onBytes(long, long)} 实时反馈底层流读取
 * 进度，便于 UI 上显示解压进度条。
 *
 * <p>所有读写使用较小（32KB）的缓冲区以降低低端机的内存压力。
 *
 * <p><b>magica/ 前缀剥离</b>：游戏引擎的资源搜索路径相对 writablePath
 * 的形态是 {@code resource/image_web/foo.png}、{@code resource/scenario/...}，
 * 它**从不**用 {@code magica/} 前缀（{@code magica/} 只在 URL 路径里
 * 用——见 .so 中字符串）。但 cn_magica_resource.zip 这类发行包内部
 * 条目名带的是 {@code magica/resource/image_web/...}（保留了 URL 路径
 * 的结构），如果原样解到 writablePath 下就会落在引擎根本不读的
 * {@code magica/resource/} 子树里，导致汉化资源完全不生效。
 * 本类**默认开启**对 {@code magica/} 前缀的自动剥离，保证任何带或
 * 不带这层前缀的 zip 都解到引擎能读的位置；通过给 {@link #extract}
 * 传一个空 {@code stripPrefix} 也可以关闭此行为。
 */
public final class Unzip {

    /** 流式解压时使用的缓冲区大小。在低端设备上 32KB 比 64KB 更安全。 */
    private static final int BUF_SIZE = 1 << 15;

    /** 解压时默认从每个条目名前剥离的前缀（详见类注释）。 */
    public static final String DEFAULT_STRIP_PREFIX = "magica/";

    /** 解压进度回调。 */
    public interface ProgressSink {
        /**
         * 每开始处理一个新条目调用一次。
         *
         * @param name              当前条目的名字
         * @param entryIndex        当前是第几个条目 (1-based)
         * @param entryTotalEstimate 估计的总条目数；未知传 -1
         */
        void onEntry(String name, long entryIndex, long entryTotalEstimate);

        /**
         * 底层流读取字节数变化时回调（约每 200ms 一次，受 IO 节奏影响）。
         *
         * @param bytesProcessed 当前已从底层流读取的字节数
         * @param bytesTotal     底层流总字节数；未知传 -1
         */
        void onBytes(long bytesProcessed, long bytesTotal);

        /** UI 端反馈是否已取消。返回 {@code true} 解压会抛 IOException。 */
        boolean isCancelled();
    }

    private Unzip() {}

    /**
     * 解压本地 zip 文件到 {@code destDir}，同名文件直接覆盖；
     * 自动剥离 {@value #DEFAULT_STRIP_PREFIX} 前缀（见类注释）。
     */
    public static void extract(File zipFile, File destDir, ProgressSink sink) throws IOException {
        extract(zipFile, destDir, DEFAULT_STRIP_PREFIX, sink);
    }

    /**
     * 解压本地 zip 文件到 {@code destDir}，对每个条目名先剥离
     * {@code stripPrefix}（{@code null} / 空串表示不剥离）。
     */
    public static void extract(File zipFile, File destDir,
                               String stripPrefix, ProgressSink sink) throws IOException {
        if (!destDir.exists()) destDir.mkdirs();
        long total = zipFile.length();
        try (InputStream raw = new BufferedInputStream(new FileInputStream(zipFile), BUF_SIZE);
             CountingInputStream counter = new CountingInputStream(raw)) {
            extractFromCountingStream(counter, destDir, total, stripPrefix, sink);
        }
    }

    /** 从任意 {@link InputStream} 解压到 {@code destDir}（总字节未知）。 */
    public static void extractFromStream(InputStream in, File destDir, ProgressSink sink) throws IOException {
        extractFromStream(in, destDir, -1L, DEFAULT_STRIP_PREFIX, sink);
    }

    /** 从外部 {@link InputStream} 解压到 {@code destDir}，并指定总字节数提示。 */
    public static void extractFromStream(InputStream in, File destDir,
                                         long totalBytesHint,
                                         ProgressSink sink) throws IOException {
        extractFromStream(in, destDir, totalBytesHint, DEFAULT_STRIP_PREFIX, sink);
    }

    /** {@link #extractFromStream(InputStream, File, long, ProgressSink)} 的可指定剥离前缀版本。 */
    public static void extractFromStream(InputStream in, File destDir,
                                         long totalBytesHint, String stripPrefix,
                                         ProgressSink sink) throws IOException {
        if (!destDir.exists()) destDir.mkdirs();
        try (CountingInputStream counter = new CountingInputStream(in)) {
            extractFromCountingStream(counter, destDir, totalBytesHint, stripPrefix, sink);
        }
    }

    /** 真正的解压主循环。包装在 CountingInputStream 之上以便上报进度。 */
    private static void extractFromCountingStream(CountingInputStream counter,
                                                  File destDir,
                                                  long totalBytesHint,
                                                  String stripPrefix,
                                                  ProgressSink sink) throws IOException {
        String canonicalDest = destDir.getCanonicalPath();
        // 规范化前缀：必须以 '/' 结尾才能整段剥离，否则比如 "magia"
        // 会把 "magia-something" 也截掉，不安全
        boolean hasStrip = stripPrefix != null && !stripPrefix.isEmpty();
        if (hasStrip && !stripPrefix.endsWith("/")) stripPrefix = stripPrefix + "/";
        long lastProgressNs = 0;
        int stripped = 0;
        try (ZipInputStream zis = new ZipInputStream(counter)) {
            ZipEntry ze;
            long idx = 0;
            byte[] buf = new byte[BUF_SIZE];
            while ((ze = zis.getNextEntry()) != null) {
                if (sink != null && sink.isCancelled()) throw new IOException("已取消");
                idx++;
                String name = ze.getName();
                // 自动剥离前缀
                if (hasStrip && name.startsWith(stripPrefix)) {
                    name = name.substring(stripPrefix.length());
                    stripped++;
                    if (name.isEmpty()) {
                        // 跳过条目本身（前缀自己的目录条目）
                        zis.closeEntry();
                        continue;
                    }
                }
                if (sink != null) sink.onEntry(name, idx, -1L);
                File out = new File(destDir, name);
                // zip-slip 防御：拼出来的路径必须仍在 destDir 之内
                if (!out.getCanonicalPath().startsWith(canonicalDest + File.separator)
                        && !out.getCanonicalPath().equals(canonicalDest)) {
                    zis.closeEntry();
                    continue;
                }
                if (ze.isDirectory()) {
                    out.mkdirs();
                    zis.closeEntry();
                    continue;
                }
                File parent = out.getParentFile();
                if (parent != null && !parent.exists()) parent.mkdirs();
                try (OutputStream os = new BufferedOutputStream(new FileOutputStream(out), BUF_SIZE)) {
                    int n;
                    while ((n = zis.read(buf)) > 0) {
                        os.write(buf, 0, n);
                        // 节流：约 200ms 报一次字节进度
                        long now = System.nanoTime();
                        if (sink != null && now - lastProgressNs > 200_000_000L) {
                            lastProgressNs = now;
                            sink.onBytes(counter.count, totalBytesHint);
                            if (sink.isCancelled()) throw new IOException("已取消");
                        }
                    }
                }
                zis.closeEntry();
            }
        }
        if (sink != null) sink.onBytes(counter.count, totalBytesHint);
        if (stripped > 0) {
            // 用 System.out 而不是日志依赖，避免循环依赖 ResourceFlow.Reporter；
            // 上层会通过 logcat 看到这行（BootstrapActivity 把 stdout/stderr
            // 也 tee 到 lastest.log）。
            System.out.println("[Unzip] auto-stripped '"
                    + (stripPrefix == null ? "" : stripPrefix) + "' from "
                    + stripped + " entries");
        }
    }

    /** 计数 wrapper：记录从底层流读出的总字节数。 */
    private static final class CountingInputStream extends FilterInputStream {
        long count = 0;
        CountingInputStream(InputStream in) { super(in); }
        @Override public int read() throws IOException {
            int b = super.read();
            if (b >= 0) count++;
            return b;
        }
        @Override public int read(byte[] b, int off, int len) throws IOException {
            int n = super.read(b, off, len);
            if (n > 0) count += n;
            return n;
        }
    }
}
