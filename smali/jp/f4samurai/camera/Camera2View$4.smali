.class Ljp/f4samurai/camera/Camera2View$4;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "Camera2View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/Camera2View;->createCameraPreviewSession()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/camera/Camera2View;


# direct methods
.method constructor <init>(Ljp/f4samurai/camera/Camera2View;)V
    .locals 0

    .line 648
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 678
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCaptureSession(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCaptureSession(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 679
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmCaptureSession(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CameraCaptureSession;)V

    :cond_0
    return-void
.end method

.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    const/4 p1, 0x0

    const-string v0, "\u30ab\u30e1\u30e9\u306e\u8d77\u52d5\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002"

    .line 673
    invoke-static {p1, v0}, Ljp/f4samurai/camera/CameraHelper;->_launchCallback(ZLjava/lang/String;)V

    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3

    .line 653
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCameraDevice(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 658
    :cond_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0, p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmCaptureSession(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CameraCaptureSession;)V

    const/4 p1, 0x1

    :try_start_0
    const-string v0, "\u30ab\u30e1\u30e9\u306e\u8d77\u52d5\u306b\u6210\u529f\u3057\u307e\u3057\u305f\u3002"

    .line 660
    invoke-static {p1, v0}, Ljp/f4samurai/camera/CameraHelper;->_launchCallback(ZLjava/lang/String;)V

    .line 662
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmPreviewRequestBuilder(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 664
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmPreviewRequestBuilder(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    invoke-static {p1, v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$msetAutoFlash(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 666
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmPreviewRequestBuilder(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    invoke-static {p1, v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmPreviewRequest(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CaptureRequest;)V

    .line 667
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCaptureSession(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object p1

    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmPreviewRequest(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCaptureCallback(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v1

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View$4;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v2}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmBackgroundHandler(Ljp/f4samurai/camera/Camera2View;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
