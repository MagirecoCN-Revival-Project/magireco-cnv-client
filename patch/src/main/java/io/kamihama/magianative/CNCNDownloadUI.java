package io.kamihama.magianative;

import android.app.Activity;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * CN 资源安装进度悬浮窗。
 * 通过 show(Activity) 在主线程上叠加一个全屏覆盖层，实时显示各文件的下载与解压进度。
 * 所有写入静态状态的方法均可从任意线程调用，UI 更新通过 uiHandler 抛回主线程。
 */
public class CNCNDownloadUI {

    private static final String TAG = "MagiaClientJNI";

    // 文件状态常量
    private static final int STATUS_PENDING     = 0;
    private static final int STATUS_DOWNLOADING = 1;
    private static final int STATUS_DONE        = 2;

    // 备用 CDN 下载 URL（顺序与 FILE_NAMES 一一对应）
    public static final String[] FILE_URLS = {
        "https://magireco.cbnv.top/cn_base_00_db.zip",
        "https://magireco.cbnv.top/cn_base_01_json.zip",
        "https://magireco.cbnv.top/cn_base_02.zip",
        "https://magireco.cbnv.top/cn_base_03.zip",
        "https://magireco.cbnv.top/cn_base_04.zip",
        "https://magireco.cbnv.top/cn_base_05.zip",
        "https://magireco.cbnv.top/cn_base_06.zip",
        "https://magireco.cbnv.top/cn_magica_resource.zip",
        "https://magireco.cbnv.top/cn_scenario_img.zip",
        "https://magireco2.cbnv.top/cn_voice_01.zip",
        "https://magireco2.cbnv.top/cn_voice_02_done.zip",
        "https://magireco.cbnv.top/cn_js_update.zip",
        "https://magireco2.cbnv.top/movie.zip",
        "https://magireco2.cbnv.top/movie2.zip",
        "https://magireco2.cbnv.top/cn_scenario_update.zip",
    };

    public static final String[] FILE_NAMES = {
        "cn_base_00_db.zip",
        "cn_base_01_json.zip",
        "cn_base_02.zip",
        "cn_base_03.zip",
        "cn_base_04.zip",
        "cn_base_05.zip",
        "cn_base_06.zip",
        "cn_magica_resource.zip",
        "cn_scenario_img.zip",
        "cn_voice_01.zip",
        "cn_voice_02_done.zip",
        "cn_js_update.zip",
        "movie.zip",
        "movie2.zip",
        "cn_scenario_update.zip",
    };

    // 每个文件的进度状态（从任意线程读写，UI 更新通过 Handler 序列化）
    public static int[]   fileStatus;
    public static int[]   fileProgress;
    public static float[] fileSize;
    public static float[] fileSpeed;
    public static float[] fileDownloaded;

    public static boolean isShowing;
    public static long    lastUpdateTime;

    // UI 控件引用（仅主线程访问）
    public static ViewGroup    decorView;
    public static FrameLayout  overlayView;
    public static ProgressBar  progressBarOverall;
    public static TextView     tvLog;
    public static TextView     tvSpeed;
    public static Handler      uiHandler;

    static {
        int n = FILE_NAMES.length;
        fileStatus     = new int[n];
        fileProgress   = new int[n];
        fileSize       = new float[n];
        fileSpeed      = new float[n];
        fileDownloaded = new float[n];
    }

    // -------------------------------------------------------------------------
    // 公开入口
    // -------------------------------------------------------------------------

    /** 在 Activity 上显示安装覆盖层，会等待 UI 控件创建完成后才返回。 */
    public static void show(Activity activity) {
        if (isShowing) return;
        try {
            uiHandler = new Handler(Looper.getMainLooper());
            activity.runOnUiThread(new CreateUIRunnable(activity));

            // 最多等 3 秒，确保 tvLog 已被主线程创建
            int waited = 0;
            while (tvLog == null && waited < 30) {
                waited++;
                try { Thread.sleep(100); } catch (InterruptedException ignored) {}
            }
            isShowing = true;
        } catch (Exception e) {
            Log.e(TAG, e.getMessage());
        }
    }

    /** 隐藏并移除覆盖层。 */
    public static void hide() {
        if (!isShowing) return;
        if (uiHandler == null) return;
        uiHandler.post(new HideRunnable());
        isShowing = false;
    }

    // -------------------------------------------------------------------------
    // 进度状态更新（可从下载线程调用）
    // -------------------------------------------------------------------------

    public static void markFileDone(int index) {
        if (fileStatus != null)   fileStatus[index]   = STATUS_DONE;
        if (fileProgress != null) fileProgress[index] = 100;
        if (uiHandler != null)    uiHandler.post(new UpdateRunnable());
    }

    public static void updateFileProgress(int index, int percent) {
        if (fileProgress != null) fileProgress[index] = percent;
        if (fileStatus != null) {
            if (fileStatus[index] != STATUS_DONE)
                fileStatus[index] = STATUS_DOWNLOADING;
        }
        throttledUpdate();
    }

    public static void setFileSize(int index, float mb) {
        if (fileSize != null) fileSize[index] = mb;
    }

    public static void setFileDownloaded(int index, float mb) {
        if (fileDownloaded != null) fileDownloaded[index] = mb;
    }

    public static void setDownloadSpeed(int index, float mbps) {
        if (fileSpeed != null) fileSpeed[index] = mbps;
    }

    /** 节流刷新：距上次更新超过 500ms 才实际触发 UI 刷新。 */
    public static void throttledUpdate() {
        if (uiHandler == null) return;
        long now = System.currentTimeMillis();
        if (now - lastUpdateTime < 500) return;
        lastUpdateTime = now;
        uiHandler.post(new UpdateRunnable());
    }

    /** 立即触发一次 UI 刷新（忽略节流），用于解压进度等关键节点。 */
    public static void updateSimple(String title, String detail, int progress) {
        if (uiHandler == null) return;
        uiHandler.post(new UpdateRunnable());
    }

    // -------------------------------------------------------------------------
    // 状态文本构建
    // -------------------------------------------------------------------------

    public static String buildStatusText() {
        if (FILE_NAMES == null || fileStatus == null || fileProgress == null)
            return "=== MagiaCN Installer ===\n(initializing...)";

        StringBuilder sb = new StringBuilder("=== MagiaCN Installer ===\n");
        for (int i = 0; i < FILE_NAMES.length; i++) {
            int status = fileStatus[i];
            if (status == STATUS_DONE)        sb.append("[OK] ");
            else if (status == STATUS_DOWNLOADING) sb.append("[ > ] ");
            else                               sb.append("[  ] ");

            sb.append(i + 1).append(".").append(FILE_NAMES[i]);

            if (status == STATUS_DOWNLOADING) {
                int pct = fileProgress[i];
                sb.append("  ").append(pct).append("%");

                if (fileDownloaded != null && fileSize != null) {
                    sb.append("  ").append(truncate(Float.toString(fileDownloaded[i]), 6))
                      .append("/").append(truncate(Float.toString(fileSize[i]), 6))
                      .append("MB");
                }
                if (fileSpeed != null) {
                    sb.append("  ").append(truncate(Float.toString(fileSpeed[i]), 4))
                      .append("MB/s");
                }
            }

            if (status != STATUS_PENDING) {
                int pct = fileProgress[i];
                sb.append("\n  [");
                for (int bar = 0; bar < 10; bar++) {
                    sb.append(bar * 10 < pct ? "█" : "░");
                }
                sb.append("]");
            }
            sb.append("\n");
        }
        return sb.toString();
    }

    private static String truncate(String s, int maxLen) {
        return s.length() <= maxLen ? s : s.substring(0, maxLen);
    }

    // -------------------------------------------------------------------------
    // 内部 Runnable
    // -------------------------------------------------------------------------

    /** 在主线程上构建并添加覆盖层视图。 */
    static class CreateUIRunnable implements Runnable {
        private final Activity context;

        CreateUIRunnable(Activity context) {
            this.context = context;
        }

        @Override
        public void run() {
            try {
                if (context == null) return;

                Window window = context.getWindow();
                ViewGroup decor = (ViewGroup) window.getDecorView();
                decorView = decor;

                // 半透明黑色全屏覆盖层
                FrameLayout overlay = new FrameLayout(context);
                overlay.setBackgroundColor(0xCC000000);

                // 内容区域（垂直线性布局，圆角深色背景）
                LinearLayout content = new LinearLayout(context);
                content.setOrientation(LinearLayout.VERTICAL);
                content.setPadding(24, 24, 24, 24);
                content.setBackgroundColor(0xE0101010);

                // 文件列表 TextView（等宽字体）
                TextView logView = new TextView(context);
                logView.setText("=== MagiaCN Installer ===\n(waiting...)");
                logView.setTextColor(0xFFE0E0E0);
                logView.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 13f);
                logView.setTypeface(Typeface.MONOSPACE);
                logView.setPadding(0, 0, 0, 8);
                content.addView(logView);
                tvLog = logView;

                // 总进度标签
                TextView speedLabel = new TextView(context);
                speedLabel.setText("总进度：");
                speedLabel.setTextColor(0xFFFFCC00);
                speedLabel.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 10f);
                content.addView(speedLabel);

                // 总进度条
                ProgressBar progressBar = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
                progressBar.setMax(100);
                LinearLayout.LayoutParams pbParams = new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT, 28);
                pbParams.setMargins(0, 6, 0, 0);
                progressBar.setPadding(0, 6, 0, 0);
                content.addView(progressBar, pbParams);
                progressBarOverall = progressBar;

                // 速度 / 状态 TextView
                TextView speedView = new TextView(context);
                speedView.setText("--- waiting ---");
                speedView.setTextColor(0xFF00FF88);
                speedView.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 13f);
                speedView.setTypeface(Typeface.MONOSPACE);
                speedView.setPadding(0, 8, 0, 0);
                content.addView(speedView);
                tvSpeed = speedView;

                // 用 ScrollView 包裹内容区
                ScrollView scrollView = new ScrollView(context);
                LinearLayout.LayoutParams svParams = new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT);
                scrollView.addView(content, svParams);

                FrameLayout.LayoutParams overlayParams = new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.MATCH_PARENT,
                        FrameLayout.LayoutParams.MATCH_PARENT,
                        android.view.Gravity.CENTER);
                overlayParams.setMargins(40, 40, 40, 40);
                overlay.addView(scrollView, overlayParams);

                // 署名 TextView（右下角半透明）
                TextView credits = new TextView(context);
                credits.setText(
                    "魔法纪录Totentanz中文化\n" +
                    "【核心逆向开发】MadeInMagius【B站ID】\n" +
                    "(独立完成汉化引擎以及下载系统和日服国服资源合并)\n" +
                    "其他个人网站\n" +
                    "magireader.pages.dev【魔法纪录剧情中日双语阅读网站】\n" +
                    "magiaexedralive2dviewer.pages.dev【MagiaExedra和魔法纪录Live2D网站】\n" +
                    "magireco-call-search-cn.pages.dev【魔法少女称呼关系搜索与身高对比网站】\n" +
                    "【协助与鸣谢】\n" +
                    "国服文件之外的翻译和校对：水银h2oag【阅读器网站为主，资源已同步至游戏】\n" +
                    "下载加速及资源自动化推送：CyberNova\n" +
                    "国服数据留存：segfault\n" +
                    "项目官网：www.magireco.top【通往其他个人网站和提供联系方式】\n" +
                    "bilibili视频教程：BV1faRiBBExk"
                );
                credits.setTextColor(0xAAFFFFFF);
                credits.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 16f);
                credits.setTypeface(Typeface.MONOSPACE);
                credits.setGravity(android.view.Gravity.CENTER);
                credits.setPadding(24, 16, 24, 16);
                credits.setBackgroundColor(0x66000000);

                FrameLayout.LayoutParams creditsParams = new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.WRAP_CONTENT,
                        FrameLayout.LayoutParams.WRAP_CONTENT,
                        android.view.Gravity.BOTTOM | android.view.Gravity.CENTER_HORIZONTAL);
                creditsParams.setMargins(0, 0, 0, 32);
                overlay.addView(credits, creditsParams);

                decor.addView(overlay, new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT));
                overlayView = overlay;

            } catch (Exception e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }

    /** 从主线程移除覆盖层视图。 */
    static class HideRunnable implements Runnable {
        @Override
        public void run() {
            try {
                if (decorView != null && overlayView != null) {
                    decorView.removeView(overlayView);
                    overlayView = null;
                }
                tvLog = null;
                tvSpeed = null;
                progressBarOverall = null;
            } catch (Exception ignored) {}
        }
    }

    /** 刷新覆盖层上显示的文本与进度条。 */
    static class UpdateRunnable implements Runnable {
        @Override
        public void run() {
            try {
                if (tvLog != null) {
                    tvLog.setText(buildStatusText());
                }
                if (progressBarOverall != null && fileStatus != null) {
                    int done = 0;
                    for (int s : fileStatus) if (s == STATUS_DONE) done++;
                    progressBarOverall.setProgress(done * 100 / FILE_NAMES.length);
                }
            } catch (Exception ignored) {}
        }
    }
}
