.class public Lcn/thinkingdata/core/router/RouteMeta;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private className:Ljava/lang/String;

.field private needCache:Z

.field private path:Ljava/lang/String;

.field private type:Lcn/thinkingdata/core/router/RouteType;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcn/thinkingdata/core/router/RouteType;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/core/router/RouteMeta;->type:Lcn/thinkingdata/core/router/RouteType;

    iput-object p2, p0, Lcn/thinkingdata/core/router/RouteMeta;->path:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/core/router/RouteMeta;->className:Ljava/lang/String;

    iput-boolean p4, p0, Lcn/thinkingdata/core/router/RouteMeta;->needCache:Z

    return-void
.end method

.method public static build(Lcn/thinkingdata/core/router/RouteType;Ljava/lang/String;Ljava/lang/String;Z)Lcn/thinkingdata/core/router/RouteMeta;
    .locals 1

    new-instance v0, Lcn/thinkingdata/core/router/RouteMeta;

    invoke-direct {v0, p0, p1, p2, p3}, Lcn/thinkingdata/core/router/RouteMeta;-><init>(Lcn/thinkingdata/core/router/RouteType;Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v0
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/RouteMeta;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/RouteMeta;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcn/thinkingdata/core/router/RouteType;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/RouteMeta;->type:Lcn/thinkingdata/core/router/RouteType;

    return-object v0
.end method

.method public isNeedCache()Z
    .locals 1

    iget-boolean v0, p0, Lcn/thinkingdata/core/router/RouteMeta;->needCache:Z

    return v0
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/router/RouteMeta;->className:Ljava/lang/String;

    return-void
.end method

.method public setNeedCache(Z)V
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/core/router/RouteMeta;->needCache:Z

    return-void
.end method

.method public setType(Lcn/thinkingdata/core/router/RouteType;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/router/RouteMeta;->type:Lcn/thinkingdata/core/router/RouteType;

    return-void
.end method
