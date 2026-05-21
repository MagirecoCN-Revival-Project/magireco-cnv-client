.class public Lcn/thinkingdata/core/network/Request;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/core/network/Request$Builder;
    }
.end annotation


# instance fields
.field final body:Ljava/lang/String;

.field final callBackOnMainThread:Z

.field final gzip:Z

.field final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final method:Ljava/lang/String;

.field final url:Ljava/lang/String;

.field final useCache:Z


# direct methods
.method constructor <init>(Lcn/thinkingdata/core/network/Request$Builder;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcn/thinkingdata/core/network/Request$Builder;->url:Ljava/lang/String;

    iput-object v0, p0, Lcn/thinkingdata/core/network/Request;->url:Ljava/lang/String;

    iget-object v0, p1, Lcn/thinkingdata/core/network/Request$Builder;->method:Ljava/lang/String;

    iput-object v0, p0, Lcn/thinkingdata/core/network/Request;->method:Ljava/lang/String;

    iget-object v0, p1, Lcn/thinkingdata/core/network/Request$Builder;->headers:Ljava/util/Map;

    iput-object v0, p0, Lcn/thinkingdata/core/network/Request;->headers:Ljava/util/Map;

    iget-object v0, p1, Lcn/thinkingdata/core/network/Request$Builder;->body:Ljava/lang/String;

    iput-object v0, p0, Lcn/thinkingdata/core/network/Request;->body:Ljava/lang/String;

    iget-boolean v0, p1, Lcn/thinkingdata/core/network/Request$Builder;->gzip:Z

    iput-boolean v0, p0, Lcn/thinkingdata/core/network/Request;->gzip:Z

    iget-boolean v0, p1, Lcn/thinkingdata/core/network/Request$Builder;->useCache:Z

    iput-boolean v0, p0, Lcn/thinkingdata/core/network/Request;->useCache:Z

    iget-boolean p1, p1, Lcn/thinkingdata/core/network/Request$Builder;->callBackOnMainThread:Z

    iput-boolean p1, p0, Lcn/thinkingdata/core/network/Request;->callBackOnMainThread:Z

    return-void
.end method
