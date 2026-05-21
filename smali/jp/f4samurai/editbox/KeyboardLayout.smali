.class Ljp/f4samurai/editbox/KeyboardLayout;
.super Landroid/widget/LinearLayout;
.source "EditBoxHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;
    }
.end annotation


# instance fields
.field private listener:Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 125
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 3

    .line 141
    iget-object v0, p0, Ljp/f4samurai/editbox/KeyboardLayout;->listener:Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;

    if-eqz v0, :cond_0

    .line 142
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 143
    invoke-virtual {p0}, Ljp/f4samurai/editbox/KeyboardLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 144
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 145
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 146
    iget v1, v2, Landroid/graphics/Rect;->top:I

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v1, v2

    sub-int/2addr v0, v1

    const/16 v1, 0x64

    if-le v0, v1, :cond_0

    .line 150
    iget-object v1, p0, Ljp/f4samurai/editbox/KeyboardLayout;->listener:Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;

    invoke-interface {v1, v0}, Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;->onResizeWindow(I)V

    .line 153
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method

.method public setListener(Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;)V
    .locals 0

    .line 135
    iput-object p1, p0, Ljp/f4samurai/editbox/KeyboardLayout;->listener:Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;

    return-void
.end method
