.class public Ljp/f4samurai/pnote/util/LogcatView;
.super Landroid/widget/LinearLayout;
.source "LogcatView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;
    }
.end annotation


# static fields
.field public static final PARENT_FRAME_LAYOUT:I = 0x0

.field public static final PARENT_RELATIVE_LAYOUT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Logcat"


# instance fields
.field private mLogcatTask:Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;

.field private mScrollView:Landroid/widget/ScrollView;

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgetmScrollView(Ljp/f4samurai/pnote/util/LogcatView;)Landroid/widget/ScrollView;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mScrollView:Landroid/widget/ScrollView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmTextView(Ljp/f4samurai/pnote/util/LogcatView;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    .line 31
    iput-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView;->mScrollView:Landroid/widget/ScrollView;

    .line 32
    iput-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView;->mLogcatTask:Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;

    .line 36
    invoke-virtual {p0}, Ljp/f4samurai/pnote/util/LogcatView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    .line 31
    iput-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView;->mScrollView:Landroid/widget/ScrollView;

    .line 32
    iput-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView;->mLogcatTask:Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;

    .line 41
    invoke-virtual {p0}, Ljp/f4samurai/pnote/util/LogcatView;->init()V

    return-void
.end method


# virtual methods
.method public clearText()V
    .locals 2

    .line 69
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mScrollView:Landroid/widget/ScrollView;

    const/16 v1, 0x82

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->fullScroll(I)Z

    return-void
.end method

.method public getLogLevelChar(I)Ljava/lang/String;
    .locals 7

    const-string v0, "V"

    const-string v1, "V"

    const-string v2, "V"

    const-string v3, "D"

    const-string v4, "I"

    const-string v5, "W"

    const-string v6, "E"

    .line 62
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    .line 65
    aget-object p1, v0, p1

    return-object p1
.end method

.method public init()V
    .locals 4

    const/4 v0, 0x1

    .line 45
    invoke-virtual {p0, v0}, Ljp/f4samurai/pnote/util/LogcatView;->setOrientation(I)V

    const/high16 v0, -0x1000000

    .line 46
    invoke-virtual {p0, v0}, Ljp/f4samurai/pnote/util/LogcatView;->setBackgroundColor(I)V

    .line 48
    new-instance v0, Landroid/widget/ScrollView;

    invoke-virtual {p0}, Ljp/f4samurai/pnote/util/LogcatView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mScrollView:Landroid/widget/ScrollView;

    .line 49
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Ljp/f4samurai/pnote/util/LogcatView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    .line 50
    new-instance v1, Landroid/text/method/ScrollingMovementMethod;

    invoke-direct {v1}, Landroid/text/method/ScrollingMovementMethod;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 51
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 53
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mScrollView:Landroid/widget/ScrollView;

    iget-object v2, p0, Ljp/f4samurai/pnote/util/LogcatView;->mTextView:Landroid/widget/TextView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mScrollView:Landroid/widget/ScrollView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v2}, Ljp/f4samurai/pnote/util/LogcatView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 75
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 76
    new-instance v0, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;

    invoke-direct {v0, p0}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;-><init>(Ljp/f4samurai/pnote/util/LogcatView;)V

    iput-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mLogcatTask:Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 77
    invoke-virtual {v0, v1}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 82
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView;->mLogcatTask:Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 83
    invoke-virtual {v0, v1}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->cancel(Z)Z

    .line 85
    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    return-void
.end method
