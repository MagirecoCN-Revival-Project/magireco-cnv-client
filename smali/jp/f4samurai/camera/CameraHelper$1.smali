.class Ljp/f4samurai/camera/CameraHelper$1;
.super Ljava/lang/Object;
.source "CameraHelper.java"

# interfaces
.implements Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/camera/CameraHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDenied()V
    .locals 2

    const/4 v0, 0x0

    const-string v1, "\u30ab\u30e1\u30e9\u3078\u306e\u30a2\u30af\u30bb\u30b9\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002<br>\u7aef\u672b\u306e\u300c\u8a2d\u5b9a\u300d->\u300c\u30a2\u30d7\u30ea\u300d->\u300c\u30de\u30ae\u30ec\u30b3\u300d->\u300c\u6a29\u9650\u300d\u3092\u9078\u629e\u3057\u3066<br>\u30ab\u30e1\u30e9\u30a2\u30af\u30bb\u30b9\u3092\u8a31\u53ef\u3057\u3066\u4e0b\u3055\u3044\u3002"

    .line 40
    invoke-static {v0, v1}, Ljp/f4samurai/camera/CameraHelper;->_launchCallback(ZLjava/lang/String;)V

    return-void
.end method

.method public onGranted()V
    .locals 2

    .line 28
    invoke-static {}, Ljp/f4samurai/camera/CameraHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$1$1;

    invoke-direct {v1, p0}, Ljp/f4samurai/camera/CameraHelper$1$1;-><init>(Ljp/f4samurai/camera/CameraHelper$1;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
