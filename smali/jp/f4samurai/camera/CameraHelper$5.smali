.class Ljp/f4samurai/camera/CameraHelper$5;
.super Ljava/lang/Object;
.source "CameraHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/CameraHelper;->zoom(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ratio:F


# direct methods
.method constructor <init>(F)V
    .locals 0

    .line 98
    iput p1, p0, Ljp/f4samurai/camera/CameraHelper$5;->val$ratio:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 101
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 102
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v0

    iget v1, p0, Ljp/f4samurai/camera/CameraHelper$5;->val$ratio:F

    invoke-virtual {v0, v1}, Ljp/f4samurai/camera/CameraViewBase;->zoom(F)V

    :cond_0
    return-void
.end method
