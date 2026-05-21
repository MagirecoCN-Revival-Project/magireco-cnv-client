.class final Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->trackEvent(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;->a:Ljava/lang/String;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;->b:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;->c:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 2

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;->b:Ljava/lang/String;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$b;->c:Lorg/json/JSONObject;

    invoke-virtual {p1, v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    :cond_1
    return-void
.end method
