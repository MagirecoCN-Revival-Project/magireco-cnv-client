package io.kamihama.cnv;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.text.InputType;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
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
import android.provider.Settings;
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
import java.util.concurrent.ConcurrentHashMap;
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

    // ---- 常量 ----
    private static final int    REQ_FILE_PICK          = 0x4D47;
    private static final int    REQ_OVERLAY_PERMISSION = 0x4F56;

    private static final int OFFLINE_CHOICE_RETRY   = 0;
    private static final int OFFLINE_CHOICE_OFFLINE = 1;
    private static final int OFFLINE_CHOICE_EXIT    = 2;
    private static final String PREFS_NAME        = "cnv_bootstrap_ui";
    private static final String PREF_DARK_MODE    = "dark_mode";
    private static final String PREFS_ACCOUNT        = "cnv_account";
    private static final String KEY_ACCOUNT_ID       = "account_id";
    private static final String KEY_ACCOUNT_TOKEN    = "account_token";
    private static final String KEY_SAVED_USERNAME   = "saved_username";
    /**
     * "记住登录"开关。取代旧的"记住密码 + 自动登录"——不再在磁盘存明文密码，
     * 改为持久化服务端下发的会话 token（{@link #KEY_ACCOUNT_TOKEN}）：
     * <ul>
     *   <li>勾选：保留 account_id + token，下次启动用 token 静默恢复会话。</li>
     *   <li>不勾选：下次启动清除已存 token，要求重新登录。</li>
     * </ul>
     * token 可由服务端撤销、且仅本应用私有可读，安全性优于明文密码。
     */
    private static final String KEY_REMEMBER_LOGIN   = "remember_login";

    /** 资源目录内的背景图路径（assets/cnv/background_light.png）。 */
    private static final String BG_ASSET          = "cnv/background_light.png";
    /** 资源目录内的游戏 Logo 路径（assets/cnv/logo.png）。 */
    private static final String LOGO_ASSET        = "cnv/logo.png";
    /** CI 将 HCA 转换成 OGG 后落在 assets 内的 BGM 路径列表（按顺序循环播放）。 */
    private static final String[] BGM_ASSETS = {
        "resource/sound_native/bgm/bgm00_system01_hca.ogg",
        "resource/sound_native/bgm/bgm00_system02_hca.ogg",
    };
    /** 启动音效候选列表（启动时随机取其中一个播放一次，播完后开始循环 BGM）。 */
    private static final String[] SFX_ASSETS = {
        "resource/sound_native/se/startgame01_hca.ogg",
        "resource/sound_native/se/startgame02_hca.ogg",
    };

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
    private TextView      vTotalSpeed;     // 总进度行右侧速度标签
    private ProgressBar   pbOverall;
    private LinearLayout  slotContainer;
    private TextView      vVersionLeft;   // 左下角版本信息
    private TextView      vVersionRight;  // 右下角客户端类型

    // ---- 槽位 widget（每文件固定一个，保存在 slotList 里） ----
    private static final class SlotViews {
        final TextView  nameView;
        final TextView  speedView;
        final ProgressBar bar;
        String phase = "pending";
        SlotViews(TextView n, TextView s, ProgressBar b) {
            nameView = n; speedView = s; bar = b;
        }
    }
    private final java.util.List<SlotViews> slotList = new java.util.ArrayList<>();

    // ---- 浮动日志面板 ----
    private LinearLayout vLeftPills;   // LOG + BGM 胶囊容器（左上角）
    private TextView   vLogPill;
    private TextView   vBgmPill;
    private GradientDrawable bgmPillBg;
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
    /** 贡献者署名列表容器；握手后由 populateContributors() 动态填充。 */
    private LinearLayout   vContribList;

    // ---- 右上角胶囊按钮背景（主题切换时统一重置颜色） ----
    private TextView       vThemeChip;
    private TextView       vHomeChip;
    private TextView       vGitHubChip;
    private GradientDrawable themeChipBg;
    private GradientDrawable homeChipBg;
    private GradientDrawable githubChipBg;

    // ---- BGM / 启动音效 ----
    /** 当前正在播放的 BGM 播放器。 */
    private MediaPlayer bgmPlayer;
    private boolean bgmWasPlayingWhenPaused = false;
    /** true = 本次会话内不再尝试播 BGM（资源缺失 / 解码失败）。 */
    private boolean bgmDisabled = false;
    /** true = 用户手动关闭 BGM。 */
    private boolean bgmMuted = false;
    /** 下一首要播的 BGM 在 {@link #BGM_ASSETS} 中的索引（0 = system01）。 */
    private int bgmIndex = 0;
    /** 启动音效播放器（一次性）。 */
    private MediaPlayer sfxPlayer;
    /** true = 本次会话内不再尝试播启动音效。 */
    private boolean sfxDisabled = false;

    // ---- 线程同步 ----
    private final Handler ui = new Handler(Looper.getMainLooper());
    private volatile boolean cancelled = false;
    private volatile boolean launched  = false;

    /** 与 cloud-init 并行运行的资源完整性校验 Future；仅 alreadyReady=true 时设置。 */
    private volatile java.util.concurrent.Future<ResourceIntegrityChecker.Result> integrityFuture;
    /** 握手后由服务端签发的会话令牌，传给 ResourceFlow 用于鉴权三件套。 */
    private volatile String  sessionToken = "";
    /** 服务端功能开关：是否允许在线下载（握手后由 handleCloudInit 写入）。 */
    private volatile boolean serverOnlineEnabled      = true;
    /** 服务端功能开关：是否允许离线包注入（握手后由 handleCloudInit 写入）。 */
    private volatile boolean serverOfflineEnabled     = true;
    /** 两个功能均关闭时服务端下发的提示文本；null 时展示默认文案。 */
    private volatile String  serverFeatureDisabledMsg = null;
    /** 服务端下发的 cap-worker 端点；空时回退 {@link CloudEndpoint#CAP_WORKER_URL}。 */
    private volatile String  serverCapWorkerUrl       = null;

    /** 覆盖层权限申请完成后待执行的回调（onActivityResult 中触发）。 */
    private Runnable pendingAfterPermission;

    private final AtomicReference<String> modeChoice  = new AtomicReference<>(null);
    private final Object                  modeLock     = new Object();
    private final AtomicReference<Uri>    pickedUri    = new AtomicReference<>(null);
    private final Object                  pickLock     = new Object();
    private volatile boolean              pickFinished = false;

    // ---- 日志缓冲 ----
    private final Deque<String>        logBuffer    = new ArrayDeque<>();
    private static final int           LOG_BUFFER_MAX = 1000;
    private java.io.BufferedWriter     logFileWriter;
    private final Object               logFileLock  = new Object();
    private static final java.text.SimpleDateFormat LOG_TS =
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);

    // ---- 外链 URL（占位 ""，由 .github/workflows/build-apk.yml 在构建期注入）----
    // 不在源码里硬编码任何 URL；CI 用正则把下面的 "" 替换为对应配置值。
    /** 标题栏「主页」按钮指向的站点。 */
    static final String URL_HOME   = "";
    /** 标题栏「GitHub」按钮指向的组织主页。 */
    static final String URL_GITHUB = "";

    // ---- 贡献者数据 ----
    // 贡献者名单不再硬编码，改由 /client/init 响应在握手阶段下发
    // （见 ClientInit.Response.contributors），数量不固定（可多可少可为 0）。
    // 握手成功后由 populateContributors() 动态填充 vContribList。

    /** 未指定颜色时按索引取色的备用调色板（ARGB）。 */
    private static final int[] CONTRIB_PALETTE = {
        0xFF3D7BFF, 0xFF8BB87A, 0xFFE667A0, 0xFF4FB7E6,
        0xFFF2A65A, 0xFF9B8CFF, 0xFF52C7B8, 0xFFE57373,
    };

    /** URL → 已解码 Bitmap 的内存缓存；static 保证 Activity 重建后不重复下载。 */
    private static final ConcurrentHashMap<String, Bitmap> AVATAR_CACHE = new ConcurrentHashMap<>();

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
        log("生命周期", "INFO", "Activity 已创建，主题=" + (darkMode ? "夜间" : "亮色")
                + "，客户端版本=" + ResourceFlow.BUILD_VERSION);
        // 工作线程：资源自检 → 自检完毕后播放标题音效 + BGM → 下载/启动
        Thread t = new Thread(this::runWork, "cnv-bootstrap");
        t.setDaemon(true);
        t.start();
    }

    @Override
    protected void onResume() {
        super.onResume();
        log("生命周期", "INFO", "Activity 恢复前台");
        resumeBgm();
    }

    @Override
    protected void onPause() {
        super.onPause();
        log("生命周期", "INFO", "Activity 进入后台，暂停 BGM");
        pauseBgm();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        log("生命周期", "INFO", "Activity 销毁，释放所有资源");
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

        // 贡献者署名区（可滚动）。名单由 /client/init 握手后动态填充，
        // 此处仅创建空容器并保存引用。
        ScrollView contribScroll = new ScrollView(this);
        contribScroll.setFillViewport(true);
        LinearLayout contribList = new LinearLayout(this);
        contribList.setOrientation(LinearLayout.VERTICAL);
        contribScroll.addView(contribList, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        vContribList = contribList;
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

        // 总进度条标签行（"总进度" 左 + 速度 右）
        LinearLayout totalRow = new LinearLayout(this);
        totalRow.setOrientation(LinearLayout.HORIZONTAL);
        totalRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams totalRowLp = lpRow(dp(8), dp(2));
        rightCol.addView(totalRow, totalRowLp);

        vOverallText = new TextView(this);
        vOverallText.setText("总进度");
        vOverallText.setTextColor(COLOR_TEXT);
        vOverallText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        totalRow.addView(vOverallText, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        vTotalSpeed = new TextView(this);
        vTotalSpeed.setText("");
        vTotalSpeed.setTextColor(COLOR_SUB);
        vTotalSpeed.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        vTotalSpeed.setGravity(Gravity.END);
        totalRow.addView(vTotalSpeed, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // 总进度条（较粗，视觉上更突出）
        pbOverall = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        pbOverall.setMax(1000);
        pbOverall.setProgress(0);
        tintBar(pbOverall, true);
        rightCol.addView(pbOverall, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(10)));

        // ── 第 3 层：顶部浮动按钮（LOG 左上 + 三个胶囊右上） ──

        // 左上角胶囊容器（LOG + BGM）
        LinearLayout leftPills = new LinearLayout(this);
        leftPills.setOrientation(LinearLayout.HORIZONTAL);
        FrameLayout.LayoutParams leftPillsLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        leftPillsLp.gravity    = Gravity.TOP | Gravity.START;
        leftPillsLp.topMargin  = dp(10);
        leftPillsLp.leftMargin = dp(10);
        vLeftPills = leftPills;

        // LOG 胶囊
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
        vLogPill.setOnClickListener(v -> openLogModal());
        leftPills.addView(vLogPill, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // BGM 胶囊
        vBgmPill = new TextView(this);
        vBgmPill.setTextColor(0xFFFFFFFF);
        vBgmPill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        vBgmPill.setTypeface(vBgmPill.getTypeface(), Typeface.BOLD);
        vBgmPill.setGravity(Gravity.CENTER);
        vBgmPill.setPadding(dp(12), dp(6), dp(12), dp(6));
        bgmPillBg = new GradientDrawable();
        bgmPillBg.setCornerRadius(dp(20));
        vBgmPill.setBackground(bgmPillBg);
        vBgmPill.setOnClickListener(v -> toggleBgm());
        LinearLayout.LayoutParams bgmLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        bgmLp.leftMargin = dp(8);
        leftPills.addView(vBgmPill, bgmLp);
        updateBgmPill();

        root.addView(leftPills, leftPillsLp);

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
        vHomeChip = makeChip("⌂  主页", URL_HOME, homeChipBg);
        LinearLayout.LayoutParams homeLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        homeLp.leftMargin = dp(8);
        headRight.addView(vHomeChip, homeLp);

        githubChipBg = new GradientDrawable();
        githubChipBg.setCornerRadius(dp(20));
        vGitHubChip = makeChip("</>  GitHub", URL_GITHUB, githubChipBg);
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
        // 拦截触摸事件，防止点击面板内部区域穿透到遮罩层关闭面板
        panel.setOnTouchListener((v, e) -> true);
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
        // FOCUS_BLOCK_DESCENDANTS 阻止 textIsSelectable 的 TextView 自动把焦点（和滚动位置）吸到顶部
        vLogScroll.setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        GradientDrawable logScrollBg = new GradientDrawable();
        // 使用与面板背景有明显对比的半透明深色背景，确保空日志时滚动区域可见
        logScrollBg.setColor(darkMode ? 0x44FFFFFF : 0x14000000);
        logScrollBg.setCornerRadius(dp(8));
        logScrollBg.setStroke(1, darkMode ? 0x33FFFFFF : 0x22000000);
        vLogScroll.setBackground(logScrollBg);
        vLogScroll.setPadding(dp(8), dp(6), dp(8), dp(6));
        panel.addView(vLogScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        vLogFull = new TextView(this);
        vLogFull.setText("（暂无日志）");
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
                || vHeadRight == null || vLeftPills == null || vLogPill == null
                || vVersionLeft == null || vVersionRight == null) return;

        final int rootW = vRoot.getWidth();
        final int rootH = vRoot.getHeight();
        if (rootW == 0 || rootH == 0) return;

        final int gap   = dp(6);   // 玻璃边与按钮之间的间隙
        final int inner = dp(10);  // 玻璃内壁到内容的内边距

        // 左右两侧取平均值，保证玻璃面板水平居中
        // rawLeft 以 LOG 胶囊（非整个左侧容器）的右边缘为基准，与之前调好的状态保持一致
        int rawLeft  = vLeftPills.getLeft() + vLogPill.getRight() + gap;
        int rawRight = rootW - vHeadRight.getRight() + gap;
        int mLeft    = (rawLeft + rawRight) / 2;
        int mRight   = mLeft;
        // 上：顶部按钮行的下侧（取 LOG 胶囊底部与右侧功能胶囊底部的较大值）
        int mTop    = Math.max(vLeftPills.getTop() + vLogPill.getBottom(), vHeadRight.getBottom()) + gap;
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
     * 用服务端下发的贡献者名单填充署名区（UI 线程调用）。
     *
     * <p>清空旧内容后按顺序渲染；列表为空时显示占位文本。
     * 颜色缺省（color==0）时按索引取调色板色。
     */
    private void populateContributors(java.util.List<ClientInit.Contributor> list) {
        if (vContribList == null) return;
        vContribList.removeAllViews();

        if (list == null || list.isEmpty()) {
            TextView empty = new TextView(this);
            empty.setText("—");
            empty.setTextColor(COLOR_SUB);
            empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
            vContribList.addView(empty);
            return;
        }

        for (int i = 0; i < list.size(); i++) {
            ClientInit.Contributor c = list.get(i);
            int color = (c.color != 0)
                    ? c.color
                    : CONTRIB_PALETTE[i % CONTRIB_PALETTE.length];
            vContribList.addView(buildContributorRow(
                    color,
                    c.name != null ? c.name : "",
                    c.contribution != null ? c.contribution : "",
                    c.url,
                    c.avatarUrl));
        }
    }

    /**
     * 构建单条贡献者条目视图。
     *
     * <p>布局：[圆形头像] [大写粗体名字（单击提示 / 双击跳转主页）]
     * <br>         [缩进]  [贡献说明文字]
     *
     * @param avatarUrl 头像图片 URL；null 时显示首字母彩色圆
     */
    private View buildContributorRow(final int avatarColor, final String name,
                                     final String contribution, final String url,
                                     final String avatarUrl) {
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

        // 圆形头像：有 avatarUrl 时异步加载网络图片，否则显示首字母彩色圆
        AvatarView avatar = new AvatarView(this, avatarColor, name);
        int avatarSize = dp(36);
        LinearLayout.LayoutParams avLp = new LinearLayout.LayoutParams(avatarSize, avatarSize);
        avLp.rightMargin = dp(8);
        nameRow.addView(avatar, avLp);
        if (avatarUrl != null && !avatarUrl.isEmpty()) {
            loadAvatarBitmap(avatar, avatarUrl);
        }

        // 名字（粗体，保留原始大小写）
        TextView vName = new TextView(this);
        vName.setText(name);
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
     * 后台线程从 URL 下载头像并回调到主线程；命中静态缓存时直接同步设置。
     * 失败静默忽略，头像保持首字母圆形兜底。
     */
    private void loadAvatarBitmap(AvatarView av, String url) {
        Bitmap hit = AVATAR_CACHE.get(url);
        if (hit != null) { av.setBitmap(hit); return; }
        final int targetPx = dp(36);
        new Thread(() -> {
            Bitmap bm = fetchBitmapWithRedirect(url, targetPx);
            if (bm != null) {
                AVATAR_CACHE.put(url, bm);
                ui.post(() -> av.setBitmap(bm));
            }
        }, "cnv-avatar").start();
    }

    /**
     * 下载并解码图片。
     *
     * <p>坑点处理：
     * <ul>
     *   <li>手动跟踪重定向（最多 5 跳），支持 HTTP↔HTTPS 跨协议跳转；
     *       Android 默认只跟同协议重定向。</li>
     *   <li>模拟移动浏览器 UA，规避 Bilibili CDN 等对裸 UA 的过滤。</li>
     *   <li>先读为字节数组，两遍解码：第一遍只取尺寸，算 inSampleSize；
     *       第二遍按倍率解码，图片尺寸大时显著节省内存。</li>
     * </ul>
     */
    private static Bitmap fetchBitmapWithRedirect(String startUrl, int targetPx) {
        String url = startUrl;
        for (int hop = 0; hop < 5; hop++) {
            java.net.HttpURLConnection c = null;
            try {
                c = (java.net.HttpURLConnection) new java.net.URL(url).openConnection();
                c.setInstanceFollowRedirects(false); // 手动跟踪，允许跨协议
                c.setConnectTimeout(10_000);
                c.setReadTimeout(15_000);
                c.setRequestProperty("User-Agent",
                        "Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36 " +
                        "(KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36");
                c.setRequestProperty("Accept", "image/webp,image/apng,image/*,*/*;q=0.8");
                c.connect();
                int code = c.getResponseCode();
                if (code >= 300 && code < 400) {
                    String loc = c.getHeaderField("Location");
                    if (loc == null || loc.isEmpty()) return null;
                    if (loc.startsWith("/")) {      // 相对路径补全为绝对 URL
                        java.net.URL base = new java.net.URL(url);
                        loc = base.getProtocol() + "://" + base.getHost() + loc;
                    }
                    // C-H2: 只允许 HTTPS 重定向，拒绝降级到 http:// 或其他协议
                    java.net.URL nextUrl = new java.net.URL(loc);
                    if (!"https".equals(nextUrl.getProtocol())) return null;
                    url = loc;
                    continue;                       // finally 负责 disconnect
                }
                if (code != 200) return null;
                byte[] raw = streamToBytes(c.getInputStream());
                BitmapFactory.Options opts = new BitmapFactory.Options();
                opts.inJustDecodeBounds = true;
                BitmapFactory.decodeByteArray(raw, 0, raw.length, opts);
                opts.inSampleSize     = calcSampleSize(opts.outWidth, opts.outHeight, targetPx);
                opts.inJustDecodeBounds = false;
                return BitmapFactory.decodeByteArray(raw, 0, raw.length, opts);
            } catch (Throwable t) {
                return null;
            } finally {
                if (c != null) try { c.disconnect(); } catch (Throwable ignore) {}
            }
        }
        return null;
    }

    private static byte[] streamToBytes(java.io.InputStream is) throws java.io.IOException {
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = is.read(buf)) != -1) out.write(buf, 0, n);
        return out.toByteArray();
    }

    private static int calcSampleSize(int w, int h, int targetPx) {
        int size = 1;
        int shorter = Math.min(w > 0 ? w : targetPx, h > 0 ? h : targetPx);
        while (shorter / (size * 2) >= targetPx) size *= 2;
        return size;
    }

    /**
     * 圆形头像 View。
     * 默认在指定颜色的圆形背景上显示名字首字母（大写）；
     * 调用 {@link #setBitmap(Bitmap)} 后改为显示网络图片（center-crop 裁圆）。
     */
    private static final class AvatarView extends View {
        private final Paint        circlePaint  = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint        textPaint    = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint        bitmapPaint  = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final String       initial;
        private       Bitmap       bitmap;
        private       BitmapShader bitmapShader;
        private       int          lastSz = -1;

        AvatarView(Context ctx, int color, String name) {
            super(ctx);
            circlePaint.setColor(color);
            circlePaint.setStyle(Paint.Style.FILL);
            textPaint.setColor(0xFFFFFFFF);
            textPaint.setTypeface(Typeface.create(Typeface.DEFAULT_BOLD, Typeface.BOLD));
            initial = name.isEmpty() ? "?" :
                    String.valueOf(name.charAt(0)).toUpperCase(Locale.US);
        }

        void setBitmap(Bitmap bm) {
            if (bm == null || bm.isRecycled()) return;
            bitmap       = bm;
            bitmapShader = new BitmapShader(bm, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            bitmapPaint.setShader(bitmapShader);
            lastSz = -1;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f, cy = getHeight() / 2f;
            float r  = Math.min(cx, cy) - 2f;
            if (bitmap != null) {
                int sz = getWidth();
                if (sz != lastSz && sz > 0) {
                    lastSz = sz;
                    float bw = bitmap.getWidth(), bh = bitmap.getHeight();
                    float scale = Math.max(sz / bw, sz / bh);
                    Matrix m = new Matrix();
                    m.setScale(scale, scale);
                    m.postTranslate((sz - bw * scale) / 2f, (sz - bh * scale) / 2f);
                    bitmapShader.setLocalMatrix(m);
                }
                canvas.drawCircle(cx, cy, r, bitmapPaint);
            } else {
                canvas.drawCircle(cx, cy, r, circlePaint);
                textPaint.setTextSize(r * 0.9f);
                Paint.FontMetrics fm = textPaint.getFontMetrics();
                float tx = cx - textPaint.measureText(initial) / 2f;
                float ty = cy - (fm.ascent + fm.descent) / 2f;
                canvas.drawText(initial, tx, ty, textPaint);
            }
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
            if (openUrl == null || openUrl.isEmpty()) return;  // 未注入 URL（如本地构建）：点击无动作
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
        updateBgmPill();
    }

    /** 切换深色/浅色主题：保存偏好，重建整棵视图树。 */
    private void toggleTheme() {
        darkMode = !darkMode;
        getSharedPreferences(PREFS_NAME, MODE_PRIVATE).edit()
                .putBoolean(PREF_DARK_MODE, darkMode).apply();
        loadPalette(darkMode);
        setContentView(buildLayout());
        initSlots(Math.max(1, slotList.size()));
        log("UI", "INFO", "切换主题：" + (darkMode ? "夜间" : "亮色"));
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
        slotList.clear();
        for (int i = 0; i < n; i++) {
            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.VERTICAL);
            slotContainer.addView(row, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            LinearLayout headRow = new LinearLayout(this);
            headRow.setOrientation(LinearLayout.HORIZONTAL);
            headRow.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams hrLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            hrLp.topMargin = dp(5);
            row.addView(headRow, hrLp);

            TextView name = new TextView(this);
            name.setText("--");
            name.setTextColor(COLOR_TEXT);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
            name.setSingleLine(true);
            name.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
            headRow.addView(name, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView speed = new TextView(this);
            speed.setText("");
            speed.setTextColor(COLOR_SUB);
            speed.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
            speed.setGravity(Gravity.END);
            headRow.addView(speed, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            ProgressBar bar = new ProgressBar(this, null,
                    android.R.attr.progressBarStyleHorizontal);
            bar.setMax(1000);
            bar.setProgress(0);
            if (Build.VERSION.SDK_INT >= 21) {
                bar.setProgressTintList(
                        android.content.res.ColorStateList.valueOf(0x55888888));
                bar.setProgressBackgroundTintList(
                        android.content.res.ColorStateList.valueOf(COLOR_BAR_BG));
            }
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dp(6));
            barLp.topMargin = dp(2);
            row.addView(bar, barLp);

            // 灰色分隔线
            View divider = new View(this);
            divider.setBackgroundColor(darkMode ? 0x22FFFFFF : 0x18000000);
            LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 1);
            divLp.topMargin = dp(4);
            row.addView(divider, divLp);

            slotList.add(new SlotViews(name, speed, bar));
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
        vLogFull.setText(sb.length() == 0 ? "（暂无日志）" : sb.toString());
    }

    // ======================================================================
    // BGM / 标题音效
    // ======================================================================

    /**
     * 在资源自检完毕后调用：从 {@link #SFX_ASSETS} 中随机选一个启动音效播放一次，
     * 播完后启动 BGM 循环。资源缺失或播放出错时直接启动 BGM。
     */
    private void playTitleSequence() {
        if (sfxDisabled) {
            log("音频", "INFO", "启动音效不可用，直接启动 BGM");
            startBgm();
            return;
        }
        if (sfxPlayer != null) return;
        int pick = (int)(Math.random() * SFX_ASSETS.length);
        String sfxAsset = SFX_ASSETS[pick];
        log("音频", "INFO", "随机播放启动音效 [" + pick + "]");
        playSfxSegment(sfxAsset, this::startBgm);
    }

    /** 播放单段音效资源；完成后在主线程执行 onDone。出错或资源缺失时直接调 startBgm()。 */
    private void playSfxSegment(String asset, Runnable onDone) {
        try {
            AssetFileDescriptor afd = getAssets().openFd(asset);
            MediaPlayer mp = new MediaPlayer();
            mp.setAudioStreamType(AudioManager.STREAM_MUSIC);
            mp.setDataSource(afd.getFileDescriptor(),
                    afd.getStartOffset(), afd.getLength());
            try { afd.close(); } catch (Throwable ignore) {}
            mp.setLooping(false);
            mp.setOnCompletionListener(p -> {
                try { p.release(); } catch (Throwable ignore) {}
                sfxPlayer = null;
                onDone.run();
            });
            mp.setOnErrorListener((p, what, extra) -> {
                log("音频", "WARN", "启动音效播放出错（what=" + what + "，extra=" + extra + "），启动 BGM");
                try { p.release(); } catch (Throwable ignore) {}
                sfxPlayer   = null;
                sfxDisabled = true;
                startBgm();
                return true;
            });
            sfxPlayer = mp;
            mp.setOnPreparedListener(MediaPlayer::start);
            mp.prepareAsync();
        } catch (Throwable t) {
            log("音频", "WARN", "启动音效资源缺失，直接启动 BGM：" + t.getMessage());
            sfxPlayer   = null;
            sfxDisabled = true;
            startBgm();
        }
    }

    /** 切换 BGM 开/关状态并更新胶囊按钮外观。 */
    private void toggleBgm() {
        bgmMuted = !bgmMuted;
        log("音频", "INFO", "BGM 状态切换：" + (bgmMuted ? "暂停" : "恢复播放"));
        if (bgmMuted) {
            pauseBgm();
        } else {
            // bgmPlayer 不为 null → 从断点续播；为 null（曲目衔接间隙或准备中被丢弃）→ 重新开始
            if (bgmPlayer != null) {
                resumeBgm();
            } else {
                startBgm();
            }
        }
        updateBgmPill();
    }

    /** 根据 bgmMuted 状态刷新 BGM 胶囊的文字和背景色。 */
    private void updateBgmPill() {
        if (vBgmPill == null || bgmPillBg == null) return;
        if (bgmMuted) {
            vBgmPill.setText("♪  暂停");
            bgmPillBg.setColor(0xAA888888);
        } else {
            vBgmPill.setText("♪  音乐");
            bgmPillBg.setColor(COLOR_LOG_PILL);
        }
    }

    /**
     * 异步启动 BGM；播完当前曲目后自动衔接下一首，形成 system01→system02→… 循环。
     * 已在播、已禁用或用户已静音时直接返回。
     */
    private void startBgm() {
        if (bgmDisabled || bgmPlayer != null || bgmMuted) return;
        String asset = BGM_ASSETS[bgmIndex % BGM_ASSETS.length];
        log("音频", "INFO", "启动 BGM [" + bgmIndex + "] " + asset);
        try {
            AssetFileDescriptor afd = getAssets().openFd(asset);
            MediaPlayer mp = new MediaPlayer();
            mp.setAudioStreamType(AudioManager.STREAM_MUSIC);
            mp.setDataSource(afd.getFileDescriptor(),
                    afd.getStartOffset(), afd.getLength());
            try { afd.close(); } catch (Throwable ignore) {}
            mp.setLooping(false);
            mp.setOnPreparedListener(p -> {
                // 准备完成时若已静音（用户在 prepareAsync 期间点了静音），直接丢弃
                if (bgmMuted || bgmPlayer == null) {
                    try { p.reset(); p.release(); } catch (Throwable ignore) {}
                    if (bgmPlayer == p) bgmPlayer = null;
                    return;
                }
                log("音频", "INFO", "BGM 准备就绪，开始播放");
                try { p.start(); } catch (Throwable ignore) {}
            });
            mp.setOnCompletionListener(p -> {
                // 曲目播完：释放旧播放器，推进索引，播下一首
                try { p.release(); } catch (Throwable ignore) {}
                if (bgmPlayer == p) bgmPlayer = null;
                bgmIndex = (bgmIndex + 1) % BGM_ASSETS.length;
                if (!bgmMuted && !bgmDisabled) startBgm();
            });
            mp.setOnErrorListener((p, what, extra) -> {
                log("音频", "WARN", "BGM 播放出错（what=" + what + "，extra=" + extra + "），本会话内禁用 BGM");
                try { p.release(); } catch (Throwable ignore) {}
                bgmPlayer   = null;
                bgmDisabled = true;
                return true;
            });
            bgmPlayer = mp;
            mp.prepareAsync();
        } catch (Throwable t) {
            // 资源缺失（CI 还没跑 HCA→OGG 转换）——本会话内不再尝试
            log("音频", "WARN", "BGM 资源缺失，本会话内禁用 BGM：" + t.getMessage());
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
                log("音频", "INFO", "BGM 已暂停");
            }
        } catch (Throwable ignore) {}
    }

    private void resumeBgm() {
        if (bgmPlayer == null || !bgmWasPlayingWhenPaused || bgmMuted) return;
        try {
            bgmPlayer.start();
            bgmWasPlayingWhenPaused = false;
            log("音频", "INFO", "BGM 已恢复播放");
        } catch (Throwable ignore) {}
    }

    private void stopBgm() {
        MediaPlayer mp = bgmPlayer;
        bgmPlayer = null;
        bgmIndex  = 0;   // 下次恢复时从 system01 重新开始
        if (mp == null) return;
        // reset() 适用于所有状态（包括 PREPARING），可靠地停止音频输出
        try { mp.reset(); } catch (Throwable ignore) {}
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
        log("启动", "INFO", "工作线程已启动");

        // 第 0 步（最优先）：自防篡改门禁——拦截重打包 / Provider 注入攻击。
        // 必须早于任何敏感数据（token / 存档）访问；不提供调试跳过开关。
        IntegrityGuard.Verdict verdict = IntegrityGuard.check(this);
        if (verdict.tampered) {
            log("安全", "ERROR", "完整性门禁拦截：" + verdict.reason);
            showFatalAndExit("客户端完整性校验失败",
                    "检测到客户端被篡改或来源不可信，已停止启动以保护你的账号数据。\n\n"
                  + "请从官方渠道重新下载安装。");
            return;
        }
        log("安全", "INFO", "完整性门禁通过");

        // 调试模式：display_ui_only.flag=true 时仅展示 UI，跳过所有启动逻辑
        if (isDebugFlag("display_ui_only")) {
            log("启动", "WARN", "调试模式已激活（display_ui_only.flag=true），跳过所有启动逻辑");
            ui.post(this::playTitleSequence);
            setPhase("init");
            setStatus("调试模式：仅展示 UI");
            return;
        }

        // 第 0a 步：检查本机资源是否已准备就绪；同时检测是否处于游戏崩溃循环中
        boolean alreadyReady = isResourcesAlreadyReady();
        log("启动", "INFO", "资源就绪检查：" + (alreadyReady ? "已就绪，跳过下载" : "未就绪，进入下载流程"));
        if (alreadyReady) {
            android.content.SharedPreferences launchState =
                    getSharedPreferences("cnv_launch_state", 0);
            long lastLaunchMs = launchState.getLong("last_launch_ms", 0L);
            long elapsed = System.currentTimeMillis() - lastLaunchMs;
            // 距上次启动游戏不超过 20 秒视为"快速重启"；累计 3 次才弹恢复对话框
            if (lastLaunchMs > 0L && elapsed < 20_000L) {
                int rapidCount = launchState.getInt("rapid_restart_count", 0) + 1;
                log("启动", "WARN", "检测到快速重启（距上次 " + elapsed + " ms），计数=" + rapidCount + "/3");
                if (rapidCount >= 3) {
                    launchState.edit()
                            .putLong("last_launch_ms", 0L)
                            .putInt("rapid_restart_count", 0)
                            .apply();
                    log("启动", "WARN", "连续 3 次快速重启，进入崩溃恢复模式");
                    boolean shouldReset = askCrashRecovery();
                    if (shouldReset) {
                        deleteReadyFlag();
                        alreadyReady = false;
                        log("启动", "INFO", "用户选择重新注入资源，已清除就绪标志");
                    } else {
                        log("启动", "INFO", "用户选择继续启动游戏");
                    }
                } else {
                    launchState.edit().putInt("rapid_restart_count", rapidCount).apply();
                }
            } else {
                // 正常间隔重启，重置计数器
                if (launchState.getInt("rapid_restart_count", 0) != 0) {
                    launchState.edit().putInt("rapid_restart_count", 0).apply();
                }
            }
        }

        // 第 0a 后置：资源已就绪时启动完整性后台校验，与后续握手 / 热更新并行
        if (alreadyReady && !isDebugFlag("skip_integrity_check")) {
            File manifestFile = new File(
                    new File(getFilesDir(), "cnv_inject"),
                    ResourceIntegrityChecker.MANIFEST_NAME);
            if (manifestFile.exists()) {
                log("校验", "INFO", "启动资源完整性后台校验（与握手并行）…");
                java.util.concurrent.ExecutorService exec =
                        java.util.concurrent.Executors.newSingleThreadExecutor();
                integrityFuture = exec.submit(() ->
                        ResourceIntegrityChecker.check(getFilesDir(), manifestFile));
                exec.shutdown();
            } else {
                log("校验", "INFO", "资源清单不存在，跳过本次校验（将在下次下载后生成）");
            }
        }

        // 自检完毕，触发标题音效序列（system02 → system01 BGM）
        ui.post(this::playTitleSequence);

        // 第 0b 步：检查本地封禁记录（心跳写入，早于 init 网络请求）
        if (!isDebugFlag("skip_ban_check")) {
            log("启动", "INFO", "检查本地封禁记录…");
            BanInfo localBan = BanInfo.load(this);
            if (localBan != null && localBan.isActive()) {
                log("启动", "ERROR", "检测到有效本地封禁记录：" + localBan.reason
                        + "（到期=" + localBan.expireTime + "）");
                showFatalAndExit("账号已被封禁", localBan.buildMessage());
                return;
            }
            log("启动", "INFO", "本地封禁记录检查通过");
        } else {
            log("启动", "WARN", "调试：skip_ban_check=true，已跳过封禁记录检查");
        }

        // 第 0c 步：与云端 /client/init 握手（封禁 / 维护 / 版本闸门 / 功能开关）
        if (!isDebugFlag("skip_cloud_init")) {
            cloudInitLoop:
            while (true) {
                log("启动", "INFO", "开始与云端握手…");
                if (!handleCloudInit()) {
                    if (OfflineModeManager.isActive()) {
                        if (alreadyReady) {
                            // 资源已就绪——让用户选择：重试 / 离线模式 / 退出
                            log("启动", "WARN", "服务器不可达，资源已就绪，询问用户");
                            int choice = askOfflineModeChoice();
                            if (choice == OFFLINE_CHOICE_RETRY) {
                                OfflineModeManager.reset();
                                log("启动", "INFO", "用户选择重试握手");
                                continue cloudInitLoop;
                            } else if (choice == OFFLINE_CHOICE_OFFLINE) {
                                log("启动", "INFO", "用户选择进入离线模式");
                                enterOfflineMode();
                            } else {
                                log("启动", "INFO", "用户选择退出");
                                ui.post(() -> {
                                    try { finishAndRemoveTask(); }
                                    catch (Throwable ignore) {}
                                    android.os.Process.killProcess(android.os.Process.myPid());
                                });
                            }
                        } else {
                            log("启动", "ERROR", "服务器不可达且资源未下载，无法进入离线模式");
                            showFatalAndExit("无法进入离线模式",
                                    "服务器暂时不可达，无法完成首次连接。\n\n"
                                  + "离线模式需要先完成一次完整的游戏资源下载。\n\n"
                                  + "请检查网络连接后重试。");
                        }
                    }
                    return;
                }
                break;
            }
        } else {
            log("启动", "WARN", "调试：skip_cloud_init=true，已跳过云端握手（使用默认功能开关）");
        }

        // 第 0d 步：资源已齐则跳过下载，直接检查热更新
        if (alreadyReady) {
            log("启动", "INFO", "资源已就绪，跳过下载，检查热更新");
            if (!isDebugFlag("skip_hot_update")) {
                new ResourceFlow(this, this, ResourceFlow.MODE_ONLINE, sessionToken).runHotUpdate();
            } else {
                log("启动", "WARN", "调试：skip_hot_update=true，已跳过热更新检查");
            }
            log("启动", "INFO", "热更新检查完成，检查完整性校验结果");
            if (integrityFuture != null && !handleIntegrityResult()) return;
            log("启动", "INFO", "显示登录界面");
            ui.post(() -> showLoginDialog(this::checkSavesBeforeLaunch));
            return;
        }

        // 第 0e 步：根据服务端功能开关和调试 flag 选择下载模式
        String userMethod;
        boolean forceOnline  = isDebugFlag("force_online_mode");
        boolean forceOffline = isDebugFlag("force_offline_mode");
        if (forceOnline) {
            userMethod = ResourceFlow.MODE_ONLINE;
            log("启动", "WARN", "调试：force_online_mode=true，强制使用在线模式");
        } else if (forceOffline) {
            userMethod = ResourceFlow.MODE_OFFLINE;
            log("启动", "WARN", "调试：force_offline_mode=true，强制使用离线模式");
        } else if (serverOnlineEnabled && serverOfflineEnabled) {
            log("启动", "INFO", "弹出下载模式选择对话框");
            userMethod = askDownloadMethod();
            if (userMethod == null) {
                log("启动", "WARN", "用户取消了下载模式选择，APP 即将退出");
                showFatalAndExit("已取消", "下载模式选择被取消，APP 即将退出。");
                return;
            }
            log("启动", "INFO", "用户选择了下载模式：" + userMethod);
        } else if (serverOnlineEnabled) {
            userMethod = ResourceFlow.MODE_ONLINE;
            log("启动", "INFO", "服务端仅开放在线下载，自动选择在线模式");
        } else {
            // serverOfflineEnabled must be true（两者均关闭的情况在 handleCloudInit 内已拦截）
            userMethod = ResourceFlow.MODE_OFFLINE;
            log("启动", "INFO", "服务端仅开放离线包注入，自动选择离线模式");
        }

        // 第 0f 步：启动资源下载流程
        log("启动", "INFO", "启动资源下载流程（模式=" + userMethod + "）");
        try {
            new ResourceFlow(this, this, userMethod, sessionToken).run();
        } catch (ResourceFlow.FatalConfigException fce) {
            log("启动", "ERROR", "资源流程配置错误：" + fce.getMessage());
            ui.post(() -> showFatalWithRetry("资源配置错误",
                    "无法准备游戏资源：" + fce.getMessage() + "\n\n请检查网络连接后重试，或联系管理员。"));
            return;
        } catch (final Throwable t) {
            log("启动", "ERROR", "资源流程异常：" + t.getClass().getSimpleName()
                    + "：" + t.getMessage());
            ui.post(() -> showFatal(t));
            return;
        }

        // 第 0g 步：首次下载完成后同样检查热更新（包可能刚发布就有更新）
        log("启动", "INFO", "资源流程完成，检查热更新");
        if (!isDebugFlag("skip_hot_update")) {
            new ResourceFlow(this, this, ResourceFlow.MODE_ONLINE, sessionToken).runHotUpdate();
        } else {
            log("启动", "WARN", "调试：skip_hot_update=true，已跳过热更新检查");
        }
        log("启动", "INFO", "热更新检查完成，显示登录界面");
        ui.post(() -> showLoginDialog(this::checkSavesBeforeLaunch));
    }

    /**
     * 检测调试 flag 文件是否存在且内容为 "true"。
     * Flag 文件位于 &lt;filesDir&gt;/debug/&lt;name&gt;.flag，内容须为字符串 "true"（忽略首尾空白）。
     *
     * <p>已定义的 flag：
     * <ul>
     *   <li>{@code display_ui_only} — 仅展示 UI，跳过所有启动逻辑（最早检查）</li>
     *   <li>{@code skip_cloud_init} — 跳过云端握手，使用默认功能开关</li>
     *   <li>{@code skip_ban_check} — 跳过本地封禁记录检查</li>
     *   <li>{@code skip_hot_update} — 跳过热更新检查</li>
     *   <li>{@code force_online_mode} — 强制使用在线下载模式（忽略服务端功能开关）</li>
     *   <li>{@code force_offline_mode} — 强制使用离线包注入模式（忽略服务端功能开关）</li>
     *   <li>{@code verbose_net_log} — 启用详细网络日志（由 Net 层读取）</li>
     * </ul>
     */
    boolean isDebugFlag(String name) {
        try {
            java.io.File f = new java.io.File(new java.io.File(getFilesDir(), "debug"),
                    name + ".flag");
            if (!f.exists()) return false;
            java.io.FileInputStream fis = new java.io.FileInputStream(f);
            byte[] buf = new byte[(int) Math.min(f.length(), 16)];
            int len = fis.read(buf);
            fis.close();
            String content = len > 0 ? new String(buf, 0, len, "UTF-8").trim() : "";
            return "true".equals(content);
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * 检查日志 ScrollView 当前是否已滚动到底部（或距底部在 32dp 以内）。
     * 在 UI 线程调用；用于决定新日志到来时是否自动追底。
     */
    private boolean isAtLogBottom() {
        if (vLogScroll == null || vLogFull == null) return true;
        return vLogScroll.getScrollY() + vLogScroll.getHeight() + dp(32) >= vLogFull.getHeight();
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
     * 弹对话框询问用户是否立即更新（阻塞直到用户选择）。
     * 返回 true = 立即更新，false = 退出。
     */
    private boolean askUserWantsInAppUpdate(final String title, final String message) {
        final Object   lock = new Object();
        final boolean[] result = { false };
        final boolean[] done   = { false };
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, title);
            addDialogMessage(card, message + "\n\n是否立即下载并安装新版本？");
            LinearLayout row = addDialogButtonRow(card);
            Button exitBtn   = addDialogButton(row, "退出",   false);
            Button updateBtn = addDialogButton(row, "立即更新", true);
            exitBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = false; done[0] = true; lock.notifyAll(); }
            });
            updateBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = true; done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return false;
                }
            }
            return result[0];
        }
    }

    /** 计算文件 SHA-256，返回 64 位小写十六进制字符串；失败抛 IOException。 */
    private static String sha256HexOfFile(java.io.File file) throws java.io.IOException {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            try (java.io.FileInputStream fis = new java.io.FileInputStream(file)) {
                byte[] buf = new byte[65536];
                int n;
                while ((n = fis.read(buf)) != -1) md.update(buf, 0, n);
            }
            byte[] hash = md.digest();
            StringBuilder sb = new StringBuilder(hash.length * 2);
            for (byte b : hash) {
                int v = b & 0xff;
                if (v < 0x10) sb.append('0');
                sb.append(Integer.toHexString(v));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
            throw new java.io.IOException("SHA-256 算法不可用", e);
        }
    }

    /**
     * 下载新版客户端 APK 并启动系统安装器。在工作线程调用。
     * 下载成功后通过 UpdateProvider 把文件 URI 传给安装器，然后退出 Activity。
     *
     * @param expectedSha256 服务端下发的 APK SHA-256（64 位小写十六进制）；null 表示未提供（仅告警）
     */
    private void downloadAndInstallClientUpdate(String url, String expectedSha256) {
        setPhase("client-update");
        setStatus("准备下载更新…");
        ui.post(() -> {
            initSlots(1);
            setSlot(0, "client_update.apk", 0, -1, 0);
            setSlotPhase(0, "downloading");
        });

        java.io.File apkFile = UpdateProvider.getStagedApk(this);
        if (apkFile.exists()) apkFile.delete();

        Net.ProgressSink sink = new Net.ProgressSink() {
            @Override public void onProgress(long soFar, long total, long bps) {
                setSlot(0, null, soFar, total, bps);
                setOverallProgress(soFar, total > 0 ? total : Math.max(soFar, 1L));
                setAggregate(0, 1, bps);
            }
            @Override public boolean isCancelled() { return false; }
        };

        try {
            log("更新", "INFO", "开始下载客户端更新");
            Net.downloadResume(url, apkFile, -1L, 30_000, sink);
            log("更新", "INFO", "更新 APK 下载完成，大小：" + apkFile.length() + " 字节");
        } catch (Exception e) {
            log("更新", "ERROR", "下载更新失败：" + e.getMessage());
            showFatalAndExit("下载更新失败",
                    "APK 下载过程中出错：" + e.getMessage() + "\n\n请稍后重试。");
            return;
        }

        setSlotPhase(0, "done");

        // C-C1: 安装前校验 SHA-256，防止服务端被接管后推送恶意 APK
        if (expectedSha256 != null && expectedSha256.matches("[0-9a-fA-F]{64}")) {
            setStatus("正在校验 APK 完整性…");
            try {
                String actual = sha256HexOfFile(apkFile);
                if (!actual.equalsIgnoreCase(expectedSha256)) {
                    apkFile.delete();
                    log("更新", "ERROR", "APK SHA-256 不匹配：期望=" + expectedSha256 + " 实际=" + actual);
                    showFatalAndExit("更新校验失败",
                            "下载到的客户端 APK 哈希与服务端不符，已拒绝安装。\n\n请稍后重试或联系管理员。");
                    return;
                }
                log("更新", "INFO", "APK SHA-256 校验通过：" + actual);
            } catch (Exception e) {
                apkFile.delete();
                log("更新", "ERROR", "APK SHA-256 计算失败：" + e.getMessage());
                showFatalAndExit("更新校验失败", "无法计算更新文件哈希值：" + e.getMessage());
                return;
            }
        } else {
            log("更新", "WARN", "服务端未提供可验证的 SHA-256，跳过完整性校验");
        }

        setStatus("正在启动安装器…");
        log("更新", "INFO", "正在启动系统安装器");

        ui.post(() -> {
            try {
                android.net.Uri apkUri = UpdateProvider.uriForStagedApk();
                Intent it = new Intent(Intent.ACTION_VIEW);
                it.setDataAndType(apkUri, "application/vnd.android.package-archive");
                it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                        | Intent.FLAG_GRANT_READ_URI_PERMISSION);
                startActivity(it);
            } catch (Throwable t) {
                log("更新", "ERROR", "启动安装器失败：" + t.getMessage());
            }
            ui.postDelayed(() -> {
                try { finishAndRemoveTask(); } catch (Throwable ignore) {}
                android.os.Process.killProcess(android.os.Process.myPid());
            }, 800);
        });
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
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "选择资源准备方式");

            final int[] which = new int[] { 0 };
            String[] options = {
                "在线下载（推荐，自动多镜像并发）",
                "离线包注入（已有官方离线 zip 时用）"
            };
            android.widget.RadioGroup rg = new android.widget.RadioGroup(this);
            rg.setOrientation(android.widget.RadioGroup.VERTICAL);
            for (int i = 0; i < options.length; i++) {
                android.widget.RadioButton rb = new android.widget.RadioButton(this);
                rb.setText(options[i]);
                rb.setTextColor(COLOR_LOG_PANEL_TEXT);
                rb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                rb.setId(i);
                if (i == 0) rb.setChecked(true);
                rg.addView(rb, new android.widget.RadioGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            rg.setOnCheckedChangeListener((g, id) -> which[0] = id);
            LinearLayout.LayoutParams rgLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            rgLp.bottomMargin = dp(16);
            card.addView(rg, rgLp);

            LinearLayout row = addDialogButtonRow(card);
            Button cancelBtn = addDialogButton(row, "取消", false);
            Button okBtn     = addDialogButton(row, "确定", true);
            cancelBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { done[0] = true; lock.notifyAll(); }
            });
            okBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) {
                    result[0] = which[0] == 0
                            ? ResourceFlow.MODE_ONLINE : ResourceFlow.MODE_OFFLINE;
                    done[0] = true;
                    lock.notifyAll();
                }
            });
            overlay.setVisibility(View.VISIBLE);
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
        log("握手", "INFO", "向云端握手接口发起请求…");
        final int MAX_RETRIES = 3;
        ClientInit.Response init = null;
        for (int attempt = 1; attempt <= MAX_RETRIES; attempt++) {
            try {
                if (attempt > 1) {
                    log("握手", "INFO", "握手重试（第 " + attempt + "/" + MAX_RETRIES + " 次）…");
                }
                init = ClientInit.fetch(this, ResourceFlow.BUILD_VERSION);
                break;
            } catch (Throwable t) {
                log("握手", "WARN", "握手失败（第 " + attempt + "/" + MAX_RETRIES + " 次）："
                        + t.getClass().getSimpleName()
                        + (t.getMessage() != null ? "：" + t.getMessage() : ""));
                if (attempt < MAX_RETRIES) {
                    try { Thread.sleep(1000L << (attempt - 1)); }
                    catch (InterruptedException ie) { Thread.currentThread().interrupt(); }
                } else {
                    log("握手", "ERROR", "握手连续 " + MAX_RETRIES + " 次失败，标记离线模式");
                    OfflineModeManager.activate();
                    return false;
                }
            }
        }
        sessionToken = init.accessToken != null ? init.accessToken : "";
        if (!sessionToken.isEmpty()) {
            getSharedPreferences(PREFS_ACCOUNT, MODE_PRIVATE).edit()
                    .putString("session_token", sessionToken)
                    .apply();
        }
        log("握手", "INFO", "握手成功，服务端状态=" + init.serverStatus
                + "，会话令牌=" + (sessionToken.isEmpty() ? "（未下发）" : "已获取"));

        // 封禁
        if (init.bannedFlag) {
            String reason = (init.bannedReason != null && !init.bannedReason.isEmpty())
                    ? init.bannedReason : "（服务端未提供原因）";
            log("握手", "ERROR", "服务端封禁：" + reason);
            showFatalAndExit("访问被服务端拒绝", "原因：" + reason);
            return false;
        }

        // 服务器维护 / 故障
        if ("maintenance".equals(init.serverStatus)) {
            String msg = (init.maintenanceMessage != null && !init.maintenanceMessage.isEmpty())
                    ? init.maintenanceMessage : "服务器正在维护，请稍后再试。";
            if (init.maintenanceEndTime > 0L)
                msg += "\n\n预计完成时间：" + formatUnixSeconds(init.maintenanceEndTime);
            log("握手", "WARN", "服务器维护中：" + msg);
            showFatalAndExit("服务器维护中", msg);
            return false;
        }
        if ("error".equals(init.serverStatus)) {
            String msg = (init.maintenanceMessage != null && !init.maintenanceMessage.isEmpty())
                    ? init.maintenanceMessage : "服务端报告错误状态，请稍后再试。";
            log("握手", "ERROR", "服务端错误状态：" + msg);
            showFatalAndExit("服务端错误", msg);
            return false;
        }

        // 版本闸门：服务端显式下发 allowed_versions 且本地版本不在列表内时阻断
        if (init.allowedVersions != null
                && !init.allowedVersions.isEmpty()
                && !init.allowedVersions.contains(ResourceFlow.BUILD_VERSION)) {
            log("握手", "WARN", "版本不在允许列表内：" + ResourceFlow.BUILD_VERSION
                    + "，允许列表=" + init.allowedVersions);
            boolean internalTest = BuildChannel.isInternalTest(this);
            String  channelName  = internalTest ? "内测版" : "正常版";
            String  url          = internalTest
                    ? init.updateUrlInternalTest : init.updateUrlNormal;
            String  msg;
            if (url != null && !url.isEmpty()) {
                msg = "当前客户端版本 " + ResourceFlow.BUILD_VERSION
                    + " 已不在服务端允许的版本列表内。\n\n请下载最新"
                    + channelName + " APK 后再启动。";
                if (askUserWantsInAppUpdate("客户端需要更新", msg)) {
                    downloadAndInstallClientUpdate(url, init.updateApkSha256);
                } else {
                    ui.post(() -> {
                        try { finishAndRemoveTask(); } catch (Throwable ignore) {}
                        android.os.Process.killProcess(android.os.Process.myPid());
                    });
                }
            } else {
                msg = "当前客户端版本 " + ResourceFlow.BUILD_VERSION
                    + " 已不在服务端允许的版本列表内，但服务端未下发"
                    + channelName + " APK 的下载地址。\n\n请联系管理员。";
                showFatalAndExit("客户端需要更新", msg);
            }
            return false;
        }

        // 版本伪造：将服务端下发的 fake_version / fake_name 写入 Spoof 静态缓存，
        // NativeBridge.getAppVersion() 会优先返回该值（null = 自动退化为真实版本）
        Spoof.set(init.fakeName, init.fakeVersion);
        if (init.fakeName != null || init.fakeVersion != null) {
            log("握手", "INFO", "版本伪造参数：fakeName=" + init.fakeName
                    + "，fakeVersion=" + init.fakeVersion);
        }

        // 服务端地址下发：cap-worker 端点 + 游戏代理后端列表
        serverCapWorkerUrl = (init.capWorkerUrl != null && !init.capWorkerUrl.isEmpty())
                ? init.capWorkerUrl : null;
        // 代理后端列表 & 原版 host 交给 native 层；
        // libMagiaClient.so 的 setURI 钩子按序尝试，全失败回退原版后端。
        ProxyBackends.set(init.proxyBackends);
        if (init.gameServerHost != null && !init.gameServerHost.isEmpty()) {
            ProxyBackends.setGameServerHost(init.gameServerHost);
        }
        log("握手", "INFO", "服务端地址：cap-worker="
                + (serverCapWorkerUrl != null ? serverCapWorkerUrl : "（回退内置）")
                + "，代理后端 " + init.proxyBackends.size() + " 条"
                + (init.gameServerHost != null ? "，game-host=" + init.gameServerHost : ""));

        // 贡献者名单：服务端下发，数量不固定。在 UI 线程动态填充署名区。
        final java.util.List<ClientInit.Contributor> contribs = init.contributors;
        log("握手", "INFO", "贡献者名单：" + contribs.size() + " 人");
        ui.post(() -> populateContributors(contribs));

        // 功能开关：写入实例字段，供 runWork() 决策下载模式
        serverOnlineEnabled      = init.onlineDownloadEnabled;
        serverOfflineEnabled     = init.offlinePackageEnabled;
        serverFeatureDisabledMsg = init.featureDisabledMessage;
        log("握手", "INFO", "功能开关：在线下载=" + serverOnlineEnabled
                + "，离线包注入=" + serverOfflineEnabled);

        // 两个功能均关闭 → 按服务器维护处理
        if (!serverOnlineEnabled && !serverOfflineEnabled) {
            String msg = (serverFeatureDisabledMsg != null && !serverFeatureDisabledMsg.isEmpty())
                    ? serverFeatureDisabledMsg : "服务器暂时关闭了所有下载功能，请稍后再试。";
            log("握手", "WARN", "所有功能开关均已关闭，按维护处理：" + msg);
            showFatalAndExit("功能暂不可用", msg);
            return false;
        }

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

    // ======================================================================
    // 账号登录对话框
    // ======================================================================

    /**
     * 热更新完成后显示登录对话框。
     * <ul>
     *   <li>"记住登录"开启且存有有效 token → 用 token 静默恢复会话，跳过登录。</li>
     *   <li>否则 → 清除可能残留的 token，显示登录表单。</li>
     * </ul>
     * 必须在主线程调用。
     */
    private void showLoginDialog(Runnable onSuccess) {
        SharedPreferences prefs = getSharedPreferences(PREFS_ACCOUNT, MODE_PRIVATE);
        boolean remember  = prefs.getBoolean(KEY_REMEMBER_LOGIN, true);
        String  savedId    = prefs.getString(KEY_ACCOUNT_ID,    null);
        String  savedToken = prefs.getString(KEY_ACCOUNT_TOKEN, null);
        if (remember
                && savedId != null && !savedId.isEmpty()
                && savedToken != null && !savedToken.isEmpty()) {
            log("登录", "INFO", "记住登录已开启，用已存 token 恢复会话");
            onSuccess.run();
            return;
        }
        // 未开启记住登录：清除可能残留的 token / id，避免下次被静默复用
        if (!remember && (savedToken != null || savedId != null)) {
            prefs.edit().remove(KEY_ACCOUNT_ID).remove(KEY_ACCOUNT_TOKEN).apply();
            log("登录", "INFO", "记住登录未开启，已清除残留 token");
        }
        showLoginFormDirectly(onSuccess);
    }

    /**
     * 直接显示登录表单对话框。
     * 表单会预填充上次记住的账号名（仅账号名，绝不存密码），
     * 并显示单个"记住登录"复选框。
     * 必须在主线程调用。
     */
    private void showLoginFormDirectly(Runnable onSuccess) {
        SharedPreferences prefs = getSharedPreferences(PREFS_ACCOUNT, MODE_PRIVATE);

        View[] frame   = inflateDialogFrame();
        FrameLayout overlay = (FrameLayout) frame[0];
        LinearLayout card   = (LinearLayout) frame[1];

        addDialogTitle(card, "账号登录");

        // ── 账号输入框 ──────────────────────────────────────────────────────
        EditText etUser = buildFormEditText(false, "账号");
        card.addView(etUser, formInputLp(dp(10)));

        // ── 密码输入框 ──────────────────────────────────────────────────────
        EditText etPass = buildFormEditText(true, "密码");
        card.addView(etPass, formInputLp(dp(6)));

        // ── 预填充已记住的账号名（仅账号名，密码绝不落盘）──────────────────
        String prefUser = prefs.getString(KEY_SAVED_USERNAME, "");
        if (prefUser != null && !prefUser.isEmpty()) etUser.setText(prefUser);

        // ── 注册账号 / 忘记密码 ────────────────────────────────────────────
        LinearLayout linksRow = new LinearLayout(this);
        linksRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams linksLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        linksLp.bottomMargin = dp(10);

        TextView tvRegister = buildLinkText("注册账号");
        tvRegister.setOnClickListener(v -> openUrlInBrowser(CloudEndpoint.ACCOUNT_REGISTER));

        View linkSpacer = new View(this);

        TextView tvForgot = buildLinkText("忘记密码");
        tvForgot.setOnClickListener(v -> openUrlInBrowser(CloudEndpoint.ACCOUNT_FORGOT));

        linksRow.addView(tvRegister, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        linksRow.addView(linkSpacer, new LinearLayout.LayoutParams(0, 1, 1f));
        linksRow.addView(tvForgot, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        card.addView(linksRow, linksLp);

        // ── "记住登录"复选框（持久化 token，取代旧的记住密码 + 自动登录）──
        android.widget.CheckBox cbRememberLogin = buildCheckBox("记住登录",
                prefs.getBoolean(KEY_REMEMBER_LOGIN, true));
        LinearLayout.LayoutParams cbLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cbLp.bottomMargin = dp(12);
        card.addView(cbRememberLogin, cbLp);

        // ── 错误提示（默认隐藏）─────────────────────────────────────────────
        TextView tvError = new TextView(this);
        tvError.setTextColor(0xFFE53935);
        tvError.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        tvError.setVisibility(View.GONE);
        LinearLayout.LayoutParams errLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        errLp.bottomMargin = dp(8);
        card.addView(tvError, errLp);

        // ── 登录按钮（全宽）────────────────────────────────────────────────
        Button btnLogin = new Button(this);
        btnLogin.setText("登录");
        btnLogin.setAllCaps(false);
        btnLogin.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        btnLogin.setTextColor(0xFFFFFFFF);
        GradientDrawable btnBg = new GradientDrawable();
        btnBg.setColor(COLOR_ACCENT);
        btnBg.setCornerRadius(dp(10));
        btnLogin.setBackground(btnBg);
        btnLogin.setPadding(dp(16), dp(10), dp(16), dp(10));
        card.addView(btnLogin, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // ── 登录点击逻辑 ────────────────────────────────────────────────────
        btnLogin.setOnClickListener(v -> {
            String user = etUser.getText().toString().trim();
            String pass = etPass.getText().toString();
            if (user.isEmpty() || pass.isEmpty()) {
                tvError.setText("账号和密码不能为空");
                tvError.setVisibility(View.VISIBLE);
                return;
            }
            tvError.setVisibility(View.GONE);
            btnLogin.setEnabled(false);
            btnLogin.setText("验证中…");

            String capUrl = (serverCapWorkerUrl != null && !serverCapWorkerUrl.isEmpty())
                    ? serverCapWorkerUrl : CloudEndpoint.CAP_WORKER_URL;
            // cap-worker 地址缺失（服务端未下发且 CI 未注入）时直接报错，
            // 避免 CapWorkerSolver 用空 URL 静默挂起、按钮卡在"验证中…"。
            if (capUrl == null || capUrl.isEmpty()) {
                tvError.setText("人机验证服务未配置，无法登录");
                tvError.setVisibility(View.VISIBLE);
                btnLogin.setEnabled(true);
                btnLogin.setText("登录");
                return;
            }
            CapWorkerSolver.solve(this, vRoot, capUrl,
                new CapWorkerSolver.Callback() {
                    @Override public void onToken(String capToken) {
                        btnLogin.setText("登录中…");
                        new Thread(() -> {
                            try {
                                String body = "{\"username\":" + jsonEscape(user)
                                    + ",\"password\":" + jsonEscape(pass)
                                    + ",\"cap_token\":" + jsonEscape(capToken) + "}";
                                String resp = Net.postJson(
                                        CloudEndpoint.ACCOUNT_LOGIN, body, 15_000);
                                org.json.JSONObject json = new org.json.JSONObject(resp);
                                if (json.optBoolean("success", false)) {
                                    String accountId    = json.optString("account_id", "");
                                    String token        = json.optString("token", "");
                                    boolean rememberNow = cbRememberLogin.isChecked();
                                    // token / account_id 本会话的存档同步、悬浮窗都要用，
                                    // 因此总是写入；remember 标志决定它是否能跨启动复用
                                    // （showLoginDialog 在 remember=false 时会清掉）。
                                    SharedPreferences.Editor ed =
                                            getSharedPreferences(PREFS_ACCOUNT, MODE_PRIVATE).edit()
                                            .putString(KEY_ACCOUNT_ID,      accountId)
                                            .putString(KEY_ACCOUNT_TOKEN,   token)
                                            .putBoolean(KEY_REMEMBER_LOGIN, rememberNow);
                                    if (rememberNow) {
                                        ed.putString(KEY_SAVED_USERNAME, user); // 仅账号名，非密码
                                    } else {
                                        ed.remove(KEY_SAVED_USERNAME);
                                    }
                                    ed.apply();
                                    ui.post(() -> {
                                        vRoot.removeView(overlay);
                                        onSuccess.run();
                                    });
                                } else {
                                    String err = json.optString("error", "登录失败，请重试");
                                    ui.post(() -> {
                                        tvError.setText(err);
                                        tvError.setVisibility(View.VISIBLE);
                                        btnLogin.setEnabled(true);
                                        btnLogin.setText("登录");
                                    });
                                }
                            } catch (Exception e) {
                                ui.post(() -> {
                                    tvError.setText("网络错误，请检查连接后重试");
                                    tvError.setVisibility(View.VISIBLE);
                                    btnLogin.setEnabled(true);
                                    btnLogin.setText("登录");
                                });
                            }
                        }, "cnv-login").start();
                    }
                    @Override public void onError(String error) {
                        tvError.setText("人机验证失败：" + error);
                        tvError.setVisibility(View.VISIBLE);
                        btnLogin.setEnabled(true);
                        btnLogin.setText("登录");
                    }
                });
        });

        overlay.setVisibility(View.VISIBLE);
    }

    private android.widget.CheckBox buildCheckBox(String label, boolean checked) {
        android.widget.CheckBox cb = new android.widget.CheckBox(this);
        cb.setText(label);
        cb.setChecked(checked);
        cb.setTextColor(COLOR_TEXT);
        cb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        return cb;
    }

    private EditText buildFormEditText(boolean isPassword, String hint) {
        EditText et = new EditText(this);
        et.setHint(hint);
        et.setHintTextColor(COLOR_SUB);
        et.setTextColor(COLOR_TEXT);
        et.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(darkMode ? 0x22FFFFFF : 0x11000000);
        bg.setCornerRadius(dp(8));
        bg.setStroke(dp(1), COLOR_CARD_STK);
        et.setBackground(bg);
        et.setPadding(dp(12), dp(10), dp(12), dp(10));
        et.setInputType(isPassword
                ? InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD
                : InputType.TYPE_CLASS_TEXT);
        et.setImeOptions(isPassword ? EditorInfo.IME_ACTION_DONE : EditorInfo.IME_ACTION_NEXT);
        return et;
    }

    private LinearLayout.LayoutParams formInputLp(int bottomMargin) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = bottomMargin;
        return lp;
    }

    private TextView buildLinkText(String text) {
        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setTextColor(COLOR_ACCENT);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        tv.setPaintFlags(tv.getPaintFlags() | android.graphics.Paint.UNDERLINE_TEXT_FLAG);
        return tv;
    }

    private void openUrlInBrowser(String url) {
        try { startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url))); }
        catch (Exception ignored) {}
    }

    private static String jsonEscape(String s) {
        return "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"") + "\"";
    }

    private void launchGame() {
        if (launched) return;
        launched = true;
        log("启动", "INFO", "准备启动游戏：停止 BGM，跳转至 " + GAME_ACTIVITY);
        // 记录本次游戏启动时间（用于下次启动时检测是否发生了崩溃循环）
        getSharedPreferences("cnv_launch_state", 0).edit()
                .putLong("last_launch_ms", System.currentTimeMillis())
                .apply();
        // 停掉 BGM，让原版游戏自己的音频栈接管；必须在 startActivity 之前停
        stopBgm();
        stopSfx();
        try {
            Intent it = new Intent();
            it.setClassName(getPackageName(), GAME_ACTIVITY);
            it.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            Intent orig = getIntent();
            if (orig != null && orig.getData() != null) {
                // C-M1: 只转发白名单 scheme 的 deep-link，拒绝 http/file/content 等
                String scheme = orig.getData().getScheme();
                if ("magireco.com".equals(scheme) || "magireco.reward".equals(scheme)) {
                    it.setData(orig.getData());
                } else if (scheme != null) {
                    log("启动", "WARN", "拒绝非白名单 deep-link scheme: " + scheme);
                }
            }
            startActivity(it);
            log("启动", "INFO", "游戏 Activity 已启动，BootstrapActivity 退出");
            finish();
            overridePendingTransition(0, 0);
        } catch (Throwable t) {
            log("启动", "ERROR", "启动游戏失败：" + t.getClass().getSimpleName()
                    + (t.getMessage() != null ? "：" + t.getMessage() : ""));
            showFatal(t);
        }
    }

    // ======================================================================
    // 存档同步（登录后、进游戏前）
    // ======================================================================

    /**
     * 登录成功后的入口：先申请悬浮窗权限（若未授权），然后做云端存档对比。
     * 在主线程调用。
     */
    private void checkSavesBeforeLaunch() {
        if (Build.VERSION.SDK_INT >= 23 && !Settings.canDrawOverlays(this)) {
            pendingAfterPermission = this::doSaveCheck;
            try {
                Intent it = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                        Uri.parse("package:" + getPackageName()));
                startActivityForResult(it, REQ_OVERLAY_PERMISSION);
            } catch (Throwable t) {
                // 如果无法打开权限页，直接继续
                pendingAfterPermission = null;
                doSaveCheck();
            }
        } else {
            doSaveCheck();
        }
    }

    /**
     * 在后台线程拉取云端存档，与本地对比，按结果展示对话框或直接启动游戏。
     * 可在主线程或子线程调用（内部会新开线程处理网络操作）。
     */
    private void doSaveCheck() {
        SharedPreferences prefs = getSharedPreferences(PREFS_ACCOUNT, MODE_PRIVATE);
        String accountId    = prefs.getString(KEY_ACCOUNT_ID,    null);
        String accountToken = prefs.getString(KEY_ACCOUNT_TOKEN, null);
        if (accountId == null || accountToken == null) {
            ui.post(this::launchWithOverlay);
            return;
        }
        final String fAccountId    = accountId;
        final String fAccountToken = accountToken;
        new Thread(() -> {
            SaveSyncHelper.SaveData local;
            SaveSyncHelper.SaveData cloud;
            try {
                local = SaveSyncHelper.loadLocal(getApplicationContext(), fAccountId);
                cloud = SaveSyncHelper.fetchCloud(getApplicationContext(), fAccountToken);
            } catch (Exception e) {
                android.util.Log.w(TAG, "存档拉取失败，跳过同步：" + e.getMessage());
                ui.post(this::launchWithOverlay);
                return;
            }
            SaveSyncHelper.SyncState state = SaveSyncHelper.compare(local, cloud);
            switch (state) {
                case IN_SYNC:
                case LOCAL_ONLY:
                    ui.post(this::launchWithOverlay);
                    break;
                case CLOUD_ONLY:
                    ui.post(() -> showDownloadConfirmDialog(cloud.json, fAccountId));
                    break;
                case CONFLICT:
                    ui.post(() -> showSaveConflictDialog(
                            local.json, cloud.json, fAccountId, fAccountToken));
                    break;
            }
        }, "cnv-save-check").start();
    }

    /**
     * 下载确认框：本地无存档、云端有存档时展示。
     * 用户选择"下载"时将云端存档写入本地 SQLite，再启动游戏；选"跳过"直接启动。
     */
    private void showDownloadConfirmDialog(String cloudJson, String accountId) {
        View[] frame = inflateDialogFrame();
        FrameLayout overlay = (FrameLayout) frame[0];
        LinearLayout card   = (LinearLayout) frame[1];
        addDialogTitle(card, "下载云端存档");
        addDialogMessage(card,
                "检测到云端有存档，而本地尚无存档记录。\n\n是否将云端存档下载到本机？");
        LinearLayout row = addDialogButtonRow(card);
        Button skipBtn     = addDialogButton(row, "跳过", false);
        Button downloadBtn = addDialogButton(row, "下载", true);
        skipBtn.setOnClickListener(v -> {
            overlay.setVisibility(View.GONE);
            vRoot.removeView(overlay);
            launchWithOverlay();
        });
        downloadBtn.setOnClickListener(v -> {
            overlay.setVisibility(View.GONE);
            vRoot.removeView(overlay);
            new Thread(() -> {
                try {
                    SaveSyncHelper.applyCloud(getApplicationContext(), accountId, cloudJson);
                } catch (Exception e) {
                    android.util.Log.e(TAG, "应用云端存档失败：" + e.getMessage());
                }
                ui.post(this::launchWithOverlay);
            }, "cnv-apply-cloud").start();
        });
        overlay.setVisibility(View.VISIBLE);
    }

    /**
     * 冲突解决框：本地与云端存档均有内容但不一致时展示。
     * 用户选择"保留本地"时将本地存档上传覆盖云端；选"使用云端"时将云端存档写入本地。
     */
    private void showSaveConflictDialog(String localJson, String cloudJson,
                                        String accountId, String accountToken) {
        View[] frame = inflateDialogFrame();
        FrameLayout overlay = (FrameLayout) frame[0];
        LinearLayout card   = (LinearLayout) frame[1];
        addDialogTitle(card, "存档冲突");
        addDialogMessage(card,
                "检测到本机存档与云端存档不一致，请选择要保留的版本：\n\n"
              + "• 保留本地：保留本机存档，并将其上传覆盖云端\n"
              + "• 使用云端：下载云端存档覆盖本机记录");
        LinearLayout row  = addDialogButtonRow(card);
        Button localBtn   = addDialogButton(row, "保留本地", false);
        Button cloudBtn   = addDialogButton(row, "使用云端", true);
        localBtn.setOnClickListener(v -> {
            overlay.setVisibility(View.GONE);
            vRoot.removeView(overlay);
            new Thread(() -> {
                try {
                    SaveSyncHelper.upload(getApplicationContext(), accountId, accountToken);
                } catch (Exception e) {
                    android.util.Log.e(TAG, "上传本地存档失败：" + e.getMessage());
                }
                ui.post(this::launchWithOverlay);
            }, "cnv-upload-local").start();
        });
        cloudBtn.setOnClickListener(v -> {
            overlay.setVisibility(View.GONE);
            vRoot.removeView(overlay);
            new Thread(() -> {
                try {
                    SaveSyncHelper.applyCloud(getApplicationContext(), accountId, cloudJson);
                } catch (Exception e) {
                    android.util.Log.e(TAG, "应用云端存档失败：" + e.getMessage());
                }
                ui.post(this::launchWithOverlay);
            }, "cnv-apply-cloud").start();
        });
        overlay.setVisibility(View.VISIBLE);
    }

    /**
     * 启动悬浮存档服务（若已获得悬浮窗权限），然后启动游戏。
     * 在主线程调用。
     */
    /**
     * 服务器不可达、资源已就绪时弹出选择框，返回用户决定。
     * 在工作线程调用，阻塞直到用户点击按钮。
     * 返回值：{@link #OFFLINE_CHOICE_RETRY}、{@link #OFFLINE_CHOICE_OFFLINE}
     *         或 {@link #OFFLINE_CHOICE_EXIT}。
     */
    private int askOfflineModeChoice() {
        final Object lock    = new Object();
        final int[]  result  = { OFFLINE_CHOICE_EXIT };
        final boolean[] done = { false };
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "服务器不可达");
            addDialogMessage(card,
                    "已连续尝试 3 次，均无法联系服务器。\n\n"
                  + "游戏资源已就绪，可以进入离线模式直连私服后端运行游戏，"
                  + "但账号登录和存档同步将不可用。");
            LinearLayout row = addDialogButtonRow(card);
            Button exitBtn    = addDialogButton(row, "退出",     false);
            Button retryBtn   = addDialogButton(row, "重试",     false);
            Button offlineBtn = addDialogButton(row, "离线模式", true);
            exitBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = OFFLINE_CHOICE_EXIT; done[0] = true; lock.notifyAll(); }
            });
            retryBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = OFFLINE_CHOICE_RETRY; done[0] = true; lock.notifyAll(); }
            });
            offlineBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = OFFLINE_CHOICE_OFFLINE; done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    return OFFLINE_CHOICE_EXIT;
                }
            }
            return result[0];
        }
    }

    /**
     * 等待并处理完整性校验结果。
     * @return true 继续启动；false 已弹 fatal / 重置标志，调用方应 return
     */
    private boolean handleIntegrityResult() {
        ResourceIntegrityChecker.Result result;
        try {
            result = integrityFuture.get(5_000, java.util.concurrent.TimeUnit.MILLISECONDS);
        } catch (java.util.concurrent.TimeoutException e) {
            log("校验", "WARN", "完整性校验超时（5s），跳过本次校验");
            integrityFuture.cancel(true);
            return true;
        } catch (Throwable e) {
            log("校验", "WARN", "获取校验结果失败：" + e.getMessage() + "，跳过");
            return true;
        }
        if (result.passed) {
            log("校验", "INFO", "资源完整性校验通过");
            return true;
        }
        log("校验", "WARN", "完整性校验未通过，疑似异常文件数=" + result.tampered.size());
        return askIntegrityWarning(result.isCheckError, result.tampered);
    }

    /**
     * 展示完整性警告对话框。
     * @return true 用户选择忽略继续；false 用户选择重新下载（已清除 ready flag，调用方 return）
     */
    private boolean askIntegrityWarning(boolean isCheckError, java.util.List<String> tampered) {
        final Object  lock   = new Object();
        final boolean[] cont = { false };
        final boolean[] done = { false };

        String title, message;
        if (isCheckError) {
            title = "资源校验程序异常";
            message = "完整性校验程序连续失败，无法完成验证。\n\n"
                    + "是否继续启动（可能存在风险）？";
        } else {
            StringBuilder sb = new StringBuilder("检测到以下脚本文件可能被篡改：\n\n");
            int show = Math.min(tampered.size(), 8);
            for (int i = 0; i < show; i++) sb.append("• ").append(tampered.get(i)).append('\n');
            if (tampered.size() > show) sb.append("… 等共 ").append(tampered.size()).append(" 个文件\n");
            sb.append("\n重新下载资源以修复；或忽略并继续（可能导致游戏异常）。");
            title   = "资源完整性验证失败";
            message = sb.toString();
        }

        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, title);
            addDialogMessage(card, message);
            LinearLayout row     = addDialogButtonRow(card);
            Button continueBtn   = addDialogButton(row, "忽略并继续", false);
            Button redownloadBtn = addDialogButton(row, "重新下载",   true);
            continueBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { cont[0] = true; done[0] = true; lock.notifyAll(); }
            });
            redownloadBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { cont[0] = false; done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
        });

        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); }
                catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    return true; // interrupted → continue
                }
            }
        }
        if (cont[0]) return true;
        // 用户选择重新下载：清除 ready flag，让用户重启触发下载
        deleteReadyFlag();
        showFatalAndExit("资源已重置",
                "资源就绪标记已清除。\n\n请重新启动应用以重新下载游戏资源。");
        return false;
    }

    /**
     * 服务器不可达时的离线模式入口：跳过热更新、账号登录、存档同步，
     * 直连 Totentanz 后端启动游戏，并显示离线状态悬浮标签。
     * 在工作线程调用。
     */
    private void enterOfflineMode() {
        ProxyBackends.set(java.util.Collections.emptyList());
        ProxyBackends.setGameServerHost("totentanz-9b.magica-us.com");
        log("离线", "INFO", "代理已清空，直连后端：totentanz-9b.magica-us.com");
        ui.post(() -> {
            if (Build.VERSION.SDK_INT >= 23 && !Settings.canDrawOverlays(this)) {
                pendingAfterPermission = this::launchGameWithOfflineOverlay;
                try {
                    startActivityForResult(
                            new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                                    android.net.Uri.parse("package:" + getPackageName())),
                            REQ_OVERLAY_PERMISSION);
                } catch (Throwable t) {
                    pendingAfterPermission = null;
                    launchGameWithOfflineOverlay();
                }
            } else {
                launchGameWithOfflineOverlay();
            }
        });
    }

    private void launchGameWithOfflineOverlay() {
        if (Build.VERSION.SDK_INT < 23 || Settings.canDrawOverlays(this)) {
            try {
                startService(new Intent(this, OfflineStatusOverlayService.class));
            } catch (Throwable t) {
                android.util.Log.w(TAG, "离线标签服务启动失败：" + t.getMessage());
            }
        }
        launchGame();
    }

    private void launchWithOverlay() {
        if (Build.VERSION.SDK_INT < 23 || Settings.canDrawOverlays(this)) {
            try {
                startService(new Intent(this, SaveOverlayService.class));
            } catch (Throwable t) {
                android.util.Log.w(TAG, "悬浮窗服务启动失败：" + t.getMessage());
            }
        }
        launchGame();
    }

    // ======================================================================
    // 自定义样式对话框
    // ======================================================================

    /**
     * 构建一个与应用色调匹配的自定义对话框根视图，插入到 vRoot（全屏遮罩）。
     * 返回值[0] = 遮罩 FrameLayout（添加到 vRoot 后需自行 VISIBLE/GONE）。
     * 返回值[1] = 内容 LinearLayout（向其中添加标题 / 正文 / 按钮）。
     */
    private View[] inflateDialogFrame() {
        FrameLayout overlay = new FrameLayout(this);
        overlay.setBackgroundColor(COLOR_DIM);
        overlay.setVisibility(View.GONE);

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(20), dp(20), dp(20), dp(16));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(COLOR_LOG_PANEL_BG);
        cardBg.setCornerRadius(dp(18));
        cardBg.setStroke(dp(1), COLOR_CARD_STK);
        card.setBackground(cardBg);

        FrameLayout.LayoutParams cardLp = new FrameLayout.LayoutParams(
                (int) (getResources().getDisplayMetrics().widthPixels * 0.85f),
                ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.gravity = Gravity.CENTER;
        overlay.addView(card, cardLp);

        vRoot.addView(overlay, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        return new View[] { overlay, card };
    }

    /** 添加对话框标题行。 */
    private TextView addDialogTitle(LinearLayout card, String title) {
        TextView tv = new TextView(this);
        tv.setText(title);
        tv.setTextColor(COLOR_ACCENT);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        tv.setTypeface(null, android.graphics.Typeface.BOLD);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(10);
        card.addView(tv, lp);
        return tv;
    }

    /** 添加对话框正文区（支持多行）。 */
    private TextView addDialogMessage(LinearLayout card, String message) {
        TextView tv = new TextView(this);
        tv.setText(message);
        tv.setTextColor(COLOR_LOG_PANEL_TEXT);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(16);
        card.addView(tv, lp);
        return tv;
    }

    /** 添加对话框底部按钮行容器。 */
    private LinearLayout addDialogButtonRow(LinearLayout card) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.END);
        card.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    /**
     * 在按钮行中添加一个按钮。
     * @param primary true = 强调色填充；false = 半透明灰色
     */
    private Button addDialogButton(LinearLayout row, String label, boolean primary) {
        Button btn = new Button(this);
        btn.setText(label);
        btn.setAllCaps(false);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        GradientDrawable bg = new GradientDrawable();
        if (primary) {
            bg.setColor(COLOR_ACCENT);
            btn.setTextColor(0xFFFFFFFF);
        } else {
            bg.setColor(darkMode ? 0x33FFFFFF : 0x22000000);
            btn.setTextColor(COLOR_TEXT);
        }
        bg.setCornerRadius(dp(10));
        btn.setBackground(bg);
        btn.setPadding(dp(16), dp(8), dp(16), dp(8));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = dp(8);
        row.addView(btn, lp);
        return btn;
    }

    /** 非阻塞错误弹窗：重试 = recreate；供工作线程通过 ui.post 调用。 */
    private void showFatalWithRetry(String title, String message) {
        if (isFinishing()) return;
        final Runnable[] showRef = new Runnable[1];
        showRef[0] = () -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, title);
            addDialogMessage(card, message);
            LinearLayout row = addDialogButtonRow(card);
            Button logBtn   = addDialogButton(row, "查看日志", false);
            Button retryBtn = addDialogButton(row, "重试",     true);
            logBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                fatalRetrigger = showRef[0];
                openLogModal();
            });
            retryBtn.setOnClickListener(v -> { overlay.setVisibility(View.GONE); recreate(); });
            overlay.setVisibility(View.VISIBLE);
        };
        showRef[0].run();
    }

    private void showFatal(Throwable t) {
        showFatalWithRetry("资源准备失败",
                "无法继续启动游戏：" + t.getMessage()
                + "\n\n请检查网络后重试，或尝试切换为离线包注入方式。");
    }

    /**
     * 阻塞型崩溃恢复对话框：询问用户是否重新注入资源（true）或直接进入游戏（false）。
     * 在工作线程调用。
     */
    private boolean askCrashRecovery() {
        final Object    lock   = new Object();
        final boolean[] result = { false };
        final boolean[] done   = { false };
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "检测到游戏启动异常");
            addDialogMessage(card,
                    "上次游戏在启动后很短时间内退出，可能发生了崩溃。\n\n"
                  + "• 重新注入资源：清除现有资源并重新选择资源包（推荐）\n"
                  + "• 继续启动：忽略此提示，直接启动游戏");
            LinearLayout row    = addDialogButtonRow(card);
            Button logBtn       = addDialogButton(row, "查看日志",   false);
            Button continueBtn  = addDialogButton(row, "继续启动",   false);
            Button reinjectBtn  = addDialogButton(row, "重新注入资源", true);
            logBtn.setOnClickListener(v -> { overlay.setVisibility(View.GONE); openLogModal(); });
            continueBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = false; done[0] = true; lock.notifyAll(); }
            });
            reinjectBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = true; done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return false;
                }
            }
            return result[0];
        }
    }

    /** 删除资源就绪标志文件（以及旧版 flag）以触发重新注入流程。 */
    private void deleteReadyFlag() {
        try {
            new java.io.File(new java.io.File(getFilesDir(), "cnv_inject"),
                    "cn_resources_ready.flag").delete();
        } catch (Throwable ignore) {}
        try {
            new java.io.File(new java.io.File(
                    new java.io.File(getFilesDir(), "madomagi"), "magica"),
                    "cn_base_done.flag").delete();
        } catch (Throwable ignore) {}
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
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "请选择资源下载方式");

            String[] opts = { "在线下载", "离线包注入" };
            for (int i = 0; i < opts.length; i++) {
                final String mode = i == 0 ? ResourceFlow.MODE_ONLINE : ResourceFlow.MODE_OFFLINE;
                Button btn = new Button(this);
                btn.setText(opts[i]);
                btn.setAllCaps(false);
                btn.setTextColor(0xFFFFFFFF);
                btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                GradientDrawable bg = new GradientDrawable();
                bg.setColor(COLOR_ACCENT);
                bg.setCornerRadius(dp(10));
                btn.setBackground(bg);
                btn.setPadding(dp(16), dp(10), dp(16), dp(10));
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                lp.bottomMargin = dp(8);
                card.addView(btn, lp);
                btn.setOnClickListener(v -> {
                    overlay.setVisibility(View.GONE);
                    vRoot.removeView(overlay);
                    synchronized (modeLock) {
                        modeChoice.set(mode);
                        modeLock.notifyAll();
                    }
                });
            }
            overlay.setVisibility(View.VISIBLE);
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
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "同时下载文件数");

            android.widget.RadioGroup rg = new android.widget.RadioGroup(this);
            rg.setOrientation(android.widget.RadioGroup.VERTICAL);
            for (int i = 0; i < options.length; i++) {
                android.widget.RadioButton rb = new android.widget.RadioButton(this);
                rb.setText(options[i] + " 个" + (options[i] == recommended ? "  （推荐）" : ""));
                rb.setTextColor(COLOR_LOG_PANEL_TEXT);
                rb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                rb.setId(i);
                if (i == finalDefaultIdx) rb.setChecked(true);
                rg.addView(rb, new android.widget.RadioGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            rg.setOnCheckedChangeListener((g, id) -> selected[0] = id);
            LinearLayout.LayoutParams rgLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            rgLp.bottomMargin = dp(16);
            card.addView(rg, rgLp);

            LinearLayout row = addDialogButtonRow(card);
            Button okBtn = addDialogButton(row, "开始下载", true);
            okBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) {
                    int idx = Math.max(0, Math.min(selected[0], options.length - 1));
                    result[0] = options[idx];
                    lock.notifyAll();
                }
            });
            overlay.setVisibility(View.VISIBLE);
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
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "请选择下载线路");

            android.widget.RadioGroup rg = new android.widget.RadioGroup(this);
            rg.setOrientation(android.widget.RadioGroup.VERTICAL);
            for (int i = 0; i < keys.length; i++) {
                android.widget.RadioButton rb = new android.widget.RadioButton(this);
                java.util.List<String> templates = lines.get(keys[i]);
                int n = templates != null ? templates.size() : 0;
                rb.setText(keys[i] + (n > 0 ? "  (" + n + " 个镜像)" : ""));
                rb.setTextColor(COLOR_LOG_PANEL_TEXT);
                rb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                rb.setId(i);
                if (i == 0) rb.setChecked(true);
                final int idx = i;
                rg.addView(rb, new android.widget.RadioGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            rg.setOnCheckedChangeListener((g, id) -> selected[0] = keys[id]);
            LinearLayout.LayoutParams rgLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            rgLp.bottomMargin = dp(16);
            card.addView(rg, rgLp);

            LinearLayout row = addDialogButtonRow(card);
            Button okBtn = addDialogButton(row, "使用此线路", true);
            okBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { result[0] = selected[0]; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
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
        } else if (requestCode == REQ_OVERLAY_PERMISSION) {
            // 不依赖 resultCode（系统总返回 RESULT_CANCELED），直接检查权限并继续
            Runnable r = pendingAfterPermission;
            pendingAfterPermission = null;
            if (r != null) r.run();
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
            if (slotList.isEmpty() || slot < 0 || slot >= slotList.size()) return;
            SlotViews sv = slotList.get(slot);
            if (fileName != null) {
                // 仅显示文件名最后一段（去掉路径前缀）
                int slash = fileName.lastIndexOf('/');
                String shortName = (slash >= 0 && slash < fileName.length() - 1)
                        ? fileName.substring(slash + 1) : fileName;
                sv.nameView.setText(shortName.isEmpty() ? fileName : shortName);
            }
            int pct = total > 0 ? (int) Math.min(1000L, soFar * 1000L / total) : 0;
            sv.bar.setProgress(pct);
            sv.speedView.setText(instantBps > 0 ? formatSpeed(instantBps) : "");
        });
    }

    @Override
    public void clearSlot(final int slot) {
        setSlotPhase(slot, "done");
    }

    @Override
    public void setSlotPhase(final int slot, final String phase) {
        ui.post(() -> {
            if (slotList.isEmpty() || slot < 0 || slot >= slotList.size()) return;
            SlotViews sv = slotList.get(slot);
            sv.phase = phase;
            int color;
            switch (phase) {
                case "downloading": color = COLOR_ACCENT;  break;
                case "extracting":  color = 0xFF4FC3F7;    break;  // 蓝
                case "done":        color = 0xFF66BB6A;    break;  // 绿
                case "failed":      color = 0xFFE53935;    break;  // 红
                default:            color = 0x55888888;    break;  // 灰（pending）
            }
            if (Build.VERSION.SDK_INT >= 21) {
                sv.bar.setProgressTintList(
                        android.content.res.ColorStateList.valueOf(color));
            }
            if ("done".equals(phase)) {
                sv.bar.setProgress(1000);
                sv.speedView.setText("✓");
                sv.speedView.setTextColor(0xFF66BB6A);
            } else if ("failed".equals(phase)) {
                sv.speedView.setText("✗");
                sv.speedView.setTextColor(0xFFE53935);
            } else {
                sv.speedView.setTextColor(COLOR_SUB);
            }
        });
    }

    @Override
    public void setAggregate(final int completed, final int total,
                             final long instantBpsTotal) {
        ui.post(() -> {
            StringBuilder sb = new StringBuilder();
            if (total > 0) sb.append(completed).append(" / ").append(total).append(" 文件");
            vAggregate.setText(sb.toString());
            if (vTotalSpeed != null) {
                vTotalSpeed.setText(instantBpsTotal > 0 ? formatSpeed(instantBpsTotal) : "");
            }
        });
    }

    @Override
    public void setOverallProgress(final long soFar, final long total) {
        ui.post(() -> {
            int pct = total > 0 ? (int) Math.min(1000L, soFar * 1000L / total) : 0;
            pbOverall.setProgress(pct);
            String progressText = "总进度";
            if (total > 0) {
                progressText += "  " + formatBytes(soFar) + " / " + formatBytes(total);
            }
            vOverallText.setText(progressText);
        });
    }

    @Override
    public boolean isCancelled() { return cancelled; }

    /** Reporter 接口实现：无组件标签，委托给带组件版本。 */
    @Override
    public void log(final String type, final String msg) {
        log("应用", type, msg);
    }

    /** 核心日志方法。格式：［yyyy-MM-dd HH:mm:ss］[组件][级别] 内容 */
    public void log(final String component, final String type, final String msg) {
        String lvl  = type      == null ? "INFO" : type;
        String comp = component == null ? "应用" : component;
        String adbMsg = "[" + comp + "] " + msg;
        switch (lvl) {
            case "WARN":  android.util.Log.w(TAG, adbMsg); break;
            case "ERROR":
            case "FATAL": android.util.Log.e(TAG, adbMsg); break;
            default:      android.util.Log.i(TAG, adbMsg);
        }
        writeToBuffer(comp, lvl, msg);
    }

    /** 直接写入日志缓冲区（不再调用 android.util.Log，供 logcat 捕获器使用）。 */
    private void writeToBuffer(String comp, String lvl, String msg) {
        final String ts;
        synchronized (LOG_TS) {
            ts = "［" + LOG_TS.format(new java.util.Date()) + "］[" + comp + "][" + lvl + "] " + msg;
        }
        synchronized (logBuffer) {
            logBuffer.addLast(ts);
            while (logBuffer.size() > LOG_BUFFER_MAX) logBuffer.removeFirst();
        }
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
        ui.post(() -> {
            if (logModal != null && logModal.getVisibility() == View.VISIBLE) {
                boolean atBottom = isAtLogBottom();
                renderLogModal();
                if (atBottom) vLogScroll.post(() -> vLogScroll.fullScroll(View.FOCUS_DOWN));
            }
        });
    }

    @Override
    public void showInfoDialog(final String title, final String message) {
        final Object   lock = new Object();
        final boolean[] done = { false };
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, title);
            addDialogMessage(card, message);
            LinearLayout row = addDialogButtonRow(card);
            Button okBtn = addDialogButton(row, "确定", true);
            okBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
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
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, title);
            addDialogMessage(card, message);
            LinearLayout row = addDialogButtonRow(card);
            Button jumpBtn = addDialogButton(row, jumpLabel, false);
            Button okBtn   = addDialogButton(row, "确定", true);
            jumpBtn.setOnClickListener(v -> {
                try {
                    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(jumpUrl))
                            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                } catch (Throwable t) {
                    Toast.makeText(BootstrapActivity.this,
                            "无法打开浏览器：" + t.getMessage(), Toast.LENGTH_LONG).show();
                }
            });
            okBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
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
    public void showFatalAndExit(final String title, final String message) {
        final Object    lock      = new Object();
        final boolean[] done      = { false };
        final boolean[] doRetry   = { false };
        final Runnable[] showRef  = new Runnable[1];
        showRef[0] = () -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, title);
            addDialogMessage(card, message);
            LinearLayout row  = addDialogButtonRow(card);
            Button logBtn     = addDialogButton(row, "查看日志", false);
            Button retryBtn   = addDialogButton(row, "重试",     false);
            Button exitBtn    = addDialogButton(row, "退出",     true);
            logBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                fatalRetrigger = showRef[0];
                openLogModal();
            });
            retryBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { doRetry[0] = true; done[0] = true; lock.notifyAll(); }
            });
            exitBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
        };
        ui.post(showRef[0]);
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return;
                }
            }
        }
        if (doRetry[0]) {
            ui.post(this::recreate);
            return;  // 工作线程退出；Activity 将被重建
        }
        ui.post(() -> {
            try { finishAndRemoveTask(); } catch (Throwable ignore) {}
            android.os.Process.killProcess(android.os.Process.myPid());
        });
    }

    /** 带"跳转"按钮的 FATAL 对话框（仅内部使用，不进 Reporter 接口）。 */
    private void showFatalAndExitWithJump(final String title, final String message,
                                          final String jumpLabel, final String jumpUrl) {
        final Object    lock    = new Object();
        final boolean[] done    = { false };
        final boolean[] doRetry = { false };
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, title);
            addDialogMessage(card, message);
            LinearLayout row  = addDialogButtonRow(card);
            Button jumpBtn  = addDialogButton(row, jumpLabel, false);
            Button retryBtn = addDialogButton(row, "重试",    false);
            Button exitBtn  = addDialogButton(row, "退出",    true);
            jumpBtn.setOnClickListener(v -> {
                try {
                    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(jumpUrl))
                            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                } catch (Throwable t) {
                    Toast.makeText(BootstrapActivity.this,
                            "无法打开浏览器：" + t.getMessage(), Toast.LENGTH_LONG).show();
                }
            });
            retryBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { doRetry[0] = true; done[0] = true; lock.notifyAll(); }
            });
            exitBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                synchronized (lock) { done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return;
                }
            }
        }
        if (doRetry[0]) { ui.post(this::recreate); return; }
        ui.post(() -> {
            try { finishAndRemoveTask(); } catch (Throwable ignore) {}
            android.os.Process.killProcess(android.os.Process.myPid());
        });
    }

    @Override
    public boolean requestOfflineSourceDialog(final String cloudUrl, final String cloudVersion) {
        final Object   lock   = new Object();
        final boolean[] result = { false };
        final boolean[] done   = { false };
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "获取离线资源包");

            StringBuilder msg = new StringBuilder("请选择获取离线资源包的方式：\n\n"
                    + "• 选择文件：直接从本机选取已有的官方离线 zip 包\n"
                    + "• 云端下载：打开浏览器下载后返回此界面再选择文件");
            if (cloudVersion != null && !cloudVersion.isEmpty()) {
                msg.append("\n\n当前云端版本：").append(cloudVersion);
            }
            if (cloudUrl == null) {
                msg.append("\n\n（暂时无法获取云端下载地址，请使用本地文件）");
            }
            addDialogMessage(card, msg.toString());

            LinearLayout row = addDialogButtonRow(card);

            Button cancelBtn = addDialogButton(row, "取消", false);
            cancelBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                log("离线包", "INFO", "用户取消了离线包来源选择");
                synchronized (lock) { result[0] = false; done[0] = true; lock.notifyAll(); }
            });

            if (cloudUrl != null && !cloudUrl.isEmpty()) {
                Button cloudBtn = addDialogButton(row, "云端下载", false);
                cloudBtn.setOnClickListener(v -> {
                    overlay.setVisibility(View.GONE);
                    vRoot.removeView(overlay);
                    try {
                        startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(cloudUrl))
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                        log("离线包", "INFO", "已打开浏览器下载离线包");
                    } catch (Throwable t) {
                        Toast.makeText(BootstrapActivity.this,
                                "无法打开浏览器：" + t.getMessage(), Toast.LENGTH_SHORT).show();
                        log("离线包", "WARN", "打开浏览器失败：" + t.getMessage());
                    }
                    Toast.makeText(BootstrapActivity.this,
                            "下载完成后请返回此界面，点击【选择文件】选取已下载的 zip 包",
                            Toast.LENGTH_LONG).show();
                    synchronized (lock) { result[0] = true; done[0] = true; lock.notifyAll(); }
                });
            }

            Button localBtn = addDialogButton(row, "选择文件", true);
            localBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                log("离线包", "INFO", "用户选择本地文件注入");
                synchronized (lock) { result[0] = true; done[0] = true; lock.notifyAll(); }
            });

            overlay.setVisibility(View.VISIBLE);
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return false;
                }
            }
            return result[0];
        }
    }

    @Override
    public boolean confirmSha256Mismatch(final String expected, final String actual) {
        final Object   lock   = new Object();
        final boolean[] result = { false };
        final boolean[] done   = { false };
        ui.post(() -> {
            View[] frame = inflateDialogFrame();
            FrameLayout overlay = (FrameLayout) frame[0];
            LinearLayout card   = (LinearLayout) frame[1];
            addDialogTitle(card, "SHA-256 校验不通过");
            addDialogMessage(card,
                    "所选文件的 SHA-256 哈希与服务端记录不符，可能文件已损坏或来源有误。\n\n"
                  + "期望：" + (expected != null ? expected : "（未知）") + "\n"
                  + "实际：" + (actual   != null ? actual   : "（计算失败）") + "\n\n"
                  + "强行继续可能导致游戏无法正常运行。");
            LinearLayout row  = addDialogButtonRow(card);
            Button cancelBtn  = addDialogButton(row, "取消",     true);
            Button forceBtn   = addDialogButton(row, "强行继续", false);
            cancelBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                log("离线包", "INFO", "用户取消：SHA-256 校验不通过");
                synchronized (lock) { result[0] = false; done[0] = true; lock.notifyAll(); }
            });
            forceBtn.setOnClickListener(v -> {
                overlay.setVisibility(View.GONE);
                vRoot.removeView(overlay);
                log("离线包", "WARN", "用户强行继续：忽略 SHA-256 校验不通过");
                synchronized (lock) { result[0] = true; done[0] = true; lock.notifyAll(); }
            });
            overlay.setVisibility(View.VISIBLE);
        });
        synchronized (lock) {
            while (!done[0]) {
                try { lock.wait(500); } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt(); return false;
                }
            }
            return result[0];
        }
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
