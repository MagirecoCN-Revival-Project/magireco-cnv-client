.class public Lorg/cocos2dx/lib/ResizeLayout;
.super Landroid/widget/FrameLayout;
.source "ResizeLayout.java"


# instance fields
.field private mEnableForceDoLayout:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lorg/cocos2dx/lib/ResizeLayout;->mEnableForceDoLayout:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lorg/cocos2dx/lib/ResizeLayout;->mEnableForceDoLayout:Z

    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 0

    .line 49
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 50
    iget-boolean p1, p0, Lorg/cocos2dx/lib/ResizeLayout;->mEnableForceDoLayout:Z

    if-eqz p1, :cond_0

    .line 55
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 56
    new-instance p2, Lorg/cocos2dx/lib/ResizeLayout$1;

    invoke-direct {p2, p0}, Lorg/cocos2dx/lib/ResizeLayout$1;-><init>(Lorg/cocos2dx/lib/ResizeLayout;)V

    const-wide/16 p3, 0x29

    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public setEnableForceDoLayout(Z)V
    .locals 0

    .line 44
    iput-boolean p1, p0, Lorg/cocos2dx/lib/ResizeLayout;->mEnableForceDoLayout:Z

    return-void
.end method
