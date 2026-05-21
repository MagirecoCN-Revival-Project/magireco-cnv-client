.class Ljp/f4samurai/camera/Camera2View$ImageSaver;
.super Ljava/lang/Object;
.source "Camera2View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/camera/Camera2View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImageSaver"
.end annotation


# instance fields
.field private mCameraView:Ljp/f4samurai/camera/CameraViewBase;

.field private final mImage:Landroid/media/Image;


# direct methods
.method constructor <init>(Landroid/media/Image;Ljp/f4samurai/camera/CameraViewBase;)V
    .locals 0

    .line 824
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 825
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$ImageSaver;->mImage:Landroid/media/Image;

    .line 826
    iput-object p2, p0, Ljp/f4samurai/camera/Camera2View$ImageSaver;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 831
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$ImageSaver;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 832
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    new-array v3, v2, [B

    .line 833
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 834
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v4, 0x1

    .line 835
    iput v4, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 836
    invoke-static {v3, v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 837
    iget-object v1, p0, Ljp/f4samurai/camera/Camera2View$ImageSaver;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    invoke-virtual {v1}, Ljp/f4samurai/camera/CameraViewBase;->getGLSurfaceView()Landroid/opengl/GLSurfaceView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/opengl/GLSurfaceView;->getWidth()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Ljp/f4samurai/camera/CameraViewBase;->resize(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 838
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 839
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$ImageSaver;->mCameraView:Ljp/f4samurai/camera/CameraViewBase;

    invoke-virtual {v0, v1}, Ljp/f4samurai/camera/CameraViewBase;->setPhotoBitmap(Landroid/graphics/Bitmap;)V

    .line 840
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$ImageSaver;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    return-void
.end method
