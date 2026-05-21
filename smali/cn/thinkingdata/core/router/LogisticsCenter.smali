.class public Lcn/thinkingdata/core/router/LogisticsCenter;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/core/router/LogisticsCenter$OnLoadPluginCallBack;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.TRouter"

.field private static mContext:Landroid/content/Context;

.field public static plugins:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/core/router/RouteMeta;",
            ">;"
        }
    .end annotation
.end field

.field public static routes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/core/router/RouteMeta;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/core/router/LogisticsCenter;->plugins:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static completion(Lcn/thinkingdata/core/router/Postcard;)Z
    .locals 2

    sget-object v0, Lcn/thinkingdata/core/router/LogisticsCenter;->plugins:Ljava/util/Map;

    invoke-virtual {p0}, Lcn/thinkingdata/core/router/Postcard;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/thinkingdata/core/router/RouteMeta;

    if-nez v0, :cond_0

    sget-object v0, Lcn/thinkingdata/core/router/LogisticsCenter;->routes:Ljava/util/Map;

    invoke-virtual {p0}, Lcn/thinkingdata/core/router/Postcard;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/thinkingdata/core/router/RouteMeta;

    :cond_0
    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "not find plugin\uff1a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcn/thinkingdata/core/router/Postcard;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ThinkingAnalytics.TRouter"

    invoke-static {v0, p0}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_1
    invoke-virtual {v0}, Lcn/thinkingdata/core/router/RouteMeta;->getType()Lcn/thinkingdata/core/router/RouteType;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcn/thinkingdata/core/router/RouteMeta;->setType(Lcn/thinkingdata/core/router/RouteType;)V

    invoke-virtual {v0}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcn/thinkingdata/core/router/RouteMeta;->setClassName(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcn/thinkingdata/core/router/RouteMeta;->isNeedCache()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcn/thinkingdata/core/router/RouteMeta;->setNeedCache(Z)V

    const/4 p0, 0x1

    return p0
.end method

.method private static declared-synchronized handlePlugin(Ljava/util/Set;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-class v0, Lcn/thinkingdata/core/router/LogisticsCenter;

    monitor-enter v0

    :try_start_0
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    const-string v2, "getRouterMap"
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v3, 0x0

    :try_start_3
    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "name"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "type"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    const-string v7, "needCache"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    invoke-static {v6}, Lcn/thinkingdata/core/router/RouteType;->parse(I)Lcn/thinkingdata/core/router/RouteType;

    move-result-object v6

    invoke-static {v6, v3, v4, v5}, Lcn/thinkingdata/core/router/RouteMeta;->build(Lcn/thinkingdata/core/router/RouteType;Ljava/lang/String;Ljava/lang/String;Z)Lcn/thinkingdata/core/router/RouteMeta;

    move-result-object v4

    sget-object v5, Lcn/thinkingdata/core/router/LogisticsCenter;->plugins:Ljava/util/Map;

    invoke-interface {v5, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized init(Landroid/content/Context;)V
    .locals 1

    const-class v0, Lcn/thinkingdata/core/router/LogisticsCenter;

    monitor-enter v0

    :try_start_0
    sput-object p0, Lcn/thinkingdata/core/router/LogisticsCenter;->mContext:Landroid/content/Context;

    invoke-static {}, Lcn/thinkingdata/core/router/TRouterMap;->getDefaultRouters()Ljava/util/Map;

    move-result-object p0

    sput-object p0, Lcn/thinkingdata/core/router/LogisticsCenter;->routes:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
