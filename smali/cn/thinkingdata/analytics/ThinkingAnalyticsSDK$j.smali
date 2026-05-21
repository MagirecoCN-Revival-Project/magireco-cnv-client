.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->timeEvent(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:J

.field final synthetic c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;J)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->a:Ljava/lang/String;

    iput-wide p3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->a:Ljava/lang/String;

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/f;->a(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    const-string v0, "ThinkingAnalyticsSDK"

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "timeEvent event name["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "] is not valid"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v0, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    monitor-enter v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v1, v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->a:Ljava/lang/String;

    new-instance v3, Lcn/thinkingdata/analytics/f/d;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v5, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;->b:J

    invoke-direct {v3, v4, v5, v6}, Lcn/thinkingdata/analytics/f/d;-><init>(Ljava/util/concurrent/TimeUnit;J)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method
