.class Ljp/f4samurai/camera/CameraViewBase$4;
.super Ljava/lang/Object;
.source "CameraViewBase.java"

# interfaces
.implements Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/camera/CameraViewBase;
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

    .line 262
    iput-object p1, p0, Ljp/f4samurai/camera/CameraViewBase$4;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGLCaptureReady(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 265
    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$4;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    iput-object p1, v0, Ljp/f4samurai/camera/CameraViewBase;->mGLBitmap:Landroid/graphics/Bitmap;

    return-void
.end method
