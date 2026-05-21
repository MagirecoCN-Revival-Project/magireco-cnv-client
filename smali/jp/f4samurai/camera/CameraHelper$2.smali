.class Ljp/f4samurai/camera/CameraHelper$2;
.super Ljava/lang/Object;
.source "CameraHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/CameraHelper;->add()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 62
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;

    move-result-object v0

    if-nez v0, :cond_1

    .line 63
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    const-string v1, "android.permission.CAMERA"

    invoke-static {v0, v1}, Ljp/f4samurai/utils/RuntimePermissionUtils;->hasSelfPermissions(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetmCameraCallback()Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Ljp/f4samurai/utils/RuntimePermissionUtils;->requestPermission(Ljp/f4samurai/AppActivity;Ljava/lang/String;ILjp/f4samurai/utils/RuntimePermissionUtils$Callback;)V

    return-void

    .line 68
    :cond_0
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->launch()V

    :cond_1
    return-void
.end method
