.class Lcn/thinkingdata/analytics/b;
.super Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
.source ""


# instance fields
.field private final a:Lorg/json/JSONObject;

.field private b:Z


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 3

    const/4 v0, 0x1

    new-array v1, v0, [Z

    const/4 v2, 0x0

    aput-boolean v0, v1, v2

    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;-><init>(Lcn/thinkingdata/analytics/TDConfig;[Z)V

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/b;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getRandomID()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusIdentifyId(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/b;)Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/b;->a:Lorg/json/JSONObject;

    return-object p0
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/b;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/analytics/b;->b:Z

    return p1
.end method


# virtual methods
.method public clearSuperProperties()V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/b$c;

    invoke-direct {v1, p0}, Lcn/thinkingdata/analytics/b$c;-><init>(Lcn/thinkingdata/analytics/b;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public enableAutoTrack(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public enableTracking(Z)V
    .locals 0

    if-eqz p1, :cond_0

    sget-object p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->NORMAL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_0

    :cond_0
    sget-object p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    :goto_0
    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    return-void
.end method

.method public getDistinctId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusIdentifyId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getRandomID()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method getLoginId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusAccountId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuperProperties()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/b;->a:Lorg/json/JSONObject;

    return-object v0
.end method

.method public hasOptOut()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public identify(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "ThinkingAnalyticsSDK"

    const-string v0, "The identity cannot be empty."

    invoke-static {p1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string v0, "distinct id cannot be empty"

    invoke-direct {p1, v0}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusIdentifyId(Ljava/lang/String;)V

    return-void
.end method

.method public ignoreAutoTrackActivities(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;)V"
        }
    .end annotation

    return-void
.end method

.method public ignoreAutoTrackActivity(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method

.method public ignoreView(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public ignoreViewType(Ljava/lang/Class;)V
    .locals 0

    return-void
.end method

.method public isEnabled()Z
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public login(Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusAccountId(Ljava/lang/String;)V

    return-void
.end method

.method public logout()V
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusAccountId(Ljava/lang/String;)V

    return-void
.end method

.method public optInTracking()V
    .locals 0

    return-void
.end method

.method public optOutTracking()V
    .locals 0

    return-void
.end method

.method public optOutTrackingAndDeleteUser()V
    .locals 0

    return-void
.end method

.method public setJsBridge(Landroid/webkit/WebView;)V
    .locals 0

    return-void
.end method

.method public setJsBridgeForX5WebView(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public setNetworkType(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;)V
    .locals 0

    return-void
.end method

.method public setSuperProperties(Lorg/json/JSONObject;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/b$a;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/b$a;-><init>(Lcn/thinkingdata/analytics/b;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
    .locals 2

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/b$d;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/b$d;-><init>(Lcn/thinkingdata/analytics/b;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setViewID(Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setViewID(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setViewProperties(Landroid/view/View;Lorg/json/JSONObject;)V
    .locals 0

    return-void
.end method

.method public trackFragmentAppViewScreen()V
    .locals 0

    return-void
.end method

.method public trackViewScreen(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public trackViewScreen(Landroid/app/Fragment;)V
    .locals 0

    return-void
.end method

.method public trackViewScreen(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public unsetSuperProperty(Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/b$b;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/b$b;-><init>(Lcn/thinkingdata/analytics/b;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method
