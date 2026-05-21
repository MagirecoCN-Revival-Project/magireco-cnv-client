.class Lcn/thinkingdata/analytics/e/b$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Lcn/thinkingdata/analytics/utils/d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lorg/json/JSONObject;

.field final synthetic b:Lcn/thinkingdata/analytics/utils/d;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Z

.field final synthetic f:Lcn/thinkingdata/analytics/e/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/e/b;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/e/b$a;->f:Lcn/thinkingdata/analytics/e/b;

    iput-object p2, p0, Lcn/thinkingdata/analytics/e/b$a;->a:Lorg/json/JSONObject;

    iput-object p3, p0, Lcn/thinkingdata/analytics/e/b$a;->b:Lcn/thinkingdata/analytics/utils/d;

    iput-object p4, p0, Lcn/thinkingdata/analytics/e/b$a;->c:Ljava/lang/String;

    iput-object p5, p0, Lcn/thinkingdata/analytics/e/b$a;->d:Ljava/lang/String;

    iput-boolean p6, p0, Lcn/thinkingdata/analytics/e/b$a;->e:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b$a;->f:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getAutoTrackStartProperties()Lorg/json/JSONObject;

    move-result-object v4

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b$a;->a:Lorg/json/JSONObject;

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b$a;->f:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v1

    iget-object v1, v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v0, v4, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    new-instance v0, Lcn/thinkingdata/analytics/f/a;

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b$a;->f:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v2

    sget-object v3, Lcn/thinkingdata/analytics/utils/j;->b:Lcn/thinkingdata/analytics/utils/j;

    iget-object v5, p0, Lcn/thinkingdata/analytics/e/b$a;->b:Lcn/thinkingdata/analytics/utils/d;

    iget-object v6, p0, Lcn/thinkingdata/analytics/e/b$a;->c:Ljava/lang/String;

    iget-object v7, p0, Lcn/thinkingdata/analytics/e/b$a;->d:Ljava/lang/String;

    iget-boolean v8, p0, Lcn/thinkingdata/analytics/e/b$a;->e:Z

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcn/thinkingdata/analytics/f/a;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    const-string v1, "ta_app_start"

    iput-object v1, v0, Lcn/thinkingdata/analytics/f/a;->a:Ljava/lang/String;

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b$a;->f:Lcn/thinkingdata/analytics/e/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/e/b;->a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackInternal(Lcn/thinkingdata/analytics/f/a;)V

    return-void
.end method
