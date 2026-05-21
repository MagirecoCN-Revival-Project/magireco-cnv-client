.class Ljp/f4samurai/camera/Camera2View$1$1;
.super Ljava/lang/Object;
.source "Camera2View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/Camera2View$1;->onOpened(Landroid/hardware/camera2/CameraDevice;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Ljp/f4samurai/camera/Camera2View$1;

.field final synthetic val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Ljp/f4samurai/camera/Camera2View$1;Landroid/os/Handler;)V
    .locals 0

    .line 159
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$1$1;->this$1:Ljp/f4samurai/camera/Camera2View$1;

    iput-object p2, p0, Ljp/f4samurai/camera/Camera2View$1$1;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 162
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$1$1;->this$1:Ljp/f4samurai/camera/Camera2View$1;

    iget-object v0, v0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCameraDevice(Ljp/f4samurai/camera/Camera2View;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$1$1;->this$1:Ljp/f4samurai/camera/Camera2View$1;

    iget-object v0, v0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmSurface(Ljp/f4samurai/camera/Camera2View;)Landroid/view/Surface;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$1$1;->this$1:Ljp/f4samurai/camera/Camera2View$1;

    iget-object v0, v0, Ljp/f4samurai/camera/Camera2View$1;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$mcreateCameraPreviewSession(Ljp/f4samurai/camera/Camera2View;)V

    return-void

    .line 166
    :cond_0
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$1$1;->val$handler:Landroid/os/Handler;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
