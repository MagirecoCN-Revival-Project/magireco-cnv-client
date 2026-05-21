.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;ZLjava/util/Map;Lcn/thinkingdata/analytics/utils/j;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lorg/json/JSONObject;

.field final synthetic c:Z

.field final synthetic d:J

.field final synthetic e:Lcn/thinkingdata/analytics/utils/j;

.field final synthetic f:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

.field final synthetic g:Lcn/thinkingdata/analytics/utils/d;

.field final synthetic h:Ljava/lang/String;

.field final synthetic i:Ljava/lang/String;

.field final synthetic j:Z

.field final synthetic k:Ljava/util/Map;

.field final synthetic l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;Lorg/json/JSONObject;ZJLcn/thinkingdata/analytics/utils/j;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->b:Lorg/json/JSONObject;

    iput-boolean p4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->c:Z

    iput-wide p5, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->d:J

    iput-object p7, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->e:Lcn/thinkingdata/analytics/utils/j;

    iput-object p8, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->f:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p9, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->g:Lcn/thinkingdata/analytics/utils/d;

    iput-object p10, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->h:Ljava/lang/String;

    iput-object p11, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->i:Ljava/lang/String;

    iput-boolean p12, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->j:Z

    iput-object p13, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->k:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v0, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/TDConfig;->isDisabledEvent(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "ThinkingAnalyticsSDK"

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignoring disabled event ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->b:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "TA_KEY_SUBPROCESS_TAG__TA__"

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    :try_start_1
    const-string v3, "#bundle_id"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->b:Lorg/json/JSONObject;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x0

    :goto_1
    iget-boolean v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->c:Z

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    invoke-static {v3}, Lcn/thinkingdata/analytics/utils/f;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[ThinkingData] Error: Incorrect Event name["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "]. Event name must be string that starts with English letter, and contains letter, number, and \'_\'. The max length of the event name is 50."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v3, v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_2

    :cond_3
    new-instance v0, Lcn/thinkingdata/analytics/utils/k;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid event name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    :goto_2
    iget-boolean v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->c:Z

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->b:Lorg/json/JSONObject;

    invoke-static {v3}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v3

    if-nez v3, :cond_6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[ThinkingData] Warning: The data contains invalid key or value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->b:Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v3, v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_3

    :cond_5
    new-instance v0, Lcn/thinkingdata/analytics/utils/k;

    const-string v1, "Invalid properties. Please refer to SDK debug log for detail reasons."

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    :goto_3
    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    iget-wide v5, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->d:J

    invoke-static {v3, v4, v5, v6, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$000(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;JZ)Lorg/json/JSONObject;

    move-result-object v10

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->b:Lorg/json/JSONObject;

    if-eqz v3, :cond_7

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v4, v4, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v4}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v4

    invoke-static {v3, v10, v4}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_7
    if-nez v0, :cond_9

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    invoke-static {v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->autoTrackEventTypeFromEventName(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    move-result-object v3

    if-eqz v3, :cond_9

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;

    move-result-object v4

    if-eqz v4, :cond_8

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;

    move-result-object v1

    invoke-interface {v1, v3, v10}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;->eventCallback(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_9

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v3, v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {v1, v10, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    goto :goto_4

    :cond_8
    const-string v3, "No mAutoTrackEventListener"

    invoke-static {v1, v3}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    :goto_4
    if-eqz v0, :cond_a

    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_a
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->e:Lcn/thinkingdata/analytics/utils/j;

    if-nez v0, :cond_b

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->b:Lcn/thinkingdata/analytics/utils/j;

    :cond_b
    move-object v9, v0

    new-instance v0, Lcn/thinkingdata/analytics/f/a;

    iget-object v8, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->f:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v11, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->g:Lcn/thinkingdata/analytics/utils/d;

    iget-object v12, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->h:Ljava/lang/String;

    iget-object v13, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->i:Ljava/lang/String;

    iget-boolean v14, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->j:Z

    move-object v7, v0

    invoke-direct/range {v7 .. v14}, Lcn/thinkingdata/analytics/f/a;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->a:Ljava/lang/String;

    iput-object v1, v0, Lcn/thinkingdata/analytics/f/a;->a:Ljava/lang/String;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->k:Ljava/util/Map;

    if-eqz v1, :cond_c

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/f/a;->a(Ljava/util/Map;)V

    :cond_c
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;->l:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackInternal(Lcn/thinkingdata/analytics/f/a;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :goto_5
    return-void
.end method
