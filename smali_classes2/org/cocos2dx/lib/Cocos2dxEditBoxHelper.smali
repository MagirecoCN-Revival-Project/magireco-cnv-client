.class public Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;
.super Ljava/lang/Object;
.source "Cocos2dxEditBoxHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Cocos2dxEditBoxHelper"

.field private static mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity; = null

.field private static mEditBoxArray:Landroid/util/SparseArray; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lorg/cocos2dx/lib/Cocos2dxEditBox;",
            ">;"
        }
    .end annotation
.end field

.field private static mFrameLayout:Lorg/cocos2dx/lib/ResizeLayout; = null

.field private static mPadding:F = 5.0f

.field private static mViewTag:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lorg/cocos2dx/lib/ResizeLayout;)V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    sput-object p1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mFrameLayout:Lorg/cocos2dx/lib/ResizeLayout;

    .line 76
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lorg/cocos2dx/lib/Cocos2dxActivity;

    sput-object p1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 77
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    sput-object p1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mEditBoxArray:Landroid/util/SparseArray;

    return-void
.end method

.method public static __editBoxEditingChanged(ILjava/lang/String;)V
    .locals 0

    .line 64
    invoke-static {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->editBoxEditingChanged(ILjava/lang/String;)V

    return-void
.end method

.method public static __editBoxEditingDidBegin(I)V
    .locals 0

    .line 59
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->editBoxEditingDidBegin(I)V

    return-void
.end method

.method public static __editBoxEditingDidEnd(ILjava/lang/String;I)V
    .locals 0

    .line 69
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->editBoxEditingDidEnd(ILjava/lang/String;I)V

    return-void
.end method

.method static synthetic access$000()Lorg/cocos2dx/lib/Cocos2dxActivity;
    .locals 1

    .line 48
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    return-object v0
.end method

.method static synthetic access$100()Lorg/cocos2dx/lib/ResizeLayout;
    .locals 1

    .line 48
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mFrameLayout:Lorg/cocos2dx/lib/ResizeLayout;

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 48
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(I)V
    .locals 0

    .line 48
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->closeKeyboardOnUiThread(I)V

    return-void
.end method

.method static synthetic access$400()Landroid/util/SparseArray;
    .locals 1

    .line 48
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mEditBoxArray:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$500(I)V
    .locals 0

    .line 48
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->openKeyboardOnUiThread(I)V

    return-void
.end method

.method public static closeKeyboard(I)V
    .locals 2

    .line 455
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$16;

    invoke-direct {v1, p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$16;-><init>(I)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static closeKeyboardOnUiThread(I)V
    .locals 2

    .line 437
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 438
    sget-object p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->TAG:Ljava/lang/String;

    const-string v0, "closeKeyboardOnUiThread doesn\'t run on UI thread!"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 442
    :cond_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 443
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mEditBoxArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/cocos2dx/lib/Cocos2dxEditBox;

    if-eqz p0, :cond_1

    .line 445
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->getWindowToken()Landroid/os/IBinder;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 446
    sget-object p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getGLSurfaceView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object p0

    invoke-virtual {p0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setSoftKeyboardShown(Z)V

    .line 447
    sget-object p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getGLSurfaceView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object p0

    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->requestFocus()Z

    .line 449
    sget-object p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->hideVirtualButton()V

    :cond_1
    return-void
.end method

.method public static createEditBox(IIIIF)I
    .locals 9

    .line 85
    sget v6, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mViewTag:I

    .line 86
    sget-object v7, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v8, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;

    move-object v0, v8

    move v1, p4

    move v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;-><init>(FIIIII)V

    invoke-virtual {v7, v8}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 219
    sget p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mViewTag:I

    add-int/lit8 p1, p0, 0x1

    sput p1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mViewTag:I

    return p0
.end method

.method private static native editBoxEditingChanged(ILjava/lang/String;)V
.end method

.method private static native editBoxEditingDidBegin(I)V
.end method

.method private static native editBoxEditingDidEnd(ILjava/lang/String;I)V
.end method

.method public static getPadding(F)I
    .locals 1

    .line 81
    sget v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mPadding:F

    mul-float v0, v0, p0

    float-to-int p0, v0

    return p0
.end method

.method public static openKeyboard(I)V
    .locals 2

    .line 412
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$15;

    invoke-direct {v1, p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$15;-><init>(I)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static openKeyboardOnUiThread(I)V
    .locals 2

    .line 421
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 422
    sget-object p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->TAG:Ljava/lang/String;

    const-string v0, "openKeyboardOnUiThread doesn\'t run on UI thread!"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 426
    :cond_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 427
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mEditBoxArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/cocos2dx/lib/Cocos2dxEditBox;

    if-eqz p0, :cond_1

    .line 429
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->requestFocus()Z

    .line 430
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getGLSurfaceView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object v1

    invoke-virtual {v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->requestLayout()V

    const/4 v1, 0x0

    .line 431
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 432
    sget-object p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getGLSurfaceView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setSoftKeyboardShown(Z)V

    :cond_1
    return-void
.end method

.method public static removeEditBox(I)V
    .locals 2

    .line 223
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$2;

    invoke-direct {v1, p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$2;-><init>(I)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setEditBoxViewRect(IIIII)V
    .locals 8

    .line 397
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v7, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$14;

    move-object v1, v7

    move v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$14;-><init>(IIIII)V

    invoke-virtual {v0, v7}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setFont(ILjava/lang/String;F)V
    .locals 2

    .line 237
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$3;

    invoke-direct {v1, p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$3;-><init>(ILjava/lang/String;F)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setFontColor(IIIII)V
    .locals 8

    .line 272
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v7, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$4;

    move-object v1, v7

    move v2, p0

    move v3, p4

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$4;-><init>(IIIII)V

    invoke-virtual {v0, v7}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setInputFlag(II)V
    .locals 2

    .line 384
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$13;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$13;-><init>(II)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setInputMode(II)V
    .locals 2

    .line 372
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$12;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$12;-><init>(II)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setMaxLength(II)V
    .locals 2

    .line 308
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$7;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$7;-><init>(II)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setPlaceHolderText(ILjava/lang/String;)V
    .locals 2

    .line 284
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$5;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$5;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setPlaceHolderTextColor(IIIII)V
    .locals 8

    .line 296
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v7, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$6;

    move-object v1, v7

    move v2, p0

    move v3, p4

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$6;-><init>(IIIII)V

    invoke-virtual {v0, v7}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setReturnType(II)V
    .locals 2

    .line 348
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$10;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$10;-><init>(II)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setText(ILjava/lang/String;)V
    .locals 2

    .line 333
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$9;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$9;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setTextHorizontalAlignment(II)V
    .locals 2

    .line 360
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$11;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$11;-><init>(II)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setVisible(IZ)V
    .locals 2

    .line 320
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$8;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$8;-><init>(IZ)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
