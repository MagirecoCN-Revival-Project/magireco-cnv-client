.class public Lcn/thinkingdata/core/router/Postcard;
.super Lcn/thinkingdata/core/router/RouteMeta;
.source ""


# instance fields
.field private action:Ljava/lang/String;

.field public arguments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcn/thinkingdata/core/router/RouteMeta;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    iput-object p1, p0, Lcn/thinkingdata/core/router/Postcard;->path:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->action:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->path:Ljava/lang/String;

    return-object v0
.end method

.method public navigation()Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/thinkingdata/core/router/Postcard;->navigation(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public navigation(Landroid/content/Context;)Ljava/lang/Object;
    .locals 1

    invoke-static {}, Lcn/thinkingdata/core/router/TRouter;->getInstance()Lcn/thinkingdata/core/router/TRouter;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcn/thinkingdata/core/router/TRouter;->navigation(Landroid/content/Context;Lcn/thinkingdata/core/router/Postcard;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public withAction(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/router/Postcard;->action:Ljava/lang/String;

    return-object p0
.end method

.method public withBoolean(Ljava/lang/String;Z)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public withCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public withDouble(Ljava/lang/String;D)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public withFloat(Ljava/lang/String;F)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public withInt(Ljava/lang/String;I)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public withLong(Ljava/lang/String;J)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public withObject(Ljava/lang/String;Ljava/lang/Object;)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public withString(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
