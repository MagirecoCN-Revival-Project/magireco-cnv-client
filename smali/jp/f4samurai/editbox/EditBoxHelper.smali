.class public Ljp/f4samurai/editbox/EditBoxHelper;
.super Ljava/lang/Object;
.source "EditBoxHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "EditBoxHelper"

.field private static mEditBox:Ljp/f4samurai/editbox/EditBox;

.field private static mFrameLayout:Landroid/widget/FrameLayout;

.field private static mKeyboardLayout:Ljp/f4samurai/editbox/KeyboardLayout;

.field private static sAppActivity:Ljp/f4samurai/AppActivity;


# direct methods
.method static bridge synthetic -$$Nest$sfgetmEditBox()Ljp/f4samurai/editbox/EditBox;
    .locals 1

    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mEditBox:Ljp/f4samurai/editbox/EditBox;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetmFrameLayout()Landroid/widget/FrameLayout;
    .locals 1

    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetmKeyboardLayout()Ljp/f4samurai/editbox/KeyboardLayout;
    .locals 1

    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mKeyboardLayout:Ljp/f4samurai/editbox/KeyboardLayout;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;
    .locals 1

    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputmEditBox(Ljp/f4samurai/editbox/EditBox;)V
    .locals 0

    sput-object p0, Ljp/f4samurai/editbox/EditBoxHelper;->mEditBox:Ljp/f4samurai/editbox/EditBox;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputmKeyboardLayout(Ljp/f4samurai/editbox/KeyboardLayout;)V
    .locals 0

    sput-object p0, Ljp/f4samurai/editbox/EditBoxHelper;->mKeyboardLayout:Ljp/f4samurai/editbox/KeyboardLayout;

    return-void
.end method

.method static bridge synthetic -$$Nest$smshowKeyboard(Landroid/view/View;)V
    .locals 0

    invoke-static {p0}, Ljp/f4samurai/editbox/EditBoxHelper;->showKeyboard(Landroid/view/View;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    sput-object p1, Ljp/f4samurai/editbox/EditBoxHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    .line 34
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Ljp/f4samurai/AppActivity;

    sput-object p1, Ljp/f4samurai/editbox/EditBoxHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const/4 p1, 0x0

    .line 35
    sput-object p1, Ljp/f4samurai/editbox/EditBoxHelper;->mEditBox:Ljp/f4samurai/editbox/EditBox;

    .line 36
    sput-object p1, Ljp/f4samurai/editbox/EditBoxHelper;->mKeyboardLayout:Ljp/f4samurai/editbox/KeyboardLayout;

    return-void
.end method

.method public static _editBoxEditingDidEnd(Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-static {p0}, Ljp/f4samurai/editbox/EditBoxHelper;->editBoxEditingDidEnd(Ljava/lang/String;)V

    return-void
.end method

.method public static closeEditBox()V
    .locals 2

    .line 89
    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mEditBox:Ljp/f4samurai/editbox/EditBox;

    if-eqz v0, :cond_0

    .line 90
    invoke-static {v0}, Ljp/f4samurai/editbox/EditBoxHelper;->hideKeyboard(Landroid/view/View;)V

    .line 91
    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mKeyboardLayout:Ljp/f4samurai/editbox/KeyboardLayout;

    sget-object v1, Ljp/f4samurai/editbox/EditBoxHelper;->mEditBox:Ljp/f4samurai/editbox/EditBox;

    invoke-virtual {v0, v1}, Ljp/f4samurai/editbox/KeyboardLayout;->removeView(Landroid/view/View;)V

    .line 92
    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mFrameLayout:Landroid/widget/FrameLayout;

    sget-object v1, Ljp/f4samurai/editbox/EditBoxHelper;->mKeyboardLayout:Ljp/f4samurai/editbox/KeyboardLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    .line 93
    sput-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mEditBox:Ljp/f4samurai/editbox/EditBox;

    .line 94
    sput-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->mKeyboardLayout:Ljp/f4samurai/editbox/KeyboardLayout;

    :cond_0
    return-void
.end method

.method private static native editBoxEditingDidEnd(Ljava/lang/String;)V
.end method

.method private static hideKeyboard(Landroid/view/View;)V
    .locals 2

    if-eqz p0, :cond_0

    .line 107
    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 109
    sget-object p0, Ljp/f4samurai/editbox/EditBoxHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {p0}, Ljp/f4samurai/AppActivity;->hideNavigation()V

    :cond_0
    return-void
.end method

.method public static openEditBox(Ljava/lang/String;II)V
    .locals 2

    .line 40
    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/editbox/EditBoxHelper$1;

    invoke-direct {v1, p1, p0, p2}, Ljp/f4samurai/editbox/EditBoxHelper$1;-><init>(ILjava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static showKeyboard(Landroid/view/View;)V
    .locals 2

    if-eqz p0, :cond_0

    .line 100
    sget-object v0, Ljp/f4samurai/editbox/EditBoxHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    const/4 v1, 0x2

    .line 101
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public onWindowFocusChanged(Z)V
    .locals 0

    if-nez p1, :cond_0

    .line 115
    sget-object p1, Ljp/f4samurai/editbox/EditBoxHelper;->mEditBox:Ljp/f4samurai/editbox/EditBox;

    if-eqz p1, :cond_0

    .line 116
    invoke-virtual {p1}, Ljp/f4samurai/editbox/EditBox;->clearFocus()V

    :cond_0
    return-void
.end method
