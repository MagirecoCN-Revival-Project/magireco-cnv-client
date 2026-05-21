.class public Lcn/thinkingdata/analytics/aop/push/TAPushLifecycleCallbacks;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.TAPushLifecycle"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    invoke-static {}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->getInstance()Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    move-result-object p2

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->onNotificationClick(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 2

    invoke-static {}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->getInstance()Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->onNotificationClick(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
