.class Ljp/f4samurai/camera/CameraHelper$1$1;
.super Ljava/lang/Object;
.source "CameraHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/CameraHelper$1;->onGranted()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/camera/CameraHelper$1;


# direct methods
.method constructor <init>(Ljp/f4samurai/camera/CameraHelper$1;)V
    .locals 0

    .line 28
    iput-object p1, p0, Ljp/f4samurai/camera/CameraHelper$1$1;->this$0:Ljp/f4samurai/camera/CameraHelper$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 31
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v0

    if-nez v0, :cond_0

    .line 32
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->launch()V

    :cond_0
    return-void
.end method
