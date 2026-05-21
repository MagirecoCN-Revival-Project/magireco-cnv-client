.class public Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;
.super Ljava/lang/Object;
.source "BacktraceBreadcrumbs.java"

# interfaces
.implements Lbacktraceio/library/interfaces/Breadcrumbs;


# static fields
.field public static final DEFAULT_MAX_LOG_SIZE_BYTES:I = 0xfa00

.field private static final transient LOG_TAG:Ljava/lang/String; = "BacktraceBreadcrumbs"

.field private static final breadcrumbLogFileName:Ljava/lang/String; = "bt-breadcrumbs-0"


# instance fields
.field private backtraceActivityLifecycleListener:Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;

.field private backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

.field private backtraceBroadcastReceiver:Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;

.field private backtraceComponentListener:Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;

.field breadcrumbLogDirectory:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private enabledBreadcrumbTypes:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "breadcrumbLogDirectory"
        }
    .end annotation

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->breadcrumbLogDirectory:Ljava/lang/String;

    return-void
.end method

.method private addConfigurationBreadcrumb()Z
    .locals 7

    .line 304
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 305
    sget-object v0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Could not add configuration breadcrumb, BreadcrumbsLogManager is null"

    invoke-static {v0, v2}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 309
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 311
    invoke-static {}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->values()[Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    move-result-object v2

    array-length v3, v2

    :goto_0
    if-ge v1, v3, :cond_3

    aget-object v4, v2, v1

    .line 312
    sget-object v5, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->CONFIGURATION:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v6, "enabled"

    if-ne v4, v5, :cond_1

    .line 313
    invoke-virtual {v4}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    :cond_1
    iget-object v5, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enabledBreadcrumbTypes:Ljava/util/EnumSet;

    if-eqz v5, :cond_2

    .line 317
    invoke-virtual {v5, v4}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1

    :cond_2
    const-string v6, "disabled"

    .line 319
    :goto_1
    invoke-virtual {v4}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 322
    :cond_3
    iget-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    sget-object v2, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->CONFIGURATION:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    sget-object v3, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v4, "Breadcrumbs configuration"

    invoke-virtual {v1, v4, v0, v2, v3}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result v0

    return v0
.end method

.method private isBreadcrumbsEnabled()Z
    .locals 1

    .line 329
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enabledBreadcrumbTypes:Ljava/util/EnumSet;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/EnumSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private registerAutomaticBreadcrumbReceivers()V
    .locals 3

    .line 83
    invoke-direct {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->unregisterAutomaticBreadcrumbReceivers()V

    .line 85
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enabledBreadcrumbTypes:Ljava/util/EnumSet;

    if-nez v0, :cond_0

    .line 86
    sget-object v0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->LOG_TAG:Ljava/lang/String;

    const-string v1, "No breadcrumbs are enabled, not registering any new breadcrumb receivers"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 90
    :cond_0
    new-instance v0, Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;

    invoke-direct {v0, p0}, Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;-><init>(Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;)V

    iput-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBroadcastReceiver:Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;

    .line 91
    iget-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    .line 92
    invoke-virtual {v0}, Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object v2

    .line 91
    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 94
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enabledBreadcrumbTypes:Ljava/util/EnumSet;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    new-instance v0, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;

    invoke-direct {v0, p0}, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;-><init>(Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;)V

    iput-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceComponentListener:Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;

    .line 96
    iget-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 98
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Application;

    if-eqz v0, :cond_1

    .line 99
    new-instance v0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;

    invoke-direct {v0, p0}, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;-><init>(Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;)V

    iput-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceActivityLifecycleListener:Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;

    .line 100
    iget-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    check-cast v1, Landroid/app/Application;

    invoke-virtual {v1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_1
    return-void
.end method

.method private unregisterAutomaticBreadcrumbReceivers()V
    .locals 3

    .line 59
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBroadcastReceiver:Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 60
    sget-object v0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Unregistering previous BacktraceBroadcastReceiver"

    invoke-static {v0, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    iget-object v2, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBroadcastReceiver:Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 62
    iput-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBroadcastReceiver:Lbacktraceio/library/breadcrumbs/BacktraceBroadcastReceiver;

    .line 65
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceComponentListener:Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;

    if-eqz v0, :cond_1

    .line 66
    sget-object v0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Unregistering previous BacktraceComponentListener"

    invoke-static {v0, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    iget-object v2, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceComponentListener:Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 68
    iput-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceComponentListener:Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;

    .line 71
    :cond_1
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceActivityLifecycleListener:Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;

    if-eqz v0, :cond_3

    .line 72
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Application;

    if-eqz v0, :cond_2

    .line 73
    sget-object v0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Unregistering previous BacktraceActivityLifecycleListener"

    invoke-static {v0, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    check-cast v0, Landroid/app/Application;

    iget-object v2, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceActivityLifecycleListener:Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;

    invoke-virtual {v0, v2}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 75
    iput-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceActivityLifecycleListener:Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;

    goto :goto_0

    .line 77
    :cond_2
    sget-object v0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->LOG_TAG:Ljava/lang/String;

    const-string v1, "BacktraceActivityLifecycleListener registered with non-Activity context"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public addBreadcrumb(Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .line 186
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->MANUAL:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2, v0, v1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1
.end method

.method public addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "level"
        }
    .end annotation

    .line 198
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->MANUAL:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0, p2}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1
.end method

.method public addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "type"
        }
    .end annotation

    .line 235
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, p2, v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1
.end method

.method public addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "message",
            "type",
            "level"
        }
    .end annotation

    const/4 v0, 0x0

    .line 248
    invoke-virtual {p0, p1, v0, p2, p3}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1
.end method

.method public addBreadcrumb(Ljava/lang/String;Ljava/util/Map;)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 210
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->MANUAL:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    invoke-virtual {p0, p1, p2, v0, v1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1
.end method

.method public addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "message",
            "attributes",
            "level"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;",
            ")Z"
        }
    .end annotation

    .line 223
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->MANUAL:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {p0, p1, p2, v0, p3}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1
.end method

.method public addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "message",
            "attributes",
            "type"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            ")Z"
        }
    .end annotation

    .line 261
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    invoke-virtual {p0, p1, p2, p3, v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1
.end method

.method public addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "message",
            "attributes",
            "type",
            "level"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;",
            ")Z"
        }
    .end annotation

    .line 275
    invoke-direct {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->isBreadcrumbsEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    if-eqz v0, :cond_0

    .line 276
    invoke-virtual {v0, p1, p2, p3, p4}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public clearBreadcrumbs()Z
    .locals 1

    .line 149
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    invoke-virtual {v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;->clear()Z

    move-result v0

    .line 151
    invoke-direct {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addConfigurationBreadcrumb()Z

    return v0
.end method

.method public enableBreadcrumbs(Landroid/content/Context;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 107
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->ALL:Ljava/util/EnumSet;

    invoke-virtual {p0, p1, v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enableBreadcrumbs(Landroid/content/Context;Ljava/util/EnumSet;)Z

    move-result p1

    return p1
.end method

.method public enableBreadcrumbs(Landroid/content/Context;I)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "maxBreadcrumbLogSizeBytes"
        }
    .end annotation

    .line 117
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->ALL:Ljava/util/EnumSet;

    invoke-virtual {p0, p1, v0, p2}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enableBreadcrumbs(Landroid/content/Context;Ljava/util/EnumSet;I)Z

    move-result p1

    return p1
.end method

.method public enableBreadcrumbs(Landroid/content/Context;Ljava/util/EnumSet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "breadcrumbTypesToEnable"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            ">;)Z"
        }
    .end annotation

    const v0, 0xfa00

    .line 112
    invoke-virtual {p0, p1, p2, v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enableBreadcrumbs(Landroid/content/Context;Ljava/util/EnumSet;I)Z

    move-result p1

    return p1
.end method

.method public enableBreadcrumbs(Landroid/content/Context;Ljava/util/EnumSet;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "breadcrumbTypesToEnable",
            "maxBreadcrumbLogSizeBytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            ">;I)Z"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->context:Landroid/content/Context;

    .line 123
    iget-object p1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    if-nez p1, :cond_0

    .line 125
    :try_start_0
    new-instance p1, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->breadcrumbLogDirectory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "bt-breadcrumbs-0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0, p3}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 129
    sget-object p2, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->LOG_TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Could not start the Breadcrumb logger due to: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    .line 134
    :cond_0
    :goto_0
    iput-object p2, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enabledBreadcrumbTypes:Ljava/util/EnumSet;

    .line 135
    invoke-direct {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->registerAutomaticBreadcrumbReceivers()V

    .line 138
    invoke-direct {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addConfigurationBreadcrumb()Z

    const/4 p1, 0x1

    return p1
.end method

.method public getBreadcrumbLogPath()Ljava/lang/String;
    .locals 2

    .line 333
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->breadcrumbLogDirectory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "bt-breadcrumbs-0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentBreadcrumbId()J
    .locals 2

    .line 175
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    invoke-virtual {v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;->getCurrentBreadcrumbId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getEnabledBreadcrumbTypes()Ljava/util/EnumSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            ">;"
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->enabledBreadcrumbTypes:Ljava/util/EnumSet;

    return-object v0
.end method

.method public processReportBreadcrumbs(Lbacktraceio/library/models/json/BacktraceReport;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceReport"
        }
    .end annotation

    .line 288
    invoke-direct {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->isBreadcrumbsEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 292
    :cond_0
    iget-object v0, p1, Lbacktraceio/library/models/json/BacktraceReport;->attachmentPaths:Ljava/util/List;

    invoke-virtual {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->getBreadcrumbLogPath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    invoke-virtual {p0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->getCurrentBreadcrumbId()J

    move-result-wide v0

    .line 295
    iget-object p1, p1, Lbacktraceio/library/models/json/BacktraceReport;->attributes:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "breadcrumbs.lastId"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setCurrentBreadcrumbId(J)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "breadcrumbId"
        }
    .end annotation

    .line 162
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->backtraceBreadcrumbsLogManager:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;

    invoke-virtual {v0, p1, p2}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbsLogManager;->setCurrentBreadcrumbId(J)V

    return-void
.end method
