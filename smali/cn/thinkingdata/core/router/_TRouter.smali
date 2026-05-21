.class final Lcn/thinkingdata/core/router/_TRouter;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.TRouter"

.field private static volatile hasInit:Z

.field private static volatile instance:Lcn/thinkingdata/core/router/_TRouter;

.field private static mContext:Landroid/content/Context;


# instance fields
.field private objectMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/core/router/_TRouter;->objectMap:Ljava/util/Map;

    return-void
.end method

.method protected static getInstance()Lcn/thinkingdata/core/router/_TRouter;
    .locals 2

    sget-boolean v0, Lcn/thinkingdata/core/router/_TRouter;->hasInit:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcn/thinkingdata/core/router/_TRouter;->instance:Lcn/thinkingdata/core/router/_TRouter;

    if-nez v0, :cond_1

    const-class v0, Lcn/thinkingdata/core/router/_TRouter;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/thinkingdata/core/router/_TRouter;->instance:Lcn/thinkingdata/core/router/_TRouter;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/core/router/_TRouter;

    invoke-direct {v1}, Lcn/thinkingdata/core/router/_TRouter;-><init>()V

    sput-object v1, Lcn/thinkingdata/core/router/_TRouter;->instance:Lcn/thinkingdata/core/router/_TRouter;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcn/thinkingdata/core/router/_TRouter;->instance:Lcn/thinkingdata/core/router/_TRouter;

    return-object v0

    :cond_2
    new-instance v0, Lcn/thinkingdata/core/router/InitException;

    const-string v1, "TRouterCore::Init::Invoke init(context) first!"

    invoke-direct {v0, v1}, Lcn/thinkingdata/core/router/InitException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static declared-synchronized init(Landroid/content/Context;)Z
    .locals 2

    const-class v0, Lcn/thinkingdata/core/router/_TRouter;

    monitor-enter v0

    :try_start_0
    sput-object p0, Lcn/thinkingdata/core/router/_TRouter;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lcn/thinkingdata/core/router/LogisticsCenter;->init(Landroid/content/Context;)V

    const-string p0, "ThinkingAnalytics.TRouter"

    const-string v1, "[ThinkingData] Info: TRouter init success!"

    invoke-static {p0, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    sput-boolean p0, Lcn/thinkingdata/core/router/_TRouter;->hasInit:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method protected build(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "ThinkingAnalytics.TRouter"

    const-string v0, "TRouter build Parameter is invalid!"

    invoke-static {p1, v0}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcn/thinkingdata/core/router/Postcard;

    const-string v0, ""

    invoke-direct {p1, v0}, Lcn/thinkingdata/core/router/Postcard;-><init>(Ljava/lang/String;)V

    return-object p1

    :cond_0
    new-instance v0, Lcn/thinkingdata/core/router/Postcard;

    invoke-direct {v0, p1}, Lcn/thinkingdata/core/router/Postcard;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected navigation(Landroid/content/Context;Lcn/thinkingdata/core/router/Postcard;)Ljava/lang/Object;
    .locals 4

    invoke-static {p2}, Lcn/thinkingdata/core/router/LogisticsCenter;->completion(Lcn/thinkingdata/core/router/Postcard;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    sget-object p1, Lcn/thinkingdata/core/router/_TRouter$1;->$SwitchMap$cn$thinkingdata$core$router$RouteType:[I

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getType()Lcn/thinkingdata/core/router/RouteType;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget p1, p1, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v1, :cond_4

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    goto/16 :goto_0

    :cond_1
    new-instance p1, Lcn/thinkingdata/core/router/plugin/MethodCall;

    invoke-direct {p1}, Lcn/thinkingdata/core/router/plugin/MethodCall;-><init>()V

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/Postcard;->getAction()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcn/thinkingdata/core/router/plugin/MethodCall;->method:Ljava/lang/String;

    iget-object v1, p2, Lcn/thinkingdata/core/router/Postcard;->arguments:Ljava/util/Map;

    iput-object v1, p1, Lcn/thinkingdata/core/router/plugin/MethodCall;->arguments:Ljava/util/Map;

    :try_start_0
    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->isNeedCache()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcn/thinkingdata/core/router/_TRouter;->objectMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcn/thinkingdata/core/router/_TRouter;->objectMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/core/router/plugin/IPlugin;

    if-eqz v1, :cond_2

    invoke-interface {v1, p1}, Lcn/thinkingdata/core/router/plugin/IPlugin;->onMethodCall(Lcn/thinkingdata/core/router/plugin/MethodCall;)V

    return-object v0

    :cond_2
    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/core/router/plugin/IPlugin;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->isNeedCache()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcn/thinkingdata/core/router/_TRouter;->objectMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v2, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-interface {v1, p1}, Lcn/thinkingdata/core/router/plugin/IPlugin;->onMethodCall(Lcn/thinkingdata/core/router/plugin/MethodCall;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->isNeedCache()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcn/thinkingdata/core/router/_TRouter;->objectMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcn/thinkingdata/core/router/_TRouter;->objectMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcn/thinkingdata/core/router/provider/IProvider;

    return-object p1

    :cond_5
    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/Class;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcn/thinkingdata/core/router/provider/IProvider;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->isNeedCache()Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcn/thinkingdata/core/router/_TRouter;->objectMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcn/thinkingdata/core/router/RouteMeta;->getClassName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_6
    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-object v0
.end method
