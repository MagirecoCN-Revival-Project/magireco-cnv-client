.class public Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;
.super Landroid/content/BroadcastReceiver;
.source ""


# static fields
.field private static volatile a:Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static declared-synchronized a()Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;
    .locals 2

    const-class v0, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;->a:Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;

    if-nez v1, :cond_1

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    sget-object v1, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;->a:Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;

    invoke-direct {v1}, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;-><init>()V

    sput-object v1, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;->a:Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1

    :cond_1
    :goto_0
    sget-object v1, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;->a:Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v0

    return-object v1

    :catchall_1
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static a(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    invoke-static {p0}, Lcn/thinkingdata/analytics/utils/p;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, "cn.thinkingdata.receiver"

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_1

    invoke-static {}, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;->a()Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_1

    :cond_1
    invoke-static {}, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;->a()Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :goto_1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10

    const-string v0, "TD_ACTION"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "#app_id"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_e

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_e

    invoke-static {p1, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sharedInstance(Landroid/content/Context;Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p1

    if-eqz p1, :cond_e

    const-string v1, "TD_KEY_TIMEZONE"

    const-string v2, "#event_name"

    const-string v3, "TD_DATE"

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const-string v7, "properties"

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    goto/16 :goto_8

    :pswitch_0
    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    :goto_0
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto/16 :goto_8

    :pswitch_1
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v3, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v7, :cond_1

    :try_start_1
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v3

    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    :cond_1
    move-object v3, v4

    :goto_1
    cmp-long v7, v8, v5

    if-eqz v7, :cond_2

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v8, v9}, Ljava/util/Date;-><init>(J)V

    goto :goto_2

    :cond_2
    move-object v5, v4

    :goto_2
    if-eqz v1, :cond_3

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    goto :goto_3

    :cond_3
    move-object v1, v4

    :goto_3
    const-string v6, "TD_KEY_EXTRA_FIELD"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const v6, 0x100003

    if-ne v0, v6, :cond_4

    new-instance v4, Lcn/thinkingdata/analytics/TDFirstEvent;

    invoke-direct {v4, v2, v3}, Lcn/thinkingdata/analytics/TDFirstEvent;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    if-eqz p2, :cond_6

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_6

    invoke-virtual {v4, p2}, Lcn/thinkingdata/analytics/TDFirstEvent;->setFirstCheckId(Ljava/lang/String;)V

    goto :goto_4

    :cond_4
    const v6, 0x100005

    if-ne v0, v6, :cond_5

    new-instance v4, Lcn/thinkingdata/analytics/TDOverWritableEvent;

    invoke-direct {v4, v2, v3, p2}, Lcn/thinkingdata/analytics/TDOverWritableEvent;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    goto :goto_4

    :cond_5
    const v6, 0x100004

    if-ne v0, v6, :cond_6

    new-instance v4, Lcn/thinkingdata/analytics/TDUpdatableEvent;

    invoke-direct {v4, v2, v3, p2}, Lcn/thinkingdata/analytics/TDUpdatableEvent;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    :cond_6
    :goto_4
    if-eqz v4, :cond_e

    invoke-virtual {v4, v5, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->setEventTime(Ljava/util/Date;Ljava/util/TimeZone;)V

    invoke-virtual {p1, v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;)V

    goto/16 :goto_8

    :pswitch_2
    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v3, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_7

    :try_start_2
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_5

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_7
    move-object v3, v4

    :goto_5
    cmp-long v0, v7, v5

    if-eqz v0, :cond_8

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4, v7, v8}, Ljava/util/Date;-><init>(J)V

    :cond_8
    iget-object v0, p1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    if-eqz v1, :cond_9

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    :cond_9
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez v4, :cond_a

    invoke-virtual {p1, p2, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto/16 :goto_8

    :cond_a
    invoke-virtual {p1, p2, v3, v4, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V

    goto/16 :goto_8

    :pswitch_3
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->clearSuperProperties()V

    goto :goto_8

    :pswitch_4
    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->unsetSuperProperty(Ljava/lang/String;)V

    goto :goto_8

    :pswitch_5
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    goto :goto_8

    :pswitch_6
    const-string v0, "#distinct_id"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->identify(Ljava/lang/String;)V

    goto :goto_8

    :pswitch_7
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->logout()V

    goto :goto_8

    :pswitch_8
    const-string v0, "#account_id"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->login(Ljava/lang/String;)V

    goto :goto_8

    :pswitch_9
    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_b

    :try_start_3
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    move-object v4, v0

    goto :goto_6

    :catch_3
    move-exception p2

    invoke-virtual {p2}, Lorg/json/JSONException;->printStackTrace()V

    :cond_b
    :goto_6
    invoke-virtual {p1, v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setSuperProperties(Lorg/json/JSONObject;)V

    goto :goto_8

    :pswitch_a
    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v3, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    if-eqz v0, :cond_c

    :try_start_4
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_7

    :catch_4
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_c
    move-object v3, v4

    :goto_7
    cmp-long v0, v1, v5

    if-eqz v0, :cond_d

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4, v1, v2}, Ljava/util/Date;-><init>(J)V

    :cond_d
    const-string v0, "TD_KEY_USER_PROPERTY_SET_TYPE"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcn/thinkingdata/analytics/utils/j;->a(Ljava/lang/String;)Lcn/thinkingdata/analytics/utils/j;

    move-result-object p2

    invoke-virtual {p1, p2, v3, v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    :cond_e
    :goto_8
    return-void

    :pswitch_data_0
    .packed-switch 0x100002
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x200000
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method
