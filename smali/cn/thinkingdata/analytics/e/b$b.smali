.class Lcn/thinkingdata/analytics/e/b$b;
.super Ljava/util/TimerTask;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/e/b;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/utils/d;

.field final synthetic b:Lcn/thinkingdata/analytics/e/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/e/b;Lcn/thinkingdata/analytics/utils/d;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    iput-object p2, p0, Lcn/thinkingdata/analytics/e/b$b;->a:Lcn/thinkingdata/analytics/utils/d;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const-string v0, "#start_reason"

    const-string v1, "ta_app_start"

    const-string v2, "#resume_from_background"

    iget-object v3, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v3}, Lcn/thinkingdata/analytics/e/b;->b(Lcn/thinkingdata/analytics/e/b;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const/4 v4, 0x1

    :try_start_0
    sget-object v5, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v5}, Lcn/thinkingdata/analytics/e/b;->c(Lcn/thinkingdata/analytics/e/b;)Z

    move-result v5

    invoke-virtual {v3, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_0
    sget-object v2, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/e/b;->a()Ljava/lang/String;

    move-result-object v2

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v2}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v2

    iget-object v5, p0, Lcn/thinkingdata/analytics/e/b$b;->a:Lcn/thinkingdata/analytics/utils/d;

    invoke-virtual {v2, v1, v3, v5}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v1, v4}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;Z)Z

    throw v0

    :catch_0
    :cond_1
    :goto_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b$b;->a:Lcn/thinkingdata/analytics/utils/d;

    invoke-virtual {v0, v1, v3, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b$b;->b:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v0, v4}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;Z)Z

    :cond_2
    return-void
.end method
