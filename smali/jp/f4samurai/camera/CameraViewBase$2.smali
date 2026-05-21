.class Ljp/f4samurai/camera/CameraViewBase$2;
.super Ljava/lang/Object;
.source "CameraViewBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/CameraViewBase;->takeScreenShot()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/camera/CameraViewBase;


# direct methods
.method constructor <init>(Ljp/f4samurai/camera/CameraViewBase;)V
    .locals 0

    .line 105
    iput-object p1, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 108
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    iget-object v0, v0, Ljp/f4samurai/camera/CameraViewBase;->mPhotoBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    iget-object v0, v0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 109
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    invoke-virtual {v0}, Ljp/f4samurai/camera/CameraViewBase;->synthesizeBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, v0, Ljp/f4samurai/camera/CameraViewBase;->mSynthesizedBitmap:Landroid/graphics/Bitmap;

    .line 110
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_1

    .line 112
    sget-object v0, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Ljp/f4samurai/utils/RuntimePermissionUtils;->hasSelfPermissions(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    sget-object v0, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    const/4 v2, 0x2

    iget-object v3, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    invoke-static {v3}, Ljp/f4samurai/camera/CameraViewBase;->-$$Nest$fgetmStoreCaptureCallback(Ljp/f4samurai/camera/CameraViewBase;)Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Ljp/f4samurai/utils/RuntimePermissionUtils;->requestPermission(Ljp/f4samurai/AppActivity;Ljava/lang/String;ILjp/f4samurai/utils/RuntimePermissionUtils$Callback;)V

    return-void

    .line 117
    :cond_0
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    invoke-static {v0}, Ljp/f4samurai/camera/CameraViewBase;->-$$Nest$mstoreCapture(Ljp/f4samurai/camera/CameraViewBase;)V

    goto :goto_0

    .line 121
    :cond_1
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    invoke-static {v0}, Ljp/f4samurai/camera/CameraViewBase;->-$$Nest$mstoreCaptureByMediaApi(Ljp/f4samurai/camera/CameraViewBase;)V

    :goto_0
    return-void

    .line 125
    :cond_2
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$2;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    iget-object v0, v0, Ljp/f4samurai/camera/CameraViewBase;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
