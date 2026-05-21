.class Lorg/cocos2dx/lib/Cocos2dxVideoView$3;
.super Ljava/lang/Object;
.source "Cocos2dxVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;


# direct methods
.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxVideoView;)V
    .locals 0

    .line 438
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 440
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    const/4 v0, 0x5

    invoke-static {p1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->access$202(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I

    .line 441
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    invoke-static {p1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->access$602(Lorg/cocos2dx/lib/Cocos2dxVideoView;I)I

    .line 445
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    invoke-static {p1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->access$700(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 446
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->access$800(Lorg/cocos2dx/lib/Cocos2dxVideoView;Z)V

    .line 449
    :cond_0
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    invoke-static {p1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->access$900(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 450
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    invoke-static {p1}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->access$900(Lorg/cocos2dx/lib/Cocos2dxVideoView;)Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;

    move-result-object p1

    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxVideoView$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxVideoView;

    invoke-static {v0}, Lorg/cocos2dx/lib/Cocos2dxVideoView;->access$1000(Lorg/cocos2dx/lib/Cocos2dxVideoView;)I

    move-result v0

    const/4 v1, 0x3

    invoke-interface {p1, v0, v1}, Lorg/cocos2dx/lib/Cocos2dxVideoView$OnVideoEventListener;->onVideoEvent(II)V

    :cond_1
    return-void
.end method
