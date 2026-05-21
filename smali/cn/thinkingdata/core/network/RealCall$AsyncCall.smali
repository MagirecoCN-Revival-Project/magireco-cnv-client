.class Lcn/thinkingdata/core/network/RealCall$AsyncCall;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/core/network/RealCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AsyncCall"
.end annotation


# instance fields
.field private final responseCallback:Lcn/thinkingdata/core/network/TEHttpCallback;

.field final synthetic this$0:Lcn/thinkingdata/core/network/RealCall;


# direct methods
.method public constructor <init>(Lcn/thinkingdata/core/network/RealCall;Lcn/thinkingdata/core/network/TEHttpCallback;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/network/RealCall$AsyncCall;->this$0:Lcn/thinkingdata/core/network/RealCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcn/thinkingdata/core/network/RealCall$AsyncCall;->responseCallback:Lcn/thinkingdata/core/network/TEHttpCallback;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/core/network/RealCall$AsyncCall;->this$0:Lcn/thinkingdata/core/network/RealCall;

    invoke-static {v0}, Lcn/thinkingdata/core/network/RealCall;->access$000(Lcn/thinkingdata/core/network/RealCall;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/core/network/RealCall$AsyncCall;->responseCallback:Lcn/thinkingdata/core/network/TEHttpCallback;

    invoke-virtual {v1, v0}, Lcn/thinkingdata/core/network/TEHttpCallback;->onResponse(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcn/thinkingdata/core/network/RealCall$AsyncCall;->responseCallback:Lcn/thinkingdata/core/network/TEHttpCallback;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcn/thinkingdata/core/network/TEHttpCallback;->onError(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
