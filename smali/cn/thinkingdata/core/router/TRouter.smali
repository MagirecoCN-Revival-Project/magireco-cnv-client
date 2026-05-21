.class public final Lcn/thinkingdata/core/router/TRouter;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.TRouter"

.field private static volatile hasInit:Z

.field private static volatile instance:Lcn/thinkingdata/core/router/TRouter;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcn/thinkingdata/core/router/TRouter;
    .locals 2

    sget-boolean v0, Lcn/thinkingdata/core/router/TRouter;->hasInit:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcn/thinkingdata/core/router/TRouter;->instance:Lcn/thinkingdata/core/router/TRouter;

    if-nez v0, :cond_1

    const-class v0, Lcn/thinkingdata/core/router/TRouter;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/thinkingdata/core/router/TRouter;->instance:Lcn/thinkingdata/core/router/TRouter;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/core/router/TRouter;

    invoke-direct {v1}, Lcn/thinkingdata/core/router/TRouter;-><init>()V

    sput-object v1, Lcn/thinkingdata/core/router/TRouter;->instance:Lcn/thinkingdata/core/router/TRouter;

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
    sget-object v0, Lcn/thinkingdata/core/router/TRouter;->instance:Lcn/thinkingdata/core/router/TRouter;

    return-object v0

    :cond_2
    new-instance v0, Lcn/thinkingdata/core/router/InitException;

    const-string v1, "TRouter::Init::Invoke init(context) first!"

    invoke-direct {v0, v1}, Lcn/thinkingdata/core/router/InitException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2

    sget-boolean v0, Lcn/thinkingdata/core/router/TRouter;->hasInit:Z

    if-nez v0, :cond_0

    const-string v0, "ThinkingAnalytics.TRouter"

    const-string v1, "[ThinkingData] Info: TRouter init start."

    invoke-static {v0, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcn/thinkingdata/core/router/_TRouter;->init(Landroid/content/Context;)Z

    move-result p0

    sput-boolean p0, Lcn/thinkingdata/core/router/TRouter;->hasInit:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public build(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;
    .locals 1

    invoke-static {}, Lcn/thinkingdata/core/router/_TRouter;->getInstance()Lcn/thinkingdata/core/router/_TRouter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcn/thinkingdata/core/router/_TRouter;->build(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    return-object p1
.end method

.method public navigation(Landroid/content/Context;Lcn/thinkingdata/core/router/Postcard;)Ljava/lang/Object;
    .locals 1

    invoke-static {}, Lcn/thinkingdata/core/router/_TRouter;->getInstance()Lcn/thinkingdata/core/router/_TRouter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/core/router/_TRouter;->navigation(Landroid/content/Context;Lcn/thinkingdata/core/router/Postcard;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
