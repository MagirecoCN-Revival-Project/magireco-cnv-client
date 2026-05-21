.class final Lcn/thinkingdata/analytics/TDAnalytics$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/TDAnalytics;->enableAutoTrack(ILcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDAnalytics$a;->a:Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public eventCallback(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x2

    goto :goto_0

    :cond_1
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    if-ne p1, v0, :cond_2

    const/4 p1, 0x4

    goto :goto_0

    :cond_2
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    if-ne p1, v0, :cond_3

    const/16 p1, 0x8

    goto :goto_0

    :cond_3
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    if-ne p1, v0, :cond_4

    const/16 p1, 0x10

    goto :goto_0

    :cond_4
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    if-ne p1, v0, :cond_5

    const/16 p1, 0x20

    goto :goto_0

    :cond_5
    const/4 p1, 0x0

    :goto_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/TDAnalytics$a;->a:Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;

    invoke-interface {v0, p1, p2}, Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;->getAutoTrackEventProperties(ILorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method
