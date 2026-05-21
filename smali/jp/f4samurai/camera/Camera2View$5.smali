.class Ljp/f4samurai/camera/Camera2View$5;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "Camera2View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/Camera2View;->captureStillPicture()V
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

    .line 749
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$5;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 0

    .line 755
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$5;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$munlockFocus(Ljp/f4samurai/camera/Camera2View;)V

    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 0

    .line 762
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 763
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$5;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-virtual {p1}, Ljp/f4samurai/camera/Camera2View;->terminateScreenShot()V

    const/4 p1, 0x0

    const-string p2, "\u64ae\u5f71\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002"

    .line 764
    invoke-static {p1, p2}, Ljp/f4samurai/camera/CameraHelper;->_storeCallback(ZLjava/lang/String;)V

    return-void
.end method
