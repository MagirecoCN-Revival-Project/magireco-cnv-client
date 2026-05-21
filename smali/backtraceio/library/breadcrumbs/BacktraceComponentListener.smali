.class public Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;
.super Ljava/lang/Object;
.source "BacktraceComponentListener.java"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# instance fields
.field private final backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;


# direct methods
.method public constructor <init>(Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceBreadcrumbs"
        }
    .end annotation

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    return-void
.end method

.method private getMemoryWarningLevel(I)Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "level"
        }
    .end annotation

    const/4 v0, 0x5

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0xf

    if-eq p1, v0, :cond_0

    const/16 v0, 0x28

    if-eq p1, v0, :cond_1

    const/16 v0, 0x3c

    if-eq p1, v0, :cond_0

    const/16 v0, 0x50

    if-eq p1, v0, :cond_0

    .line 52
    sget-object p1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->WARNING:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    return-object p1

    .line 50
    :cond_0
    sget-object p1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->FATAL:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    return-object p1

    .line 46
    :cond_1
    sget-object p1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->ERROR:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    return-object p1
.end method

.method private getMemoryWarningString(I)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "level"
        }
    .end annotation

    const/4 v0, 0x5

    if-eq p1, v0, :cond_6

    const/16 v0, 0xa

    if-eq p1, v0, :cond_5

    const/16 v0, 0xf

    if-eq p1, v0, :cond_4

    const/16 v0, 0x14

    if-eq p1, v0, :cond_3

    const/16 v0, 0x28

    if-eq p1, v0, :cond_2

    const/16 v0, 0x3c

    if-eq p1, v0, :cond_1

    const/16 v0, 0x50

    if-eq p1, v0, :cond_0

    const-string p1, "Generic memory warning"

    return-object p1

    :cond_0
    const-string p1, "TRIM MEMORY COMPLETE"

    return-object p1

    :cond_1
    const-string p1, "TRIM MEMORY MODERATE"

    return-object p1

    :cond_2
    const-string p1, "TRIM MEMORY BACKGROUND"

    return-object p1

    :cond_3
    const-string p1, "TRIM MEMORY UI HIDDEN"

    return-object p1

    :cond_4
    const-string p1, "TRIM MEMORY RUNNING CRITICAL"

    return-object p1

    :cond_5
    const-string p1, "TRIM MEMORY RUNNING LOW"

    return-object p1

    :cond_6
    const-string p1, "TRIM MEMORY RUNNING MODERATE"

    return-object p1
.end method

.method private stringifyOrientation(I)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "orientation"
        }
    .end annotation

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const-string p1, "unknown orientation"

    return-object p1

    :cond_0
    const-string p1, "landscape"

    return-object p1

    :cond_1
    const-string p1, "portrait"

    return-object p1
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newConfig"
        }
    .end annotation

    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 79
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-direct {p0, p1}, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;->stringifyOrientation(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "orientation"

    .line 80
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    iget-object p1, p0, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    sget-object v2, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v3, "Configuration changed"

    invoke-virtual {p1, v3, v0, v1, v2}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    return-void
.end method

.method public onLowMemory()V
    .locals 4

    .line 89
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    sget-object v2, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->FATAL:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v3, "Critical low memory warning!"

    invoke-virtual {v0, v3, v1, v2}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "level"
        }
    .end annotation

    .line 58
    invoke-direct {p0, p1}, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;->getMemoryWarningString(I)Ljava/lang/String;

    move-result-object v0

    .line 59
    invoke-direct {p0, p1}, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;->getMemoryWarningLevel(I)Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    move-result-object p1

    .line 60
    iget-object v1, p0, Lbacktraceio/library/breadcrumbs/BacktraceComponentListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v2, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v1, v0, v2, p1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;)Z

    return-void
.end method
