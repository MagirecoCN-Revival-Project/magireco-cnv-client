.class public Lcn/thinkingdata/analytics/e/b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field private a:Z

.field private final b:Ljava/lang/Object;

.field private final c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

.field private volatile d:Ljava/lang/Boolean;

.field private e:Lcn/thinkingdata/analytics/f/d;

.field private f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;>;"
        }
    .end annotation
.end field

.field private h:Z


# direct methods
.method public constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcn/thinkingdata/analytics/e/b;->a:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/e/b;->b:Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcn/thinkingdata/analytics/e/b;->d:Ljava/lang/Boolean;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    iput-boolean p2, p0, Lcn/thinkingdata/analytics/e/b;->h:Z

    iput-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/e/b;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    return-object p0
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/e/b;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/e/b;->d:Ljava/lang/Boolean;

    return-object p1
.end method

.method public static a(Ljava/lang/Object;)Lorg/json/JSONArray;
    .locals 4

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    invoke-static {p0, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcn/thinkingdata/analytics/e/b;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    :cond_1
    new-instance v0, Lorg/json/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not a primitive array: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private a(Landroid/app/Activity;Lcn/thinkingdata/analytics/utils/d;)V
    .locals 12

    const-string v0, "#background_duration"

    const-string v1, "#start_reason"

    const-string v2, "#resume_from_background"

    iget-object v3, p0, Lcn/thinkingdata/analytics/e/b;->d:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcn/thinkingdata/analytics/e/b;->a:Z

    if-eqz v3, :cond_8

    :cond_0
    iget-object v3, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v3, v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSessionManager:Lcn/thinkingdata/analytics/h/a;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/h/a;->b()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEnabled()Z

    move-result v3

    if-eqz v3, :cond_7

    :try_start_0
    iget-object v3, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v4, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {v3, v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_6

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcn/thinkingdata/analytics/e/b;->d:Ljava/lang/Boolean;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    sget-object v3, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcn/thinkingdata/analytics/e/b;->a:Z

    invoke-virtual {v7, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_1
    sget-object v2, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/e/b;->a()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v7, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    invoke-static {v7, p1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Landroid/app/Activity;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->e:Lcn/thinkingdata/analytics/f/d;

    if-eqz p1, :cond_3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->e:Lcn/thinkingdata/analytics/f/d;

    invoke-virtual {p1, v1, v2}, Lcn/thinkingdata/analytics/f/d;->a(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmpl-double p1, v1, v5

    if-lez p1, :cond_3

    sget-object p1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    invoke-virtual {v7, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    :cond_3
    if-nez p2, :cond_4

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    const-string v0, "ta_app_start"

    invoke-virtual {p1, v0, v7}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result p1

    if-eqz p1, :cond_5

    return-void

    :cond_5
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusAccountId()Ljava/lang/String;

    move-result-object v10

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusIdentifyId()Ljava/lang/String;

    move-result-object v9

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isStatusTrackSaveOnly()Z

    move-result v11

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object p1, p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v0, Lcn/thinkingdata/analytics/e/b$a;

    move-object v5, v0

    move-object v6, p0

    move-object v8, p2

    invoke-direct/range {v5 .. v11}, Lcn/thinkingdata/analytics/e/b$a;-><init>(Lcn/thinkingdata/analytics/e/b;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p1, v0}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    iput-boolean v4, p0, Lcn/thinkingdata/analytics/e/b;->h:Z

    :cond_6
    :goto_0
    if-nez p2, :cond_7

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object p2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z

    move-result p1

    if-nez p1, :cond_7

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    const-string p2, "ta_app_end"

    invoke-virtual {p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->timeEvent(Ljava/lang/String;)V

    iput-boolean v4, p0, Lcn/thinkingdata/analytics/e/b;->h:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7
    :goto_1
    :try_start_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->appBecomeActive()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcn/thinkingdata/analytics/e/b;->e:Lcn/thinkingdata/analytics/f/d;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_8
    :goto_2
    return-void
.end method

.method private a(Landroid/app/Activity;Z)Z
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_0

    if-eqz p2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    :cond_1
    const/4 p1, 0x0

    monitor-exit v0

    return p1

    :cond_2
    const/4 p1, 0x1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/e/b;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/analytics/e/b;->h:Z

    return p1
.end method

.method static synthetic b(Lcn/thinkingdata/analytics/e/b;)Ljava/lang/Boolean;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/e/b;->d:Ljava/lang/Boolean;

    return-object p0
.end method

.method public static b(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    if-nez p0, :cond_0

    sget-object p0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    return-object p0

    :cond_0
    instance-of v0, p0, Lorg/json/JSONArray;

    if-nez v0, :cond_9

    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    goto/16 :goto_1

    :cond_1
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return-object p0

    :cond_2
    :try_start_0
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_3

    new-instance v0, Lorg/json/JSONArray;

    check-cast p0, Ljava/util/Collection;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    return-object v0

    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {p0}, Lcn/thinkingdata/analytics/e/b;->a(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0

    :cond_4
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_5

    new-instance v0, Lorg/json/JSONObject;

    check-cast p0, Ljava/util/Map;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    return-object v0

    :cond_5
    instance-of v0, p0, Ljava/lang/Boolean;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/Byte;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/Character;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/Double;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/Float;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/Short;

    if-nez v0, :cond_7

    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_6

    goto :goto_0

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "java."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_7
    :goto_0
    return-object p0

    :catch_0
    :cond_8
    const/4 p0, 0x0

    :cond_9
    :goto_1
    return-object p0
.end method

.method static synthetic c(Lcn/thinkingdata/analytics/e/b;)Z
    .locals 0

    iget-boolean p0, p0, Lcn/thinkingdata/analytics/e/b;->a:Z

    return p0
.end method


# virtual methods
.method a()Ljava/lang/String;
    .locals 8

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b;->f:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_3

    :try_start_0
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "url"

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcn/thinkingdata/analytics/e/b;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    sget-object v7, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v6, v7, :cond_1

    invoke-static {v5}, Lcn/thinkingdata/analytics/e/b;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_2
    const-string v2, "data"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public a(Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    const-string v1, "ta_app_crash"

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "ta_app_end"

    invoke-virtual {p1, v1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcn/thinkingdata/analytics/e/b;->h:Z

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    return-void
.end method

.method public a(Z)V
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/analytics/e/b;->h:Z

    return-void
.end method

.method a(Landroid/content/Context;)Z
    .locals 3

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "TAEnableBackgroundStartEvent"

    const-string v2, "bool"

    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, v2, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public b()V
    .locals 5

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->d:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v1, v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSessionManager:Lcn/thinkingdata/analytics/h/a;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/h/a;->b()V

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEnabled()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    :try_start_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {v1, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v1, v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v1, v1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcn/thinkingdata/analytics/utils/p;->e(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v1, v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v1, v1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v1, v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v1

    new-instance v2, Lcn/thinkingdata/analytics/e/b$b;

    invoke-direct {v2, p0, v1}, Lcn/thinkingdata/analytics/e/b$b;-><init>(Lcn/thinkingdata/analytics/e/b;Lcn/thinkingdata/analytics/utils/d;)V

    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    const-wide/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    const-string v2, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    invoke-static {v2, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    const-string p2, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    const-string v0, "onActivityCreated"

    invoke-static {p2, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcn/thinkingdata/analytics/e/b;->f:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 4

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->b:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Z)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    const-string v1, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onActivityPaused: the SDK was initialized after the onActivityStart of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getAutoTrackStartTime()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Lcn/thinkingdata/analytics/utils/d;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 5

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->b:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Z)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    const-string v1, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onActivityResumed: the SDK was initialized after the onActivityStart of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getAutoTrackStartTime()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Lcn/thinkingdata/analytics/utils/d;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    :cond_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isActivityAutoTrackAppViewScreenIgnored(Ljava/lang/Class;)Z

    move-result v0

    xor-int/2addr v0, v2

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEnabled()Z

    move-result v1

    if-eqz v1, :cond_7

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    if-nez v0, :cond_7

    :try_start_3
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sget-object v1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string v2, "#screen_name"

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    if-nez v1, :cond_1

    const-string v1, "#screen_name"

    :try_start_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    invoke-static {v0, p1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Landroid/app/Activity;)V

    instance-of v1, p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    if-eqz v1, :cond_3

    check-cast p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getScreenUrl()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getTrackProperties()Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-static {p1}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {p1, v0, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    :cond_2
    const-string v2, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    :try_start_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid properties: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    :goto_1
    invoke-virtual {p1, v1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreenInternal(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_2

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcn/thinkingdata/analytics/ThinkingDataAutoTrackAppViewScreenUrl;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/ThinkingDataAutoTrackAppViewScreenUrl;

    if-eqz v1, :cond_6

    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingDataAutoTrackAppViewScreenUrl;->appId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingDataAutoTrackAppViewScreenUrl;->appId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingDataAutoTrackAppViewScreenUrl;->url()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    :cond_5
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    goto :goto_1

    :cond_6
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isIgnoreAppViewInExtPackage()Z

    move-result p1

    if-nez p1, :cond_7

    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    const-string v1, "ta_app_view"

    invoke-virtual {p1, v1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_6
    const-string v0, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_7
    :goto_2
    return-void

    :catchall_0
    move-exception p1

    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    throw p1
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 4

    const-string v0, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    const-string v1, "onActivityStarted"

    invoke-static {v0, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/e/b;->f:Ljava/lang/ref/WeakReference;

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->b:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Lcn/thinkingdata/analytics/utils/d;)V

    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_1
    const-string v1, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected state. The activity might not be stopped correctly: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 5

    const-string v0, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    const-string v1, "onActivityStopped"

    invoke-static {v0, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/e/b;->b:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    const/4 v1, 0x1

    :try_start_1
    invoke-direct {p0, p1, v1}, Lcn/thinkingdata/analytics/e/b;->a(Landroid/app/Activity;Z)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v2, :cond_0

    const-string v1, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onActivityStopped: the SDK might be initialized after the onActivityStart of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :cond_0
    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b;->g:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_3

    const/4 v2, 0x0

    iput-object v2, p0, Lcn/thinkingdata/analytics/e/b;->f:Ljava/lang/ref/WeakReference;

    iget-boolean v2, p0, Lcn/thinkingdata/analytics/e/b;->h:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v2, :cond_2

    :try_start_3
    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->appEnterBackground()V

    iput-boolean v1, p0, Lcn/thinkingdata/analytics/e/b;->a:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    sget-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {v2, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z

    move-result v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-nez v2, :cond_1

    const/4 v2, 0x0

    :try_start_5
    invoke-static {v1, p1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Landroid/app/Activity;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    const-string v3, "ta_app_end"

    :goto_1
    invoke-virtual {p1, v3, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :try_start_7
    const-string v3, "ThinkingAnalytics.ThinkingDataActivityLifecycleCallbacks"

    invoke-static {v3, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    const-string v3, "ta_app_end"

    goto :goto_1

    :goto_2
    iput-boolean v2, p0, Lcn/thinkingdata/analytics/e/b;->h:Z

    goto :goto_4

    :goto_3
    iget-object v3, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    const-string v4, "ta_app_end"

    invoke-virtual {v3, v4, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V

    iput-boolean v2, p0, Lcn/thinkingdata/analytics/e/b;->h:Z

    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :cond_1
    :goto_4
    :try_start_9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    new-instance p1, Lcn/thinkingdata/analytics/f/d;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p1, v3, v1, v2}, Lcn/thinkingdata/analytics/f/d;-><init>(Ljava/util/concurrent/TimeUnit;J)V

    iput-object p1, p0, Lcn/thinkingdata/analytics/e/b;->e:Lcn/thinkingdata/analytics/f/d;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_5

    :catch_2
    move-exception p1

    :try_start_a
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_5
    iget-object p1, p0, Lcn/thinkingdata/analytics/e/b;->c:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    :cond_3
    monitor-exit v0

    goto :goto_6

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :try_start_b
    throw p1
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    :catch_3
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_6
    return-void
.end method
