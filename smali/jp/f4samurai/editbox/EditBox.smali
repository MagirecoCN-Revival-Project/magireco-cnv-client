.class public Ljp/f4samurai/editbox/EditBox;
.super Landroidx/appcompat/widget/AppCompatEditText;
.source "EditBox.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "EditBox"


# instance fields
.field private activity:Ljp/f4samurai/AppActivity;

.field private mText:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetactivity(Ljp/f4samurai/editbox/EditBox;)Ljp/f4samurai/AppActivity;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/editbox/EditBox;->activity:Ljp/f4samurai/AppActivity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmText(Ljp/f4samurai/editbox/EditBox;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/editbox/EditBox;->mText:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmText(Ljp/f4samurai/editbox/EditBox;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Ljp/f4samurai/editbox/EditBox;->mText:Ljava/lang/String;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    .line 22
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ljp/f4samurai/editbox/EditBox;->activity:Ljp/f4samurai/AppActivity;

    .line 24
    check-cast p1, Ljp/f4samurai/AppActivity;

    iput-object p1, p0, Ljp/f4samurai/editbox/EditBox;->activity:Ljp/f4samurai/AppActivity;

    .line 25
    iput-object p2, p0, Ljp/f4samurai/editbox/EditBox;->mText:Ljava/lang/String;

    const/4 p1, -0x1

    .line 27
    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setBackgroundColor(I)V

    const/high16 p1, -0x1000000

    .line 28
    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setTextColor(I)V

    .line 29
    invoke-virtual {p0, p2}, Ljp/f4samurai/editbox/EditBox;->setText(Ljava/lang/CharSequence;)V

    .line 30
    invoke-virtual {p0, p3}, Ljp/f4samurai/editbox/EditBox;->setInputType(I)V

    const/high16 p1, 0x2000000

    .line 31
    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setImeOptions(I)V

    const p1, 0x10000006

    .line 32
    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setImeOptions(I)V

    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setTextIsSelectable(Z)V

    .line 35
    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setFocusableInTouchMode(Z)V

    .line 36
    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setFocusable(Z)V

    .line 38
    new-instance p1, Ljp/f4samurai/editbox/EditBox$1;

    invoke-direct {p1, p0}, Ljp/f4samurai/editbox/EditBox$1;-><init>(Ljp/f4samurai/editbox/EditBox;)V

    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 55
    new-instance p1, Ljp/f4samurai/editbox/EditBox$2;

    invoke-direct {p1, p0}, Ljp/f4samurai/editbox/EditBox$2;-><init>(Ljp/f4samurai/editbox/EditBox;)V

    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 65
    new-instance p1, Ljp/f4samurai/editbox/EditBox$3;

    invoke-direct {p1, p0}, Ljp/f4samurai/editbox/EditBox$3;-><init>(Ljp/f4samurai/editbox/EditBox;)V

    invoke-virtual {p0, p1}, Ljp/f4samurai/editbox/EditBox;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    return-void
.end method


# virtual methods
.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 82
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    .line 83
    iget-object p1, p0, Ljp/f4samurai/editbox/EditBox;->activity:Ljp/f4samurai/AppActivity;

    invoke-virtual {p1}, Ljp/f4samurai/AppActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 85
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 89
    :cond_1
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatEditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
