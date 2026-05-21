.class Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;
.super Ljava/lang/Object;
.source "Cocos2dxWebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/lib/Cocos2dxWebViewHelper;->setWebViewRect(IIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$index:I

.field final synthetic val$left:I

.field final synthetic val$maxHeight:I

.field final synthetic val$maxWidth:I

.field final synthetic val$top:I


# direct methods
.method constructor <init>(IIIII)V
    .locals 0

    .line 191
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$index:I

    iput p2, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$left:I

    iput p3, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$top:I

    iput p4, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$maxWidth:I

    iput p5, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$maxHeight:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 194
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper;->access$200()Landroid/util/SparseArray;

    move-result-object v0

    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$index:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxWebView;

    if-eqz v0, :cond_0

    .line 196
    iget v1, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$left:I

    iget v2, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$top:I

    iget v3, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$maxWidth:I

    iget v4, p0, Lorg/cocos2dx/lib/Cocos2dxWebViewHelper$7;->val$maxHeight:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/cocos2dx/lib/Cocos2dxWebView;->setWebViewRect(IIII)V

    :cond_0
    return-void
.end method
