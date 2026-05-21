.class public Lcn/thinkingdata/analytics/f/g;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

.field private final b:Lcn/thinkingdata/analytics/TDConfig;


# direct methods
.method public constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/f/g;->b:Lcn/thinkingdata/analytics/TDConfig;

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/f/g;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/f/g;->b:Lcn/thinkingdata/analytics/TDConfig;

    return-object p0
.end method

.method static synthetic b(Lcn/thinkingdata/analytics/f/g;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    return-object p0
.end method


# virtual methods
.method public a(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 9

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-nez p3, :cond_1

    iget-object p3, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object p3, p3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {p3}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object p3

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v0, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    const/4 v1, 0x0

    invoke-virtual {v0, p3, v1}, Lcn/thinkingdata/analytics/utils/a;->a(Ljava/util/Date;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/utils/d;

    move-result-object p3

    :goto_0
    move-object v4, p3

    iget-object p3, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusAccountId()Ljava/lang/String;

    move-result-object v6

    iget-object p3, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusIdentifyId()Ljava/lang/String;

    move-result-object v5

    iget-object p3, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isStatusTrackSaveOnly()Z

    move-result v7

    iget-object p3, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object p3, p3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v8, Lcn/thinkingdata/analytics/f/g$a;

    move-object v0, v8

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    invoke-direct/range {v0 .. v7}, Lcn/thinkingdata/analytics/f/g$a;-><init>(Lcn/thinkingdata/analytics/f/g;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/j;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p3, v8}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/Number;)V
    .locals 1

    if-nez p2, :cond_1

    :try_start_0
    const-string p1, "ThinkingAnalytics.UserOperation"

    const-string p2, "user_add value must be Number"

    invoke-static {p1, p2}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/g;->b:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "Invalid property values for user add."

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lcn/thinkingdata/analytics/f/g;->a(Lorg/json/JSONObject;Ljava/util/Date;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    iget-object p2, p0, Lcn/thinkingdata/analytics/f/g;->b:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p2}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p2

    if-nez p2, :cond_2

    :goto_0
    return-void

    :cond_2
    new-instance p2, Lcn/thinkingdata/analytics/utils/k;

    invoke-direct {p2, p1}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public a(Ljava/util/Date;)V
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/utils/j;->j:Lcn/thinkingdata/analytics/utils/j;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public a(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/utils/j;->e:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v0, v1, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public varargs a([Ljava/lang/String;)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, p1, v3

    :try_start_0
    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result p1

    if-lez p1, :cond_2

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lcn/thinkingdata/analytics/f/g;->f(Lorg/json/JSONObject;Ljava/util/Date;)V

    :cond_2
    return-void
.end method

.method public b(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/utils/j;->i:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v0, v1, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public c(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/utils/j;->f:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v0, v1, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public d(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/utils/j;->g:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v0, v1, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public e(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/utils/j;->k:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v0, v1, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public f(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/utils/j;->h:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v0, v1, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method
