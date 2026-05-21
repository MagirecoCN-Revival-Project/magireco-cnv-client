.class Ljp/f4samurai/camera/CameraHelper$3;
.super Ljava/lang/Object;
.source "CameraHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/CameraHelper;->remove()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 78
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 79
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmFrameLayout()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    .line 80
    invoke-static {v0}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfputmCameraView(Ljp/f4samurai/camera/CameraViewBase;)V

    :cond_0
    return-void
.end method
