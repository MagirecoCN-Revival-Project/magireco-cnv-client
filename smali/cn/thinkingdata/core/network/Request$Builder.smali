.class public Lcn/thinkingdata/core/network/Request$Builder;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/core/network/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field body:Ljava/lang/String;

.field callBackOnMainThread:Z

.field gzip:Z

.field headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field method:Ljava/lang/String;

.field url:Ljava/lang/String;

.field useCache:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "GET"

    iput-object v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->method:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->headers:Ljava/util/Map;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->gzip:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcn/thinkingdata/core/network/Request$Builder;->useCache:Z

    iput-boolean v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->callBackOnMainThread:Z

    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/network/Request$Builder;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->headers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public build()Lcn/thinkingdata/core/network/Request;
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->url:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Lcn/thinkingdata/core/network/Request;

    invoke-direct {v0, p0}, Lcn/thinkingdata/core/network/Request;-><init>(Lcn/thinkingdata/core/network/Request$Builder;)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "url == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get()Lcn/thinkingdata/core/network/Request$Builder;
    .locals 2

    const-string v0, "GET"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcn/thinkingdata/core/network/Request$Builder;->method(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/network/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public gzip()Lcn/thinkingdata/core/network/Request$Builder;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->gzip:Z

    return-object p0
.end method

.method public headers(Ljava/util/Map;)Lcn/thinkingdata/core/network/Request$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcn/thinkingdata/core/network/Request$Builder;"
        }
    .end annotation

    iget-object v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->headers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object p0
.end method

.method public mainThread()Lcn/thinkingdata/core/network/Request$Builder;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->callBackOnMainThread:Z

    return-object p0
.end method

.method public method(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/network/Request$Builder;
    .locals 2

    if-nez p2, :cond_1

    const-string v0, "POST"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "method "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " must have a request body."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_1
    :goto_0
    iput-object p1, p0, Lcn/thinkingdata/core/network/Request$Builder;->method:Ljava/lang/String;

    iput-object p2, p0, Lcn/thinkingdata/core/network/Request$Builder;->body:Ljava/lang/String;

    return-object p0
.end method

.method public post(Ljava/lang/String;)Lcn/thinkingdata/core/network/Request$Builder;
    .locals 1

    const-string v0, "POST"

    invoke-virtual {p0, v0, p1}, Lcn/thinkingdata/core/network/Request$Builder;->method(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/network/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public removeHeader(Ljava/lang/String;)Lcn/thinkingdata/core/network/Request$Builder;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/network/Request$Builder;->headers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public url(Ljava/lang/String;)Lcn/thinkingdata/core/network/Request$Builder;
    .locals 1

    const-string v0, "http url == null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    iput-object p1, p0, Lcn/thinkingdata/core/network/Request$Builder;->url:Ljava/lang/String;

    return-object p0
.end method

.method public useCache(Z)Lcn/thinkingdata/core/network/Request$Builder;
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/core/network/Request$Builder;->useCache:Z

    return-object p0
.end method
