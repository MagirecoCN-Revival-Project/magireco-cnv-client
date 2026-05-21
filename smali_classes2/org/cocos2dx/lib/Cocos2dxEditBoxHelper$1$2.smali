.class Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;
.super Ljava/lang/Object;
.source "Cocos2dxEditBoxHelper.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;

.field final synthetic val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;


# direct methods
.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;Lorg/cocos2dx/lib/Cocos2dxEditBox;)V
    .locals 0

    .line 148
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->this$0:Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;

    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 3

    .line 152
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->setTag(Ljava/lang/Object;)V

    .line 153
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->setChangedTextProgrammatically(Ljava/lang/Boolean;)V

    if-eqz p2, :cond_0

    .line 155
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$000()Lorg/cocos2dx/lib/Cocos2dxActivity;

    move-result-object p1

    new-instance p2, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$1;

    invoke-direct {p2, p0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;)V

    invoke-virtual {p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 162
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;

    invoke-virtual {p1}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->setSelection(I)V

    .line 163
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$100()Lorg/cocos2dx/lib/ResizeLayout;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/cocos2dx/lib/ResizeLayout;->setEnableForceDoLayout(Z)V

    .line 164
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$000()Lorg/cocos2dx/lib/Cocos2dxActivity;

    move-result-object p1

    invoke-virtual {p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getGLSurfaceView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setSoftKeyboardShown(Z)V

    .line 165
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$200()Ljava/lang/String;

    move-result-object p1

    const-string p2, "edit box get focus"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 167
    :cond_0
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->setVisibility(I)V

    .line 170
    new-instance p1, Ljava/lang/String;

    iget-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;

    invoke-virtual {p2}, Lorg/cocos2dx/lib/Cocos2dxEditBox;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 171
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$000()Lorg/cocos2dx/lib/Cocos2dxActivity;

    move-result-object p2

    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;

    invoke-direct {v0, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;-><init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 178
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$000()Lorg/cocos2dx/lib/Cocos2dxActivity;

    move-result-object p1

    invoke-virtual {p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->hideVirtualButton()V

    .line 179
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$100()Lorg/cocos2dx/lib/ResizeLayout;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/cocos2dx/lib/ResizeLayout;->setEnableForceDoLayout(Z)V

    .line 180
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->access$200()Ljava/lang/String;

    move-result-object p1

    const-string p2, "edit box lose focus"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
