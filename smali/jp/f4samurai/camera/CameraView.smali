.class public Ljp/f4samurai/camera/CameraView;
.super Ljp/f4samurai/camera/CameraViewBase;
.source "CameraView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/hardware/Camera$PictureCallback;


# instance fields
.field private mCamera:Landroid/hardware/Camera;

.field private mCameraFacing:I

.field private mHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Ljp/f4samurai/camera/CameraViewBase;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Ljp/f4samurai/camera/CameraView;->mCameraFacing:I

    .line 22
    invoke-virtual {p0}, Ljp/f4samurai/camera/CameraView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iput-object p1, p0, Ljp/f4samurai/camera/CameraView;->mHolder:Landroid/view/SurfaceHolder;

    return-void
.end method

.method private takePicture()V
    .locals 2

    .line 142
    iget-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, p0}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    return-void
.end method


# virtual methods
.method public createCamera()Landroid/hardware/Camera;
    .locals 5

    .line 56
    iget v0, p0, Ljp/f4samurai/camera/CameraView;->mCameraFacing:I

    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    .line 57
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 58
    invoke-virtual {p0}, Ljp/f4samurai/camera/CameraView;->hasFeatureAutoFocus()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 59
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v2

    const-string v3, "continuous-picture"

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 60
    invoke-virtual {v1, v3}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 63
    :cond_0
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    move-result-object v2

    .line 64
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    .line 66
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/Camera$Size;

    .line 67
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/Camera$Size;

    .line 69
    iget v4, v2, Landroid/hardware/Camera$Size;->width:I

    iget v2, v2, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v1, v4, v2}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 70
    iget v2, v3, Landroid/hardware/Camera$Size;->width:I

    iget v3, v3, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v1, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 72
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    return-object v0
.end method

.method public deleteCamera(Landroid/hardware/Camera;)V
    .locals 1

    const/4 v0, 0x0

    .line 77
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 78
    invoke-virtual {p1}, Landroid/hardware/Camera;->stopPreview()V

    .line 79
    invoke-virtual {p1}, Landroid/hardware/Camera;->release()V

    return-void
.end method

.method public hasFeatureAutoFocus()Z
    .locals 2

    .line 84
    sget-object v0, Ljp/f4samurai/camera/CameraView;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.camera.autofocus"

    .line 85
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 2

    .line 148
    :try_start_0
    iget-object p2, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {p2}, Landroid/hardware/Camera;->startPreview()V

    .line 150
    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v0, 0x1

    .line 151
    iput v0, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v0, 0x0

    .line 152
    array-length v1, p1

    invoke-static {p1, v0, v1, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 154
    iget-object p2, p0, Ljp/f4samurai/camera/CameraView;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {p2}, Landroid/opengl/GLSurfaceView;->getWidth()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Ljp/f4samurai/camera/CameraView;->resize(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p2

    iput-object p2, p0, Ljp/f4samurai/camera/CameraView;->mPhotoBitmap:Landroid/graphics/Bitmap;

    .line 155
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 41
    invoke-super {p0, p1, p2, p3, p4}, Ljp/f4samurai/camera/CameraViewBase;->surfaceChanged(Landroid/view/SurfaceHolder;III)V

    .line 42
    iget-object p1, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {p1}, Landroid/hardware/Camera;->startPreview()V

    const/4 p1, 0x1

    const-string p2, "\u30ab\u30e1\u30e9\u306e\u8d77\u52d5\u306b\u6210\u529f\u3057\u307e\u3057\u305f\u3002"

    .line 43
    invoke-static {p1, p2}, Ljp/f4samurai/camera/CameraHelper;->_launchCallback(ZLjava/lang/String;)V

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 27
    invoke-super {p0, p1}, Ljp/f4samurai/camera/CameraViewBase;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 28
    invoke-virtual {p0}, Ljp/f4samurai/camera/CameraView;->createCamera()Landroid/hardware/Camera;

    move-result-object p1

    iput-object p1, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    .line 30
    :try_start_0
    iget-object v0, p0, Ljp/f4samurai/camera/CameraView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 32
    iget-object p1, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    if-eqz p1, :cond_0

    .line 33
    invoke-virtual {p1}, Landroid/hardware/Camera;->release()V

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    :cond_0
    :goto_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 48
    iget-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 49
    invoke-virtual {p0, v0}, Ljp/f4samurai/camera/CameraView;->deleteCamera(Landroid/hardware/Camera;)V

    const/4 v0, 0x0

    .line 50
    iput-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    .line 52
    :cond_0
    invoke-super {p0, p1}, Ljp/f4samurai/camera/CameraViewBase;->surfaceDestroyed(Landroid/view/SurfaceHolder;)V

    return-void
.end method

.method public swap()V
    .locals 2

    .line 104
    iget-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {p0, v0}, Ljp/f4samurai/camera/CameraView;->deleteCamera(Landroid/hardware/Camera;)V

    .line 106
    invoke-virtual {p0}, Ljp/f4samurai/camera/CameraView;->switchCameraId()V

    .line 107
    invoke-virtual {p0}, Ljp/f4samurai/camera/CameraView;->createCamera()Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    .line 109
    :try_start_0
    iget-object v1, p0, Ljp/f4samurai/camera/CameraView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 110
    iget-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 112
    iget-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    const/4 v0, 0x0

    .line 114
    iput-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    :cond_0
    :goto_0
    return-void
.end method

.method public switchCameraId()V
    .locals 3

    .line 90
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_0

    .line 92
    iput v1, p0, Ljp/f4samurai/camera/CameraView;->mCameraFacing:I

    return-void

    .line 95
    :cond_0
    iget v0, p0, Ljp/f4samurai/camera/CameraView;->mCameraFacing:I

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 96
    iput v0, p0, Ljp/f4samurai/camera/CameraView;->mCameraFacing:I

    goto :goto_0

    .line 98
    :cond_1
    iput v1, p0, Ljp/f4samurai/camera/CameraView;->mCameraFacing:I

    :goto_0
    return-void
.end method

.method public takeScreenShot()V
    .locals 0

    .line 137
    invoke-direct {p0}, Ljp/f4samurai/camera/CameraView;->takePicture()V

    .line 138
    invoke-super {p0}, Ljp/f4samurai/camera/CameraViewBase;->takeScreenShot()V

    return-void
.end method

.method public zoom(F)V
    .locals 3

    .line 122
    iget-object v0, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 123
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 124
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 125
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr p1, v2

    const/high16 v2, 0x41200000    # 10.0f

    mul-float p1, p1, v2

    float-to-int p1, p1

    mul-int/lit8 p1, p1, 0x5

    const/4 v2, 0x1

    add-int/2addr p1, v2

    .line 128
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 129
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 130
    iget-object p1, p0, Ljp/f4samurai/camera/CameraView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    :cond_0
    return-void
.end method
