.class public Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;
.super Ljava/lang/Object;
.source "BacktraceActivityLifecycleListener.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


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

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "activity",
            "savedInstanceState"
        }
    .end annotation

    .line 19
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onActivityCreated()"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 20
    iget-object p2, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {p2, p1, v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onActivityDestroyed()"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 56
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v0, p1, v1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onActivityPaused()"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 38
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v0, p1, v1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onActivityResumed()"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 32
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v0, p1, v1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "activity",
            "outState"
        }
    .end annotation

    .line 49
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onActivitySaveInstanceState()"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 50
    iget-object p2, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {p2, p1, v0}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onActivityStarted()"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 26
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v0, p1, v1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " onActivityStopped()"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 44
    iget-object v0, p0, Lbacktraceio/library/breadcrumbs/BacktraceActivityLifecycleListener;->backtraceBreadcrumbs:Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    sget-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v0, p1, v1}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;->addBreadcrumb(Ljava/lang/String;Lbacktraceio/library/enums/BacktraceBreadcrumbType;)Z

    return-void
.end method
