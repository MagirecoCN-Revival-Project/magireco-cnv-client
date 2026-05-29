package io.kamihama.cnv;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * 悬浮存档窗口 + 游戏阶段心跳服务。
 *
 * <p>游戏启动后以 Foreground Service 运行：
 * <ul>
 *   <li>通过 WindowManager 在屏幕上显示可拖动圆形按钮（粉红进度环，600 秒自动存档）。</li>
 *   <li>每 5 秒向 /client/heartbeat 发送心跳；任何时刻收到封禁或维护响应均立即处理。</li>
 * </ul>
 */
public class SaveOverlayService extends Service {

    private static final String TAG           = "CnvSaveOverlay";
    private static final String PREFS_OVERLAY = "cnv_save_overlay";
    private static final String KEY_POS_X     = "x";
    private static final String KEY_POS_Y     = "y";
    private static final long   CYCLE_MS      = 600_000L;
    private static final long   HEARTBEAT_MS  = 5_000L;

    private static final int    NOTIF_ID = 0x5356;
    private static final String CHAN_ID  = "cnv_save_overlay";

    private WindowManager  wm;
    private SaveButtonView buttonView;
    private Handler        handler;
    private long           cycleStartMs;
    /** 避免因重复心跳响应多次弹出封禁/维护覆盖层。 */
    private volatile boolean fatalShown     = false;
    /** 游戏阶段心跳是否已停止（封禁/维护触发后停止）。 */
    private volatile boolean heartbeatDone  = false;

    // ── Lifecycle ────────────────────────────────────────────────────────────

    @Override
    public void onCreate() {
        super.onCreate();
        wm      = (WindowManager) getSystemService(WINDOW_SERVICE);
        handler = new Handler(Looper.getMainLooper());
        startForegroundCompat();
        createOverlayView();
        resetCycle();
        handler.post(saveTicker);
        handler.postDelayed(heartbeatRunnable, HEARTBEAT_MS);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) { return null; }

    @Override
    public void onDestroy() {
        super.onDestroy();
        heartbeatDone = true;
        handler.removeCallbacks(saveTicker);
        handler.removeCallbacks(heartbeatRunnable);
        if (buttonView != null) {
            try { wm.removeView(buttonView); } catch (Throwable ignore) {}
            buttonView = null;
        }
    }

    @Override
    public void onTaskRemoved(Intent rootIntent) {
        stopSelf();
    }

    // ── Foreground notification ──────────────────────────────────────────────

    @SuppressWarnings({"deprecation", "NewApi"})
    private void startForegroundCompat() {
        if (Build.VERSION.SDK_INT >= 26) {
            NotificationManager nm =
                    (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
            NotificationChannel ch = new NotificationChannel(
                    CHAN_ID, "存档同步", NotificationManager.IMPORTANCE_MIN);
            ch.setShowBadge(false);
            nm.createNotificationChannel(ch);
            Notification n = new Notification.Builder(this, CHAN_ID)
                    .setContentTitle("魔法纪录 CNV")
                    .setContentText("存档同步运行中")
                    .setSmallIcon(android.R.drawable.ic_popup_sync)
                    .setOngoing(true)
                    .build();
            startForeground(NOTIF_ID, n);
        } else {
            Notification n = new Notification.Builder(this)
                    .setContentTitle("魔法纪录 CNV")
                    .setContentText("存档同步运行中")
                    .setSmallIcon(android.R.drawable.ic_popup_sync)
                    .setOngoing(true)
                    .setPriority(Notification.PRIORITY_MIN)
                    .build();
            startForeground(NOTIF_ID, n);
        }
    }

    // ── Overlay window ───────────────────────────────────────────────────────

    private void createOverlayView() {
        SharedPreferences prefs = getSharedPreferences(PREFS_OVERLAY, MODE_PRIVATE);
        int size = dp(56);
        int defaultX = getResources().getDisplayMetrics().widthPixels - size - dp(12);
        int savedX = prefs.getInt(KEY_POS_X, defaultX);
        int savedY = prefs.getInt(KEY_POS_Y, dp(100));

        buttonView = new SaveButtonView(this);

        int type = Build.VERSION.SDK_INT >= 26
                ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                : WindowManager.LayoutParams.TYPE_PHONE;
        int flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                  | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS;

        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(
                size, size, type, flags, PixelFormat.TRANSLUCENT);
        lp.gravity = Gravity.TOP | Gravity.START;
        lp.x = savedX;
        lp.y = savedY;

        buttonView.setOnTouchListener(new DragTouchListener(lp));
        try {
            wm.addView(buttonView, lp);
        } catch (Throwable t) {
            Log.e(TAG, "无法添加悬浮窗：" + t.getMessage());
        }
    }

    // ── Save timer ───────────────────────────────────────────────────────────

    private void resetCycle() {
        cycleStartMs = SystemClock.elapsedRealtime();
    }

    private final Runnable saveTicker = new Runnable() {
        @Override public void run() {
            long elapsed = SystemClock.elapsedRealtime() - cycleStartMs;
            float progress = Math.min(1f, (float) elapsed / CYCLE_MS);
            if (buttonView != null) buttonView.setProgress(progress);
            if (elapsed >= CYCLE_MS) {
                resetCycle();
                performSave(true);
            }
            handler.postDelayed(this, 100);
        }
    };

    // ── Game-phase heartbeat ─────────────────────────────────────────────────

    private final Runnable heartbeatRunnable = new Runnable() {
        @Override public void run() {
            if (heartbeatDone) return;
            sendGameHeartbeat();
            handler.postDelayed(this, HEARTBEAT_MS);
        }
    };

    /**
     * 在子线程发送一次心跳，解析响应。
     * 服务端在连接中返回封禁或维护包时立即触发覆盖层提示并终止进程，
     * 不依赖客户端刚发送心跳包——任何心跳响应均有效。
     */
    private void sendGameHeartbeat() {
        new Thread(() -> {
            try {
                JSONObject body = ClientInit.authTriple(getApplicationContext(), sessionToken());
                body.put("files", new JSONArray()); // 游戏阶段无下载文件
                String raw = Net.postJson(
                        CloudEndpoint.CLIENT_HEARTBEAT, body.toString(), 10_000);
                if (raw == null || raw.isEmpty()) return;
                handleHeartbeatResponse(new JSONObject(raw));
            } catch (Throwable t) {
                Log.w(TAG, "游戏阶段心跳失败（将在下次重试）：" + t.getMessage());
            }
        }, "cnv-game-heartbeat").start();
    }

    private void handleHeartbeatResponse(JSONObject resp) {
        String action = resp.optString("action", "ok");
        if ("ban".equals(action)) {
            if (fatalShown) return;
            fatalShown    = true;
            heartbeatDone = true;
            String reason     = resp.optString("reason", "（服务端未提供原因）");
            long   expireTime = resp.optLong("expire_time", 0L);
            BanInfo.save(getApplicationContext(), reason, expireTime);
            String msg = buildBanMsg(reason, expireTime);
            handler.post(() -> showFatalOverlay("账号已被封禁", msg));

        } else if ("maintenance".equals(action)) {
            if (fatalShown) return;
            fatalShown    = true;
            heartbeatDone = true;
            String rawMsg = resp.optString("message", "服务器正在维护，请稍后再试。");
            long end = resp.optLong("end_time", 0L);
            String endSuffix = "";
            if (end > 0L) {
                try {
                    String ts = new java.text.SimpleDateFormat(
                            "yyyy-MM-dd HH:mm", java.util.Locale.getDefault())
                            .format(new java.util.Date(end * 1000L));
                    endSuffix = "\n预计完成时间：" + ts;
                } catch (Throwable ignore) {}
            }
            final String msg = rawMsg + endSuffix;
            handler.post(() -> showFatalOverlay("服务器维护中", msg));
        }
        // action=ok / switch_mirrors → irrelevant during game phase, ignore
    }

    private String sessionToken() {
        return getSharedPreferences("cnv_account", MODE_PRIVATE)
                .getString("session_token", "");
    }

    private static String buildBanMsg(String reason, long expireTime) {
        String msg = "原因：" + reason;
        if (expireTime > 0L) {
            try {
                String ts = new java.text.SimpleDateFormat(
                        "yyyy-MM-dd HH:mm", java.util.Locale.getDefault())
                        .format(new java.util.Date(expireTime * 1000L));
                msg += "\n解封时间：" + ts;
            } catch (Throwable ignore) {
                msg += "\n解封时间戳：" + expireTime;
            }
        } else {
            msg += "\n封禁类型：永久";
        }
        return msg;
    }

    /**
     * 通过 WindowManager 在游戏画面上层显示封禁/维护模态对话框。
     * 用户点击确定后终止进程。
     */
    private void showFatalOverlay(String title, String message) {
        int type = Build.VERSION.SDK_INT >= 26
                ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                : WindowManager.LayoutParams.TYPE_PHONE;

        // Full-screen dim layer that captures all touches
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(0xAA000000);

        // Card
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(20), dp(20), dp(20), dp(16));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(0xFF1F1030);
        cardBg.setCornerRadius(dp(18));
        card.setBackground(cardBg);

        FrameLayout.LayoutParams cardLp = new FrameLayout.LayoutParams(
                (int) (getResources().getDisplayMetrics().widthPixels * 0.80f),
                FrameLayout.LayoutParams.WRAP_CONTENT);
        cardLp.gravity = Gravity.CENTER;
        root.addView(card, cardLp);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextColor(0xFFFF6BAF);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        tvTitle.setTypeface(tvTitle.getTypeface(), Typeface.BOLD);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        titleLp.bottomMargin = dp(10);
        card.addView(tvTitle, titleLp);

        TextView tvMsg = new TextView(this);
        tvMsg.setText(message);
        tvMsg.setTextColor(0xFFEFE4F8);
        tvMsg.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        LinearLayout.LayoutParams msgLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        msgLp.bottomMargin = dp(16);
        card.addView(tvMsg, msgLp);

        Button btn = new Button(this);
        btn.setText("确定");
        btn.setAllCaps(false);
        btn.setTextColor(0xFFFFFFFF);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        GradientDrawable btnBg = new GradientDrawable();
        btnBg.setColor(0xFFFF6BAF);
        btnBg.setCornerRadius(dp(10));
        btn.setBackground(btnBg);
        btn.setPadding(dp(16), dp(8), dp(16), dp(8));
        LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        card.addView(btn, btnLp);

        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.MATCH_PARENT,
                type,
                WindowManager.LayoutParams.FLAG_DIM_BEHIND,
                PixelFormat.TRANSLUCENT);
        lp.dimAmount = 0.6f;

        btn.setOnClickListener(v -> {
            try { wm.removeView(root); } catch (Throwable ignore) {}
            android.os.Process.killProcess(android.os.Process.myPid());
        });

        try {
            wm.addView(root, lp);
        } catch (Throwable t) {
            Log.e(TAG, "无法显示覆盖层：" + t.getMessage());
            android.os.Process.killProcess(android.os.Process.myPid());
        }
    }

    // ── Save logic ───────────────────────────────────────────────────────────

    private void performSave(boolean isAuto) {
        SharedPreferences prefs = getSharedPreferences("cnv_account", MODE_PRIVATE);
        String accountId    = prefs.getString("account_id",    null);
        String accountToken = prefs.getString("account_token", null);
        if (accountId == null || accountToken == null) return;
        String label = isAuto ? "自动存档" : "手动存档";
        new Thread(() -> {
            try {
                SaveSyncHelper.upload(getApplicationContext(), accountId, accountToken);
                handler.post(() -> Toast.makeText(
                        getApplicationContext(), label + "成功", Toast.LENGTH_SHORT).show());
            } catch (Exception e) {
                Log.e(TAG, label + "失败：" + e.getMessage());
                handler.post(() -> Toast.makeText(
                        getApplicationContext(), label + "失败", Toast.LENGTH_SHORT).show());
            }
        }, "cnv-save-upload").start();
    }

    // ── Custom View ──────────────────────────────────────────────────────────

    private final class SaveButtonView extends View {
        private final Paint bgPaint   = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ringTrack = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ringFill  = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint iconPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF arcBounds = new RectF();
        private float progress = 0f;

        SaveButtonView(Context ctx) {
            super(ctx);
            bgPaint.setColor(0xDD202030);
            bgPaint.setStyle(Paint.Style.FILL);

            ringTrack.setColor(0x44FF6BAF);
            ringTrack.setStyle(Paint.Style.STROKE);
            ringTrack.setStrokeCap(Paint.Cap.ROUND);

            ringFill.setColor(0xFFFF6BAF);
            ringFill.setStyle(Paint.Style.STROKE);
            ringFill.setStrokeCap(Paint.Cap.ROUND);

            iconPaint.setColor(0xFFFFFFFF);
            iconPaint.setAntiAlias(true);
        }

        void setProgress(float p) {
            if (Math.abs(p - progress) < 0.001f) return;
            progress = p;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            float cx = w / 2f, cy = h / 2f;
            float r  = Math.min(cx, cy);
            float sw = r * 0.12f;
            float arcR = r - sw;

            canvas.drawCircle(cx, cy, arcR - sw / 2f, bgPaint);

            arcBounds.set(cx - arcR, cy - arcR, cx + arcR, cy + arcR);
            ringTrack.setStrokeWidth(sw);
            ringFill.setStrokeWidth(sw);
            canvas.drawArc(arcBounds, -90f, 360f, false, ringTrack);
            if (progress > 0f) {
                canvas.drawArc(arcBounds, -90f, progress * 360f, false, ringFill);
            }

            float ir  = arcR * 0.38f;
            float sw2 = r * 0.115f;
            float tipY  = cy - ir * 1.1f;
            float midY  = cy - ir * 0.05f;
            float baseY = cy + ir * 0.75f;

            Path head = new Path();
            head.moveTo(cx, tipY);
            head.lineTo(cx - ir * 0.75f, midY);
            head.lineTo(cx + ir * 0.75f, midY);
            head.close();
            iconPaint.setStyle(Paint.Style.FILL);
            canvas.drawPath(head, iconPaint);

            iconPaint.setStyle(Paint.Style.STROKE);
            iconPaint.setStrokeWidth(sw2);
            iconPaint.setStrokeCap(Paint.Cap.ROUND);
            canvas.drawLine(cx, midY, cx, baseY - sw2 / 2f, iconPaint);
            canvas.drawLine(cx - ir * 1.0f, baseY, cx + ir * 1.0f, baseY, iconPaint);
        }
    }

    // ── Drag touch listener ──────────────────────────────────────────────────

    private final class DragTouchListener implements View.OnTouchListener {
        private final WindowManager.LayoutParams lp;
        private final int clickThresholdSq;
        private float downRawX, downRawY;
        private int   startLpX, startLpY;
        private boolean dragged;

        DragTouchListener(WindowManager.LayoutParams lp) {
            this.lp = lp;
            int t = dp(8);
            clickThresholdSq = t * t;
        }

        @Override
        public boolean onTouch(View v, MotionEvent ev) {
            switch (ev.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downRawX = ev.getRawX();
                    downRawY = ev.getRawY();
                    startLpX = lp.x;
                    startLpY = lp.y;
                    dragged  = false;
                    return true;

                case MotionEvent.ACTION_MOVE: {
                    float dx = ev.getRawX() - downRawX;
                    float dy = ev.getRawY() - downRawY;
                    if (!dragged && dx * dx + dy * dy > clickThresholdSq) dragged = true;
                    if (dragged) {
                        lp.x = startLpX + (int) dx;
                        lp.y = startLpY + (int) dy;
                        if (buttonView != null) {
                            try { wm.updateViewLayout(buttonView, lp); }
                            catch (Throwable ignore) {}
                        }
                    }
                    return true;
                }

                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    if (!dragged) {
                        performSave(false);
                    } else {
                        getSharedPreferences(PREFS_OVERLAY, MODE_PRIVATE).edit()
                                .putInt(KEY_POS_X, lp.x)
                                .putInt(KEY_POS_Y, lp.y)
                                .apply();
                    }
                    return true;
            }
            return false;
        }
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }
}
