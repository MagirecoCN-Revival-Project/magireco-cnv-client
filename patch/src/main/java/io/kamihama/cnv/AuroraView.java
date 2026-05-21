package io.kamihama.cnv;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.view.View;

/**
 * 浅色调极光背景 View。
 *
 * <p>底色为粉色，上层叠四个大半径 {@link RadialGradient} 色块；每个色块：
 * <ul>
 *   <li>沿 Lissajous 轨迹缓慢漂移（~0.35-0.50 rad/s，约 10-15 秒一周）；</li>
 *   <li>半径在 0.55x ~ 0.95x 之间脉动；</li>
 *   <li>在两个调色板色之间做正弦 crossfade，让整个场景从不静止。</li>
 * </ul>
 *
 * <p>每帧仅 4 次 {@code drawCircle}，启用了硬件层加速，
 * 资源开销极低。
 */
public class AuroraView extends View {

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final long startTime = System.currentTimeMillis();

    /** 极光下面铺的底色（默认浅粉；深色模式下切到夜空紫黑）。 */
    private int baseColor = 0xFFFDEEF6;

    /** 四个色块，每个色块在两个色之间正弦插值。 */
    private static final int[][] BLOB_LIGHT = {
            { 0xCCFFB6E0, 0xCCFF8FBC },  // 粉 ↔ 玫红
            { 0xBBC8B7FF, 0xBB9CC6FF },  // 薰衣草 ↔ 天蓝
            { 0xBBFFE4B8, 0xBBFFBFD0 },  // 桃 ↔ 珊瑚
            { 0xAAB7F0E0, 0xAACDB8FF },  // 薄荷 ↔ 丁香
    };
    private static final int[][] BLOB_DARK = {
            { 0x99B23A85, 0x99D85B9F },  // 深紫 ↔ 玫红
            { 0x885B40B0, 0x884F6BC8 },  // 深薰衣草 ↔ 深天蓝
            { 0x88B5722F, 0x88C24D75 },  // 焦糖 ↔ 樱桃
            { 0x885A8C76, 0x886A4B9A },  // 深苔藓 ↔ 紫罗兰
    };
    private int[][] blobs = BLOB_LIGHT;

    /** 切换浅 / 深色模式，并立即触发重绘。 */
    public void setDarkMode(boolean dark) {
        baseColor = dark ? 0xFF1A1428 : 0xFFFDEEF6;
        blobs = dark ? BLOB_DARK : BLOB_LIGHT;
        invalidate();
    }

    public AuroraView(Context c) {
        super(c);
        if (android.os.Build.VERSION.SDK_INT >= 11) {
            setLayerType(LAYER_TYPE_HARDWARE, null);
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int w = getWidth();
        int h = getHeight();
        if (w == 0 || h == 0) {
            postInvalidateOnAnimation();
            return;
        }
        canvas.drawColor(baseColor);
        float t = (System.currentTimeMillis() - startTime) / 1000f;
        float maxR = Math.max(w, h);

        for (int i = 0; i < blobs.length; i++) {
            float phaseX = i * 1.7f;
            float phaseY = i * 0.9f + 0.4f;
            // 每个色块速度略不同，避免视觉上整齐排布
            float speed = 0.35f + i * 0.05f;

            float cx = w * (0.5f + 0.48f * (float) Math.sin(t * speed + phaseX));
            float cy = h * (0.5f + 0.52f * (float) Math.cos(t * speed * 1.3f + phaseY));

            // 半径脉动：0.55x → 0.95x → 0.55x ...
            float pulse = 0.75f + 0.20f * (float) Math.sin(t * 0.45f + i * 1.1f);
            float r = maxR * pulse;

            // 在两色之间做正弦插值
            float mix = 0.5f + 0.5f * (float) Math.sin(t * 0.28f + i * 0.7f);
            int color = lerpColor(blobs[i][0], blobs[i][1], mix);

            RadialGradient shader = new RadialGradient(
                    cx, cy, r,
                    color, color & 0x00FFFFFF,
                    Shader.TileMode.CLAMP);
            paint.setShader(shader);
            canvas.drawCircle(cx, cy, r, paint);
        }
        paint.setShader(null);
        postInvalidateOnAnimation();
    }

    /** ARGB 线性插值。 */
    private static int lerpColor(int a, int b, float t) {
        int aa = (a >>> 24) & 0xFF;
        int ar = (a >>> 16) & 0xFF;
        int ag = (a >>>  8) & 0xFF;
        int ab = (a       ) & 0xFF;
        int ba = (b >>> 24) & 0xFF;
        int br = (b >>> 16) & 0xFF;
        int bg = (b >>>  8) & 0xFF;
        int bb = (b       ) & 0xFF;
        int outA = (int) (aa + (ba - aa) * t);
        int outR = (int) (ar + (br - ar) * t);
        int outG = (int) (ag + (bg - ag) * t);
        int outB = (int) (ab + (bb - ab) * t);
        return Color.argb(outA, outR, outG, outB);
    }
}
