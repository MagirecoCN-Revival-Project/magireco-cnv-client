.class final Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$h;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onMenuItemSelected(Ljava/lang/Object;Landroid/view/MenuItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Object;

.field final synthetic b:Landroid/view/MenuItem;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/view/MenuItem;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$h;->a:Ljava/lang/Object;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$h;->b:Landroid/view/MenuItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 9

    const-string v0, "#title"

    const-string v1, "#element_content"

    const-string v2, "#element_type"

    const-string v3, "#element_id"

    const-string v4, "#screen_name"

    :try_start_0
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEnabled()Z

    move-result v5

    if-nez v5, :cond_0

    return-void

    :cond_0
    sget-object v5, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {p1, v5}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z

    move-result v5

    if-eqz v5, :cond_1

    return-void

    :cond_1
    const-class v5, Landroid/view/MenuItem;

    invoke-static {p1, v5}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_2

    return-void

    :cond_2
    iget-object v5, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$h;->a:Ljava/lang/Object;

    if-nez v5, :cond_3

    return-void

    :cond_3
    instance-of v6, v5, Landroid/content/Context;

    const/4 v7, 0x0

    if-eqz v6, :cond_4

    check-cast v5, Landroid/content/Context;

    goto :goto_0

    :cond_4
    move-object v5, v7

    :goto_0
    if-nez v5, :cond_5

    return-void

    :cond_5
    invoke-static {v5}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v6

    if-eqz v6, :cond_6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p1, v8}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isActivityAutoTrackAppClickIgnored(Ljava/lang/Class;)Z

    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v8, :cond_6

    return-void

    :cond_6
    :try_start_1
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-object v8, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$h;->b:Landroid/view/MenuItem;

    invoke-interface {v8}, Landroid/view/MenuItem;->getItemId()I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    :try_start_2
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    if-eqz v6, :cond_7

    sget-object v8, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v4, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {v6}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_7

    sget-object v6, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    invoke-virtual {v5, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_8

    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {v5, v3, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_8
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$h;->b:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$h;->b:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v5, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_9
    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "MenuItem"

    invoke-virtual {v5, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_a
    const-string v0, "ta_app_click"

    invoke-virtual {p1, v0, v5}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "track MenuItem click error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ThinkingAnalytics.ThinkingDataRuntimeBridge"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    return-void
.end method
