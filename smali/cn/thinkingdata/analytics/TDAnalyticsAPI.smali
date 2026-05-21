.class public Lcn/thinkingdata/analytics/TDAnalyticsAPI;
.super Ljava/lang/Object;
.source ""


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearSuperProperties(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->clearSuperProperties()V

    :cond_0
    return-void
.end method

.method public static enableAutoTrack(ILcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {p2}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p2

    if-eqz p2, :cond_7

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
    new-instance p0, Lcn/thinkingdata/analytics/TDAnalyticsAPI$a;

    invoke-direct {p0, p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI$a;-><init>(Lcn/thinkingdata/analytics/TDAnalytics$TDAutoTrackEventHandler;)V

    invoke-virtual {p2, v0, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableAutoTrack(Ljava/util/List;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;)V

    :cond_7
    return-void
.end method

.method public static enableAutoTrack(ILjava/lang/String;)V
    .locals 1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-static {p0, v0, p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->enableAutoTrack(ILorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method public static enableAutoTrack(ILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2

    invoke-static {p2}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p2

    if-eqz p2, :cond_6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    and-int/lit8 v1, p0, 0x1

    if-lez v1, :cond_0

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    and-int/lit8 v1, p0, 0x2

    if-lez v1, :cond_1

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    and-int/lit8 v1, p0, 0x4

    if-lez v1, :cond_2

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    and-int/lit8 v1, p0, 0x8

    if-lez v1, :cond_3

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    and-int/lit8 v1, p0, 0x10

    if-lez v1, :cond_4

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    and-int/lit8 p0, p0, 0x20

    if-lez p0, :cond_5

    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    invoke-virtual {p2, v0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableAutoTrack(Ljava/util/List;Lorg/json/JSONObject;)V

    :cond_6
    return-void
.end method

.method public static enableThirdPartySharing(ILjava/lang/Object;Ljava/lang/String;)V
    .locals 0

    invoke-static {p2}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableThirdPartySharing(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static enableThirdPartySharing(ILjava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableThirdPartySharing(I)V

    :cond_0
    return-void
.end method

.method public static flush(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    :cond_0
    return-void
.end method

.method public static getDeviceId(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDeviceId()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method public static getDistinctId(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDistinctId()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method private static getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, " "

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics;->sInstances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    return-object p0
.end method

.method public static getPresetProperties(Ljava/lang/String;)Lcn/thinkingdata/analytics/TDPresetProperties;
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getPresetProperties()Lcn/thinkingdata/analytics/TDPresetProperties;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Lcn/thinkingdata/analytics/TDPresetProperties;

    invoke-direct {p0}, Lcn/thinkingdata/analytics/TDPresetProperties;-><init>()V

    return-object p0
.end method

.method public static getSuperProperties(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getSuperProperties()Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    return-object p0
.end method

.method public static ignoreAppViewEventInExtPackage(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreAppViewEventInExtPackage()V

    :cond_0
    return-void
.end method

.method public static ignoreAutoTrackActivities(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreAutoTrackActivities(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public static ignoreAutoTrackActivity(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreAutoTrackActivity(Ljava/lang/Class;)V

    :cond_0
    return-void
.end method

.method public static ignoreView(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public static ignoreViewType(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->ignoreViewType(Ljava/lang/Class;)V

    :cond_0
    return-void
.end method

.method public static lightInstance(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->createLightInstance()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/TDAnalytics;->sInstances:Ljava/util/Map;

    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public static login(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->login(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static logout(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->logout()V

    :cond_0
    return-void
.end method

.method public static setDistinctId(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->identify(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static setDynamicSuperProperties(Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    if-eqz p0, :cond_0

    new-instance v0, Lcn/thinkingdata/analytics/TDAnalyticsAPI$b;

    invoke-direct {v0, p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI$b;-><init>(Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;)V

    invoke-virtual {p1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setDynamicSuperPropertiesTracker(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;)V

    :cond_0
    return-void
.end method

.method public static setJsBridge(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setJsBridge(Landroid/webkit/WebView;)V

    :cond_0
    return-void
.end method

.method public static setJsBridgeForX5WebView(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setJsBridgeForX5WebView(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static setNetworkType(Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_2

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalyticsAPI$c;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    goto :goto_1

    :cond_0
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;->NETWORKTYPE_ALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;

    goto :goto_0

    :cond_1
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;->NETWORKTYPE_WIFI:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;

    :goto_0
    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setNetworkType(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public static setSuperProperties(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setSuperProperties(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static setTrackStatus(Lcn/thinkingdata/analytics/TDAnalytics$TDTrackStatus;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_4

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalyticsAPI$c;->b:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    goto :goto_1

    :cond_0
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->NORMAL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_0

    :cond_1
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->SAVE_ONLY:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_0

    :cond_2
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->STOP:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_0

    :cond_3
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    :goto_0
    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public static setViewID(Landroid/app/Dialog;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p2}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setViewID(Landroid/app/Dialog;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static setViewID(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p2}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setViewID(Landroid/view/View;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static setViewProperties(Landroid/view/View;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p2}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setViewProperties(Landroid/view/View;Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static timeEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->timeEvent(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static track(Lcn/thinkingdata/analytics/d;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;)V

    :cond_0
    return-void
.end method

.method public static track(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p2}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;Ljava/lang/String;)V
    .locals 0

    invoke-static {p4}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p4

    if-eqz p4, :cond_0

    invoke-virtual {p4, p0, p1, p2, p3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V

    :cond_0
    return-void
.end method

.method public static trackFragmentAppViewScreen(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackFragmentAppViewScreen()V

    :cond_0
    return-void
.end method

.method public static trackViewScreen(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreen(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method

.method public static trackViewScreen(Landroid/app/Fragment;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreen(Landroid/app/Fragment;)V

    :cond_0
    return-void
.end method

.method public static trackViewScreen(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreen(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static unsetSuperProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->unsetSuperProperty(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static userAdd(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_add(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static userAppend(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_append(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static userDelete(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_delete()V

    :cond_0
    return-void
.end method

.method public static userSet(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_set(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static userSetOnce(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_setOnce(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static userUniqAppend(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_uniqAppend(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method public static varargs userUnset([Ljava/lang/String;)V
    .locals 6

    array-length v0, p0

    if-lez v0, :cond_0

    array-length v0, p0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    aget-object v0, p0, v0

    invoke-static {v0}, Lcn/thinkingdata/analytics/TDAnalyticsAPI;->getInstance(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    array-length v4, p0

    sub-int/2addr v4, v1

    if-ge v3, v4, :cond_0

    new-array v4, v1, [Ljava/lang/String;

    aget-object v5, p0, v3

    aput-object v5, v4, v2

    invoke-virtual {v0, v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_unset([Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
