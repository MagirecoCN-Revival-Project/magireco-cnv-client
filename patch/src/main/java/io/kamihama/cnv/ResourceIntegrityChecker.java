package io.kamihama.cnv;

import android.util.Log;
import org.json.JSONObject;

import java.io.*;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * 静态资源完整性校验——仅针对脚本 / 配置类文件（JS / HTML / JSON / CSS 等）。
 *
 * <p>游戏资源总数十万计，但能影响游戏逻辑的只有脚本和配置文件；图片 / 音频
 * 被替换不构成安全威胁。通过扩展名白名单过滤后，实际需要校验的文件量很小，
 * 整个检查可与 cloud-init 握手并行运行，不影响启动时间。
 *
 * <p>工作流程：
 * <ol>
 *   <li>{@link #generate} — 资源下载 / 热更新完成后调用，遍历 baseDir 中的
 *       脚本配置文件，写出 SHA-256 + size + mtime 清单
 *       ({@code cnv_inject/resource_manifest.json})。</li>
 *   <li>{@link #check} — 启动时调用：先用 size+mtime 快速筛，
 *       只对可疑文件做 SHA-256 深度校验。校验程序自身连续 3 次异常时返回
 *       {@code isCheckError=true}，由调用方弹窗提示（不静默放行）。</li>
 * </ol>
 *
 * <p><b>能力边界：</b>清单 {@code resource_manifest.json} 与资源同处可写目录、
 * 未签名，因此本机制只能发现<em>非对抗性</em>的损坏 / 第三方 App 篡改：有 root
 * 或会改清单的攻击者可同步改清单绕过。对抗重打包靠 {@link IntegrityGuard}
 * 与服务端签名校验；本类负责"日常资源没被改坏"这一层。</p>
 */
public final class ResourceIntegrityChecker {

    private static final String TAG              = "CnvIntegrity";
    private static final int    MANIFEST_VERSION = 1;
    static final String         MANIFEST_NAME    = "resource_manifest.json";

    /** 需要校验的文件扩展名白名单（小写）。图片 / 音频等二进制资源不在此列。 */
    private static final Set<String> SCRIPT_EXTS = new HashSet<>(Arrays.asList(
            ".js", ".json", ".html", ".htm", ".css", ".lua", ".ts", ".xml"
    ));

    // ── Public result type ────────────────────────────────────────────────────

    public static final class Result {
        public final boolean      passed;
        /** true 表示校验程序本身异常（非篡改），提示用户"校验失败"而非"疑似篡改"。 */
        public final boolean      isCheckError;
        public final List<String> tampered; // 相对路径列表
        Result(boolean passed, boolean isCheckError, List<String> tampered) {
            this.passed       = passed;
            this.isCheckError = isCheckError;
            this.tampered     = tampered;
        }
    }

    // ── Generate ──────────────────────────────────────────────────────────────

    /**
     * 遍历 baseDir 下所有脚本配置文件，生成 SHA-256 清单。
     * 采用临时文件 + rename 确保原子写入。在工作线程调用。
     */
    public static void generate(File baseDir, File manifestFile) {
        try {
            JSONObject files = new JSONObject();
            collectScriptFiles(baseDir, baseDir, files);

            JSONObject root = new JSONObject();
            root.put("version",      MANIFEST_VERSION);
            root.put("generated_at", System.currentTimeMillis() / 1000L);
            root.put("files",        files);

            File tmp = new File(manifestFile.getParentFile(), manifestFile.getName() + ".tmp");
            try (FileOutputStream fos = new FileOutputStream(tmp);
                 OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8")) {
                osw.write(root.toString());
                osw.flush();
            }
            if (!tmp.renameTo(manifestFile)) {
                manifestFile.delete();
                tmp.renameTo(manifestFile);
            }
            Log.i(TAG, "资源清单已生成：" + files.length() + " 个脚本/配置文件 → " + manifestFile);
        } catch (Throwable t) {
            Log.e(TAG, "资源清单生成失败：" + t.getMessage());
        }
    }

    private static void collectScriptFiles(File base, File dir, JSONObject out) throws Exception {
        File[] children = dir.listFiles();
        if (children == null) return;
        for (File f : children) {
            if (f.isDirectory()) {
                collectScriptFiles(base, f, out);
            } else if (isScriptFile(f.getName())) {
                String rel = base.toURI().relativize(f.toURI()).getPath();
                JSONObject e = new JSONObject();
                e.put("sha256", sha256hex(f));
                e.put("size",   f.length());
                e.put("mtime",  f.lastModified() / 1000L);
                out.put(rel, e);
            }
        }
    }

    // ── Check ─────────────────────────────────────────────────────────────────

    /**
     * 校验资源完整性，最多重试 3 次。
     * 先用 size+mtime 快速筛（无 IO），仅对可疑文件做 SHA-256 深度校验。
     * 全部重试失败则返回 {@code isCheckError=true} 的失败结果，由调用方弹窗提示。
     * 在工作线程调用。
     */
    public static Result check(File baseDir, File manifestFile) {
        for (int attempt = 1; attempt <= 3; attempt++) {
            try {
                return doCheck(baseDir, manifestFile);
            } catch (Throwable t) {
                Log.w(TAG, "完整性校验异常（第 " + attempt + "/3 次）：" + t.getMessage());
                if (attempt < 3) {
                    try { Thread.sleep(500L * attempt); }
                    catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        break;
                    }
                }
            }
        }
        Log.e(TAG, "完整性校验连续 3 次失败");
        return new Result(false, true, Collections.singletonList("校验程序运行异常"));
    }

    private static Result doCheck(File baseDir, File manifestFile) throws Exception {
        List<String> tampered = new ArrayList<>();
        JSONObject root  = new JSONObject(readFile(manifestFile));
        JSONObject files = root.getJSONObject("files");

        Iterator<String> keys = files.keys();
        while (keys.hasNext()) {
            String     rel    = keys.next();
            JSONObject e      = files.getJSONObject(rel);
            File       actual = new File(baseDir, rel);

            if (!actual.exists()) {
                tampered.add(rel + "（文件缺失）");
                continue;
            }

            long expectedSize  = e.optLong("size",  -1L);
            long expectedMtime = e.optLong("mtime", -1L);
            boolean sizeOk  = expectedSize  < 0 || actual.length() == expectedSize;
            boolean mtimeOk = expectedMtime < 0 || (actual.lastModified() / 1000L) == expectedMtime;

            if (!sizeOk || !mtimeOk) {
                // 快速检查不通过 → SHA-256 深度校验
                String expectedHash = e.optString("sha256", "");
                if (expectedHash.isEmpty()) {
                    tampered.add(rel + "（清单无哈希）");
                } else if (!sha256hex(actual).equalsIgnoreCase(expectedHash)) {
                    tampered.add(rel);
                }
                // SHA-256 一致 → 只是 mtime 被触碰，不算篡改
            }
        }

        boolean passed = tampered.isEmpty();
        if (passed) Log.i(TAG, "资源完整性校验通过");
        else        Log.w(TAG, "疑似篡改文件（" + tampered.size() + " 个）：" + tampered);
        return new Result(passed, false, tampered);
    }

    // ── Utilities ─────────────────────────────────────────────────────────────

    private static boolean isScriptFile(String name) {
        int dot = name.lastIndexOf('.');
        if (dot < 0) return false;
        return SCRIPT_EXTS.contains(name.substring(dot).toLowerCase());
    }

    private static String sha256hex(File f) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        try (FileInputStream fis = new FileInputStream(f)) {
            byte[] buf = new byte[65536];
            int n;
            while ((n = fis.read(buf)) != -1) md.update(buf, 0, n);
        }
        byte[] hash = md.digest();
        StringBuilder sb = new StringBuilder(64);
        for (byte b : hash) {
            int v = b & 0xff;
            if (v < 0x10) sb.append('0');
            sb.append(Integer.toHexString(v));
        }
        return sb.toString();
    }

    private static String readFile(File f) throws IOException {
        try (FileInputStream fis   = new FileInputStream(f);
             InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
             BufferedReader br     = new BufferedReader(isr)) {
            StringBuilder sb = new StringBuilder((int) f.length() + 16);
            char[] buf = new char[8192];
            int n;
            while ((n = br.read(buf)) != -1) sb.append(buf, 0, n);
            return sb.toString();
        }
    }

    private ResourceIntegrityChecker() {}
}
