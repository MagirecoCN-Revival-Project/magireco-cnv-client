.class final Lcn/thinkingdata/analytics/aop/push/TAPushUtils$1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/aop/push/TAPushUtils;->trackPushClickEvent(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$flags:[Z

.field final synthetic val$properties:Lorg/json/JSONObject;


# direct methods
.method constructor <init>([ZLorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/aop/push/TAPushUtils$1;->val$flags:[Z

    iput-object p2, p0, Lcn/thinkingdata/analytics/aop/push/TAPushUtils$1;->val$properties:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushUtils$1;->val$flags:[Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    aput-boolean v2, v0, v1

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushUtils$1;->val$properties:Lorg/json/JSONObject;

    const-string v1, "ops_push_click"

    invoke-static {p1, v1, v0}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onAppPushClickEvent(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method
