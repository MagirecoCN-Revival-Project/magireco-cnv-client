.class final Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onViewOnClick(Landroid/view/View;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/Object;

.field final synthetic b:Landroid/view/View;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->a:Ljava/lang/Object;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "-"

    const-string v4, "#element_content"

    const-string v5, "#element_type"

    const-string v6, "#title"

    const-string v7, "androidx.viewpager.widget.ViewPager"

    const-string v8, "#screen_name"

    const-string v9, "androidx.appcompat.widget.SwitchCompat"

    const-string v10, "#element_id"

    const-string v11, "ThinkingAnalytics.ThinkingDataRuntimeBridge"

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {v2, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->a:Ljava/lang/Object;

    if-eqz v0, :cond_7

    instance-of v12, v0, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackOnClick;

    if-eqz v12, :cond_3

    check-cast v0, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackOnClick;

    invoke-interface {v0}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackOnClick;->appId()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackOnClick;->appId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_2
    return-void

    :cond_3
    instance-of v12, v0, Lcn/thinkingdata/analytics/ThinkingDataTrackViewOnClick;

    if-eqz v12, :cond_4

    check-cast v0, Lcn/thinkingdata/analytics/ThinkingDataTrackViewOnClick;

    invoke-interface {v0}, Lcn/thinkingdata/analytics/ThinkingDataTrackViewOnClick;->appId()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_7

    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0}, Lcn/thinkingdata/analytics/ThinkingDataTrackViewOnClick;->appId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_4
    instance-of v12, v0, Ljava/lang/String;

    if-eqz v12, :cond_7

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_7

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v12

    const/4 v13, 0x2

    if-lt v12, v13, :cond_7

    invoke-virtual {v0, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "1_"

    invoke-virtual {v0, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_5
    return-void

    :cond_6
    const-string v13, "2_"

    invoke-virtual {v0, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v14, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    sget v15, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_onclick_timestamp:I

    invoke-static {v0, v14, v15}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_9

    if-nez v14, :cond_8

    :try_start_1
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    sub-long v14, v12, v14

    const-wide/16 v16, 0x1f4

    cmp-long v0, v14, v16

    if-gez v0, :cond_8

    const-string v0, "This onClick maybe extends from super, IGNORE"

    invoke-static {v11, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_8
    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v14, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    sget v15, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_onclick_timestamp:I

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v14, v15, v12}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;ILjava/lang/Object;)V

    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v2, v12}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isActivityAutoTrackAppClickIgnored(Ljava/lang/Class;)Z

    move-result v12

    if-eqz v12, :cond_9

    return-void

    :cond_9
    iget-object v12, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-static {v2, v12}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->access$000(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Landroid/view/View;)Z

    move-result v12

    if-eqz v12, :cond_a

    return-void

    :cond_a
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    iget-object v13, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-static {v0, v13, v12}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONObject;)V

    iget-object v13, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/view/View;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_b

    sget-object v14, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v14, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_b

    invoke-virtual {v12, v10, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_b
    if-eqz v0, :cond_c

    sget-object v10, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v10, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v12, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_c

    sget-object v10, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v10, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c

    invoke-virtual {v12, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_9

    :cond_c
    const/4 v6, 0x0

    :try_start_3
    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    :catch_1
    move-object v8, v6

    :goto_0
    if-nez v8, :cond_d

    :try_start_4
    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    :cond_d
    :try_start_5
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_1

    :catch_3
    move-object v9, v6

    :goto_1
    if-nez v9, :cond_e

    :try_start_6
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    :catch_4
    :cond_e
    :try_start_7
    iget-object v7, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v7

    iget-object v10, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    instance-of v13, v10, Landroid/widget/CheckBox;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_9

    const-string v14, "Spinner"

    if-eqz v13, :cond_f

    :try_start_8
    check-cast v10, Landroid/widget/CheckBox;

    invoke-virtual {v10}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_9

    const-string v3, "CheckBox"

    :goto_2
    move-object v6, v0

    move-object v7, v3

    goto/16 :goto_b

    :cond_f
    const/4 v13, 0x0

    if-eqz v8, :cond_11

    :try_start_9
    invoke-virtual {v8, v10}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_11

    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/CompoundButton;

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_9

    const-string v3, "getTextOn"

    :try_start_a
    new-array v6, v13, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    goto :goto_3

    :cond_10
    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    const-string v3, "getTextOff"

    :try_start_b
    new-array v6, v13, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    :goto_3
    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    new-array v6, v13, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9

    const-string v3, "SwitchCompat"

    goto :goto_2

    :cond_11
    const-string v8, "#element_position"

    const/4 v10, 0x1

    if-eqz v9, :cond_13

    :try_start_c
    iget-object v15, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual {v9, v15}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v9
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    if-eqz v9, :cond_13

    const-string v7, "ViewPager"

    :try_start_d
    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_5

    const-string v3, "getAdapter"

    :try_start_e
    new-array v9, v13, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    new-array v9, v13, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5

    const-string v9, "getCurrentItem"

    :try_start_f
    new-array v14, v13, [Ljava/lang/Class;

    invoke-virtual {v3, v9, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    if-eqz v3, :cond_27

    iget-object v9, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    new-array v14, v13, [Ljava/lang/Object;

    invoke-virtual {v3, v9, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sget-object v9, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_12

    sget-object v9, Ljava/util/Locale;->CHINA:Ljava/util/Locale;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5

    const-string v14, "%d"

    :try_start_10
    new-array v15, v10, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v15, v13

    invoke-static {v9, v14, v15}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_5

    const-string v9, "getPageTitle"

    :try_start_11
    new-array v14, v10, [Ljava/lang/Class;

    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v15, v14, v13

    invoke-virtual {v8, v9, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    if-eqz v8, :cond_27

    new-array v9, v10, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v9, v13

    invoke-virtual {v8, v0, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_5

    goto :goto_6

    :catch_5
    move-exception v0

    :goto_4
    :try_start_12
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_b

    :cond_13
    iget-object v9, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    instance-of v15, v9, Landroid/widget/Switch;

    if-eqz v15, :cond_16

    check-cast v9, Landroid/widget/Switch;

    invoke-virtual {v9}, Landroid/widget/Switch;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {v9}, Landroid/widget/Switch;->getTextOn()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_5

    :cond_14
    invoke-virtual {v9}, Landroid/widget/Switch;->getTextOff()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-virtual {v9}, Landroid/widget/Switch;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_9

    :cond_15
    move-object v6, v0

    const-string v7, "SwitchButton"

    goto/16 :goto_b

    :cond_16
    :try_start_13
    instance-of v15, v9, Landroid/widget/RadioGroup;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_9

    if-eqz v15, :cond_17

    const-string v7, "RadioGroup"

    :try_start_14
    check-cast v9, Landroid/widget/RadioGroup;

    invoke-virtual {v9}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v3
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_9

    if-eqz v0, :cond_27

    :try_start_15
    invoke-virtual {v0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_27

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_6

    :goto_6
    move-object v6, v0

    goto/16 :goto_b

    :catch_6
    move-exception v0

    goto :goto_4

    :cond_17
    :try_start_16
    instance-of v0, v9, Landroid/widget/RadioButton;

    if-eqz v0, :cond_18

    check-cast v9, Landroid/widget/RadioButton;

    invoke-virtual {v9}, Landroid/widget/RadioButton;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_9

    const-string v3, "RadioButton"

    goto/16 :goto_2

    :cond_18
    :try_start_17
    instance-of v0, v9, Landroid/widget/ToggleButton;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_9

    const-string v15, "ToggleButton"

    if-eqz v0, :cond_1a

    :try_start_18
    check-cast v9, Landroid/widget/ToggleButton;

    invoke-virtual {v9}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {v9}, Landroid/widget/ToggleButton;->getTextOn()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_7

    :cond_19
    invoke-virtual {v9}, Landroid/widget/ToggleButton;->getTextOff()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_7
    move-object v6, v0

    move-object v7, v15

    goto/16 :goto_b

    :cond_1a
    instance-of v0, v9, Landroid/widget/Button;

    if-eqz v0, :cond_1b

    check-cast v9, Landroid/widget/Button;

    invoke-virtual {v9}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_9

    const-string v3, "Button"

    goto/16 :goto_2

    :cond_1b
    :try_start_19
    instance-of v0, v9, Landroid/widget/CheckedTextView;

    if-eqz v0, :cond_1c

    check-cast v9, Landroid/widget/CheckedTextView;

    invoke-virtual {v9}, Landroid/widget/CheckedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_9

    const-string v3, "CheckedTextView"

    goto/16 :goto_2

    :cond_1c
    :try_start_1a
    instance-of v0, v9, Landroid/widget/TextView;

    if-eqz v0, :cond_1d

    check-cast v9, Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_9

    const-string v3, "TextView"

    goto/16 :goto_2

    :cond_1d
    :try_start_1b
    instance-of v0, v9, Landroid/widget/ImageButton;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_9

    if-eqz v0, :cond_1e

    const-string v7, "ImageButton"

    :try_start_1c
    check-cast v9, Landroid/widget/ImageButton;

    invoke-virtual {v9}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_27

    invoke-virtual {v9}, Landroid/widget/ImageButton;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_8

    :cond_1e
    instance-of v0, v9, Landroid/widget/ImageView;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_9

    if-eqz v0, :cond_1f

    const-string v7, "ImageView"

    :try_start_1d
    check-cast v9, Landroid/widget/ImageView;

    invoke-virtual {v9}, Landroid/widget/ImageView;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_27

    invoke-virtual {v9}, Landroid/widget/ImageView;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_6

    :cond_1f
    instance-of v0, v9, Landroid/widget/RatingBar;

    if-eqz v0, :cond_20

    check-cast v9, Landroid/widget/RatingBar;

    invoke-virtual {v9}, Landroid/widget/RatingBar;->getRating()F

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_9

    const-string v3, "RatingBar"

    goto/16 :goto_2

    :cond_20
    :try_start_1e
    instance-of v0, v9, Landroid/widget/SeekBar;

    if-eqz v0, :cond_21

    check-cast v9, Landroid/widget/SeekBar;

    invoke-virtual {v9}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_9

    const-string v3, "SeekBar"

    goto/16 :goto_2

    :cond_21
    :try_start_1f
    instance-of v0, v9, Landroid/widget/Spinner;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_9

    if-eqz v0, :cond_24

    :try_start_20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-static {v0, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/StringBuilder;Landroid/view/ViewGroup;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_22

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v3

    sub-int/2addr v3, v10

    invoke-virtual {v0, v13, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v6, v0

    :cond_22
    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    invoke-virtual {v12, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_7

    goto :goto_9

    :catch_7
    move-exception v0

    :try_start_21
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_23
    :goto_9
    move-object v7, v14

    goto/16 :goto_b

    :cond_24
    instance-of v0, v9, Landroid/widget/TimePicker;

    if-eqz v0, :cond_25

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    check-cast v3, Landroid/widget/TimePicker;

    invoke-virtual {v3}, Landroid/widget/TimePicker;->getCurrentHour()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    check-cast v3, Landroid/widget/TimePicker;

    invoke-virtual {v3}, Landroid/widget/TimePicker;->getCurrentMinute()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_9

    const-string v3, "TimePicker"

    goto :goto_a

    :cond_25
    :try_start_22
    instance-of v0, v9, Landroid/widget/DatePicker;

    if-eqz v0, :cond_26

    check-cast v9, Landroid/widget/DatePicker;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Landroid/widget/DatePicker;->getYear()I

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Landroid/widget/DatePicker;->getMonth()I

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Landroid/widget/DatePicker;->getDayOfMonth()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_9

    const-string v3, "DatePicker"

    :goto_a
    :try_start_23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    :cond_26
    instance-of v0, v9, Landroid/view/ViewGroup;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_9

    if-eqz v0, :cond_27

    :try_start_24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-static {v0, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/StringBuilder;Landroid/view/ViewGroup;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_27

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v3

    sub-int/2addr v3, v10

    invoke-virtual {v0, v13, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_8

    goto/16 :goto_6

    :catch_8
    move-exception v0

    goto/16 :goto_4

    :cond_27
    :goto_b
    :try_start_25
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_28

    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_28
    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    invoke-virtual {v12, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_29
    iget-object v0, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    invoke-static {v0, v12}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/view/View;Lorg/json/JSONObject;)V

    invoke-virtual/range {p1 .. p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v3, v1, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge$d;->b:Landroid/view/View;

    sget v4, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_properties:I

    invoke-static {v0, v3, v4}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-eqz v0, :cond_2a

    iget-object v3, v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {v0, v12, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_2a
    const-string v0, "ta_app_click"

    invoke-virtual {v2, v0, v12}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_9

    goto :goto_c

    :catch_9
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onViewClickMethod error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_c
    return-void
.end method
