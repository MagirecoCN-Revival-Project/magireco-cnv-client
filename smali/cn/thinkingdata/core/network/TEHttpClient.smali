.class public Lcn/thinkingdata/core/network/TEHttpClient;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/core/network/Call$Factory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/core/network/TEHttpClient$Builder;
    }
.end annotation


# instance fields
.field final connectTimeout:I

.field final dispatcher:Ljava/util/concurrent/ExecutorService;

.field final readTimeout:I

.field final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    new-instance v0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;

    invoke-direct {v0}, Lcn/thinkingdata/core/network/TEHttpClient$Builder;-><init>()V

    invoke-direct {p0, v0}, Lcn/thinkingdata/core/network/TEHttpClient;-><init>(Lcn/thinkingdata/core/network/TEHttpClient$Builder;)V

    return-void
.end method

.method constructor <init>(Lcn/thinkingdata/core/network/TEHttpClient$Builder;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->dispatcher:Ljava/util/concurrent/ExecutorService;

    iput-object v0, p0, Lcn/thinkingdata/core/network/TEHttpClient;->dispatcher:Ljava/util/concurrent/ExecutorService;

    iget v0, p1, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->connectTimeout:I

    iput v0, p0, Lcn/thinkingdata/core/network/TEHttpClient;->connectTimeout:I

    iget v0, p1, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->readTimeout:I

    iput v0, p0, Lcn/thinkingdata/core/network/TEHttpClient;->readTimeout:I

    iget-object p1, p1, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    iput-object p1, p0, Lcn/thinkingdata/core/network/TEHttpClient;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-void
.end method


# virtual methods
.method public newCall(Lcn/thinkingdata/core/network/Request;)Lcn/thinkingdata/core/network/Call;
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/core/network/RealCall;->newRealCall(Lcn/thinkingdata/core/network/TEHttpClient;Lcn/thinkingdata/core/network/Request;)Lcn/thinkingdata/core/network/RealCall;

    move-result-object p1

    return-object p1
.end method
