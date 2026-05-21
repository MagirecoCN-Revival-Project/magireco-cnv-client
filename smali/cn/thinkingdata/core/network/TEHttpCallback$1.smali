.class Lcn/thinkingdata/core/network/TEHttpCallback$1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/core/network/TEHttpCallback;->onError(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/thinkingdata/core/network/TEHttpCallback;

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcn/thinkingdata/core/network/TEHttpCallback;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/network/TEHttpCallback$1;->this$0:Lcn/thinkingdata/core/network/TEHttpCallback;

    iput-object p2, p0, Lcn/thinkingdata/core/network/TEHttpCallback$1;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/core/network/TEHttpCallback$1;->this$0:Lcn/thinkingdata/core/network/TEHttpCallback;

    iget-object v1, p0, Lcn/thinkingdata/core/network/TEHttpCallback$1;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/core/network/TEHttpCallback;->onFailure(Ljava/lang/String;)V

    return-void
.end method
