.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setSuperProperties(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lorg/json/JSONObject;

.field final synthetic b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;->a:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;->a:Lorg/json/JSONObject;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v3, v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lcn/thinkingdata/analytics/g/b;->a(Lorg/json/JSONObject;Ljava/util/TimeZone;Z)V

    return-void
.end method
