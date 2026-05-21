.class public final Lcn/thinkingdata/core/network/TEHttpClient$Builder;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/core/network/TEHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field connectTimeout:I

.field dispatcher:Ljava/util/concurrent/ExecutorService;

.field readTimeout:I

.field sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcn/thinkingdata/core/network/TEHttpTaskManager;->getExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->dispatcher:Ljava/util/concurrent/ExecutorService;

    const/16 v0, 0x3a98

    iput v0, p0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->connectTimeout:I

    const/16 v0, 0x4e20

    iput v0, p0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->readTimeout:I

    return-void
.end method


# virtual methods
.method public build()Lcn/thinkingdata/core/network/TEHttpClient;
    .locals 1

    new-instance v0, Lcn/thinkingdata/core/network/TEHttpClient;

    invoke-direct {v0, p0}, Lcn/thinkingdata/core/network/TEHttpClient;-><init>(Lcn/thinkingdata/core/network/TEHttpClient$Builder;)V

    return-object v0
.end method

.method public connectTimeout(I)Lcn/thinkingdata/core/network/TEHttpClient$Builder;
    .locals 0

    iput p1, p0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->connectTimeout:I

    return-object p0
.end method

.method public dispatcher(Ljava/util/concurrent/ExecutorService;)Lcn/thinkingdata/core/network/TEHttpClient$Builder;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->dispatcher:Ljava/util/concurrent/ExecutorService;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "dispatcher == null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public readTimeout(I)Lcn/thinkingdata/core/network/TEHttpClient$Builder;
    .locals 0

    iput p1, p0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->readTimeout:I

    return-object p0
.end method

.method public sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lcn/thinkingdata/core/network/TEHttpClient$Builder;
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/network/TEHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object p0
.end method
