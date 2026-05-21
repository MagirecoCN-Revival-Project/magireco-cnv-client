.class Ljp/f4samurai/camera/Camera2View$2;
.super Ljava/lang/Object;
.source "Camera2View.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


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

    .line 213
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$2;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 3

    .line 216
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$2;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmBackgroundHandler(Ljp/f4samurai/camera/Camera2View;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Ljp/f4samurai/camera/Camera2View$ImageSaver;

    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    iget-object v2, p0, Ljp/f4samurai/camera/Camera2View$2;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v2}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmCameraView(Ljp/f4samurai/camera/Camera2View;)Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Ljp/f4samurai/camera/Camera2View$ImageSaver;-><init>(Landroid/media/Image;Ljp/f4samurai/camera/CameraViewBase;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
