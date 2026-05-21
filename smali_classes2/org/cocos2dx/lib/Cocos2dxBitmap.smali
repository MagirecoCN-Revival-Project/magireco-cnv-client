.class public final Lorg/cocos2dx/lib/Cocos2dxBitmap;
.super Ljava/lang/Object;
.source "Cocos2dxBitmap.java"


# static fields
.field private static final HORIZONTAL_ALIGN_CENTER:I = 0x3

.field private static final HORIZONTAL_ALIGN_LEFT:I = 0x1

.field private static final HORIZONTAL_ALIGN_RIGHT:I = 0x2

.field private static final VERTICAL_ALIGN_BOTTOM:I = 0x2

.field private static final VERTICAL_ALIGN_CENTER:I = 0x3

.field private static final VERTICAL_ALIGN_TOP:I = 0x1

.field private static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calculateShrinkTypeFace(Ljava/lang/String;IILandroid/text/Layout$Alignment;FLandroid/text/TextPaint;Z)Landroid/graphics/Typeface;
    .locals 17

    move-object/from16 v8, p0

    move/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p4

    move-object/from16 v12, p5

    if-eqz v9, :cond_7

    if-nez v10, :cond_0

    goto/16 :goto_2

    :cond_0
    add-int/lit8 v0, v9, 0x1

    int-to-float v0, v0

    add-int/lit8 v1, v10, 0x1

    int-to-float v1, v1

    const/high16 v13, 0x3f800000    # 1.0f

    add-float v2, v11, v13

    const/4 v14, 0x0

    if-nez p6, :cond_3

    :cond_1
    int-to-float v3, v9

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_2

    int-to-float v0, v10

    cmpl-float v0, v1, v0

    if-lez v0, :cond_5

    :cond_2
    sub-float/2addr v2, v13

    .line 123
    invoke-static {v8, v12}, Landroid/text/StaticLayout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    int-to-float v0, v0

    float-to-int v1, v0

    .line 124
    invoke-virtual/range {p5 .. p5}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    invoke-static {v8, v1, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->getTextHeight(Ljava/lang/String;IFLandroid/graphics/Typeface;)I

    move-result v1

    int-to-float v1, v1

    .line 126
    invoke-virtual {v12, v2}, Landroid/text/TextPaint;->setTextSize(F)V

    cmpg-float v3, v2, v14

    if-gtz v3, :cond_1

    .line 128
    invoke-virtual {v12, v11}, Landroid/text/TextPaint;->setTextSize(F)V

    goto :goto_1

    :cond_3
    :goto_0
    int-to-float v3, v10

    cmpl-float v1, v1, v3

    if-gtz v1, :cond_4

    int-to-float v1, v9

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5

    :cond_4
    sub-float v15, v2, v13

    .line 136
    new-instance v7, Landroid/text/StaticLayout;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/16 v16, 0x0

    move-object v0, v7

    move-object/from16 v1, p0

    move-object/from16 v2, p5

    move/from16 v3, p1

    move-object/from16 v4, p3

    move-object/from16 p6, v7

    move/from16 v7, v16

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 137
    invoke-virtual/range {p6 .. p6}, Landroid/text/Layout;->getWidth()I

    move-result v0

    int-to-float v0, v0

    .line 138
    invoke-virtual/range {p6 .. p6}, Landroid/text/Layout;->getLineCount()I

    move-result v1

    move-object/from16 v2, p6

    invoke-virtual {v2, v1}, Landroid/text/Layout;->getLineTop(I)I

    move-result v1

    int-to-float v1, v1

    .line 140
    invoke-virtual {v12, v15}, Landroid/text/TextPaint;->setTextSize(F)V

    cmpg-float v2, v15, v14

    if-gtz v2, :cond_6

    .line 143
    invoke-virtual {v12, v11}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 149
    :cond_5
    :goto_1
    invoke-virtual/range {p5 .. p5}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0

    :cond_6
    move v2, v15

    goto :goto_0

    .line 113
    :cond_7
    :goto_2
    invoke-virtual/range {p5 .. p5}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public static createTextBitmapShadowStroke([BLjava/lang/String;IIIIIIIIZFFFFZIIIIFZI)Z
    .locals 18

    move-object/from16 v0, p0

    move/from16 v7, p8

    move/from16 v8, p22

    if-eqz v0, :cond_10

    .line 158
    array-length v1, v0

    if-nez v1, :cond_0

    goto/16 :goto_9

    .line 161
    :cond_0
    new-instance v11, Ljava/lang/String;

    invoke-direct {v11, v0}, Ljava/lang/String;-><init>([B)V

    .line 164
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    and-int/lit8 v6, p7, 0xf

    const/4 v5, 0x3

    const/4 v4, 0x2

    if-eq v6, v4, :cond_2

    if-eq v6, v5, :cond_1

    :goto_0
    move-object v14, v0

    goto :goto_1

    .line 168
    :cond_1
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    goto :goto_0

    .line 171
    :cond_2
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    goto :goto_0

    .line 179
    :goto_1
    invoke-static/range {p1 .. p2}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->newPaint(Ljava/lang/String;I)Landroid/text/TextPaint;

    move-result-object v3

    if-eqz p15, :cond_3

    .line 182
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v0}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    move/from16 v0, p20

    .line 183
    invoke-virtual {v3, v0}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    :cond_3
    if-gtz v7, :cond_4

    .line 189
    invoke-static {v11, v3}, Landroid/text/StaticLayout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    move v13, v0

    goto :goto_2

    :cond_4
    move v13, v7

    :goto_2
    const/4 v2, 0x1

    if-ne v8, v2, :cond_5

    if-nez p21, :cond_5

    .line 198
    invoke-static {v11, v3}, Landroid/text/StaticLayout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v13, v0

    .line 199
    new-instance v0, Landroid/text/StaticLayout;

    const/high16 v15, 0x3f800000    # 1.0f

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v10, v0

    move-object v12, v3

    invoke-direct/range {v10 .. v17}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    move v9, v6

    const/4 v2, 0x3

    const/4 v4, 0x1

    goto :goto_4

    :cond_5
    if-ne v8, v4, :cond_6

    move/from16 v0, p2

    int-to-float v10, v0

    move-object v0, v11

    move/from16 v1, p8

    const/4 v15, 0x1

    move/from16 v2, p9

    move-object v12, v3

    move-object v3, v14

    const/4 v9, 0x2

    move v4, v10

    const/4 v10, 0x3

    move-object v5, v12

    move v9, v6

    move/from16 v6, p21

    .line 202
    invoke-static/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->calculateShrinkTypeFace(Ljava/lang/String;IILandroid/text/Layout$Alignment;FLandroid/text/TextPaint;Z)Landroid/graphics/Typeface;

    goto :goto_3

    :cond_6
    move-object v12, v3

    move v9, v6

    const/4 v10, 0x3

    const/4 v15, 0x1

    .line 204
    :goto_3
    new-instance v0, Landroid/text/StaticLayout;

    const/high16 v1, 0x3f800000    # 1.0f

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v2, 0x3

    move-object v10, v0

    move-object v3, v12

    const/4 v4, 0x1

    move v15, v1

    invoke-direct/range {v10 .. v17}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 207
    :goto_4
    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    move-result v1

    .line 208
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/text/Layout;->getLineTop(I)I

    move-result v5

    .line 210
    invoke-static {v1, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    if-lez p9, :cond_7

    move/from16 v10, p9

    goto :goto_5

    :cond_7
    move v10, v5

    :goto_5
    if-ne v8, v4, :cond_8

    if-nez p21, :cond_8

    if-lez v7, :cond_8

    move v6, v7

    :cond_8
    if-eqz v6, :cond_f

    if-nez v10, :cond_9

    goto :goto_8

    :cond_9
    if-ne v9, v2, :cond_a

    sub-int v1, v6, v1

    const/4 v7, 0x2

    .line 228
    div-int/2addr v1, v7

    goto :goto_6

    :cond_a
    const/4 v7, 0x2

    if-ne v9, v7, :cond_b

    sub-int v1, v6, v1

    goto :goto_6

    :cond_b
    const/4 v1, 0x0

    :goto_6
    shr-int/lit8 v8, p7, 0x4

    and-int/lit8 v8, v8, 0xf

    if-eq v8, v7, :cond_d

    if-eq v8, v2, :cond_c

    const/4 v9, 0x0

    goto :goto_7

    :cond_c
    sub-int v2, v10, v5

    .line 239
    div-int/lit8 v9, v2, 0x2

    goto :goto_7

    :cond_d
    sub-int v9, v10, v5

    .line 248
    :goto_7
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v10, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 249
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    int-to-float v1, v1

    int-to-float v6, v9

    .line 250
    invoke-virtual {v5, v1, v6}, Landroid/graphics/Canvas;->translate(FF)V

    if-eqz p15, :cond_e

    move/from16 v1, p16

    move/from16 v6, p17

    move/from16 v7, p18

    move/from16 v8, p19

    .line 253
    invoke-virtual {v3, v8, v1, v6, v7}, Landroid/text/TextPaint;->setARGB(IIII)V

    .line 254
    invoke-virtual {v0, v5}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 256
    :cond_e
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v1}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    move/from16 v1, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    .line 257
    invoke-virtual {v3, v8, v1, v6, v7}, Landroid/text/TextPaint;->setARGB(IIII)V

    .line 258
    invoke-virtual {v0, v5}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 260
    invoke-static {v2}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->initNativeObject(Landroid/graphics/Bitmap;)V

    return v4

    :cond_f
    :goto_8
    const/4 v0, 0x0

    return v0

    :cond_10
    :goto_9
    const/4 v0, 0x0

    return v0
.end method

.method public static getFontSizeAccordingHeight(I)I
    .locals 8

    .line 313
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 314
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 316
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    :cond_0
    :goto_0
    if-nez v4, :cond_1

    int-to-float v6, v5

    .line 321
    invoke-virtual {v0, v6}, Landroid/text/TextPaint;->setTextSize(F)V

    const/4 v6, 0x6

    const-string v7, "SghMNy"

    .line 323
    invoke-virtual {v0, v7, v2, v6, v1}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    add-int/lit8 v5, v5, 0x1

    .line 327
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v6

    sub-int v6, p0, v6

    const/4 v7, 0x2

    if-gt v6, v7, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    return v5
.end method

.method private static getPixels(Landroid/graphics/Bitmap;)[B
    .locals 3

    if-eqz p0, :cond_0

    .line 301
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 302
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int v0, v0, v1

    mul-int/lit8 v0, v0, 0x4

    new-array v0, v0, [B

    .line 303
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 304
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 305
    invoke-virtual {p0, v1}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getStringWithEllipsis(Ljava/lang/String;FF)Ljava/lang/String;
    .locals 2

    .line 336
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, ""

    return-object p0

    .line 340
    :cond_0
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 341
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 342
    invoke-virtual {v0, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 344
    sget-object p2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {p0, v0, p1, p2}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object p0

    .line 345
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getTextHeight(Ljava/lang/String;IFLandroid/graphics/Typeface;)I
    .locals 9

    .line 85
    new-instance v7, Landroid/text/TextPaint;

    const/16 v0, 0x81

    invoke-direct {v7, v0}, Landroid/text/TextPaint;-><init>(I)V

    .line 86
    invoke-virtual {v7, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 87
    invoke-virtual {v7, p3}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 92
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    const/4 p3, 0x0

    const/4 v8, 0x0

    :goto_0
    if-ge p3, p2, :cond_1

    const/4 v4, 0x1

    int-to-float v5, p1

    const/4 v6, 0x0

    move-object v0, v7

    move-object v1, p0

    move v2, p3

    move v3, p2

    .line 95
    invoke-virtual/range {v0 .. v6}, Landroid/text/TextPaint;->breakText(Ljava/lang/CharSequence;IIZF[F)I

    move-result v0

    if-nez v0, :cond_0

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_0
    add-int/2addr p3, v0

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 105
    :cond_1
    invoke-virtual {v7}, Landroid/text/TextPaint;->ascent()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    invoke-virtual {v7}, Landroid/text/TextPaint;->descent()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    add-float/2addr p0, p1

    int-to-float p1, v8

    mul-float p1, p1, p0

    float-to-double p0, p1

    .line 107
    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide p0

    double-to-int p0, p0

    return p0
.end method

.method private static initNativeObject(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 290
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->getPixels(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 295
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 296
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    .line 295
    invoke-static {v1, p0, v0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->nativeInitBitmapDC(II[B)V

    return-void
.end method

.method private static native nativeInitBitmapDC(II[B)V
.end method

.method private static newPaint(Ljava/lang/String;I)Landroid/text/TextPaint;
    .locals 3

    .line 265
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    int-to-float p1, p1

    .line 266
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTextSize(F)V

    const/4 p1, 0x1

    .line 267
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    const-string p1, ".ttf"

    .line 270
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 272
    :try_start_0
    sget-object p1, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    invoke-static {p1, p0}, Lorg/cocos2dx/lib/Cocos2dxTypefaces;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p1

    .line 274
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 276
    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error to create ttf type face: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "Cocos2dxBitmap"

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    invoke-static {p0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 283
    :cond_0
    invoke-static {p0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    :goto_0
    return-object v0
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0

    .line 69
    sput-object p0, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    return-void
.end method
