.class public Ljp/f4samurai/camera/CameraHelper;
.super Ljava/lang/Object;
.source "CameraHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraHelper"

.field private static mCameraCallback:Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

.field private static mCameraView:Ljp/f4samurai/camera/CameraViewBase;

.field private static mFrameLayout:Landroid/widget/FrameLayout;

.field private static sAppActivity:Ljp/f4samurai/AppActivity;


# direct methods
.method static bridge synthetic -$$Nest$sfgetmCameraCallback()Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;
    .locals 1

    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->mCameraCallback:Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetmCameraView()Ljp/f4samurai/camera/CameraViewBase;
    .locals 1

    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetmFrameLayout()Landroid/widget/FrameLayout;
    .locals 1

    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;
    .locals 1

    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputmCameraView(Ljp/f4samurai/camera/CameraViewBase;)V
    .locals 0

    sput-object p0, Ljp/f4samurai/camera/CameraHelper;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 25
    new-instance v0, Ljp/f4samurai/camera/CameraHelper$1;

    invoke-direct {v0}, Ljp/f4samurai/camera/CameraHelper$1;-><init>()V

    sput-object v0, Ljp/f4samurai/camera/CameraHelper;->mCameraCallback:Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    sput-object p1, Ljp/f4samurai/camera/CameraHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    .line 22
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Ljp/f4samurai/AppActivity;

    sput-object p1, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-void
.end method

.method public static _launchCallback(ZLjava/lang/String;)V
    .locals 0

    .line 144
    invoke-static {p0, p1}, Ljp/f4samurai/camera/CameraHelper;->launchCallback(ZLjava/lang/String;)V

    return-void
.end method

.method public static _storeCallback(ZLjava/lang/String;)V
    .locals 0

    .line 150
    invoke-static {p0, p1}, Ljp/f4samurai/camera/CameraHelper;->storeCallback(ZLjava/lang/String;)V

    return-void
.end method

.method public static add()V
    .locals 2

    .line 59
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$2;

    invoke-direct {v1}, Ljp/f4samurai/camera/CameraHelper$2;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static launch()V
    .locals 3

    .line 45
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 46
    new-instance v0, Ljp/f4samurai/camera/Camera2View;

    sget-object v1, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    sget-object v2, Ljp/f4samurai/camera/CameraHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    invoke-direct {v0, v1, v2}, Ljp/f4samurai/camera/Camera2View;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    sput-object v0, Ljp/f4samurai/camera/CameraHelper;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    goto :goto_0

    .line 48
    :cond_0
    new-instance v0, Ljp/f4samurai/camera/CameraView;

    sget-object v1, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    sget-object v2, Ljp/f4samurai/camera/CameraHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    invoke-direct {v0, v1, v2}, Ljp/f4samurai/camera/CameraView;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    sput-object v0, Ljp/f4samurai/camera/CameraHelper;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    .line 55
    :goto_0
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    sget-object v1, Ljp/f4samurai/camera/CameraHelper;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public static native launchCallback(ZLjava/lang/String;)V
.end method

.method public static onPause()V
    .locals 2

    .line 120
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$7;

    invoke-direct {v1}, Ljp/f4samurai/camera/CameraHelper$7;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static onResume()V
    .locals 2

    .line 131
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$8;

    invoke-direct {v1}, Ljp/f4samurai/camera/CameraHelper$8;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static remove()V
    .locals 2

    .line 75
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$3;

    invoke-direct {v1}, Ljp/f4samurai/camera/CameraHelper$3;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static native storeCallback(ZLjava/lang/String;)V
.end method

.method public static swap()V
    .locals 2

    .line 87
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$4;

    invoke-direct {v1}, Ljp/f4samurai/camera/CameraHelper$4;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static takeScreenShot()V
    .locals 2

    .line 109
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$6;

    invoke-direct {v1}, Ljp/f4samurai/camera/CameraHelper$6;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static zoom(F)V
    .locals 2

    .line 98
    sget-object v0, Ljp/f4samurai/camera/CameraHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/camera/CameraHelper$5;

    invoke-direct {v1, p0}, Ljp/f4samurai/camera/CameraHelper$5;-><init>(F)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
