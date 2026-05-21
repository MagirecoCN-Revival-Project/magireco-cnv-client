.class Lcn/thinkingdata/analytics/c;
.super Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
.source ""


# instance fields
.field a:Landroid/content/Context;

.field b:Ljava/lang/String;

.field private final c:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Z

    invoke-direct {p0, p1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;-><init>(Lcn/thinkingdata/analytics/TDConfig;[Z)V

    iget-object p1, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    iput-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/c;->c:Lorg/json/JSONObject;

    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    invoke-static {p1}, Lcn/thinkingdata/analytics/utils/p;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/thinkingdata/analytics/c;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method a(Ljava/lang/String;J)D
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/f/d;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    invoke-virtual {v1, p2, p3}, Lcn/thinkingdata/analytics/f/d;->a(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p1

    goto :goto_0

    :cond_0
    const-wide/16 p1, 0x0

    :goto_0
    return-wide p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a()Landroid/content/Intent;
    .locals 4

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iget-object v1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    invoke-static {v1}, Lcn/thinkingdata/analytics/utils/p;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, "cn.thinkingdata.receiver"

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "#app_id"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method public a(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 7

    const-string v0, "#duration"

    const-string v1, "#bundle_id"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    :try_start_0
    const-string v5, "TA_KEY_SUBPROCESS_TAG__TA__"

    const/4 v6, 0x1

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    sget-object v5, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcn/thinkingdata/analytics/c;->b:Ljava/lang/String;

    invoke-virtual {v2, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    invoke-virtual {p0, p1, v3, v4}, Lcn/thinkingdata/analytics/c;->a(Ljava/lang/String;J)D

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmpl-double p1, v3, v5

    if-lez p1, :cond_1

    sget-object p1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v2, v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDynamicSuperPropertiesTracker()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDynamicSuperPropertiesTracker()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;

    move-result-object p1

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;->getDynamicSuperProperties()Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_2

    :try_start_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {p1, v2, v0}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_2
    :goto_1
    :try_start_2
    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object p1

    invoke-static {p2, v2, p1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_2
    return-object v2
.end method

.method public autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "#event_name"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-nez p2, :cond_0

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcn/thinkingdata/analytics/c;->a(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p2

    :try_start_0
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->getAutoTrackProperties()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    const-string p1, "properties"

    :try_start_1
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "TD_ACTION"

    const p2, 0x100006

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_2

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_0
    return-void
.end method

.method public clearSuperProperties()V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const v2, 0x200007

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public enableAutoTrack(Ljava/util/List;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public enableTracking(Z)V
    .locals 0

    return-void
.end method

.method public flush()V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const v2, 0x200005

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public getAutoTrackProperties()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/c;->c:Lorg/json/JSONObject;

    return-object v0
.end method

.method public hasOptOut()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public identify(Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const v2, 0x200004

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "#distinct_id"

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public login(Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const v2, 0x200002

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "#account_id"

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public logout()V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const v2, 0x200003

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public optInTracking()V
    .locals 0

    return-void
.end method

.method public optOutTracking()V
    .locals 0

    return-void
.end method

.method public optOutTrackingAndDeleteUser()V
    .locals 0

    return-void
.end method

.method public setAutoTrackProperties(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->hasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_3

    :try_start_0
    invoke-static {p2}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {p2, v2, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->getEventName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->c:Lorg/json/JSONObject;

    monitor-enter p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object p2, p0, Lcn/thinkingdata/analytics/c;->c:Lorg/json/JSONObject;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v0, p2, v1}, Lcn/thinkingdata/analytics/utils/p;->b(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    monitor-exit p1

    goto :goto_2

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p2

    :cond_3
    :goto_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-nez p1, :cond_4

    return-void

    :cond_4
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "Set autoTrackEvent properties failed. Please refer to the SDK debug log for details."

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    return-void
.end method

.method public setNetworkType(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;)V
    .locals 0

    return-void
.end method

.method public setSuperProperties(Lorg/json/JSONObject;)V
    .locals 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "TD_ACTION"

    const v3, 0x200001

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_0

    const-string p1, "properties"

    :try_start_1
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method public setTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
    .locals 0

    return-void
.end method

.method public track(Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;)V
    .locals 4

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/c$a;->a:[I

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getDataType()Lcn/thinkingdata/analytics/utils/j;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const-string v2, "TD_ACTION"

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2

    const/4 v3, 0x2

    if-eq v1, v3, :cond_1

    const/4 v3, 0x3

    if-eq v1, v3, :cond_0

    goto :goto_1

    :cond_0
    const v1, 0x100003

    goto :goto_0

    :cond_1
    const v1, 0x100004

    goto :goto_0

    :cond_2
    const v1, 0x100005

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :goto_1
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getEventName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "#event_name"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getProperties()Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_3

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_2

    :cond_3
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getProperties()Lorg/json/JSONObject;

    move-result-object v1

    :goto_2
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getEventName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcn/thinkingdata/analytics/c;->a(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "properties"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getEventTime()Ljava/util/Date;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getEventTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-string v3, "TD_DATE"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    :cond_4
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TD_KEY_TIMEZONE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_5
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getExtraValue()Ljava/lang/String;

    move-result-object p1

    const-string v1, "TD_KEY_EXTRA_FIELD"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_6

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_6
    return-void
.end method

.method public track(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0, v0}, Lcn/thinkingdata/analytics/c;->track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V

    return-void
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v0}, Lcn/thinkingdata/analytics/c;->track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V

    return-void
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcn/thinkingdata/analytics/c;->track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V

    return-void
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const v2, 0x100002

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "#event_name"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-nez p2, :cond_0

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcn/thinkingdata/analytics/c;->a(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "properties"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    const-string p3, "TD_DATE"

    invoke-virtual {v0, p3, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    :cond_1
    if-eqz p4, :cond_2

    invoke-virtual {p4}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object p1

    const-string p2, "TD_KEY_TIMEZONE"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_3

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_3
    return-void
.end method

.method public unsetSuperProperty(Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const v2, 0x200006

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    if-eqz p1, :cond_0

    const-string v1, "properties"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/c;->a()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "TD_ACTION"

    const/high16 v2, 0x200000

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/utils/j;->a()Ljava/lang/String;

    move-result-object p1

    const-string v1, "TD_KEY_USER_PROPERTY_SET_TYPE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p2, :cond_0

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {p2, p1, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    invoke-virtual {p2}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "properties"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    const-string p3, "TD_DATE"

    invoke-virtual {v0, p3, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    :cond_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/c;->a:Landroid/content/Context;

    if-eqz p1, :cond_2

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_2
    return-void
.end method
