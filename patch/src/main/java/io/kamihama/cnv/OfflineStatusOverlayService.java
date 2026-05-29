package io.kamihama.cnv;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;

/**
 * 离线模式状态悬浮标签服务。
 *
 * <p>游戏在离线模式下运行时以 Foreground Service 启动，
 * 通过 WindowManager 在屏幕左下角常驻显示"离线模式 v{version}"标签。
 * 标签不接受触摸输入，不随游戏 Activity 生命周期消失。
 */
public class OfflineStatusOverlayService extends Service {

    private static final String TAG     = "CnvOfflineOverlay";
    private static final int    NOTIF_ID = 0x4F46;
    private static final String CHAN_ID  = "cnv_offline_status";

    private WindowManager wm;
    private View          labelView;

    @Override
    public void onCreate() {
        super.onCreate();
        wm = (WindowManager) getSystemService(WINDOW_SERVICE);
        startForegroundCompat();
        createLabelView();
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
        if (labelView != null) {
            try { wm.removeView(labelView); } catch (Throwable ignore) {}
            labelView = null;
        }
    }

    @Override
    public void onTaskRemoved(Intent rootIntent) { stopSelf(); }

    // ── Foreground notification ──────────────────────────────────────────────

    @SuppressWarnings({"deprecation", "NewApi"})
    private void startForegroundCompat() {
        if (Build.VERSION.SDK_INT >= 26) {
            NotificationManager nm =
                    (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
            NotificationChannel ch = new NotificationChannel(
                    CHAN_ID, "离线模式", NotificationManager.IMPORTANCE_MIN);
            ch.setShowBadge(false);
            nm.createNotificationChannel(ch);
            Notification n = new Notification.Builder(this, CHAN_ID)
                    .setContentTitle("魔法纪录 CNV")
                    .setContentText("离线模式运行中")
                    .setSmallIcon(android.R.drawable.ic_dialog_alert)
                    .setOngoing(true)
                    .build();
            startForeground(NOTIF_ID, n);
        } else {
            Notification n = new Notification.Builder(this)
                    .setContentTitle("魔法纪录 CNV")
                    .setContentText("离线模式运行中")
                    .setSmallIcon(android.R.drawable.ic_dialog_alert)
                    .setOngoing(true)
                    .setPriority(Notification.PRIORITY_MIN)
                    .build();
            startForeground(NOTIF_ID, n);
        }
    }

    // ── Overlay window ───────────────────────────────────────────────────────

    private void createLabelView() {
        String version = ResourceFlow.BUILD_VERSION;
        if (version == null || version.isEmpty()) version = "unknown";

        labelView = new OfflineLabelView(this, "离线模式 v" + version);

        int type = Build.VERSION.SDK_INT >= 26
                ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                : WindowManager.LayoutParams.TYPE_PHONE;
        int flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                  | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                  | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS;

        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(
                WindowManager.LayoutParams.WRAP_CONTENT,
                WindowManager.LayoutParams.WRAP_CONTENT,
                type, flags, PixelFormat.TRANSLUCENT);
        lp.gravity = Gravity.BOTTOM | Gravity.START;
        lp.x = dp(12);
        lp.y = dp(12);

        try {
            wm.addView(labelView, lp);
        } catch (Throwable t) {
            Log.e(TAG, "无法添加离线状态标签：" + t.getMessage());
        }
    }

    // ── Custom view ──────────────────────────────────────────────────────────

    private final class OfflineLabelView extends View {
        private final Paint bgPaint   = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF bgRect    = new RectF();
        private final String text;
        private final float  textSize;
        private final float  padH;
        private final float  padV;
        private float measuredW;
        private float measuredH;

        OfflineLabelView(android.content.Context ctx, String text) {
            super(ctx);
            this.text     = text;
            this.textSize = sp(11f);
            this.padH     = dp(9);
            this.padV     = dp(5);

            bgPaint.setColor(0xCC1F1030);
            bgPaint.setStyle(Paint.Style.FILL);

            textPaint.setColor(0xFFFF6BAF);
            textPaint.setTextSize(textSize);
            textPaint.setTypeface(Typeface.create(Typeface.MONOSPACE, Typeface.BOLD));
            textPaint.setAntiAlias(true);

            measuredW = textPaint.measureText(text) + padH * 2;
            Paint.FontMetrics fm = textPaint.getFontMetrics();
            measuredH = (fm.descent - fm.ascent) + padV * 2;
        }

        @Override
        protected void onMeasure(int wSpec, int hSpec) {
            setMeasuredDimension((int) Math.ceil(measuredW), (int) Math.ceil(measuredH));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            float r = dp(6);
            bgRect.set(0, 0, w, h);
            canvas.drawRoundRect(bgRect, r, r, bgPaint);

            Paint.FontMetrics fm = textPaint.getFontMetrics();
            float textY = padV + (-fm.ascent);
            canvas.drawText(text, padH, textY, textPaint);
        }

        private float sp(float v) {
            return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, v,
                    getResources().getDisplayMetrics());
        }

        private float dp(int v) {
            return v * getResources().getDisplayMetrics().density;
        }
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }
}
