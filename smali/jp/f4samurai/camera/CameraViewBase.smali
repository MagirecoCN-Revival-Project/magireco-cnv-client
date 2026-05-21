.class public Ljp/f4samurai/camera/CameraViewBase;
.super Landroid/view/SurfaceView;
.source "CameraViewBase.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;
    }
.end annotation


# static fields
.field protected static mActivity:Ljp/f4samurai/AppActivity;


# instance fields
.field protected mGLBitmap:Landroid/graphics/Bitmap;

.field protected mGLCaptureReadyCallback:Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;

.field protected mGLSurfaceView:Landroid/opengl/GLSurfaceView;

.field protected mHandler:Landroid/os/Handler;

.field protected mLayout:Landroid/widget/FrameLayout;

.field protected mPhotoBitmap:Landroid/graphics/Bitmap;

.field protected mRunnable:Ljava/lang/Runnable;

.field private mStoreCaptureCallback:Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

.field protected mSynthesizedBitmap:Landroid/graphics/Bitmap;


# direct methods
.method static bridge synthetic -$$Nest$fgetmStoreCaptureCallback(Ljp/f4samurai/camera/CameraViewBase;)Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/CameraViewBase;->mStoreCaptureCallback:Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mstoreCapture(Ljp/f4samurai/camera/CameraViewBase;)V
    .locals 0

    invoke-direct {p0}, Ljp/f4samurai/camera/CameraViewBase;->storeCapture()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstoreCaptureByMediaApi(Ljp/f4samurai/camera/CameraViewBase;)V
    .locals 0

    invoke-direct {p0}, Ljp/f4samurai/camera/CameraViewBase;->storeCaptureByMediaApi()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V
    .locals 1

    .line 47
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 77
    new-instance v0, Ljp/f4samurai/camera/CameraViewBase$1;

    invoke-direct {v0, p0}, Ljp/f4samurai/camera/CameraViewBase$1;-><init>(Ljp/f4samurai/camera/CameraViewBase;)V

    iput-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mStoreCaptureCallback:Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

    .line 262
    new-instance v0, Ljp/f4samurai/camera/CameraViewBase$4;

    invoke-direct {v0, p0}, Ljp/f4samurai/camera/CameraViewBase$4;-><init>(Ljp/f4samurai/camera/CameraViewBase;)V

    iput-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLCaptureReadyCallback:Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;

    .line 48
    invoke-virtual {p0}, Ljp/f4samurai/camera/CameraViewBase;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 49
    iput-object p2, p0, Ljp/f4samurai/camera/CameraViewBase;->mLayout:Landroid/widget/FrameLayout;

    .line 50
    check-cast p1, Ljp/f4samurai/AppActivity;

    sput-object p1, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    .line 52
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Ljp/f4samurai/camera/CameraViewBase;->mHandler:Landroid/os/Handler;

    .line 54
    sget-object p1, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {p1}, Ljp/f4samurai/AppActivity;->getGLSurfaceView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object p1

    iput-object p1, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    return-void
.end method

.method private storeCapture()V
    .locals 2

    .line 148
    invoke-static {}, Ljp/f4samurai/utils/FileUtils;->canUseSd()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    sget-object v0, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    iget-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mSynthesizedBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Ljp/f4samurai/utils/FileUtils;->saveToSd(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    const/4 v0, 0x1

    const-string v1, "\u753b\u50cf\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f\u3002"

    .line 150
    invoke-static {v0, v1}, Ljp/f4samurai/camera/CameraHelper;->_storeCallback(ZLjava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const-string v1, "\u753b\u50cf\u306e\u4fdd\u5b58\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002"

    .line 152
    invoke-static {v0, v1}, Ljp/f4samurai/camera/CameraHelper;->_storeCallback(ZLjava/lang/String;)V

    .line 154
    :goto_0
    invoke-direct {p0}, Ljp/f4samurai/camera/CameraViewBase;->terminateStoreCapture()V

    return-void
.end method

.method private storeCaptureByMediaApi()V
    .locals 2

    .line 159
    invoke-static {}, Ljp/f4samurai/utils/FileUtils;->canReadSd()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 160
    sget-object v0, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    iget-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mSynthesizedBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Ljp/f4samurai/utils/FileUtils;->saveToMedia(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    const/4 v0, 0x1

    const-string v1, "\u753b\u50cf\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f\u3002"

    .line 161
    invoke-static {v0, v1}, Ljp/f4samurai/camera/CameraHelper;->_storeCallback(ZLjava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const-string v1, "\u753b\u50cf\u306e\u4fdd\u5b58\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002"

    .line 163
    invoke-static {v0, v1}, Ljp/f4samurai/camera/CameraHelper;->_storeCallback(ZLjava/lang/String;)V

    .line 165
    :goto_0
    invoke-direct {p0}, Ljp/f4samurai/camera/CameraViewBase;->terminateStoreCapture()V

    return-void
.end method

.method private terminateStoreCapture()V
    .locals 1

    .line 170
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mSynthesizedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 171
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 172
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    .line 174
    iput-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    .line 175
    iput-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    .line 176
    iput-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mSynthesizedBitmap:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method protected captureGL(Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;)V
    .locals 2

    .line 219
    sget-object v0, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraViewBase$3;

    invoke-direct {v1, p0, p1}, Ljp/f4samurai/camera/CameraViewBase$3;-><init>(Ljp/f4samurai/camera/CameraViewBase;Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected createBitmapFromGLSurface(IIIILjavax/microedition/khronos/opengles/GL10;)Landroid/graphics/Bitmap;
    .locals 13

    move/from16 v8, p3

    move/from16 v9, p4

    mul-int v0, v8, v9

    .line 237
    new-array v10, v0, [I

    .line 238
    new-array v11, v0, [I

    .line 239
    invoke-static {v10}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v7

    const/4 v12, 0x0

    .line 240
    invoke-virtual {v7, v12}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    move-object/from16 v0, p5

    move v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    .line 243
    :try_start_0
    invoke-interface/range {v0 .. v7}, Ljavax/microedition/khronos/opengles/GL10;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v9, :cond_1

    mul-int v1, v0, v8

    sub-int v2, v9, v0

    add-int/lit8 v2, v2, -0x1

    mul-int v2, v2, v8

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v8, :cond_0

    add-int v4, v1, v3

    .line 249
    aget v4, v10, v4

    shr-int/lit8 v5, v4, 0x10

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v6, v4, 0x10

    const/high16 v7, 0xff0000

    and-int/2addr v6, v7

    const v7, -0xff0100

    and-int/2addr v4, v7

    or-int/2addr v4, v6

    or-int/2addr v4, v5

    add-int v5, v2, v3

    .line 253
    aput v4, v11, v5
    :try_end_0
    .catch Landroid/opengl/GLException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 259
    :cond_1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v11, v8, v9, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :catch_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getGLSurfaceView()Landroid/opengl/GLSurfaceView;
    .locals 1

    .line 191
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    return-object v0
.end method

.method public onPause()V
    .locals 2

    .line 180
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 181
    iget-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    .line 182
    iput-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mRunnable:Ljava/lang/Runnable;

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method protected resize(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 7

    .line 209
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 210
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 211
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    int-to-float p2, p2

    int-to-float v0, v3

    div-float/2addr p2, v0

    .line 213
    invoke-virtual {v5, p2, p2}, Landroid/graphics/Matrix;->setScale(FF)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v6, 0x1

    move-object v0, p1

    .line 214
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected rotate(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 5

    .line 199
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 200
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 201
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 202
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 203
    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    const/high16 v4, 0x43340000    # 180.0f

    invoke-virtual {v3, v4, v0, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 204
    invoke-virtual {v3, p1, v0, v0, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-object v2
.end method

.method public setPhotoBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 195
    iput-object p1, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

.method public swap()V
    .locals 0

    return-void
.end method

.method protected synthesizeBitmap()Landroid/graphics/Bitmap;
    .locals 6

    .line 270
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->getWidth()I

    move-result v0

    iget-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v1}, Landroid/opengl/GLSurfaceView;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 271
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 273
    iget-object v2, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v2}, Landroid/opengl/GLSurfaceView;->getHeight()I

    move-result v2

    iget-object v3, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    .line 274
    iget-object v3, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v4, v2, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 275
    iget-object v2, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2, v4, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-object v0
.end method

.method public takeScreenShot()V
    .locals 3

    .line 90
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 92
    iput-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    .line 94
    :cond_0
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 95
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 96
    iput-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    .line 98
    :cond_1
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_2

    .line 99
    iget-object v2, p0, Ljp/f4samurai/camera/CameraViewBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 100
    iput-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mRunnable:Ljava/lang/Runnable;

    .line 103
    :cond_2
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLCaptureReadyCallback:Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;

    invoke-virtual {p0, v0}, Ljp/f4samurai/camera/CameraViewBase;->captureGL(Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;)V

    .line 105
    new-instance v0, Ljp/f4samurai/camera/CameraViewBase$2;

    invoke-direct {v0, p0}, Ljp/f4samurai/camera/CameraViewBase$2;-><init>(Ljp/f4samurai/camera/CameraViewBase;)V

    iput-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mRunnable:Ljava/lang/Runnable;

    .line 128
    iget-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected terminateScreenShot()V
    .locals 3

    .line 132
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 134
    iput-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    .line 136
    :cond_0
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 137
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 138
    iput-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    .line 140
    :cond_1
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase;->mRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_2

    .line 141
    iget-object v2, p0, Ljp/f4samurai/camera/CameraViewBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 142
    iput-object v1, p0, Ljp/f4samurai/camera/CameraViewBase;->mRunnable:Ljava/lang/Runnable;

    :cond_2
    return-void
.end method

.method public zoom(F)V
    .locals 0

    return-void
.end method
