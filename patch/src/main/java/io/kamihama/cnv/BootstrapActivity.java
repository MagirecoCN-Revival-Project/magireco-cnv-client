package io.kamihama.cnv;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicReference;

/**
 * 启动引导 Activity（LAUNCHER 入口）。
 *
 * <p>在 Cocos2dx 引擎接管之前，完成所有资源准备工作：
 * 在线下载 / 离线包注入 / 客户端版本核查 / 剧本热更新。
 * 完成后通过 Intent 显式启动 {@link jp.f4samurai.AppActivity}。
 *
 * <p>同时也是 {@link ResourceFlow.Reporter} 的 UI 实现端，
 * 提供极光背景 + 毛玻璃卡片 + 进度槽位 + 贡献者署名 + 浮动日志。
 */
public class BootstrapActivity extends Activity implements ResourceFlow.Reporter {

    public static final String TAG = "CNVBoot";
    public static final String GAME_ACTIVITY = "jp.f4samurai.AppActivity";

    /**
     * Native 兜底入口：{@code libMagiaClient.so} 在 flag 缺失时通过 JNI 反向调用。
     * 用 ActivityThread 反射取 Application context，避免持有静态 Activity 引用。
     */
    public static void startCNDownload() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Object app = at.getMethod("currentApplication").invoke(null);
            if (app == null) {
                android.util.Log.e(TAG, "startCNDownload: 无法取到 Application");
                return;
            }
            Context ctx = (Context) app;
            Intent it = new Intent(ctx, BootstrapActivity.class);
            it.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            ctx.startActivity(it);
            android.util.Log.i(TAG, "startCNDownload: 已拉起 BootstrapActivity，杀掉引擎进程");
            android.os.Process.killProcess(android.os.Process.myPid());
        } catch (Throwable t) {
            android.util.Log.e(TAG, "startCNDownload fallback 失败: " + t.getMessage(), t);
        }
    }

    // ---- 常量 ----
    private static final int    REQ_FILE_PICK     = 0x4D47;
    private static final String PREFS_NAME        = "cnv_bootstrap_ui";
    private static final String PREF_DARK_MODE    = "dark_mode";

    /** 资源目录内的背景图路径（assets/cnv/background_light.png）。 */
    private static final String BG_ASSET          = "cnv/background_light.png";
    /** 资源目录内的游戏 Logo 路径（assets/cnv/logo.png）。 */
    private static final String LOGO_ASSET        = "cnv/logo.png";
    /** CI 将 HCA 转换成 OGG 后落在 assets 内的循环 BGM 路径。 */
    private static final String BGM_ASSET         = "resource/sound_native/bgm/bgm00_system01_hca.ogg";
    /** 自检完毕后播放一次的标题音效（"Magia Record！" 片段）。 */
    private static final String TITLE_SFX_ASSET   = "resource/sound_native/bgm/bgm00_system02_hca.ogg";

    // ---- 配色 ----
    private int COLOR_CARD;          // 卡片/面板背景
    private int COLOR_CARD_STK;      // 卡片边框
    private int COLOR_ACCENT;        // 主强调色
    private int COLOR_ACCENT2;       // 次强调色
    private int COLOR_TEXT;          // 主文字色
    private int COLOR_SUB;           // 次级文字色
    private int COLOR_LOG;           // 日志文字色
    private int COLOR_BAR_BG;        // 进度条背景色
    private int COLOR_LOG_PILL;      // LOG 胶囊背景色
    private int COLOR_DIM;           // 模态遮罩色
    private int COLOR_LOG_PANEL_BG;  // 日志面板背景
    private int COLOR_LOG_PANEL_TEXT;// 日志面板文字
    private int COLOR_GLASS;         // 毛玻璃面板颜色
    private int COLOR_GLASS_STK;     // 毛玻璃面板边框
    private boolean darkMode = false;

    private void loadPalette(boolean dark) {
        if (dark) {
            COLOR_CARD          = 0xE81F1730;
            COLOR_CARD_STK      = 0x55FF80C0;
            COLOR_ACCENT        = 0xFFFF7AC2;
            COLOR_ACCENT2       = 0xFFB87FE0;
            COLOR_TEXT          = 0xFFEFE4F8;
            COLOR_SUB           = 0xFFB9A6C8;
            COLOR_LOG           = 0xCCB9A6C8;
            COLOR_BAR_BG        = 0x44FFFFFF;
            COLOR_LOG_PILL      = 0xE6FF6FB5;
            COLOR_DIM           = 0xAA000000;
            COLOR_LOG_PANEL_BG  = 0xFF1B1029;
            COLOR_LOG_PANEL_TEXT= 0xFFF5ECFB;
            COLOR_GLASS         = 0xCC18112A;  // 深紫半透
            COLOR_GLASS_STK     = 0x44FF80C0;
        } else {
            COLOR_CARD          = 0xF0FFFFFF;
            COLOR_CARD_STK      = 0x33B53C8C;
            COLOR_ACCENT        = 0xFFD63384;
            COLOR_ACCENT2       = 0xFF9C5BC2;
            COLOR_TEXT          = 0xFF2A1A3B;
            COLOR_SUB           = 0xFF6E5276;
            COLOR_LOG           = 0x99452A52;
            COLOR_BAR_BG        = 0x22000000;
            COLOR_LOG_PILL      = 0xE6D63384;
            COLOR_DIM           = 0x88000000;
            COLOR_LOG_PANEL_BG  = 0xFFFFFFFF;
            COLOR_LOG_PANEL_TEXT= 0xFF2A1A3B;
            COLOR_GLASS         = 0xCCFFFFFF;  // 白色半透
            COLOR_GLASS_STK     = 0x33B53C8C;
        }
    }

    // ---- 主卡片内 widget ----
    private TextView      vPhase;
    private TextView      vStatus;
    private TextView      vAggregate;
    private TextView      vOverallText;
    private ProgressBar   pbOverall;
    private LinearLayout  slotContainer;
    private TextView      vVersionLeft;   // 左下角版本信息
    private TextView      vVersionRight;  // 右下角客户端类型

    // ---- 槽位 widget（每次 initSlots(n) 重建） ----
    private TextView[]    slotNameViews;
    private ProgressBar[] slotBars;
    private TextView[]    slotMetaViews;

    // ---- 浮动日志面板 ----
    private TextView   vLogPill;
    private FrameLayout logModal;
    private TextView   vLogFull;
    /** FATAL 对话框被"查看日志"临时关闭时，此 Runnable 保存重弹逻辑。 */
    private Runnable   fatalRetrigger;
    private ScrollView vLogScroll;

    // ---- 主布局根视图（供 syncGlassToButtons 动态计算边距） ----
    private FrameLayout    vRoot;
    private GlassPanelView vGlassPanel;
    private LinearLayout   vHeadRight;
    private LinearLayout   vMainRow;

    // ---- 右上角胶囊按钮背景（主题切换时统一重置颜色） ----
    private TextView       vThemeChip;
    private TextView       vHomeChip;
    private TextView       vGitHubChip;
    private GradientDrawable themeChipBg;
    private GradientDrawable homeChipBg;
    private GradientDrawable githubChipBg;

    // ---- BGM / 标题音效 ----
    /** 循环 BGM 播放器（system01）。 */
    private MediaPlayer bgmPlayer;
    private boolean bgmWasPlayingWhenPaused = false;
    /** true = 本次会话内不再尝试播 BGM（资源缺失 / 解码失败）。 */
    private boolean bgmDisabled = false;
    /** 标题音效播放器（system02，一次性）。 */
    private MediaPlayer sfxPlayer;
    /** true = 本次会话内不再尝试播标题音效。 */
    private boolean sfxDisabled = false;

    // ---- 线程同步 ----
    private final Handler ui = new Handler(Looper.getMainLooper());
    private volatile boolean cancelled = false;
    private volatile boolean launched  = false;

    private final AtomicReference<String> modeChoice  = new AtomicReference<>(null);
    private final Object                  modeLock     = new Object();
    private final AtomicReference<Uri>    pickedUri    = new AtomicReference<>(null);
    private final Object                  pickLock     = new Object();
    private volatile boolean              pickFinished = false;

    // ---- 日志缓冲 ----
    private final Deque<String>        logBuffer    = new ArrayDeque<>();
    private static final int           LOG_BUFFER_MAX = 500;
    private java.io.BufferedWriter     logFileWriter;
    private final Object               logFileLock  = new Object();
    private static final java.text.SimpleDateFormat LOG_TS =
            new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.US);

    // ---- 贡献者数据 ----
    /**
     * 贡献者条目：圆形头像颜色 + 名字（将显示为大写粗体）+ 贡献说明 + 主页 URL。
     * 头像显示名字首字，颜色与设计文档中署名颜色一致。
     */
    private static final Object[][] CONTRIBUTORS = {
        // { 头像色, 名字, 贡献说明, 主页 URL }
        { 0xFF3D7BFF, "CyberNova",   "项目负责人 · 私服开发 · UI 设计",  "https://github.com/magirecocn-revival-project" },
        { 0xFF8BB87A, "MadeInMagius","资源整理 · 汉化数据",              "https://github.com/magirecocn-revival-project" },
        { 0xFFE667A0, "segfault",    "资源数据 · 技术支持",              "https://github.com/magirecocn-revival-project" },
        { 0xFF4FB7E6, "水银h2oag",   "资源数据 · 社区维护",              "https://github.com/magirecocn-revival-project" },
    };

    // ======================================================================
    // Activity 生命周期
    // ======================================================================

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        applyFullscreen();
        darkMode = getSharedPreferences(PREFS_NAME, MODE_PRIVATE)
                .getBoolean(PREF_DARK_MODE, false);
        loadPalette(darkMode);
        openLogFile();
        setContentView(buildLayout());
        initSlots(1);
        // 工作线程：资源自检 → 自检完毕后播放标题音效 + BGM → 下载/启动
        Thread t = new Thread(this::runWork, "cnv-bootstrap");
        t.setDaemon(true);
        t.start();
    }

    @Override
    protected void onResume() {
        super.onResume();
        resumeBgm();
    }

    @Override
    protected void onPause() {
        super.onPause();
        pauseBgm();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        stopBgm();
        stopSfx();
        closeLogFile();
    }

    private void applyFullscreen() {
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON,
                WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        if (Build.VERSION.SDK_INT >= 19) {
            getWindow().getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                            | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                            | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
        }
    }

    // ======================================================================
    // 布局构建
    // ======================================================================

    /** 构建整棵视图树并返回根视图。主题切换时会被重新调用。 */
    private View buildLayout() {
        FrameLayout root = new FrameLayout(this);
        vRoot = root;

        // ── 第 0 层：背景图（background_light.png） ──
        ImageView bgView = new ImageView(this);
        bgView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        loadBitmapFromAssets(BG_ASSET, bgView);
        // 深色模式叠加暗色遮罩让背景不那么刺眼
        if (darkMode) bgView.setColorFilter(0xAA000000, PorterDuff.Mode.SRC_ATOP);
        root.addView(bgView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        // ── 第 1 层：毛玻璃底板（边距由 syncGlassToButtons 在首次 layout 后动态写入） ──
        // 使用异步 Stack Blur 处理背景图，初次显示前先用纯色半透明占位
        GlassPanelView glassPanel = new GlassPanelView(this, COLOR_GLASS, COLOR_GLASS_STK, dp(20));
        vGlassPanel = glassPanel;
        FrameLayout.LayoutParams glassLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        root.addView(glassPanel, glassLp);

        // ── 第 2 层：主内容区（横向两列，内边距由 syncGlassToButtons 动态写入） ──
        LinearLayout mainRow = new LinearLayout(this);
        vMainRow = mainRow;
        mainRow.setOrientation(LinearLayout.HORIZONTAL);
        root.addView(mainRow, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        // ── 左列：Logo + 贡献者署名区 ──
        LinearLayout leftCol = new LinearLayout(this);
        leftCol.setOrientation(LinearLayout.VERTICAL);
        leftCol.setPadding(dp(4), 0, dp(12), 0);
        LinearLayout.LayoutParams leftLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.MATCH_PARENT, 0.38f);
        mainRow.addView(leftCol, leftLp);

        // Logo 图片
        ImageView logoView = new ImageView(this);
        logoView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        loadBitmapFromAssets(LOGO_ASSET, logoView);
        LinearLayout.LayoutParams logoLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(72));
        logoLp.bottomMargin = dp(10);
        leftCol.addView(logoView, logoLp);

        // 分隔线
        View divider = new View(this);
        divider.setBackgroundColor(COLOR_CARD_STK);
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(1));
        divLp.bottomMargin = dp(10);
        leftCol.addView(divider, divLp);

        // 贡献者署名区（可滚动）
        ScrollView contribScroll = new ScrollView(this);
        contribScroll.setFillViewport(true);
        LinearLayout contribList = new LinearLayout(this);
        contribList.setOrientation(LinearLayout.VERTICAL);
        contribScroll.addView(contribList, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        for (Object[] c : CONTRIBUTORS) {
            contribList.addView(buildContributorRow(
                    (int) c[0], (String) c[1], (String) c[2], (String) c[3]));
        }
        leftCol.addView(contribScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // ── 右列：阶段/状态 + 文件进度条 + 总进度条 ──
        LinearLayout rightCol = new LinearLayout(this);
        rightCol.setOrientation(LinearLayout.VERTICAL);
        rightCol.setPadding(dp(10), dp(4), dp(4), dp(4));
        LinearLayout.LayoutParams rightLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.MATCH_PARENT, 0.62f);
        mainRow.addView(rightCol, rightLp);

        // 阶段/汇总 头部行
        LinearLayout headRow = new LinearLayout(this);
        headRow.setOrientation(LinearLayout.HORIZONTAL);
        headRow.setGravity(Gravity.CENTER_VERTICAL);
        rightCol.addView(headRow, lpRow(0, dp(4)));

        vPhase = new TextView(this);
        vPhase.setText("初始化");
        vPhase.setTextColor(COLOR_ACCENT);
        vPhase.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        vPhase.setTypeface(vPhase.getTypeface(), Typeface.BOLD);
        headRow.addView(vPhase, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        vAggregate = new TextView(this);
        vAggregate.setText("");
        vAggregate.setTextColor(COLOR_SUB);
        vAggregate.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        vAggregate.setGravity(Gravity.END);
        headRow.addView(vAggregate, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // 状态文字（单行，居中）
        vStatus = new TextView(this);
        vStatus.setText("正在加载...");
        vStatus.setTextColor(COLOR_TEXT);
        vStatus.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        vStatus.setSingleLine(true);
        vStatus.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
        rightCol.addView(vStatus, lpRow(0, dp(6)));

        // 文件槽位列表（可滚动）
        ScrollView slotScroll = new ScrollView(this);
        slotContainer = new LinearLayout(this);
        slotContainer.setOrientation(LinearLayout.VERTICAL);
        slotScroll.addView(slotContainer, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        rightCol.addView(slotScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // 总进度条标签
        vOverallText = new TextView(this);
        vOverallText.setText("整体进度");
        vOverallText.setTextColor(COLOR_TEXT);
        vOverallText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        rightCol.addView(vOverallText, lpRow(dp(8), dp(2)));

        // 总进度条（较粗，视觉上更突出）
        pbOverall = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        pbOverall.setMax(1000);
        pbOverall.setProgress(0);
        tintBar(pbOverall, true);
        rightCol.addView(pbOverall, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(12)));

        // ── 第 3 层：顶部浮动按钮（LOG 左上 + 三个胶囊右上） ──

        // LOG 胶囊（左上）
        vLogPill = new TextView(this);
        vLogPill.setText("LOG");
        vLogPill.setTextColor(0xFFFFFFFF);
        vLogPill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        vLogPill.setTypeface(vLogPill.getTypeface(), Typeface.BOLD);
        vLogPill.setGravity(Gravity.CENTER);
        vLogPill.setPadding(dp(12), dp(6), dp(12), dp(6));
        GradientDrawable pillBg = new GradientDrawable();
        pillBg.setColor(COLOR_LOG_PILL);
        pillBg.setCornerRadius(dp(20));
        vLogPill.setBackground(pillBg);
        FrameLayout.LayoutParams logPillLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        logPillLp.gravity = Gravity.TOP | Gravity.START;
        logPillLp.topMargin  = dp(10);
        logPillLp.leftMargin = dp(10);
        vLogPill.setOnClickListener(v -> openLogModal());
        root.addView(vLogPill, logPillLp);

        // 右上角三个胶囊
        LinearLayout headRight = new LinearLayout(this);
        headRight.setOrientation(LinearLayout.HORIZONTAL);
        FrameLayout.LayoutParams headLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        headLp.gravity    = Gravity.TOP | Gravity.END;
        headLp.topMargin  = dp(10);
        headLp.rightMargin= dp(10);

        themeChipBg = new GradientDrawable();
        themeChipBg.setCornerRadius(dp(20));
        vThemeChip = new TextView(this);
        vThemeChip.setTextColor(0xFFFFFFFF);
        vThemeChip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        vThemeChip.setTypeface(vThemeChip.getTypeface(), Typeface.BOLD);
        vThemeChip.setGravity(Gravity.CENTER);
        vThemeChip.setPadding(dp(12), dp(6), dp(12), dp(6));
        vThemeChip.setBackground(themeChipBg);
        vThemeChip.setOnClickListener(v -> toggleTheme());
        headRight.addView(vThemeChip, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        homeChipBg = new GradientDrawable();
        homeChipBg.setCornerRadius(dp(20));
        vHomeChip = makeChip("⌂  主页", "https://www.magireco.top", homeChipBg);
        LinearLayout.LayoutParams homeLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        homeLp.leftMargin = dp(8);
        headRight.addView(vHomeChip, homeLp);

        githubChipBg = new GradientDrawable();
        githubChipBg.setCornerRadius(dp(20));
        vGitHubChip = makeChip("</>  GitHub",
                "https://github.com/MagirecoCN-Revival-Project", githubChipBg);
        LinearLayout.LayoutParams ghLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        ghLp.leftMargin = dp(8);
        headRight.addView(vGitHubChip, ghLp);
        vHeadRight = headRight;
        root.addView(headRight, headLp);

        applyThemeChipColors();

        // ── 第 4 层：底部左右两端文字 ──
        vVersionLeft = new TextView(this);
        vVersionLeft.setTextColor(COLOR_SUB);
        vVersionLeft.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
        vVersionLeft.setPadding(dp(12), 0, 0, dp(6));
        FrameLayout.LayoutParams vlLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        vlLp.gravity = Gravity.BOTTOM | Gravity.START;
        root.addView(vVersionLeft, vlLp);
        refreshVersionText();

        vVersionRight = new TextView(this);
        vVersionRight.setTextColor(COLOR_SUB);
        vVersionRight.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
        vVersionRight.setPadding(0, 0, dp(12), dp(6));
        vVersionRight.setText(BuildChannel.isInternalTest(this)
                ? "Internal Test Client" : "Public Client");
        FrameLayout.LayoutParams vrLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        vrLp.gravity = Gravity.BOTTOM | Gravity.END;
        root.addView(vVersionRight, vrLp);

        // ── 第 5 层：日志模态面板（默认隐藏） ──
        logModal = new FrameLayout(this);
        logModal.setBackgroundColor(COLOR_DIM);
        logModal.setVisibility(View.GONE);
        logModal.setClickable(true);
        logModal.setOnClickListener(v -> closeLogModal());
        root.addView(logModal, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout panel = new LinearLayout(this);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setClickable(true);
        panel.setPadding(dp(16), dp(16), dp(16), dp(16));
        GradientDrawable panelBg = new GradientDrawable();
        panelBg.setColor(COLOR_LOG_PANEL_BG);
        panelBg.setCornerRadius(dp(16));
        panelBg.setStroke(dp(1), COLOR_CARD_STK);
        panel.setBackground(panelBg);
        FrameLayout.LayoutParams panelLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        panelLp.leftMargin   = dp(20);
        panelLp.rightMargin  = dp(20);
        panelLp.topMargin    = dp(20);
        panelLp.bottomMargin = dp(20);
        logModal.addView(panel, panelLp);

        // 日志面板头部：标题 + 复制 + 关闭
        LinearLayout logHead = new LinearLayout(this);
        logHead.setOrientation(LinearLayout.HORIZONTAL);
        logHead.setGravity(Gravity.CENTER_VERTICAL);
        panel.addView(logHead, lpRow(0, dp(8)));

        TextView logTitle = new TextView(this);
        logTitle.setText("调试日志");
        logTitle.setTextColor(COLOR_ACCENT);
        logTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        logHead.addView(logTitle, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button copyBtn = new Button(this);
        copyBtn.setText("复制全部");
        copyBtn.setAllCaps(false);
        copyBtn.setTextColor(0xFFFFFFFF);
        GradientDrawable copyBg = new GradientDrawable();
        copyBg.setColor(COLOR_ACCENT);
        copyBg.setCornerRadius(dp(8));
        copyBtn.setBackground(copyBg);
        copyBtn.setMinHeight(dp(36));
        copyBtn.setMinimumHeight(dp(36));
        copyBtn.setPadding(dp(14), dp(4), dp(14), dp(4));
        copyBtn.setOnClickListener(v -> copyLogToClipboard());
        logHead.addView(copyBtn, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        Button closeBtn = new Button(this);
        closeBtn.setText("关闭");
        closeBtn.setAllCaps(false);
        closeBtn.setTextColor(COLOR_TEXT);
        GradientDrawable closeBg = new GradientDrawable();
        closeBg.setColor(0x22000000);
        closeBg.setCornerRadius(dp(8));
        closeBtn.setBackground(closeBg);
        closeBtn.setPadding(dp(14), dp(4), dp(14), dp(4));
        LinearLayout.LayoutParams closeLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        closeLp.leftMargin = dp(8);
        closeBtn.setOnClickListener(v -> closeLogModal());
        logHead.addView(closeBtn, closeLp);

        // 日志正文（等宽字体 + 可全选）
        vLogScroll = new ScrollView(this);
        vLogScroll.setFillViewport(true);
        GradientDrawable logScrollBg = new GradientDrawable();
        logScrollBg.setColor(COLOR_BAR_BG);
        logScrollBg.setCornerRadius(dp(8));
        vLogScroll.setBackground(logScrollBg);
        vLogScroll.setPadding(dp(8), dp(6), dp(8), dp(6));
        panel.addView(vLogScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        vLogFull = new TextView(this);
        vLogFull.setText("");
        vLogFull.setTextColor(COLOR_LOG_PANEL_TEXT);
        vLogFull.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        vLogFull.setTypeface(Typeface.MONOSPACE);
        vLogFull.setTextIsSelectable(true);
        vLogScroll.addView(vLogFull, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // 首帧绘制前动态计算玻璃边距，避免界面闪烁
        root.getViewTreeObserver().addOnPreDrawListener(
                new android.view.ViewTreeObserver.OnPreDrawListener() {
            @Override public boolean onPreDraw() {
                root.getViewTreeObserver().removeOnPreDrawListener(this);
                syncGlassToButtons();
                return true;
            }
        });

        return root;
    }

    /**
     * 根据浮动按钮和版本信息的实际测量位置，动态计算毛玻璃边距和主内容行内边距，
     * 确保角落控件（LOG 胶囊、右上角功能胶囊、底部版本信息）不被包裹进玻璃范围内。
     * buildLayout() 首帧绘制前调用一次；toggleTheme() 重建视图后会再次触发。
     */
    private void syncGlassToButtons() {
        if (vRoot == null || vGlassPanel == null || vMainRow == null
                || vHeadRight == null || vLogPill == null
                || vVersionLeft == null || vVersionRight == null) return;

        final int rootW = vRoot.getWidth();
        final int rootH = vRoot.getHeight();
        if (rootW == 0 || rootH == 0) return;

        final int gap   = dp(6);   // 玻璃边与按钮之间的间隙
        final int inner = dp(10);  // 玻璃内壁到内容的内边距

        // 左：LOG 胶囊右侧
        int mLeft   = vLogPill.getRight() + gap;
        // 上：顶部按钮行（LOG 胶囊与功能胶囊组）的下侧
        int mTop    = Math.max(vLogPill.getBottom(), vHeadRight.getBottom()) + gap;
        // 右：右侧功能胶囊组的左侧（转换为从右边缘算起的距离）
        int mRight  = rootW - vHeadRight.getLeft() + gap;
        // 下：底部版本信息的上侧（转换为从下边缘算起的距离）
        int mBottom = rootH - Math.min(vVersionLeft.getTop(), vVersionRight.getTop()) + gap;

        // 更新毛玻璃边距
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) vGlassPanel.getLayoutParams();
        lp.leftMargin   = mLeft;
        lp.topMargin    = mTop;
        lp.rightMargin  = mRight;
        lp.bottomMargin = mBottom;
        vGlassPanel.setLayoutParams(lp);

        // 同步主内容行内边距，使内容始终位于玻璃内壁以内
        vMainRow.setPadding(mLeft + inner, mTop + inner, mRight + inner, mBottom + inner);
    }

    // ── 毛玻璃底板 View ──────────────────────────────────────────────────

    /**
     * 纯色半透明圆角矩形，垫在所有内容控件底下。
     * 同时在异步线程计算背景图的 Stack Blur，完成后替换成真正的模糊效果。
     */
    private static final class GlassPanelView extends View {
        private final Paint   paint        = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF   bounds       = new RectF();
        private final int     fillColor;
        private final int     strokeColor;
        private final float   radius;
        private       Bitmap  blurBitmap;  // 异步生成的模糊背景（可为 null）

        GlassPanelView(Context ctx, int fill, int stroke, float radiusPx) {
            super(ctx);
            fillColor   = fill;
            strokeColor = stroke;
            radius      = radiusPx;
        }

        /** 由外部线程生成模糊图后调用，触发重绘。 */
        void setBlurBitmap(Bitmap b) {
            blurBitmap = b;
            postInvalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            bounds.set(0, 0, getWidth(), getHeight());
            if (blurBitmap != null) {
                // 将模糊 Bitmap 裁成圆角后绘制
                Paint bp = new Paint(Paint.ANTI_ALIAS_FLAG);
                bp.setShader(new BitmapShader(blurBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP));
                // 缩放矩阵让 Bitmap 铺满 View
                Matrix m = new Matrix();
                m.setScale((float) getWidth() / blurBitmap.getWidth(),
                           (float) getHeight() / blurBitmap.getHeight());
                bp.getShader();
                BitmapShader bs = new BitmapShader(blurBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
                bs.setLocalMatrix(m);
                bp.setShader(bs);
                canvas.drawRoundRect(bounds, radius, radius, bp);
                // 叠加半透明遮罩增强可读性
                paint.setColor(fillColor & 0x88FFFFFF);  // 降低不透明度的叠层
                paint.setStyle(Paint.Style.FILL);
                canvas.drawRoundRect(bounds, radius, radius, paint);
            } else {
                // 还没有模糊图时用纯半透明色兜底
                paint.setColor(fillColor);
                paint.setStyle(Paint.Style.FILL);
                canvas.drawRoundRect(bounds, radius, radius, paint);
            }
            // 边框
            paint.setColor(strokeColor);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2f);
            canvas.drawRoundRect(bounds, radius, radius, paint);
        }
    }

    // ── 贡献者条目构建 ───────────────────────────────────────────────────

    /**
     * 构建单条贡献者条目视图。
     *
     * <p>布局：[圆形头像] [大写粗体名字（单击提示 / 双击跳转主页）]
     * <br>         [缩进]  [贡献说明文字]
     */
    private View buildContributorRow(final int avatarColor, final String name,
                                     final String contribution, final String url) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        rowLp.bottomMargin = dp(10);
        row.setLayoutParams(rowLp);
        row.setPadding(dp(2), 0, dp(2), 0);

        // 上半行：圆形头像 + 名字
        LinearLayout nameRow = new LinearLayout(this);
        nameRow.setOrientation(LinearLayout.HORIZONTAL);
        nameRow.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(nameRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // 圆形头像（显示名字首字母，颜色为贡献者专属色）
        AvatarView avatar = new AvatarView(this, avatarColor, name);
        int avatarSize = dp(36);
        LinearLayout.LayoutParams avLp = new LinearLayout.LayoutParams(avatarSize, avatarSize);
        avLp.rightMargin = dp(8);
        nameRow.addView(avatar, avLp);

        // 名字（大写 + 粗体）
        TextView vName = new TextView(this);
        vName.setText(name.toUpperCase(Locale.US));
        vName.setTextColor(avatarColor);
        vName.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        vName.setTypeface(vName.getTypeface(), Typeface.BOLD);

        // 单击：提示贡献内容；双击：跳转主页
        final GestureDetector gd = new GestureDetector(this,
                new GestureDetector.SimpleOnGestureListener() {
                    @Override public boolean onSingleTapConfirmed(MotionEvent e) {
                        Toast.makeText(BootstrapActivity.this,
                                name + "\n" + contribution,
                                Toast.LENGTH_SHORT).show();
                        return true;
                    }
                    @Override public boolean onDoubleTap(MotionEvent e) {
                        if (url != null && !url.isEmpty()) {
                            try {
                                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url))
                                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                            } catch (Throwable ex) {
                                Toast.makeText(BootstrapActivity.this,
                                        "无法打开: " + url, Toast.LENGTH_SHORT).show();
                            }
                        }
                        return true;
                    }
                });
        vName.setOnTouchListener((v, ev) -> gd.onTouchEvent(ev));
        vName.setClickable(true);
        nameRow.addView(vName, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        // 下半行：贡献说明（左侧留出头像宽度的缩进）
        TextView vContrib = new TextView(this);
        vContrib.setText(contribution);
        vContrib.setTextColor(COLOR_SUB);
        vContrib.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
        LinearLayout.LayoutParams contribLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        contribLp.leftMargin  = dp(44);  // 与头像右侧对齐
        contribLp.topMargin   = dp(2);
        row.addView(vContrib, contribLp);

        return row;
    }

    /**
     * 圆形头像 View：在指定颜色的圆形背景上显示名字首字母（大写）。
     */
    private static final class AvatarView extends View {
        private final Paint  circlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint  textPaint   = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final String initial;

        AvatarView(Context ctx, int color, String name) {
            super(ctx);
            circlePaint.setColor(color);
            circlePaint.setStyle(Paint.Style.FILL);
            textPaint.setColor(0xFFFFFFFF);
            textPaint.setTypeface(Typeface.create(Typeface.DEFAULT_BOLD, Typeface.BOLD));
            // 首字符大写（汉字则直接取第一个字符）
            initial = name.isEmpty() ? "?" :
                    String.valueOf(name.charAt(0)).toUpperCase(Locale.US);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f, cy = getHeight() / 2f;
            float r  = Math.min(cx, cy) - 2f;
            canvas.drawCircle(cx, cy, r, circlePaint);
            textPaint.setTextSize(r * 0.9f);
            Paint.FontMetrics fm = textPaint.getFontMetrics();
            float tx = cx - textPaint.measureText(initial) / 2f;
            float ty = cy - (fm.ascent + fm.descent) / 2f;
            canvas.drawText(initial, tx, ty, textPaint);
        }
    }

    // ── 辅助 UI 方法 ─────────────────────────────────────────────────────

    private LinearLayout.LayoutParams lpRow(int marginTop, int marginBottom) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin    = marginTop;
        lp.bottomMargin = marginBottom;
        return lp;
    }

    private void tintBar(ProgressBar pb, boolean accent) {
        if (Build.VERSION.SDK_INT >= 21) {
            int c = accent ? COLOR_ACCENT : COLOR_ACCENT2;
            pb.setProgressTintList(
                    android.content.res.ColorStateList.valueOf(c));
            pb.setProgressBackgroundTintList(
                    android.content.res.ColorStateList.valueOf(COLOR_BAR_BG));
        }
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    /** 工厂：创建右上角胶囊形导航按钮（带外链点击）。 */
    private TextView makeChip(String label, final String openUrl, GradientDrawable bg) {
        TextView t = new TextView(this);
        t.setText(label);
        t.setTextColor(0xFFFFFFFF);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        t.setTypeface(t.getTypeface(), Typeface.BOLD);
        t.setGravity(Gravity.CENTER);
        t.setPadding(dp(12), dp(6), dp(12), dp(6));
        t.setBackground(bg);
        t.setOnClickListener(v -> {
            try {
                Intent it = new Intent(Intent.ACTION_VIEW, Uri.parse(openUrl));
                it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(it);
            } catch (Throwable ex) {
                Toast.makeText(BootstrapActivity.this,
                        "无法打开链接: " + openUrl, Toast.LENGTH_SHORT).show();
            }
        });
        return t;
    }

    /** 将当前主题的颜色同步到所有胶囊按钮背景。 */
    private void applyThemeChipColors() {
        if (themeChipBg  != null) themeChipBg.setColor(darkMode ? 0xCCFFE4A0 : COLOR_ACCENT2);
        if (vThemeChip   != null) vThemeChip.setText(darkMode ? "☀  亮色" : "☾  夜间");
        if (homeChipBg   != null) homeChipBg.setColor(COLOR_LOG_PILL);
        if (githubChipBg != null) githubChipBg.setColor(COLOR_ACCENT2);
    }

    /** 切换深色/浅色主题：保存偏好，重建整棵视图树。 */
    private void toggleTheme() {
        darkMode = !darkMode;
        getSharedPreferences(PREFS_NAME, MODE_PRIVATE).edit()
                .putBoolean(PREF_DARK_MODE, darkMode).apply();
        loadPalette(darkMode);
        setContentView(buildLayout());
        if (slotNameViews != null) initSlots(slotNameViews.length);
        else                       initSlots(1);
        log("INFO", "[UI] 切换主题：" + (darkMode ? "夜间" : "亮色"));
    }

    /**
     * 更新左下角版本文字：
     * "v{真实版本} (VersionCode {code}) · Spoofed as {伪装版本}"
     */
    private void refreshVersionText() {
        if (vVersionLeft == null) return;
        try {
            android.content.pm.PackageInfo pi =
                    getPackageManager().getPackageInfo(getPackageName(), 0);
            String real    = pi.versionName;
            long   code    = Build.VERSION.SDK_INT >= 28
                    ? pi.getLongVersionCode() : pi.versionCode;
            String spoofed = Spoof.getFakeVersion();
            String text    = "v" + real + " (" + code + ")"
                    + (spoofed != null ? "  ·  Spoofed as " + spoofed : "");
            vVersionLeft.setText(text);
        } catch (Throwable ignore) {}
    }

    /**
     * 异步从 assets 加载 Bitmap，完成后在主线程设置到 ImageView。
     * 加载失败时静默忽略（ImageView 保持空白）。
     */
    private void loadBitmapFromAssets(final String assetPath, final ImageView target) {
        new Thread(() -> {
            try {
                Bitmap bm;
                try (java.io.InputStream is = getAssets().open(assetPath)) {
                    bm = BitmapFactory.decodeStream(is);
                }
                final Bitmap result = bm;
                ui.post(() -> target.setImageBitmap(result));
            } catch (Throwable ignore) {}
        }, "cnv-img-load").start();
    }

    // ── 槽位重建 ─────────────────────────────────────────────────────────

    private void rebuildSlots(int n) {
        slotContainer.removeAllViews();
        slotNameViews = new TextView[n];
        slotBars      = new ProgressBar[n];
        slotMetaViews = new TextView[n];
        for (int i = 0; i < n; i++) {
            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            rowLp.bottomMargin = dp(6);
            slotContainer.addView(row, rowLp);

            LinearLayout headRow = new LinearLayout(this);
            headRow.setOrientation(LinearLayout.HORIZONTAL);
            row.addView(headRow, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            TextView name = new TextView(this);
            name.setText(n > 1 ? ("#" + (i + 1) + "  待命") : "--");
            name.setTextColor(COLOR_TEXT);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, n > 4 ? 11f : 13f);
            name.setSingleLine(true);
            name.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
            headRow.addView(name, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView meta = new TextView(this);
            meta.setText("");
            meta.setTextColor(COLOR_SUB);
            meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, n > 4 ? 10f : 11f);
            meta.setGravity(Gravity.END);
            headRow.addView(meta, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            ProgressBar bar = new ProgressBar(this, null,
                    android.R.attr.progressBarStyleHorizontal);
            bar.setMax(1000);
            bar.setProgress(0);
            tintBar(bar, false);
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dp(n > 4 ? 6 : 8));
            barLp.topMargin = dp(2);
            row.addView(bar, barLp);

            slotNameViews[i] = name;
            slotBars[i]      = bar;
            slotMetaViews[i] = meta;
        }
    }

    // ── 浮动日志面板 ─────────────────────────────────────────────────────

    private void openLogModal() {
        renderLogModal();
        logModal.setVisibility(View.VISIBLE);
        vLogScroll.post(() -> vLogScroll.fullScroll(View.FOCUS_DOWN));
    }

    private void closeLogModal() {
        logModal.setVisibility(View.GONE);
        // FATAL 弹窗被"查看日志"临时关闭时，关掉日志面板后要把 FATAL 弹窗重新弹回来
        if (fatalRetrigger != null) {
            Runnable r = fatalRetrigger;
            fatalRetrigger = null;
            ui.post(r);
        }
    }

    private void renderLogModal() {
        StringBuilder sb = new StringBuilder();
        synchronized (logBuffer) {
            for (String s : logBuffer) sb.append(s).append('\n');
        }
        vLogFull.setText(sb.toString());
    }

    // ======================================================================
    // BGM / 标题音效
    // ======================================================================

    /**
     * 在资源自检完毕后调用：
     * 先播放一次标题音效（system02），播完后自动启动循环 BGM（system01）。
     * 若标题音效资源缺失，直接启动 BGM。
     */
    private void playTitleSequence() {
        if (sfxDisabled) {
            startBgm();
            return;
        }
        if (sfxPlayer != null) return;
        try {
            AssetFileDescriptor afd = getAssets().openFd(TITLE_SFX_ASSET);
            MediaPlayer mp = new MediaPlayer();
            mp.setAudioStreamType(AudioManager.STREAM_MUSIC);
            mp.setDataSource(afd.getFileDescriptor(),
                    afd.getStartOffset(), afd.getLength());
            try { afd.close(); } catch (Throwable ignore) {}
            mp.setLooping(false);
            mp.setOnCompletionListener(p -> {
                // 音效播完后释放并启动 BGM
                try { p.release(); } catch (Throwable ignore) {}
                sfxPlayer = null;
                startBgm();
            });
            mp.setOnErrorListener((p, what, extra) -> {
                try { p.release(); } catch (Throwable ignore) {}
                sfxPlayer  = null;
                sfxDisabled = true;
                startBgm();
                return true;
            });
            sfxPlayer = mp;
            mp.setOnPreparedListener(MediaPlayer::start);
            mp.prepareAsync();
        } catch (Throwable t) {
            // 资源缺失（CI 还没转换）——直接启动 BGM
            sfxPlayer  = null;
            sfxDisabled = true;
            startBgm();
        }
    }

    /**
     * 异步启动循环 BGM（system01）。
     * 已经在播或已禁用时直接返回。
     */
    private void startBgm() {
        if (bgmDisabled || bgmPlayer != null) return;
        try {
            AssetFileDescriptor afd = getAssets().openFd(BGM_ASSET);
            MediaPlayer mp = new MediaPlayer();
            mp.setAudioStreamType(AudioManager.STREAM_MUSIC);
            mp.setDataSource(afd.getFileDescriptor(),
                    afd.getStartOffset(), afd.getLength());
            try { afd.close(); } catch (Throwable ignore) {}
            mp.setLooping(true);
            mp.setOnPreparedListener(p -> {
                try { p.start(); } catch (Throwable ignore) {}
            });
            mp.setOnErrorListener((p, what, extra) -> {
                try { p.release(); } catch (Throwable ignore) {}
                bgmPlayer   = null;
                bgmDisabled = true;
                return true;
            });
            bgmPlayer = mp;
            mp.prepareAsync();
        } catch (Throwable t) {
            // 资源缺失（CI 还没跑 HCA→OGG 转换）——本会话内不再尝试
            bgmPlayer   = null;
            bgmDisabled = true;
        }
    }

    private void pauseBgm() {
        if (bgmPlayer == null) return;
        try {
            if (bgmPlayer.isPlaying()) {
                bgmPlayer.pause();
                bgmWasPlayingWhenPaused = true;
            }
        } catch (Throwable ignore) {}
    }

    private void resumeBgm() {
        if (bgmPlayer == null || !bgmWasPlayingWhenPaused) return;
        try {
            bgmPlayer.start();
            bgmWasPlayingWhenPaused = false;
        } catch (Throwable ignore) {}
    }

    private void stopBgm() {
        MediaPlayer mp = bgmPlayer;
        bgmPlayer = null;
        if (mp == null) return;
        try { if (mp.isPlaying()) mp.stop(); } catch (Throwable ignore) {}
        try { mp.release(); } catch (Throwable ignore) {}
    }

    private void stopSfx() {
        MediaPlayer mp = sfxPlayer;
        sfxPlayer = null;
        if (mp == null) return;
        try { if (mp.isPlaying()) mp.stop(); } catch (Throwable ignore) {}
        try { mp.release(); } catch (Throwable ignore) {}
    }

    // ======================================================================
    // 日志文件 I/O
    // ======================================================================

    private void openLogFile() {
        synchronized (logFileLock) {
            try {
                java.io.File logFile = new java.io.File(getFilesDir(), "latest.log");
                logFileWriter = new java.io.BufferedWriter(new java.io.OutputStreamWriter(
                        new java.io.FileOutputStream(logFile, false), "UTF-8"));
                String head = "==== Magireco CNV Bootstrap 日志 (开始于 "
                        + new java.text.SimpleDateFormat(
                                "yyyy/MM/dd HH:mm:ss", Locale.US).format(new java.util.Date())
                        + ") ====\n";
                logFileWriter.write(head);
                logFileWriter.flush();
            } catch (Throwable t) {
                logFileWriter = null;
            }
        }
    }

    private void closeLogFile() {
        synchronized (logFileLock) {
            if (logFileWriter != null) {
                try { logFileWriter.flush(); } catch (Throwable ignore) {}
                try { logFileWriter.close(); } catch (Throwable ignore) {}
                logFileWriter = null;
            }
        }
    }

    // ======================================================================
    // 后台工作线程
    // ======================================================================

    private void runWork() {
        // 第 0a 步：检查本机资源是否已准备就绪
        boolean alreadyReady = isResourcesAlreadyReady();

        // 自检完毕，触发标题音效序列（system02 → system01 BGM）
        ui.post(this::playTitleSequence);

        // 第 0b 步：选下载模式（在线 / 离线）
        // 资源已齐时跳过对话框，用占位值发 init（服务端不关心 ready 场景的 method 字段）
        String userMethod;
        if (alreadyReady) {
            userMethod = ResourceFlow.MODE_ONLINE;
        } else {
            userMethod = askDownloadMethod();
            if (userMethod == null) {
                showFatalAndExit("已取消", "下载模式选择被取消，APP 即将退出。");
                return;
            }
        }

        // 第 0c 步：检查本地封禁记录（心跳写入，早于 init 网络请求）
        BanInfo localBan = BanInfo.load(this);
        if (localBan != null && localBan.isActive()) {
            showFatalAndExit("账号已被封禁", localBan.buildMessage());
            return;
        }

        // 第 0d 步：与云端 /client/init 握手（封禁 / 维护 / 版本闸门）
        if (!handleCloudInit()) return;

        // 第 0e 步：资源已齐则直接启动游戏
        if (alreadyReady) {
            ui.post(this::launchGame);
            return;
        }

        // 第 0f 步：启动资源下载流程
        try {
            new ResourceFlow(this, this, userMethod).run();
        } catch (ResourceFlow.FatalConfigException fce) {
            // showFatalAndExit 已经弹框，此处静默返回
            return;
        } catch (final Throwable t) {
            ui.post(() -> showFatal(t));
            return;
        }
        ui.post(this::launchGame);
    }

    /**
     * 检查资源就绪 flag 文件是否存在。
     * 同时兼容旧版 flag 路径（迁移期）。
     */
    private boolean isResourcesAlreadyReady() {
        java.io.File primary = new java.io.File(
                new java.io.File(getFilesDir(), "cnv_inject"),
                "cn_resources_ready.flag");
        if (primary.exists()) return true;
        java.io.File legacy = new java.io.File(
                new java.io.File(new java.io.File(getFilesDir(), "madomagi"), "magica"),
                "cn_base_done.flag");
        return legacy.exists();
    }

    /**
     * 阻塞型对话框：让用户在「在线下载」和「离线包」之间二选一。
     * 返回 {@link ResourceFlow#MODE_ONLINE} / {@link ResourceFlow#MODE_OFFLINE}；用户取消时返回 null。
     */
    private String askDownloadMethod() {
        final Object   lock   = new Object();
        final boolean[] done  = new boolean[] { false };
        final String[]  result= new String[] { null };
        ui.post(() -> {
            final int[] which = new int[] { 0 };
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle("选择资源准备方式");
            b.setSingleChoiceItems(
                    new String[] {
                            "在线下载（推荐，自动多镜像并发）",
                            "离线包注入（已有官方离线 zip 时用）"
                    }, 0, (d, w) -> which[0] = w);
            b.setCancelable(true);
            b.setPositiveButton("确定", (d, w) -> {
                synchronized (lock) {
                    result[0] = which[0] == 0
                            ? ResourceFlow.MODE_ONLINE : ResourceFlow.MODE_OFFLINE;
                    done[0] = true;
                    lock.notifyAll();
                }
            });
            b.setOnCancelListener(d -> {
                synchronized (lock) { done[0] = true; lock.notifyAll(); }
            });
            b.show();
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    return ResourceFlow.MODE_ONLINE;
                }
            }
            return result[0];
        }
    }

    /**
     * 与 /client/init 握手，处理封禁 / 维护 / 版本闸门。
     * 全部检查通过返回 true；任何一项命中时已弹 FATAL 框，返回 false。
     */
    private boolean handleCloudInit() {
        ClientInit.Response init;
        try {
            init = ClientInit.fetch(this, ResourceFlow.BUILD_VERSION);
        } catch (Throwable t) {
            showFatalAndExit("无法联系服务器",
                    "客户端启动需要先和云端 init 接口握手，但本次请求失败了。\n\n"
                  + "API：" + CloudEndpoint.CLIENT_INIT + "\n"
                  + "错误：" + t.getClass().getSimpleName()
                  + (t.getMessage() != null ? (": " + t.getMessage()) : "")
                  + "\n\n请检查网络后重试。");
            return false;
        }

        // 封禁
        if (init.bannedFlag) {
            String reason = (init.bannedReason != null && !init.bannedReason.isEmpty())
                    ? init.bannedReason : "（服务端未提供原因）";
            showFatalAndExit("访问被服务端拒绝", "原因：" + reason);
            return false;
        }

        // 服务器维护 / 故障
        if ("maintenance".equals(init.serverStatus)) {
            String msg = (init.maintenanceMessage != null && !init.maintenanceMessage.isEmpty())
                    ? init.maintenanceMessage : "服务器正在维护，请稍后再试。";
            if (init.maintenanceEndTime > 0L)
                msg += "\n\n预计完成时间：" + formatUnixSeconds(init.maintenanceEndTime);
            showFatalAndExit("服务器维护中", msg);
            return false;
        }
        if ("error".equals(init.serverStatus)) {
            String msg = (init.maintenanceMessage != null && !init.maintenanceMessage.isEmpty())
                    ? init.maintenanceMessage : "服务端报告错误状态，请稍后再试。";
            showFatalAndExit("服务端错误", msg);
            return false;
        }

        // 版本闸门：服务端显式下发 allowed_versions 且本地版本不在列表内时阻断
        if (init.allowedVersions != null
                && !init.allowedVersions.isEmpty()
                && !init.allowedVersions.contains(ResourceFlow.BUILD_VERSION)) {
            boolean internalTest = BuildChannel.isInternalTest(this);
            String  channelName  = internalTest ? "内测版" : "正常版";
            String  url          = internalTest
                    ? init.updateUrlInternalTest : init.updateUrlNormal;
            String  msg;
            if (url != null && !url.isEmpty()) {
                msg = "当前客户端版本 " + ResourceFlow.BUILD_VERSION
                    + " 已不在服务端允许的版本列表内。\n\n请下载最新"
                    + channelName + " APK 后再启动。\n\n下载地址：\n" + url;
                showFatalAndExitWithJump("客户端需要更新", msg, "去下载", url);
            } else {
                msg = "当前客户端版本 " + ResourceFlow.BUILD_VERSION
                    + " 已不在服务端允许的版本列表内，但服务端未下发"
                    + channelName + " APK 的下载地址。\n\n请联系管理员。";
                showFatalAndExit("客户端需要更新", msg);
            }
            return false;
        }

        // 下载镜像 / token 缺失时打日志（不阻断，ResourceFlow 内部会处理）
        if (init.downloadMirrors.isEmpty()
                || init.downloadAccessToken == null
                || init.downloadAccessToken.isEmpty()) {
            android.util.Log.w("cnv-init",
                    "服务端 init 响应里 download.mirrors / access-token 为空——"
                  + "后续 ResourceFlow 接入云端 mirrors 时可能需要在此提前拦截");
        }

        // 版本伪造：将服务端下发的 fake_version / fake_name 写入 Spoof 静态缓存，
        // NativeBridge.getAppVersion() 会优先返回该值（null = 自动退化为真实版本）
        Spoof.set(init.fakeName, init.fakeVersion);

        return true;
    }

    /** Unix 秒 → "yyyy-MM-dd HH:mm" 本地时区字符串。 */
    private static String formatUnixSeconds(long sec) {
        try {
            return new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US)
                    .format(new java.util.Date(sec * 1000L));
        } catch (Throwable t) {
            return String.valueOf(sec);
        }
    }

    private void launchGame() {
        if (launched) return;
        launched = true;
        // 停掉 BGM，让原版游戏自己的音频栈接管；必须在 startActivity 之前停
        stopBgm();
        stopSfx();
        try {
            Intent it = new Intent();
            it.setClassName(getPackageName(), GAME_ACTIVITY);
            it.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            Intent orig = getIntent();
            if (orig != null && orig.getData() != null) it.setData(orig.getData());
            startActivity(it);
            finish();
            overridePendingTransition(0, 0);
        } catch (Throwable t) {
            showFatal(t);
        }
    }

    private void showFatal(Throwable t) {
        AlertDialog.Builder b = new AlertDialog.Builder(this);
        b.setTitle("资源准备失败");
        b.setMessage("无法继续启动游戏: " + t.getMessage()
                + "\n\n请检查网络后重试，或尝试切换为离线包注入方式。");
        b.setCancelable(false);
        b.setPositiveButton("重试",      (d, w) -> recreate());
        b.setNegativeButton("查看日志",  (d, w) -> openLogModal());
        b.show();
    }

    @Override
    public void onBackPressed() {
        // 日志面板打开时按返回键关闭面板，否则吞掉（防止误退出下载）
        if (logModal.getVisibility() == View.VISIBLE) {
            closeLogModal();
        }
    }

    // ======================================================================
    // Reporter 接口实现
    // ======================================================================

    @Override
    public String requestModeChoice(boolean onlineEnabled, boolean offlineEnabled) {
        modeChoice.set(null);
        ui.post(() -> {
            final CharSequence[] items = { "在线下载", "离线包注入" };
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle("请选择资源下载方式");
            b.setCancelable(false);
            b.setItems(items, (dialog, which) -> {
                synchronized (modeLock) {
                    modeChoice.set(which == 0
                            ? ResourceFlow.MODE_ONLINE : ResourceFlow.MODE_OFFLINE);
                    modeLock.notifyAll();
                }
            });
            b.show();
        });
        synchronized (modeLock) {
            while (modeChoice.get() == null) {
                try { modeLock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    return ResourceFlow.MODE_ONLINE;
                }
            }
            return modeChoice.get();
        }
    }

    @Override
    public int requestConcurrency(final int recommended) {
        final int[] options = { 1, 2, 3, 4, 6, 8 };
        int defaultIdx = 0;
        for (int i = 0; i < options.length; i++) {
            if (options[i] == recommended) { defaultIdx = i; break; }
            if (options[i] > recommended) { defaultIdx = Math.max(0, i - 1); break; }
            defaultIdx = i;
        }
        final int finalDefaultIdx = defaultIdx;
        final int[] selected = { defaultIdx };
        final int[] result   = { -1 };
        final Object lock = new Object();
        ui.post(() -> {
            CharSequence[] items = new CharSequence[options.length];
            for (int i = 0; i < options.length; i++)
                items[i] = options[i] + " 个" + (options[i] == recommended ? "   (推荐)" : "");
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle("同时下载文件数")
             .setCancelable(false)
             .setSingleChoiceItems(items, finalDefaultIdx, (d, w) -> selected[0] = w)
             .setPositiveButton("开始下载", (d, w) -> {
                 synchronized (lock) {
                     int idx = Math.max(0, Math.min(selected[0], options.length - 1));
                     result[0] = options[idx];
                     lock.notifyAll();
                 }
             });
            b.show();
        });
        synchronized (lock) {
            while (result[0] < 0) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    return recommended;
                }
            }
            return result[0];
        }
    }

    @Override
    public String requestLineChoice(
            final java.util.LinkedHashMap<String, java.util.List<String>> lines) {
        final String[] keys     = lines.keySet().toArray(new String[0]);
        final String[] selected = { keys.length > 0 ? keys[0] : null };
        final String[] result   = { null };
        final Object lock = new Object();
        ui.post(() -> {
            CharSequence[] items = new CharSequence[keys.length];
            for (int i = 0; i < keys.length; i++) {
                java.util.List<String> templates = lines.get(keys[i]);
                int n = templates != null ? templates.size() : 0;
                items[i] = keys[i] + (n > 0 ? "  (" + n + " 个镜像)" : "");
            }
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle("请选择下载线路")
             .setCancelable(false)
             .setSingleChoiceItems(items, 0, (d, w) -> selected[0] = keys[w])
             .setPositiveButton("使用此线路", (d, w) -> {
                 synchronized (lock) { result[0] = selected[0]; lock.notifyAll(); }
             });
            b.show();
        });
        synchronized (lock) {
            while (result[0] == null) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    return keys.length > 0 ? keys[0] : null;
                }
            }
            return result[0];
        }
    }

    @Override
    public Uri requestFilePick() {
        pickedUri.set(null);
        pickFinished = false;
        ui.post(() -> {
            Intent it = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            it.addCategory(Intent.CATEGORY_OPENABLE);
            it.setType("application/zip");
            it.putExtra(Intent.EXTRA_MIME_TYPES, new String[] {
                    "application/zip", "application/octet-stream",
                    "application/x-zip-compressed", "*/*"
            });
            try {
                startActivityForResult(it, REQ_FILE_PICK);
            } catch (Throwable t) {
                Intent fallback = new Intent(Intent.ACTION_GET_CONTENT);
                fallback.addCategory(Intent.CATEGORY_OPENABLE);
                fallback.setType("*/*");
                startActivityForResult(fallback, REQ_FILE_PICK);
            }
        });
        synchronized (pickLock) {
            while (!pickFinished) {
                try { pickLock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    return null;
                }
            }
        }
        return pickedUri.get();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQ_FILE_PICK) {
            synchronized (pickLock) {
                pickedUri.set(resultCode == Activity.RESULT_OK && data != null
                        ? data.getData() : null);
                pickFinished = true;
                pickLock.notifyAll();
            }
        }
    }

    @Override
    public void setPhase(final String phase) {
        ui.post(() -> {
            String show = phase;
            switch (phase) {
                case "init":              show = "初始化";       break;
                case "client-check":      show = "校验客户端版本"; break;
                case "client-update":     show = "下载新版客户端"; break;
                case "mode-choice":       show = "选择资源方式";  break;
                case "download":          show = "在线下载";      break;
                case "extract":           show = "解压资源";      break;
                case "offline-pick":      show = "选择离线包";    break;
                case "offline-verify":    show = "校验离线包";    break;
                case "offline-extract":   show = "解压离线包";    break;
                case "scenario-check":    show = "校验剧本版本";  break;
                case "scenario-download": show = "下载剧本更新";  break;
                case "scenario-extract":  show = "解压剧本更新";  break;
                case "done":              show = "完成";          break;
            }
            vPhase.setText(show);
        });
    }

    @Override
    public void setStatus(final String status) {
        ui.post(() -> vStatus.setText(status == null ? "" : status));
    }

    @Override
    public void initSlots(final int count) {
        ui.post(() -> rebuildSlots(Math.max(1, count)));
    }

    @Override
    public void setSlot(final int slot, final String fileName,
                        final long soFar, final long total, final long instantBps) {
        ui.post(() -> {
            if (slotNameViews == null || slot < 0 || slot >= slotNameViews.length) return;
            int    n      = slotNameViews.length;
            String prefix = n > 1 ? ("#" + (slot + 1) + "  ") : "";
            slotNameViews[slot].setText(prefix + (fileName == null ? "--" : fileName));
            int pct = total > 0 ? (int) Math.min(1000L, soFar * 1000L / total) : 0;
            slotBars[slot].setProgress(pct);
            StringBuilder meta = new StringBuilder();
            meta.append(formatBytes(soFar));
            if (total > 0) meta.append(" / ").append(formatBytes(total));
            if (instantBps > 0) meta.append("  ").append(formatSpeed(instantBps));
            slotMetaViews[slot].setText(meta.toString());
        });
    }

    @Override
    public void clearSlot(final int slot) {
        ui.post(() -> {
            if (slotNameViews == null || slot < 0 || slot >= slotNameViews.length) return;
            int n = slotNameViews.length;
            slotNameViews[slot].setText(n > 1 ? ("#" + (slot + 1) + "  待命") : "--");
            slotBars[slot].setProgress(0);
            slotMetaViews[slot].setText("");
        });
    }

    @Override
    public void setAggregate(final int completed, final int total,
                             final long instantBpsTotal) {
        ui.post(() -> {
            StringBuilder sb = new StringBuilder();
            if (total > 0) sb.append(completed).append(" / ").append(total).append(" 文件");
            if (instantBpsTotal > 0) {
                if (sb.length() > 0) sb.append("  ");
                sb.append("合计 ").append(formatSpeed(instantBpsTotal));
            }
            vAggregate.setText(sb.toString());
        });
    }

    @Override
    public void setOverallProgress(final long soFar, final long total) {
        ui.post(() -> {
            int pct = total > 0 ? (int) Math.min(1000L, soFar * 1000L / total) : 0;
            pbOverall.setProgress(pct);
            vOverallText.setText("整体进度  "
                    + formatBytes(soFar) + " / " + formatBytes(total));
        });
    }

    @Override
    public boolean isCancelled() { return cancelled; }

    @Override
    public void log(final String type, final String msg) {
        String tag = type == null ? "INFO" : type;
        switch (tag) {
            case "WARN":  android.util.Log.w(TAG, msg); break;
            case "ERROR":
            case "FATAL": android.util.Log.e(TAG, msg); break;
            default:      android.util.Log.i(TAG, msg);
        }
        final String ts;
        synchronized (LOG_TS) {
            ts = "[" + LOG_TS.format(new java.util.Date()) + "] [" + tag + "] " + msg;
        }
        synchronized (logBuffer) {
            logBuffer.addLast(ts);
            while (logBuffer.size() > LOG_BUFFER_MAX) logBuffer.removeFirst();
        }
        // 同步落盘到 latest.log
        synchronized (logFileLock) {
            if (logFileWriter != null) {
                try {
                    logFileWriter.write(ts);
                    logFileWriter.write('\n');
                    logFileWriter.flush();
                } catch (Throwable t) {
                    android.util.Log.w(TAG, "latest.log 写入失败: " + t);
                }
            }
        }
        // 日志面板打开时实时更新
        ui.post(() -> {
            if (logModal != null && logModal.getVisibility() == View.VISIBLE) {
                renderLogModal();
                vLogScroll.post(() -> vLogScroll.fullScroll(View.FOCUS_DOWN));
            }
        });
    }

    @Override
    public void showInfoDialog(final String title, final String message) {
        final Object   lock = new Object();
        final boolean[] done = { false };
        ui.post(() -> {
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle(title).setMessage(message).setCancelable(false)
             .setPositiveButton("确定", (d, w) -> {
                 synchronized (lock) { done[0] = true; lock.notifyAll(); }
             });
            b.show();
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return;
                }
            }
        }
    }

    @Override
    public void showInfoDialogWithJump(final String title, final String message,
                                       final String jumpLabel, final String jumpUrl) {
        final Object   lock = new Object();
        final boolean[] done = { false };
        final Runnable[] showRef = new Runnable[1];
        showRef[0] = () -> {
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle(title).setMessage(message).setCancelable(false)
             .setPositiveButton("确定", (d, w) -> {
                 synchronized (lock) { done[0] = true; lock.notifyAll(); }
             })
             .setNeutralButton(jumpLabel, (d, w) -> {
                 try {
                     startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(jumpUrl))
                             .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                 } catch (Throwable t) {
                     Toast.makeText(BootstrapActivity.this,
                             "无法打开浏览器：" + t.getMessage(), Toast.LENGTH_LONG).show();
                 }
                 // 玩家从浏览器返回后让对话框重新出现
                 ui.postDelayed(showRef[0], 300L);
             });
            b.show();
        };
        ui.post(showRef[0]);
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return;
                }
            }
        }
    }

    @Override
    public void showFatalAndExit(final String title, final String message) {
        final Object   lock = new Object();
        final boolean[] done = { false };
        final Runnable[] showRef = new Runnable[1];
        showRef[0] = () -> {
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle(title).setMessage(message).setCancelable(false)
             .setPositiveButton("退出", (d, w) -> {
                 synchronized (lock) { done[0] = true; lock.notifyAll(); }
             })
             .setNeutralButton("查看日志", (d, w) -> {
                 // 记录"重弹 FATAL"的 Runnable，关掉日志面板时会重新弹出
                 fatalRetrigger = showRef[0];
                 openLogModal();
             });
            b.show();
        };
        ui.post(showRef[0]);
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return;
                }
            }
        }
        ui.post(() -> {
            try { finishAndRemoveTask(); } catch (Throwable ignore) {}
            android.os.Process.killProcess(android.os.Process.myPid());
        });
    }

    /** 带"跳转"按钮的 FATAL 对话框（仅内部使用，不进 Reporter 接口）。 */
    private void showFatalAndExitWithJump(final String title, final String message,
                                          final String jumpLabel, final String jumpUrl) {
        final Object   lock = new Object();
        final boolean[] done = { false };
        final Runnable[] showRef = new Runnable[1];
        showRef[0] = () -> {
            AlertDialog.Builder b = new AlertDialog.Builder(BootstrapActivity.this);
            b.setTitle(title).setMessage(message).setCancelable(false)
             .setPositiveButton("退出", (d, w) -> {
                 synchronized (lock) { done[0] = true; lock.notifyAll(); }
             })
             .setNeutralButton(jumpLabel, (d, w) -> {
                 try {
                     startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(jumpUrl))
                             .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                 } catch (Throwable t) {
                     Toast.makeText(BootstrapActivity.this,
                             "无法打开浏览器：" + t.getMessage(), Toast.LENGTH_LONG).show();
                 }
                 ui.postDelayed(showRef[0], 300L);
             });
            b.show();
        };
        ui.post(showRef[0]);
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return;
                }
            }
        }
        ui.post(() -> {
            try { finishAndRemoveTask(); } catch (Throwable ignore) {}
            android.os.Process.killProcess(android.os.Process.myPid());
        });
    }

    // ======================================================================
    // 剪贴板
    // ======================================================================

    private void copyLogToClipboard() {
        StringBuilder sb = new StringBuilder();
        synchronized (logBuffer) {
            for (String s : logBuffer) sb.append(s).append('\n');
        }
        try {
            ClipboardManager cm = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("magireco-cnv-log", sb.toString()));
                Toast.makeText(this, "日志已复制到剪贴板", Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
            Toast.makeText(this, "复制失败: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    // ======================================================================
    // 工具方法
    // ======================================================================

    private static String formatBytes(long b) {
        if (b < 1024L)             return b + " B";
        if (b < 1024L * 1024L)     return String.format(Locale.US, "%.1f KB", b / 1024.0);
        if (b < 1024L * 1024L * 1024L)
            return String.format(Locale.US, "%.1f MB", b / (1024.0 * 1024.0));
        return String.format(Locale.US, "%.2f GB", b / (1024.0 * 1024.0 * 1024.0));
    }

    private static String formatSpeed(long bps) {
        if (bps <= 0) return "";
        return formatBytes(bps) + "/s";
    }
}
