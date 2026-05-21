.class Ljp/f4samurai/camera/CameraViewBase$3;
.super Ljava/lang/Object;
.source "CameraViewBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/camera/CameraViewBase;->captureGL(Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/camera/CameraViewBase;

.field final synthetic val$callback:Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;


# direct methods
.method constructor <init>(Ljp/f4samurai/camera/CameraViewBase;Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;)V
    .locals 0

    .line 219
    iput-object p1, p0, Ljp/f4samurai/camera/CameraViewBase$3;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    iput-object p2, p0, Ljp/f4samurai/camera/CameraViewBase$3;->val$callback:Ljp/f4samurai/camera/CameraViewBase$GLCaptureReadyCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 222
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 223
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljavax/microedition/khronos/opengles/GL10;

    .line 224
    iget-object v1, p0, Ljp/f4samurai/camera/CameraViewBase$3;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    iget-object v0, v1, Ljp/f4samurai/camera/CameraViewBase;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->getWidth()I

    move-result v4

    iget-object v0, p0, Ljp/f4samurai/camera/CameraViewBase$3;->this$0:Ljp/f4samurai/camera/CameraViewBase;

    iget-object v0, v0, Ljp/f4samurai/camera/CameraViewBase;->mGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->getHeight()I

    move-result v5

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Ljp/f4samurai/camera/CameraViewBase;->createBitmapFromGLSurface(IIIILjavax/microedition/khronos/opengles/GL10;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 226
    sget-object v1, Ljp/f4samurai/camera/CameraViewBase;->mActivity:Ljp/f4samurai/AppActivity;

    new-instance v2, Ljp/f4samurai/camera/CameraViewBase$3$1;

    invoke-direct {v2, p0, v0}, Ljp/f4samurai/camera/CameraViewBase$3$1;-><init>(Ljp/f4samurai/camera/CameraViewBase$3;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
