.class public Lcn/thinkingdata/analytics/TDAnalytics;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;,
        Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;,
        Lcn/thinkingdata/analytics/TDAnalytics$TDTrackStatus;,
        Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;,
        Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventType;
    }
.end annotation


# static fields
.field private static instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

.field public static sInstances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->sInstances:Ljava/util/Map;

    const/4 v0, 0x0

    sput-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calibrateTime(J)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->calibrateTime(J)V

    return-void
.end method

.method public static varargs calibrateTimeWithNtp([Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->calibrateTimeWithNtp([Ljava/lang/String;)V

    return-void
.end method

.method public static clearSuperProperties()V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->clearSuperProperties()V

    return-void
.end method

.method public static enableAutoTrack(I)V
    .locals 1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-static {p0, v0}, Lcn/thinkingdata/analytics/TDAnalytics;->enableAutoTrack(ILorg/json/JSONObject;)V

    return-void
.end method

.method public static enableAutoTrack(ILcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;)V
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-eqz v0, :cond_7

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    and-int/lit8 v1, p0, 0x1

    if-lez v1, :cond_1

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    and-int/lit8 v1, p0, 0x2

    if-lez v1, :cond_2

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    and-int/lit8 v1, p0, 0x4

    if-lez v1, :cond_3

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    and-int/lit8 v1, p0, 0x8

    if-lez v1, :cond_4

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    and-int/lit8 v1, p0, 0x10

    if-lez v1, :cond_5

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    and-int/lit8 p0, p0, 0x20

    if-lez p0, :cond_6

    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    new-instance p0, Lcn/thinkingdata/analytics/TDAnalytics$a;

    invoke-direct {p0, p1}, Lcn/thinkingdata/analytics/TDAnalytics$a;-><init>(Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;)V

    sget-object p1, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1, v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableAutoTrack(Ljava/util/List;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;)V

    :cond_7
    :goto_0
    return-void
.end method

.method public static enableAutoTrack(ILorg/json/JSONObject;)V
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    and-int/lit8 v1, p0, 0x1

    if-lez v1, :cond_1

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    and-int/lit8 v1, p0, 0x2

    if-lez v1, :cond_2

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    and-int/lit8 v1, p0, 0x4

    if-lez v1, :cond_3

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    and-int/lit8 v1, p0, 0x8

    if-lez v1, :cond_4

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    and-int/lit8 v1, p0, 0x10

    if-lez v1, :cond_5

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    and-int/lit8 p0, p0, 0x20

    if-lez p0, :cond_6

    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p0, v0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableAutoTrack(Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static enableLog(Z)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableTrackLog(Z)V

    return-void
.end method

.method public static enableThirdPartySharing(I)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableThirdPartySharing(I)V

    return-void
.end method

.method public static enableThirdPartySharing(ILjava/lang/Object;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableThirdPartySharing(ILjava/lang/Object;)V

    return-void
.end method

.method public static flush()V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    return-void
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDistinctId()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDistinctId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLocalRegion()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getLocalRegion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPresetProperties()Lcn/thinkingdata/analytics/TDPresetProperties;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    new-instance v0, Lcn/thinkingdata/analytics/TDPresetProperties;

    invoke-direct {v0}, Lcn/thinkingdata/analytics/TDPresetProperties;-><init>()V

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getPresetProperties()Lcn/thinkingdata/analytics/TDPresetProperties;

    move-result-object v0

    return-object v0
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    const-string v0, "3.0.0-beta.1"

    return-object v0
.end method

.method public static getSuperProperties()Lorg/json/JSONObject;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getSuperProperties()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public static ignoreAppViewEventInExtPackage()V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreAppViewEventInExtPackage()V

    return-void
.end method

.method public static ignoreAutoTrackActivities(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;)V"
        }
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreAutoTrackActivities(Ljava/util/List;)V

    return-void
.end method

.method public static ignoreAutoTrackActivity(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreAutoTrackActivity(Ljava/lang/Class;)V

    return-void
.end method

.method public static ignoreView(Landroid/view/View;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreView(Landroid/view/View;)V

    return-void
.end method

.method public static ignoreViewType(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreViewType(Ljava/lang/Class;)V

    return-void
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sharedInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    sput-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object p2, Lcn/thinkingdata/analytics/TDAnalytics;->sInstances:Ljava/util/Map;

    invoke-interface {p2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static init(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 2

    invoke-static {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sharedInstance(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    sput-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->sInstances:Ljava/util/Map;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static lightInstance()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->createLightInstance()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcn/thinkingdata/analytics/TDAnalytics;->sInstances:Ljava/util/Map;

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1
.end method

.method public static login(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->login(Ljava/lang/String;)V

    return-void
.end method

.method public static logout()V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->logout()V

    return-void
.end method

.method public static setCustomerLibInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setCustomerLibInfo(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setDistinctId(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->identify(Ljava/lang/String;)V

    return-void
.end method

.method public static setDynamicSuperProperties(Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-eqz v0, :cond_1

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcn/thinkingdata/analytics/TDAnalytics$b;

    invoke-direct {v0, p0}, Lcn/thinkingdata/analytics/TDAnalytics$b;-><init>(Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;)V

    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setDynamicSuperPropertiesTracker(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static setJsBridge(Landroid/webkit/WebView;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setJsBridge(Landroid/webkit/WebView;)V

    return-void
.end method

.method public static setJsBridgeForX5WebView(Ljava/lang/Object;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setJsBridgeForX5WebView(Ljava/lang/Object;)V

    return-void
.end method

.method public static setNetworkType(Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics$c;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    goto :goto_1

    :cond_1
    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;->NETWORKTYPE_ALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;

    goto :goto_0

    :cond_2
    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;->NETWORKTYPE_WIFI:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;

    :goto_0
    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setNetworkType(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;)V

    :goto_1
    return-void
.end method

.method public static setSuperProperties(Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setSuperProperties(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static setTrackStatus(Lcn/thinkingdata/analytics/TDAnalytics$TDTrackStatus;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics$c;->b:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    goto :goto_1

    :cond_1
    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->NORMAL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_0

    :cond_2
    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->SAVE_ONLY:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_0

    :cond_3
    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->STOP:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_0

    :cond_4
    sget-object p0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    :goto_0
    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    :goto_1
    return-void
.end method

.method public static setViewID(Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setViewID(Landroid/app/Dialog;Ljava/lang/String;)V

    return-void
.end method

.method public static setViewID(Landroid/view/View;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setViewID(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public static setViewProperties(Landroid/view/View;Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setViewProperties(Landroid/view/View;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static timeEvent(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->timeEvent(Ljava/lang/String;)V

    return-void
.end method

.method public static track(Lcn/thinkingdata/analytics/d;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;)V

    return-void
.end method

.method public static track(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;)V

    return-void
.end method

.method public static track(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0, p1, p2, p3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V

    return-void
.end method

.method public static trackFragmentAppViewScreen()V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackFragmentAppViewScreen()V

    return-void
.end method

.method public static trackViewScreen(Landroid/app/Activity;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreen(Landroid/app/Activity;)V

    return-void
.end method

.method public static trackViewScreen(Landroid/app/Fragment;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreen(Landroid/app/Fragment;)V

    return-void
.end method

.method public static trackViewScreen(Ljava/lang/Object;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreen(Ljava/lang/Object;)V

    return-void
.end method

.method public static unsetSuperProperty(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->unsetSuperProperty(Ljava/lang/String;)V

    return-void
.end method

.method public static userAdd(Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_add(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static userAppend(Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_append(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static userDelete()V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_delete()V

    return-void
.end method

.method public static userSet(Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_set(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static userSetOnce(Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_setOnce(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static userUniqAppend(Lorg/json/JSONObject;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_uniqAppend(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static varargs userUnset([Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->instance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_unset([Ljava/lang/String;)V

    return-void
.end method
