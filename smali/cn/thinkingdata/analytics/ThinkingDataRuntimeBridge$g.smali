.class final Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onAdapterViewItemClick(Landroid/view/View;Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/View;

.field final synthetic b:Landroid/view/View;

.field final synthetic c:I


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/view/View;I)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->a:Landroid/view/View;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    iput p3, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 9

    const-string v0, "#title"

    const-string v1, "#element_content"

    const-string v2, "#screen_name"

    const-string v3, "#element_position"

    const-string v4, "#element_id"

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
    iget-object v5, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->a:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    if-nez v5, :cond_2

    return-void

    :cond_2
    invoke-static {v5}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isActivityAutoTrackAppClickIgnored(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_3

    return-void

    :cond_3
    iget-object v6, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {p1, v6}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_4

    return-void

    :cond_4
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getIgnoredViewTypeList()Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_7

    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    instance-of v7, v7, Landroid/widget/ListView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const-string v8, "#element_type"

    if-eqz v7, :cond_5

    :try_start_1
    sget-object v7, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    const-string v7, "ListView"

    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-class v7, Landroid/widget/ListView;

    invoke-static {p1, v7}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_7

    return-void

    :cond_5
    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    instance-of v7, v7, Landroid/widget/GridView;

    if-eqz v7, :cond_6

    sget-object v7, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "GridView"

    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-class v7, Landroid/widget/GridView;

    invoke-static {p1, v7}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_7

    return-void

    :cond_6
    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    instance-of v7, v7, Landroid/widget/Spinner;

    if-eqz v7, :cond_7

    sget-object v7, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    const-string v7, "Spinner"

    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-class v7, Landroid/widget/Spinner;

    invoke-static {p1, v7}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_7

    return-void

    :cond_7
    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    check-cast v7, Landroid/widget/AdapterView;

    invoke-virtual {v7}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v7

    instance-of v8, v7, Lcn/thinkingdata/analytics/ThinkingAdapterViewItemTrackProperties;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    if-eqz v8, :cond_8

    :try_start_2
    check-cast v7, Lcn/thinkingdata/analytics/ThinkingAdapterViewItemTrackProperties;

    iget v8, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->c:I

    invoke-interface {v7, v8}, Lcn/thinkingdata/analytics/ThinkingAdapterViewItemTrackProperties;->getThinkingItemTrackProperties(I)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_8

    invoke-static {v7}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v8

    if-eqz v8, :cond_8

    iget-object v8, p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v8}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v8

    invoke-static {v7, v6, v8}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    :catch_0
    move-exception v7

    :try_start_3
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    :cond_8
    :goto_0
    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->a:Landroid/view/View;

    invoke-static {v5, v7, v6}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONObject;)V

    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/view/View;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_9

    sget-object v8, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9

    invoke-virtual {v6, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_9
    if-eqz v5, :cond_a

    sget-object v4, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {v5}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    sget-object v4, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    invoke-virtual {v6, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_a
    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    iget v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->c:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_b
    const/4 v0, 0x0

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->a:Landroid/view/View;

    instance-of v3, v2, Landroid/view/ViewGroup;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    if-eqz v3, :cond_c

    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->a:Landroid/view/View;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-static {v2, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/StringBuilder;Landroid/view/ViewGroup;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    :catch_1
    move-exception v2

    :try_start_5
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_c
    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_d

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_d
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_e

    sget-object v2, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    invoke-virtual {v6, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_e
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->b:Landroid/view/View;

    invoke-static {v0, v6}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/view/View;Lorg/json/JSONObject;)V

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$g;->a:Landroid/view/View;

    sget v2, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_properties:I

    invoke-static {v0, v1, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-eqz v0, :cond_f

    iget-object v1, p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v0, v6, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_f
    const-string v0, "ta_app_click"

    invoke-virtual {p1, v0, v6}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_2

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " AdapterView.OnItemClickListener.onItemClick AOP ERROR: "

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
