.class public Lcn/thinkingdata/analytics/aop/push/TAPushProcess;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final GT_PUSH_MSG:I = 0x64

.field private static INSTANCE:Lcn/thinkingdata/analytics/aop/push/TAPushProcess; = null

.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.process"


# instance fields
.field private final mGeTuiMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/aop/push/TANotificationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mPushHandler:Landroid/os/Handler;


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mGeTuiMap:Ljava/util/Map;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "TA.PushThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Lcn/thinkingdata/analytics/aop/push/TAPushProcess$1;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess$1;-><init>(Lcn/thinkingdata/analytics/aop/push/TAPushProcess;Landroid/os/Looper;)V

    iput-object v1, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mPushHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcn/thinkingdata/analytics/aop/push/TAPushProcess;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mGeTuiMap:Ljava/util/Map;

    return-object p0
.end method

.method public static declared-synchronized getInstance()Lcn/thinkingdata/analytics/aop/push/TAPushProcess;
    .locals 2

    const-class v0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->INSTANCE:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    invoke-direct {v1}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;-><init>()V

    sput-object v1, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->INSTANCE:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    :cond_0
    sget-object v1, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->INSTANCE:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public onNotificationClick(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    :cond_0
    :try_start_0
    instance-of p1, p1, Landroid/app/Activity;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ThinkingAnalytics.process"

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method trackGTDelayed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    :try_start_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x64

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mGeTuiMap:Ljava/util/Map;

    new-instance v2, Lcn/thinkingdata/analytics/aop/push/TANotificationInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {v2, p2, p3, v3, v4}, Lcn/thinkingdata/analytics/aop/push/TANotificationInfo;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mPushHandler:Landroid/os/Handler;

    const-wide/16 p2, 0xc8

    invoke-virtual {p1, v0, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ThinkingAnalytics.process"

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method trackGeTuiReceiveMessageData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string p1, "ThinkingAnalytics.process"

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mPushHandler:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mGeTuiMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mPushHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mGeTuiMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/thinkingdata/analytics/aop/push/TANotificationInfo;

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->mGeTuiMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " onGeTuiReceiveMessage:msg id : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method
