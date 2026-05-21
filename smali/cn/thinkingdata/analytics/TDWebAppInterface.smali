.class public Lcn/thinkingdata/analytics/TDWebAppInterface;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/analytics/TDWebAppInterface$c;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.TDWebAppInterface"


# instance fields
.field private final defaultInstance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

.field private deviceInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDWebAppInterface;->defaultInstance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/TDWebAppInterface;->deviceInfoMap:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$100(Lcn/thinkingdata/analytics/TDWebAppInterface;Ljava/lang/String;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/TDWebAppInterface;->trackFromH5(Ljava/lang/String;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V

    return-void
.end method

.method private trackFromH5(Ljava/lang/String;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 19

    const-string v0, "#zone_offset"

    const-string v1, "ThinkingAnalytics.TDWebAppInterface"

    const-string v2, "#event_id"

    const-string v3, "#first_check_id"

    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    move-object/from16 v5, p1

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v5, "data"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_9

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "#time"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    :cond_1
    new-instance v14, Lcn/thinkingdata/analytics/utils/o;

    invoke-direct {v14, v7, v8}, Lcn/thinkingdata/analytics/utils/o;-><init>(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v7, "#type"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcn/thinkingdata/analytics/utils/j;->a(Ljava/lang/String;)Lcn/thinkingdata/analytics/utils/j;

    move-result-object v7

    if-nez v7, :cond_2

    const-string v0, "Unknown data type from H5. ignoring..."

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    const-string v8, "properties"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    invoke-virtual {v13}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    :cond_3
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v9, :cond_5

    :try_start_1
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string v10, "#account_id"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    const-string v10, "#distinct_id"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v10, :cond_4

    move-object/from16 v15, p0

    :try_start_2
    iget-object v10, v15, Lcn/thinkingdata/analytics/TDWebAppInterface;->deviceInfoMap:Ljava/util/Map;

    invoke-interface {v10, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    goto :goto_2

    :cond_4
    move-object/from16 v15, p0

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    :catch_0
    move-exception v0

    move-object/from16 v15, p0

    goto/16 :goto_4

    :cond_5
    move-object/from16 v15, p0

    invoke-virtual {v7}, Lcn/thinkingdata/analytics/utils/j;->b()Z

    move-result v8

    if-eqz v8, :cond_8

    const-string v8, "#event_name"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v8, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    const/4 v6, 0x0

    move-object/from16 v9, p2

    move-object v11, v13

    move-object v12, v14

    move v13, v6

    move-object v14, v8

    move-object v15, v7

    invoke-virtual/range {v9 .. v15}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;ZLjava/util/Map;Lcn/thinkingdata/analytics/utils/j;)V

    move-object/from16 v6, p2

    move-object/from16 v18, v0

    goto :goto_3

    :cond_8
    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusAccountId()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusIdentifyId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isStatusTrackSaveOnly()Z

    move-result v17

    move-object/from16 v6, p2

    iget-object v8, v6, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v12, Lcn/thinkingdata/analytics/TDWebAppInterface$b;

    move-object v9, v12

    move-object/from16 v10, p0

    move-object/from16 v11, p2

    move-object/from16 v18, v0

    move-object v0, v12

    move-object v12, v7

    invoke-direct/range {v9 .. v17}, Lcn/thinkingdata/analytics/TDWebAppInterface$b;-><init>(Lcn/thinkingdata/analytics/TDWebAppInterface;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v8, v0}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :goto_3
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, v18

    goto/16 :goto_0

    :catch_1
    move-exception v0

    :goto_4
    const-string v2, "Exception occurred when track data from H5."

    invoke-static {v1, v2}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_9
    return-void
.end method


# virtual methods
.method public thinkingdata_track(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "ThinkingAnalytics.TDWebAppInterface"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "#app_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcn/thinkingdata/analytics/TDWebAppInterface$c;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcn/thinkingdata/analytics/TDWebAppInterface$c;-><init>(Lcn/thinkingdata/analytics/TDWebAppInterface;Lcn/thinkingdata/analytics/TDWebAppInterface$a;)V

    new-instance v3, Lcn/thinkingdata/analytics/TDWebAppInterface$a;

    invoke-direct {v3, p0, v1, v2, p1}, Lcn/thinkingdata/analytics/TDWebAppInterface$a;-><init>(Lcn/thinkingdata/analytics/TDWebAppInterface;Ljava/lang/String;Lcn/thinkingdata/analytics/TDWebAppInterface$c;Ljava/lang/String;)V

    invoke-static {v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->allInstances(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;)V

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDWebAppInterface$c;->a()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDWebAppInterface;->defaultInstance:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/TDWebAppInterface;->trackFromH5(Ljava/lang/String;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected exception occurred: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method
