.class Ljp/f4samurai/camera/CameraHelper$6;
.super Ljava/lang/Object;
.source "CameraHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/CameraHelper;->takeScreenShot()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 112
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 113
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v0

    invoke-virtual {v0}, Ljp/f4samurai/camera/CameraViewBase;->takeScreenShot()V

    :cond_0
    return-void
.end method
