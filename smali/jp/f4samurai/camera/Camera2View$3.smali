.class Ljp/f4samurai/camera/Camera2View$3;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "Camera2View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/camera/Camera2View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/camera/Camera2View;


# direct methods
.method constructor <init>(Ljp/f4samurai/camera/Camera2View;)V
    .locals 0

    .line 256
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method

.method private process(Landroid/hardware/camera2/CaptureResult;)V
    .locals 5

    .line 259
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {v0}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fgetmState(Ljp/f4samurai/camera/Camera2View;)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x2

    const/4 v3, 0x5

    const/4 v4, 0x4

    if-eq v0, v1, :cond_4

    const/4 v1, 0x3

    if-eq v0, v2, :cond_2

    if-eq v0, v1, :cond_0

    goto/16 :goto_1

    .line 292
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_1

    .line 293
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-eq p1, v3, :cond_9

    .line 294
    :cond_1
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1, v4}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmState(Ljp/f4samurai/camera/Camera2View;I)V

    .line 295
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$mcaptureStillPicture(Ljp/f4samurai/camera/Camera2View;)V

    goto :goto_1

    .line 282
    :cond_2
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_3

    .line 284
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v3, :cond_3

    .line 285
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v4, :cond_9

    .line 286
    :cond_3
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1, v1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmState(Ljp/f4samurai/camera/Camera2View;I)V

    goto :goto_1

    .line 265
    :cond_4
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_5

    .line 267
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$mcaptureStillPicture(Ljp/f4samurai/camera/Camera2View;)V

    goto :goto_1

    .line 268
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v4, v1, :cond_6

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v3, v0, :cond_9

    .line 270
    :cond_6
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_8

    .line 271
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v2, :cond_7

    goto :goto_0

    .line 275
    :cond_7
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$mrunPrecaptureSequence(Ljp/f4samurai/camera/Camera2View;)V

    goto :goto_1

    .line 272
    :cond_8
    :goto_0
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1, v4}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$fputmState(Ljp/f4samurai/camera/Camera2View;I)V

    .line 273
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$3;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-static {p1}, Ljp/f4samurai/camera/Camera2View;->-$$Nest$mcaptureStillPicture(Ljp/f4samurai/camera/Camera2View;)V

    :cond_9
    :goto_1
    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 0

    .line 313
    invoke-direct {p0, p3}, Ljp/f4samurai/camera/Camera2View$3;->process(Landroid/hardware/camera2/CaptureResult;)V

    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0

    .line 306
    invoke-direct {p0, p3}, Ljp/f4samurai/camera/Camera2View$3;->process(Landroid/hardware/camera2/CaptureResult;)V

    return-void
.end method
