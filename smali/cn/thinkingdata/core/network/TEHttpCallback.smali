.class public abstract Lcn/thinkingdata/core/network/TEHttpCallback;
.super Ljava/lang/Object;
.source ""


# static fields
.field static sMainHandler:Landroid/os/Handler;


# instance fields
.field public callBackOnMainThread:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcn/thinkingdata/core/network/TEHttpCallback;->sMainHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/thinkingdata/core/network/TEHttpCallback;->callBackOnMainThread:Z

    return-void
.end method


# virtual methods
.method onError(Ljava/lang/String;)V
    .locals 2

    iget-boolean v0, p0, Lcn/thinkingdata/core/network/TEHttpCallback;->callBackOnMainThread:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcn/thinkingdata/core/network/TEHttpCallback;->sMainHandler:Landroid/os/Handler;

    new-instance v1, Lcn/thinkingdata/core/network/TEHttpCallback$1;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/core/network/TEHttpCallback$1;-><init>(Lcn/thinkingdata/core/network/TEHttpCallback;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcn/thinkingdata/core/network/TEHttpCallback;->onFailure(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public abstract onFailure(Ljava/lang/String;)V
.end method

.method onResponse(Ljava/lang/String;)V
    .locals 2

    iget-boolean v0, p0, Lcn/thinkingdata/core/network/TEHttpCallback;->callBackOnMainThread:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcn/thinkingdata/core/network/TEHttpCallback;->sMainHandler:Landroid/os/Handler;

    new-instance v1, Lcn/thinkingdata/core/network/TEHttpCallback$2;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/core/network/TEHttpCallback$2;-><init>(Lcn/thinkingdata/core/network/TEHttpCallback;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcn/thinkingdata/core/network/TEHttpCallback;->onSuccess(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public abstract onSuccess(Ljava/lang/String;)V
.end method
