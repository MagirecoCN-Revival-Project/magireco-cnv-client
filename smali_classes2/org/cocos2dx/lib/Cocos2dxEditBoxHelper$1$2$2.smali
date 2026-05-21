.class Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;
.super Ljava/lang/Object;
.source "Cocos2dxEditBoxHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->onFocusChange(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;Ljava/lang/String;)V
    .locals 0

    .line 171
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;->this$1:Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;

    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 174
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;->this$1:Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;

    iget-object v0, v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->val$editBox:Lorg/cocos2dx/lib/Cocos2dxEditBox;

    iget v0, v0, Lorg/cocos2dx/lib/Cocos2dxEditBox;->endAction:I

    .line 175
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;->this$1:Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;

    iget-object v1, v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2;->this$0:Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;

    iget v1, v1, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1;->val$index:I

    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper$1$2$2;->val$text:Ljava/lang/String;

    invoke-static {v1, v2, v0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxHelper;->__editBoxEditingDidEnd(ILjava/lang/String;I)V

    return-void
.end method
