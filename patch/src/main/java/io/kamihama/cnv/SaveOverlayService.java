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
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.Toast;

/**
 * 悬浮存档窗口服务。
 *
 * <p>游戏启动后以 Foreground Service 运行，通过 WindowManager 在屏幕上显示
 * 一个可拖动的圆形按钮：外圈粉红色进度环（600 秒转满），中心上传图标。
 * 进度环转满时自动触发云端存档上传；点击（非拖动）触发手动上传。
 */
public class SaveOverlayService extends Service {

    private static final String TAG           = "CnvSaveOverlay";
    private static final String PREFS_OVERLAY = "cnv_save_overlay";
    private static final String KEY_POS_X     = "x";
    private static final String KEY_POS_Y     = "y";
    private static final long   CYCLE_MS      = 600_000L;

    private static final int    NOTIF_ID      = 0x5356;
    private static final String CHAN_ID       = "cnv_save_overlay";

    private WindowManager  wm;
    private SaveButtonView buttonView;
    private Handler        handler;
    private long           cycleStartMs;

    // ── Lifecycle ────────────────────────────────────────────────────────────

    @Override
    public void onCreate() {
        super.onCreate();
        wm      = (WindowManager) getSystemService(WINDOW_SERVICE);
        handler = new Handler(Looper.getMainLooper());
        startForegroundCompat();
        createOverlayView();
        resetCycle();
        handler.post(ticker);
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
        handler.removeCallbacks(ticker);
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

    // ── Timer ────────────────────────────────────────────────────────────────

    private void resetCycle() {
        cycleStartMs = SystemClock.elapsedRealtime();
    }

    private final Runnable ticker = new Runnable() {
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

    // ── Save ─────────────────────────────────────────────────────────────────

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
            float sw = r * 0.12f;           // ring stroke width
            float arcR = r - sw;            // ring center radius

            // Background
            canvas.drawCircle(cx, cy, arcR - sw / 2f, bgPaint);

            // Ring track + fill
            arcBounds.set(cx - arcR, cy - arcR, cx + arcR, cy + arcR);
            ringTrack.setStrokeWidth(sw);
            ringFill.setStrokeWidth(sw);
            canvas.drawArc(arcBounds, -90f, 360f, false, ringTrack);
            if (progress > 0f) {
                canvas.drawArc(arcBounds, -90f, progress * 360f, false, ringFill);
            }

            // Upload icon: upward arrow + base line
            float ir  = arcR * 0.38f;        // icon half-width
            float sw2 = r * 0.115f;          // icon stroke width
            float tipY  = cy - ir * 1.1f;    // arrow tip (top)
            float midY  = cy - ir * 0.05f;   // shaft bottom / arrow head base
            float baseY = cy + ir * 0.75f;   // horizontal baseline

            // Arrowhead (filled triangle pointing up)
            Path head = new Path();
            head.moveTo(cx, tipY);
            head.lineTo(cx - ir * 0.75f, midY);
            head.lineTo(cx + ir * 0.75f, midY);
            head.close();
            iconPaint.setStyle(Paint.Style.FILL);
            canvas.drawPath(head, iconPaint);

            // Shaft
            iconPaint.setStyle(Paint.Style.STROKE);
            iconPaint.setStrokeWidth(sw2);
            iconPaint.setStrokeCap(Paint.Cap.ROUND);
            canvas.drawLine(cx, midY, cx, baseY - sw2 / 2f, iconPaint);

            // Base line
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
