.class public Ljp/f4samurai/camera/Camera2View;
.super Ljp/f4samurai/camera/CameraViewBase;
.source "Camera2View.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljp/f4samurai/camera/Camera2View$CameraScaler;,
        Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;,
        Ljp/f4samurai/camera/Camera2View$ImageSaver;
    }
.end annotation


# static fields
.field private static final MAX_PREVIEW_HEIGHT:I = 0x438

.field private static final MAX_PREVIEW_WIDTH:I = 0x780

.field private static final ORIENTATIONS:Landroid/util/SparseIntArray;

.field private static final STATE_PICTURE_TAKEN:I = 0x4

.field private static final STATE_PREVIEW:I = 0x0

.field private static final STATE_WAITING_LOCK:I = 0x1

.field private static final STATE_WAITING_NON_PRECAPTURE:I = 0x3

.field private static final STATE_WAITING_PRECAPTURE:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Camera2BasicFragment"


# instance fields
.field private mBackgroundHandler:Landroid/os/Handler;

.field private mBackgroundThread:Landroid/os/HandlerThread;

.field private mCameraDevice:Landroid/hardware/camera2/CameraDevice;

.field private mCameraId:Ljava/lang/String;

.field private mCameraOpenCloseLock:Ljava/util/concurrent/Semaphore;

.field private mCameraView:Ljp/f4samurai/camera/CameraViewBase;

.field private mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

.field private mFaceing:Ljava/lang/Integer;

.field private mFlashSupported:Z

.field private mImageReader:Landroid/media/ImageReader;

.field private final mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

.field private mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

.field private mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

.field private mPreviewSize:Landroid/util/Size;

.field private mScaler:Ljp/f4samurai/camera/Camera2View$CameraScaler;

.field private mSensorOrientation:I

.field private mState:I

.field private final mStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field private mSurface:Landroid/view/Surface;


# direct methods
.method static bridge synthetic -$$Nest$fgetmBackgroundHandler(Ljp/f4samurai/camera/Camera2View;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCameraDevice(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCameraOpenCloseLock(Ljp/f4samurai/camera/Camera2View;)Ljava/util/concurrent/Semaphore;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraOpenCloseLock:Ljava/util/concurrent/Semaphore;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCameraView(Ljp/f4samurai/camera/Camera2View;)Ljp/f4samurai/camera/CameraViewBase;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCaptureCallback(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmCaptureSession(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPreviewRequest(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CaptureRequest;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPreviewRequestBuilder(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmState(Ljp/f4samurai/camera/Camera2View;)I
    .locals 0

    iget p0, p0, Ljp/f4samurai/camera/Camera2View;->mState:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmSurface(Ljp/f4samurai/camera/Camera2View;)Landroid/view/Surface;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mSurface:Landroid/view/Surface;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmCameraDevice(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CameraDevice;)V
    .locals 0

    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmCaptureSession(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmPreviewRequest(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CaptureRequest;)V
    .locals 0

    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmState(Ljp/f4samurai/camera/Camera2View;I)V
    .locals 0

    iput p1, p0, Ljp/f4samurai/camera/Camera2View;->mState:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mcaptureStillPicture(Ljp/f4samurai/camera/Camera2View;)V
    .locals 0

    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->captureStillPicture()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateCameraPreviewSession(Ljp/f4samurai/camera/Camera2View;)V
    .locals 0

    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->createCameraPreviewSession()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrunPrecaptureSequence(Ljp/f4samurai/camera/Camera2View;)V
    .locals 0

    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->runPrecaptureSequence()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetAutoFlash(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    invoke-direct {p0, p1}, Ljp/f4samurai/camera/Camera2View;->setAutoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$munlockFocus(Ljp/f4samurai/camera/Camera2View;)V
    .locals 0

    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->unlockFocus()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 60
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Ljp/f4samurai/camera/Camera2View;->ORIENTATIONS:Landroid/util/SparseIntArray;

    const/4 v1, 0x0

    const/16 v2, 0x5a

    .line 63
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    const/4 v2, 0x1

    .line 64
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->append(II)V

    const/4 v1, 0x2

    const/16 v2, 0x10e

    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    const/4 v1, 0x3

    const/16 v2, 0xb4

    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 319
    invoke-direct {p0, p1, p2}, Ljp/f4samurai/camera/CameraViewBase;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    const/4 p1, 0x1

    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, p0, Ljp/f4samurai/camera/Camera2View;->mFaceing:Ljava/lang/Integer;

    .line 150
    new-instance p2, Ljp/f4samurai/camera/Camera2View$1;

    invoke-direct {p2, p0}, Ljp/f4samurai/camera/Camera2View$1;-><init>(Ljp/f4samurai/camera/Camera2View;)V

    iput-object p2, p0, Ljp/f4samurai/camera/Camera2View;->mStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 212
    new-instance p2, Ljp/f4samurai/camera/Camera2View$2;

    invoke-direct {p2, p0}, Ljp/f4samurai/camera/Camera2View$2;-><init>(Ljp/f4samurai/camera/Camera2View;)V

    iput-object p2, p0, Ljp/f4samurai/camera/Camera2View;->mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    const/4 p2, 0x0

    .line 236
    iput p2, p0, Ljp/f4samurai/camera/Camera2View;->mState:I

    .line 241
    new-instance p2, Ljava/util/concurrent/Semaphore;

    invoke-direct {p2, p1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object p2, p0, Ljp/f4samurai/camera/Camera2View;->mCameraOpenCloseLock:Ljava/util/concurrent/Semaphore;

    .line 256
    new-instance p1, Ljp/f4samurai/camera/Camera2View$3;

    invoke-direct {p1, p0}, Ljp/f4samurai/camera/Camera2View$3;-><init>(Ljp/f4samurai/camera/Camera2View;)V

    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 320
    iput-object p0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    .line 321
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->startBackgroundThread()V

    .line 322
    invoke-virtual {p0}, Ljp/f4samurai/camera/Camera2View;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Ljp/f4samurai/camera/Camera2View;->getHeight()I

    move-result p2

    invoke-direct {p0, p1, p2}, Ljp/f4samurai/camera/Camera2View;->openCamera(II)V

    return-void
.end method

.method private captureStillPicture()V
    .locals 4

    .line 730
    :try_start_0
    sget-object v0, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    if-eqz v0, :cond_2

    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    .line 734
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 735
    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 738
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 739
    invoke-direct {p0, v0}, Ljp/f4samurai/camera/Camera2View;->setAutoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 742
    sget-object v1, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v1}, Ljp/f4samurai/AppActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v1

    .line 743
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-direct {p0, v1}, Ljp/f4samurai/camera/Camera2View;->getOrientation(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 745
    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mScaler:Ljp/f4samurai/camera/Camera2View$CameraScaler;

    if-eqz v1, :cond_1

    .line 746
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mScaler:Ljp/f4samurai/camera/Camera2View$CameraScaler;

    invoke-virtual {v2}, Ljp/f4samurai/camera/Camera2View$CameraScaler;->getCurrentView()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 749
    :cond_1
    new-instance v1, Ljp/f4samurai/camera/Camera2View$5;

    invoke-direct {v1, p0}, Ljp/f4samurai/camera/Camera2View$5;-><init>(Ljp/f4samurai/camera/Camera2View;)V

    .line 768
    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 769
    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V

    .line 770
    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    :catch_0
    :cond_2
    :goto_0
    return-void
.end method

.method private static chooseOptimalSize([Landroid/util/Size;IIIILandroid/util/Size;)Landroid/util/Size;
    .locals 9

    .line 432
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 434
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 435
    invoke-virtual {p5}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 436
    invoke-virtual {p5}, Landroid/util/Size;->getHeight()I

    move-result p5

    .line 437
    array-length v3, p0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_2

    aget-object v6, p0, v5

    .line 438
    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-gt v7, p3, :cond_1

    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v7

    if-gt v7, p4, :cond_1

    .line 439
    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v7

    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v8

    mul-int v8, v8, p5

    div-int/2addr v8, v2

    if-ne v7, v8, :cond_1

    .line 440
    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-lt v7, p1, :cond_0

    .line 441
    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v7

    if-lt v7, p2, :cond_0

    .line 442
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 444
    :cond_0
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 451
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_3

    .line 452
    new-instance p0, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;

    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;-><init>()V

    invoke-static {v0, p0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/Size;

    return-object p0

    .line 453
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_4

    .line 454
    new-instance p0, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;

    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;-><init>()V

    invoke-static {v1, p0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/Size;

    return-object p0

    .line 456
    :cond_4
    aget-object p0, p0, v4

    return-object p0
.end method

.method private closeCamera()V
    .locals 3

    .line 596
    :try_start_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraOpenCloseLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 597
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 598
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 599
    iput-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 601
    :cond_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_1

    .line 602
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 603
    iput-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 605
    :cond_1
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_2

    .line 606
    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 607
    iput-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mImageReader:Landroid/media/ImageReader;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 612
    :cond_2
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraOpenCloseLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 610
    :try_start_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Interrupted while trying to lock camera closing."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 612
    :goto_0
    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mCameraOpenCloseLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 613
    throw v0
.end method

.method private createCameraPreviewSession()V
    .locals 5

    .line 644
    :try_start_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    iput-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 645
    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 647
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/view/Surface;

    const/4 v3, 0x0

    iget-object v4, p0, Ljp/f4samurai/camera/Camera2View;->mSurface:Landroid/view/Surface;

    aput-object v4, v2, v3

    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    new-instance v2, Ljp/f4samurai/camera/Camera2View$4;

    invoke-direct {v2, p0}, Ljp/f4samurai/camera/Camera2View$4;-><init>(Ljp/f4samurai/camera/Camera2View;)V

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private static getMaxPreviewAspectSize(Ljava/util/List;)Landroid/util/Size;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Landroid/util/Size;"
        }
    .end annotation

    .line 915
    new-instance v0, Landroid/util/Size;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroid/util/Size;-><init>(II)V

    .line 916
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 917
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    .line 918
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v4

    mul-int/lit16 v5, v3, 0x438

    div-int/lit16 v5, v5, 0x780

    if-ne v4, v5, :cond_0

    .line 919
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v4

    if-le v3, v4, :cond_0

    move-object v0, v2

    goto :goto_0

    .line 924
    :cond_1
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-nez v1, :cond_2

    .line 925
    new-instance v0, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;

    invoke-direct {v0}, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Landroid/util/Size;

    :cond_2
    return-object v0
.end method

.method private getOrientation(I)I
    .locals 1

    .line 786
    sget-object v0, Ljp/f4samurai/camera/Camera2View;->ORIENTATIONS:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    iget v0, p0, Ljp/f4samurai/camera/Camera2View;->mSensorOrientation:I

    add-int/2addr p1, v0

    add-int/lit16 p1, p1, 0x10e

    rem-int/lit16 p1, p1, 0x168

    return p1
.end method

.method private lockFocus()V
    .locals 4

    .line 701
    :try_start_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 703
    iput v2, p0, Ljp/f4samurai/camera/Camera2View;->mState:I

    .line 704
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private openCamera(II)V
    .locals 3

    .line 578
    invoke-direct {p0, p1, p2}, Ljp/f4samurai/camera/Camera2View;->setUpCameraOutputs(II)V

    .line 579
    sget-object p1, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    const-string p2, "camera"

    invoke-virtual {p1, p2}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CameraManager;

    .line 581
    :try_start_0
    iget-object p2, p0, Ljp/f4samurai/camera/Camera2View;->mCameraOpenCloseLock:Ljava/util/concurrent/Semaphore;

    const-wide/16 v0, 0x9c4

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v0, v1, v2}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 584
    iget-object p2, p0, Ljp/f4samurai/camera/Camera2View;->mCameraId:Ljava/lang/String;

    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2, v0, v1}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    goto :goto_0

    .line 582
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Time out waiting to lock camera opening."

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 587
    new-instance p2, Ljava/lang/RuntimeException;

    const-string v0, "Interrupted while trying to lock camera opening."

    invoke-direct {p2, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :catch_1
    :goto_0
    return-void
.end method

.method private runPrecaptureSequence()V
    .locals 4

    .line 716
    :try_start_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    const/4 v0, 0x2

    .line 718
    iput v0, p0, Ljp/f4samurai/camera/Camera2View;->mState:I

    .line 719
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private setAutoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 807
    iget-boolean v0, p0, Ljp/f4samurai/camera/Camera2View;->mFlashSupported:Z

    if-eqz v0, :cond_0

    .line 808
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private setUpCameraOutputs(II)V
    .locals 20

    move-object/from16 v0, p0

    .line 468
    sget-object v1, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    const-string v2, "camera"

    invoke-virtual {v1, v2}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraManager;

    .line 470
    :try_start_0
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_f

    aget-object v6, v2, v5

    .line 471
    invoke-virtual {v1, v6}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v7

    .line 474
    sget-object v8, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v7, v8}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    if-eqz v8, :cond_0

    .line 475
    iget-object v9, v0, Ljp/f4samurai/camera/Camera2View;->mFaceing:Ljava/lang/Integer;

    if-eq v8, v9, :cond_0

    goto :goto_1

    .line 479
    :cond_0
    sget-object v8, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v7, v8}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/hardware/camera2/params/StreamConfigurationMap;

    if-nez v8, :cond_1

    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 486
    :cond_1
    const-class v1, Landroid/view/SurfaceHolder;

    invoke-virtual {v8, v1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_2
    const/16 v5, 0x438

    const/16 v9, 0x780

    const/4 v10, 0x1

    if-ge v3, v2, :cond_3

    aget-object v11, v1, v3

    .line 487
    invoke-virtual {v11}, Landroid/util/Size;->getWidth()I

    move-result v12

    if-ne v12, v9, :cond_2

    invoke-virtual {v11}, Landroid/util/Size;->getHeight()I

    move-result v11

    if-ne v11, v5, :cond_2

    const/4 v1, 0x1

    goto :goto_3

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_3
    const/16 v2, 0x100

    if-eqz v1, :cond_4

    .line 496
    invoke-virtual {v8, v2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    new-instance v11, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;

    invoke-direct {v11}, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;-><init>()V

    invoke-static {v3, v11}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    goto :goto_4

    .line 500
    :cond_4
    invoke-virtual {v8, v2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Ljp/f4samurai/camera/Camera2View;->getMaxPreviewAspectSize(Ljava/util/List;)Landroid/util/Size;

    move-result-object v3

    .line 502
    :goto_4
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v11

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v12

    const/4 v13, 0x2

    invoke-static {v11, v12, v2, v13}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v11

    iput-object v11, v0, Ljp/f4samurai/camera/Camera2View;->mImageReader:Landroid/media/ImageReader;

    .line 503
    iget-object v12, v0, Ljp/f4samurai/camera/Camera2View;->mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    iget-object v14, v0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    invoke-virtual {v11, v12, v14}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    if-nez v1, :cond_5

    .line 505
    invoke-virtual {v8, v2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;

    invoke-direct {v3}, Ljp/f4samurai/camera/Camera2View$CompareSizesByArea;-><init>()V

    invoke-static {v2, v3}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/util/Size;

    :cond_5
    move-object/from16 v19, v3

    .line 509
    sget-object v2, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v2}, Ljp/f4samurai/AppActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v2

    .line 511
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v7, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, v0, Ljp/f4samurai/camera/Camera2View;->mSensorOrientation:I

    if-eqz v2, :cond_7

    if-eq v2, v10, :cond_6

    if-eq v2, v13, :cond_7

    const/4 v11, 0x3

    if-eq v2, v11, :cond_6

    const-string v3, "Camera2BasicFragment"

    .line 527
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Display rotation is invalid: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :cond_6
    if-eqz v3, :cond_9

    const/16 v2, 0xb4

    if-ne v3, v2, :cond_8

    goto :goto_6

    :cond_7
    const/16 v2, 0x5a

    if-eq v3, v2, :cond_9

    const/16 v2, 0x10e

    if-ne v3, v2, :cond_8

    goto :goto_6

    :cond_8
    :goto_5
    const/4 v10, 0x0

    .line 530
    :cond_9
    :goto_6
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 532
    sget-object v3, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v3}, Ljp/f4samurai/AppActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 535
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 536
    iget v11, v2, Landroid/graphics/Point;->y:I

    if-eqz v10, :cond_a

    .line 541
    iget v3, v2, Landroid/graphics/Point;->y:I

    .line 542
    iget v11, v2, Landroid/graphics/Point;->x:I

    move/from16 v16, p1

    move/from16 v15, p2

    goto :goto_7

    :cond_a
    move/from16 v15, p1

    move/from16 v16, p2

    :goto_7
    if-le v3, v9, :cond_b

    const/16 v17, 0x780

    goto :goto_8

    :cond_b
    move/from16 v17, v3

    :goto_8
    if-le v11, v5, :cond_c

    const/16 v18, 0x438

    goto :goto_9

    :cond_c
    move/from16 v18, v11

    .line 556
    :goto_9
    const-class v2, Landroid/view/SurfaceHolder;

    invoke-virtual {v8, v2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v14

    invoke-static/range {v14 .. v19}, Ljp/f4samurai/camera/Camera2View;->chooseOptimalSize([Landroid/util/Size;IIIILandroid/util/Size;)Landroid/util/Size;

    move-result-object v2

    iput-object v2, v0, Ljp/f4samurai/camera/Camera2View;->mPreviewSize:Landroid/util/Size;

    .line 560
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v7, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    if-nez v2, :cond_d

    goto :goto_a

    .line 561
    :cond_d
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    :goto_a
    iput-boolean v4, v0, Ljp/f4samurai/camera/Camera2View;->mFlashSupported:Z

    if-nez v1, :cond_e

    .line 564
    invoke-virtual/range {p0 .. p0}, Ljp/f4samurai/camera/Camera2View;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    iget-object v2, v0, Ljp/f4samurai/camera/Camera2View;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    iget-object v3, v0, Ljp/f4samurai/camera/Camera2View;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 566
    :cond_e
    iput-object v6, v0, Ljp/f4samurai/camera/Camera2View;->mCameraId:Ljava/lang/String;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_f
    return-void
.end method

.method private startBackgroundThread()V
    .locals 2

    .line 620
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "CameraBackground"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundThread:Landroid/os/HandlerThread;

    .line 621
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 622
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    return-void
.end method

.method private stopBackgroundThread()V
    .locals 1

    .line 629
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 631
    :try_start_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    const/4 v0, 0x0

    .line 632
    iput-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundThread:Landroid/os/HandlerThread;

    .line 633
    iput-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private takePicture()V
    .locals 0

    .line 692
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->lockFocus()V

    return-void
.end method

.method private unlockFocus()V
    .locals 4

    .line 796
    :try_start_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 797
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Ljp/f4samurai/camera/Camera2View;->setAutoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 798
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    const/4 v0, 0x0

    .line 800
    iput v0, p0, Ljp/f4samurai/camera/Camera2View;->mState:I

    .line 801
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method public onPause()V
    .locals 0

    .line 407
    invoke-super {p0}, Ljp/f4samurai/camera/CameraViewBase;->onPause()V

    .line 408
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->closeCamera()V

    .line 409
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->stopBackgroundThread()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 400
    invoke-super {p0}, Ljp/f4samurai/camera/CameraViewBase;->onResume()V

    .line 401
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->startBackgroundThread()V

    .line 402
    invoke-virtual {p0}, Ljp/f4samurai/camera/Camera2View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Ljp/f4samurai/camera/Camera2View;->getHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Ljp/f4samurai/camera/Camera2View;->openCamera(II)V

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 117
    invoke-super {p0, p1, p2, p3, p4}, Ljp/f4samurai/camera/CameraViewBase;->surfaceChanged(Landroid/view/SurfaceHolder;III)V

    .line 118
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mSurface:Landroid/view/Surface;

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 111
    invoke-super {p0, p1}, Ljp/f4samurai/camera/CameraViewBase;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 112
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mSurface:Landroid/view/Surface;

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 123
    invoke-super {p0, p1}, Ljp/f4samurai/camera/CameraViewBase;->surfaceDestroyed(Landroid/view/SurfaceHolder;)V

    .line 124
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->closeCamera()V

    return-void
.end method

.method public swap()V
    .locals 9

    .line 328
    sget-object v0, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    const-string v1, "camera"

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 330
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    const/4 v6, 0x1

    if-ge v4, v2, :cond_1

    aget-object v7, v1, v4

    .line 331
    invoke-virtual {v0, v7}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v7

    .line 332
    sget-object v8, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v7, v8}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    if-eqz v7, :cond_0

    .line 333
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v7, :cond_0

    const/4 v5, 0x1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    if-nez v5, :cond_2

    return-void

    .line 343
    :cond_2
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mFaceing:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v6, :cond_3

    .line 344
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mFaceing:Ljava/lang/Integer;

    goto :goto_1

    .line 346
    :cond_3
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mFaceing:Ljava/lang/Integer;

    .line 348
    :goto_1
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->closeCamera()V

    .line 349
    invoke-virtual {p0}, Ljp/f4samurai/camera/Camera2View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Ljp/f4samurai/camera/Camera2View;->getHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Ljp/f4samurai/camera/Camera2View;->openCamera(II)V

    :catch_0
    return-void
.end method

.method public takeScreenShot()V
    .locals 0

    .line 394
    invoke-direct {p0}, Ljp/f4samurai/camera/Camera2View;->takePicture()V

    .line 395
    invoke-super {p0}, Ljp/f4samurai/camera/CameraViewBase;->takeScreenShot()V

    return-void
.end method

.method public zoom(F)V
    .locals 11

    .line 354
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 355
    sget-object v1, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v1}, Ljp/f4samurai/AppActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    const/4 v1, 0x0

    .line 360
    :try_start_0
    sget-object v2, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "camera"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/CameraManager;

    .line 361
    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View;->mCameraId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v2

    .line 362
    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Rect;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 363
    :try_start_1
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_MAX_DIGITAL_ZOOM:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v2, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v2

    move-object v3, v1

    move-object v1, v2

    .line 365
    :goto_0
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    const/high16 v1, 0x3f800000    # 1.0f

    .line 368
    :goto_1
    new-instance v2, Ljp/f4samurai/camera/Camera2View$CameraScaler;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v8

    iget v9, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v10, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    move-object v4, v2

    move-object v5, p0

    move v6, v1

    invoke-direct/range {v4 .. v10}, Ljp/f4samurai/camera/Camera2View$CameraScaler;-><init>(Ljp/f4samurai/camera/Camera2View;FIIII)V

    iput-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mScaler:Ljp/f4samurai/camera/Camera2View$CameraScaler;

    .line 369
    sget-object v0, Ljp/f4samurai/camera/Camera2View;->mActivity:Ljp/f4samurai/AppActivity;

    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "camera"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 372
    :try_start_2
    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCameraId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;
    :try_end_2
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_2 .. :try_end_2} :catch_3

    .line 377
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View;->mScaler:Ljp/f4samurai/camera/Camera2View$CameraScaler;

    if-eqz v0, :cond_0

    .line 378
    monitor-enter v0

    .line 379
    :try_start_3
    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mScaler:Ljp/f4samurai/camera/Camera2View$CameraScaler;

    const v3, 0x3dcccccd    # 0.1f

    sub-float/2addr v1, v3

    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-virtual {v2, p1}, Ljp/f4samurai/camera/Camera2View$CameraScaler;->zoom(F)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 381
    :try_start_4
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mScaler:Ljp/f4samurai/camera/Camera2View$CameraScaler;

    invoke-virtual {v2}, Ljp/f4samurai/camera/Camera2View$CameraScaler;->getCurrentView()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 382
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 383
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Ljp/f4samurai/camera/Camera2View;->setAutoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 384
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 385
    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View;->mBackgroundHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_4
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 388
    :catch_2
    :try_start_5
    monitor-exit v0

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p1

    :catch_3
    :cond_0
    :goto_2
    return-void
.end method
