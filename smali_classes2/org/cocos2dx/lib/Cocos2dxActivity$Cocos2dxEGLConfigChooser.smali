.class Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;
.super Ljava/lang/Object;
.source "Cocos2dxActivity.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$EGLConfigChooser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Cocos2dxEGLConfigChooser"
.end annotation


# instance fields
.field private final EGL_OPENGL_ES2_BIT:I

.field private final EGL_OPENGL_ES3_BIT:I

.field private mConfigAttributes:[I

.field final synthetic this$0:Lorg/cocos2dx/lib/Cocos2dxActivity;


# direct methods
.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxActivity;IIIIIII)V
    .locals 2

    .line 392
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->this$0:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x4

    .line 389
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->EGL_OPENGL_ES2_BIT:I

    const/16 v0, 0x40

    .line 390
    iput v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->EGL_OPENGL_ES3_BIT:I

    const/4 v0, 0x7

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p2, v0, v1

    const/4 p2, 0x1

    aput p3, v0, p2

    const/4 p2, 0x2

    aput p4, v0, p2

    const/4 p2, 0x3

    aput p5, v0, p2

    aput p6, v0, p1

    const/4 p1, 0x5

    aput p7, v0, p1

    const/4 p1, 0x6

    aput p8, v0, p1

    .line 393
    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->mConfigAttributes:[I

    return-void
.end method

.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxActivity;[I)V
    .locals 0

    .line 396
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->this$0:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x4

    .line 389
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->EGL_OPENGL_ES2_BIT:I

    const/16 p1, 0x40

    .line 390
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->EGL_OPENGL_ES3_BIT:I

    .line 397
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->mConfigAttributes:[I

    return-void
.end method

.method private doChooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[I)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 8

    const/4 v0, 0x1

    new-array v7, v0, [Ljavax/microedition/khronos/egl/EGLConfig;

    new-array v0, v0, [I

    const/4 v5, 0x1

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, v7

    move-object v6, v0

    .line 464
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    aget p2, v0, p1

    if-lez p2, :cond_0

    aget-object p1, v7, p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 28

    move-object/from16 v0, p0

    const/4 v1, 0x4

    new-array v2, v1, [[I

    const/16 v3, 0x13

    new-array v4, v3, [I

    const/4 v5, 0x0

    const/16 v6, 0x3024

    aput v6, v4, v5

    .line 403
    iget-object v7, v0, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->mConfigAttributes:[I

    aget v8, v7, v5

    const/4 v9, 0x1

    aput v8, v4, v9

    const/4 v8, 0x2

    const/16 v10, 0x3023

    aput v10, v4, v8

    aget v11, v7, v9

    const/4 v12, 0x3

    aput v11, v4, v12

    const/16 v11, 0x3022

    aput v11, v4, v1

    aget v13, v7, v8

    const/4 v14, 0x5

    aput v13, v4, v14

    const/4 v13, 0x6

    const/16 v15, 0x3021

    aput v15, v4, v13

    aget v16, v7, v12

    const/16 v17, 0x7

    aput v16, v4, v17

    const/16 v16, 0x8

    const/16 v18, 0x3025

    aput v18, v4, v16

    aget v19, v7, v1

    const/16 v20, 0x9

    aput v19, v4, v20

    const/16 v19, 0xa

    const/16 v21, 0x3026

    aput v21, v4, v19

    aget v22, v7, v14

    const/16 v23, 0xb

    aput v22, v4, v23

    const/16 v22, 0xc

    const/16 v24, 0x3032

    aput v24, v4, v22

    .line 412
    aget v25, v7, v13

    if-lez v25, :cond_0

    const/16 v25, 0x1

    goto :goto_0

    :cond_0
    const/16 v25, 0x0

    :goto_0
    const/16 v26, 0xd

    aput v25, v4, v26

    const/16 v25, 0xe

    const/16 v26, 0x3031

    aput v26, v4, v25

    const/16 v25, 0xf

    aget v26, v7, v13

    aput v26, v4, v25

    const/16 v25, 0x3040

    const/16 v26, 0x10

    aput v25, v4, v26

    const/16 v25, 0x11

    aput v1, v4, v25

    const/16 v25, 0x12

    const/16 v27, 0x3038

    aput v27, v4, v25

    aput-object v4, v2, v5

    new-array v4, v3, [I

    aput v6, v4, v5

    aget v25, v7, v5

    aput v25, v4, v9

    aput v10, v4, v8

    aget v25, v7, v9

    aput v25, v4, v12

    aput v11, v4, v1

    aget v25, v7, v8

    aput v25, v4, v14

    aput v15, v4, v13

    aget v25, v7, v12

    aput v25, v4, v17

    aput v18, v4, v16

    .line 423
    aget v15, v7, v1

    const/16 v11, 0x18

    if-lt v15, v11, :cond_1

    const/16 v11, 0x10

    goto :goto_1

    :cond_1
    aget v11, v7, v1

    :goto_1
    aput v11, v4, v20

    aput v21, v4, v19

    aget v11, v7, v14

    aput v11, v4, v23

    aput v24, v4, v22

    const/16 v11, 0xd

    .line 425
    aget v15, v7, v13

    if-lez v15, :cond_2

    const/4 v15, 0x1

    goto :goto_2

    :cond_2
    const/4 v15, 0x0

    :goto_2
    aput v15, v4, v11

    const/16 v11, 0xe

    const/16 v15, 0x3031

    aput v15, v4, v11

    const/16 v11, 0xf

    aget v15, v7, v13

    aput v15, v4, v11

    const/16 v11, 0x3040

    aput v11, v4, v26

    const/16 v11, 0x11

    aput v1, v4, v11

    const/16 v11, 0x12

    const/16 v15, 0x3038

    aput v15, v4, v11

    aput-object v4, v2, v9

    new-array v3, v3, [I

    aput v6, v3, v5

    aget v4, v7, v5

    aput v4, v3, v9

    aput v10, v3, v8

    aget v4, v7, v9

    aput v4, v3, v12

    const/16 v4, 0x3022

    aput v4, v3, v1

    aget v4, v7, v8

    aput v4, v3, v14

    const/16 v4, 0x3021

    aput v4, v3, v13

    aget v4, v7, v12

    aput v4, v3, v17

    aput v18, v3, v16

    .line 436
    aget v4, v7, v1

    const/16 v6, 0x18

    if-lt v4, v6, :cond_3

    const/16 v4, 0x10

    goto :goto_3

    :cond_3
    aget v4, v7, v1

    :goto_3
    aput v4, v3, v20

    aput v21, v3, v19

    aget v4, v7, v14

    aput v4, v3, v23

    aput v24, v3, v22

    const/16 v4, 0xd

    aput v5, v3, v4

    const/16 v4, 0xe

    const/16 v6, 0x3031

    aput v6, v3, v4

    const/16 v4, 0xf

    aput v5, v3, v4

    const/16 v4, 0x3040

    aput v4, v3, v26

    const/16 v4, 0x11

    aput v1, v3, v4

    const/16 v4, 0x12

    const/16 v6, 0x3038

    aput v6, v3, v4

    aput-object v3, v2, v8

    new-array v3, v12, [I

    fill-array-data v3, :array_0

    aput-object v3, v2, v12

    :goto_4
    if-ge v5, v1, :cond_5

    .line 451
    aget-object v3, v2, v5

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    .line 452
    invoke-direct {v0, v4, v6, v3}, Lorg/cocos2dx/lib/Cocos2dxActivity$Cocos2dxEGLConfigChooser;->doChooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[I)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v3

    if-eqz v3, :cond_4

    return-object v3

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :cond_5
    const-string v1, "device_policy"

    const-string v2, "Can not select an EGLConfig for rendering."

    .line 457
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    return-object v1

    nop

    :array_0
    .array-data 4
        0x3040
        0x4
        0x3038
    .end array-data
.end method
