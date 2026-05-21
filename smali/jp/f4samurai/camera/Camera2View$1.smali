.class Ljp/f4samurai/camera/Camera2View$1;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "Camera2View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/camera/Camera2View;
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

    .line 150
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 0

    .line 174
    invoke-super {p0, p1}, Landroid/hardware/camera2/CameraDevice$StateCallback;->onClosed(Landroid/hardware/camera2/CameraDevice;)V

    return-void
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 1

    .line 179
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCameraOpenCloseLock(Ljp/f4samurai/camera/Camera2View;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 180
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 181
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmCameraDevice(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CameraDevice;)V

    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 0

    .line 186
    iget-object p2, p0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p2}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCameraOpenCloseLock(Ljp/f4samurai/camera/Camera2View;)Ljava/util/concurrent/Semaphore;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 187
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 188
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmCameraDevice(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CameraDevice;)V

    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 3

    .line 155
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCameraOpenCloseLock(Ljp/f4samurai/camera/Camera2View;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 156
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0, p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmCameraDevice(Ljp/f4samurai/camera/Camera2View;Landroid/hardware/camera2/CameraDevice;)V

    .line 158
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 159
    new-instance v0, Ljp/f4samurai/camera/Camera2View$1$1;

    invoke-direct {v0, p0, p1}, Ljp/f4samurai/camera/Camera2View$1$1;-><init>(Ljp/f4samurai/camera/Camera2View$1;Landroid/os/Handler;)V

    const-wide/16 v1, 0x64

    .line 169
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
