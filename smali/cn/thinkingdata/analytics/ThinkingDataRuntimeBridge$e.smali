.class final Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onExpandableListViewOnChildClick(Landroid/view/View;Landroid/view/View;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Landroid/view/View;

.field final synthetic c:Landroid/view/View;

.field final synthetic d:I

.field final synthetic e:I


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/View;Landroid/view/View;II)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->a:Landroid/content/Context;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->b:Landroid/view/View;

    iput-object p3, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->c:Landroid/view/View;

    iput p4, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->d:I

    iput p5, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 10

    const-string v0, "#element_content"

    const-string v1, "#title"

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
    iget-object v5, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->a:Landroid/content/Context;

    invoke-static {v5}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isActivityAutoTrackAppClickIgnored(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_2

    return-void

    :cond_2
    const-class v6, Landroid/widget/ExpandableListView;

    invoke-static {p1, v6}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_3

    return-void

    :cond_3
    iget-object v6, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->b:Landroid/view/View;

    invoke-static {p1, v6}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$000(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_4

    return-void

    :cond_4
    iget-object v6, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->c:Landroid/view/View;

    invoke-static {p1, v6}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$000(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_5

    return-void

    :cond_5
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->c:Landroid/view/View;

    invoke-static {v5, v7, v6}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONObject;)V

    if-eqz v5, :cond_6

    sget-object v7, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {v5}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    sget-object v5, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    invoke-virtual {v6, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_6
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->b:Landroid/view/View;

    invoke-static {v1}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_7

    sget-object v4, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    invoke-virtual {v6, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    iget v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->d:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-string v5, "#element_position"

    if-gez v1, :cond_8

    :try_start_1
    sget-object v1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    const-string v7, "%d"

    :try_start_2
    new-array v8, v4, [Ljava/lang/Object;

    iget v9, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->e:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v3

    invoke-static {v1, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_8
    sget-object v1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    const-string v7, "%d:%d"

    const/4 v8, 0x2

    :try_start_3
    new-array v8, v8, [Ljava/lang/Object;

    iget v9, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->e:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v3

    iget v9, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->d:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-static {v1, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v6, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_9
    sget-object v1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    const-string v1, "ExpandableListView"

    invoke-virtual {v6, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_a
    const/4 v1, 0x0

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->c:Landroid/view/View;

    instance-of v5, v2, Landroid/view/ViewGroup;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    if-eqz v5, :cond_b

    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->c:Landroid/view/View;

    check-cast v5, Landroid/view/ViewGroup;

    invoke-static {v2, v5}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/StringBuilder;Landroid/view/ViewGroup;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    :try_start_5
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_b
    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_c

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :cond_c
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    sget-object v2, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    invoke-virtual {v6, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_d
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->b:Landroid/view/View;

    invoke-static {v0, v6}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/view/View;Lorg/json/JSONObject;)V

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->c:Landroid/view/View;

    sget v2, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_properties:I

    invoke-static {v0, v1, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-eqz v0, :cond_e

    iget-object v1, p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v0, v6, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_e
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/ExpandableListView;

    invoke-virtual {v0}, Landroid/widget/ExpandableListView;->getExpandableListAdapter()Landroid/widget/ExpandableListAdapter;

    move-result-object v0

    if-eqz v0, :cond_10

    instance-of v1, v0, Lcn/thinkingdata/analytics/ThinkingExpandableListViewItemTrackProperties;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    if-eqz v1, :cond_10

    :try_start_6
    check-cast v0, Lcn/thinkingdata/analytics/ThinkingExpandableListViewItemTrackProperties;

    iget v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->d:I

    if-gez v1, :cond_f

    iget v1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->e:I

    invoke-interface {v0, v1}, Lcn/thinkingdata/analytics/ThinkingExpandableListViewItemTrackProperties;->getThinkingGroupItemTrackProperties(I)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_2

    :cond_f
    iget v2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$e;->e:I

    invoke-interface {v0, v2, v1}, Lcn/thinkingdata/analytics/ThinkingExpandableListViewItemTrackProperties;->getThinkingChildItemTrackProperties(II)Lorg/json/JSONObject;

    move-result-object v0

    :goto_2
    if-eqz v0, :cond_10

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v0, v6, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_3

    :catch_1
    move-exception v0

    :try_start_7
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_10
    :goto_3
    const-string v0, "ta_app_click"

    invoke-virtual {p1, v0, v6}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_4

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " ExpandableListView.OnChildClickListener.onGroupClick AOP ERROR: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ThinkingAnalytics.ThinkingDataRuntimeBridge"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    return-void
.end method
