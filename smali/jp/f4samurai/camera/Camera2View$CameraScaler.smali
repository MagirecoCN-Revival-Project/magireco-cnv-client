.class public Ljp/f4samurai/camera/Camera2View$CameraScaler;
.super Ljava/lang/Object;
.source "Camera2View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/camera/Camera2View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CameraScaler"
.end annotation


# instance fields
.field private final X_MIN:I

.field private final Y_MIN:I

.field private final ZOOM_MIN:F

.field private current_rect:Landroid/graphics/Rect;

.field final synthetic this$0:Ljp/f4samurai/camera/Camera2View;

.field private xCenter:I

.field private xMax:I

.field private yCenter:I

.field private yMax:I

.field private zoomCurrent:F

.field private zoomMax:F


# direct methods
.method public constructor <init>(Ljp/f4samurai/camera/Camera2View;FIIII)V
    .locals 0

    .line 872
    iput-object p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->this$0:Ljp/f4samurai/camera/Camera2View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 p1, 0x3f800000    # 1.0f

    .line 860
    iput p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->ZOOM_MIN:F

    const/4 p5, 0x0

    .line 861
    iput p5, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->X_MIN:I

    .line 862
    iput p5, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->Y_MIN:I

    .line 873
    iput p3, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->xMax:I

    .line 874
    iput p4, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->yMax:I

    .line 875
    iput p2, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->zoomMax:F

    .line 877
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, p5, p5, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p2, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->current_rect:Landroid/graphics/Rect;

    .line 878
    iput p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->zoomCurrent:F

    .line 879
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    iput p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->xCenter:I

    .line 880
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->current_rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result p1

    iput p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->yCenter:I

    return-void
.end method


# virtual methods
.method public getCurrentView()Landroid/graphics/Rect;
    .locals 1

    .line 909
    iget-object v0, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->current_rect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public zoom(F)V
    .locals 6

    .line 884
    iget v0, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->zoomCurrent:F

    mul-float v1, v0, p1

    iget v2, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->zoomMax:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_4

    mul-float v1, v0, p1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_4

    mul-float v0, v0, p1

    .line 885
    iput v0, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->zoomCurrent:F

    .line 886
    iget p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->xMax:I

    int-to-float p1, p1

    div-float/2addr p1, v0

    float-to-double v0, p1

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int p1, v0

    .line 887
    iget v0, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->yMax:I

    int-to-float v0, v0

    iget v1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->zoomCurrent:F

    div-float/2addr v0, v1

    float-to-double v0, v0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    .line 888
    iget v1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->xCenter:I

    .line 889
    iget v2, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->yCenter:I

    add-int v3, v1, p1

    .line 892
    iget v4, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->xMax:I

    if-le v3, v4, :cond_0

    sub-int v1, v4, p1

    goto :goto_0

    :cond_0
    sub-int v3, v1, p1

    if-gez v3, :cond_1

    move v1, p1

    :cond_1
    :goto_0
    add-int v3, v2, v0

    .line 897
    iget v4, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->yMax:I

    if-le v3, v4, :cond_2

    sub-int v2, v4, v0

    goto :goto_1

    :cond_2
    sub-int v3, v2, v0

    if-gez v3, :cond_3

    move v2, v0

    .line 902
    :cond_3
    :goto_1
    iget-object v3, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->current_rect:Landroid/graphics/Rect;

    sub-int v4, v1, p1

    sub-int v5, v2, v0

    add-int/2addr v1, p1

    add-int/2addr v2, v0

    invoke-virtual {v3, v4, v5, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 903
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->current_rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    iput p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->xCenter:I

    .line 904
    iget-object p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->current_rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result p1

    iput p1, p0, Ljp/f4samurai/camera/Camera2View$CameraScaler;->yCenter:I

    :cond_4
    return-void
.end method
