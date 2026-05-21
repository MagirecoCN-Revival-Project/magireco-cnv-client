.class public Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/core/router/plugin/IPlugin;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lcn/thinkingdata/core/router/plugin/MethodCall;)V
    .locals 8

    iget-object v0, p1, Lcn/thinkingdata/core/router/plugin/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    const-string v1, "updatePushToken"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "appId"

    if-nez v1, :cond_1

    const-string v1, "uploadPushClick"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v2}, Lcn/thinkingdata/core/router/plugin/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "ops_properties"

    invoke-virtual {p1, v1}, Lcn/thinkingdata/core/router/plugin/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v2, "#ops_receipt_properties"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$b;

    invoke-direct {p1, p0, v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$b;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-static {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->allInstances(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_1
    const-string v0, "token"

    invoke-virtual {p1, v0}, Lcn/thinkingdata/core/router/plugin/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v3, "user_language"

    invoke-virtual {p1, v3}, Lcn/thinkingdata/core/router/plugin/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "local_zone"

    invoke-virtual {p1, v5}, Lcn/thinkingdata/core/router/plugin/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {p1, v2}, Lcn/thinkingdata/core/router/plugin/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    :try_start_1
    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v2, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    new-instance v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$a;

    invoke-direct {v0, p0, p1, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$a;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->allInstances(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method
