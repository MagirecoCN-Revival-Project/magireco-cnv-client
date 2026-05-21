.class Lcn/thinkingdata/analytics/f/b$b;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/f/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/analytics/f/b$b$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/Object;

.field private final b:Landroid/os/Handler;

.field private final c:Lcn/thinkingdata/analytics/utils/g;

.field private final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic e:Lcn/thinkingdata/analytics/f/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/f/b;)V
    .locals 3

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/f/b$b;->a:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/f/b$b;->d:Ljava/util/Map;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "thinkingData.sdk.sendMessageWorker"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Lcn/thinkingdata/analytics/f/b$b$a;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lcn/thinkingdata/analytics/f/b$b$a;-><init>(Lcn/thinkingdata/analytics/f/b$b;Landroid/os/Looper;)V

    iput-object v1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/f/b;->a()Lcn/thinkingdata/analytics/utils/g;

    move-result-object p1

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->c:Lcn/thinkingdata/analytics/utils/g;

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/f/b$b;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/f/b$b;->a:Ljava/lang/Object;

    return-object p0
.end method

.method private a(Lorg/json/JSONArray;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcn/thinkingdata/analytics/f/e;->i()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TA-Integration-Type"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcn/thinkingdata/analytics/f/e;->j()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TA-Integration-Version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "TA-Integration-Count"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "TA-Integration-Extra"

    const-string v2, "Android"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lcn/thinkingdata/analytics/encrypt/c;->a(Lorg/json/JSONArray;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "1"

    goto :goto_0

    :cond_0
    const-string p1, "0"

    :goto_0
    const-string v1, "TA-Datas-Type"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private a(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 1

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcn/thinkingdata/analytics/f/b$b;->a(Ljava/lang/String;Lcn/thinkingdata/analytics/TDConfig;)V

    return-void
.end method

.method private a(Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V
    .locals 9

    iget-object v0, p1, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "data"

    invoke-virtual {p2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p1, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    const-string v1, "#app_id"

    invoke-virtual {p2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-string v2, "#flush_time"

    invoke-virtual {p2, v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v3, p0, Lcn/thinkingdata/analytics/f/b$b;->c:Lcn/thinkingdata/analytics/utils/g;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getServerUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v7

    const-string p1, "1"

    invoke-direct {p0, p1}, Lcn/thinkingdata/analytics/f/b$b;->d(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v8

    const/4 v6, 0x0

    invoke-interface/range {v3 .. v8}, Lcn/thinkingdata/analytics/utils/g;->a(Ljava/lang/String;Ljava/lang/String;ZLjavax/net/ssl/SSLSocketFactory;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "code"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ret code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", upload message:\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p1, 0x4

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ThinkingAnalytics.DataHandle"

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/f/b$b;Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/TDConfig;)V

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/f/b$b;Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/f/b$b;Ljava/lang/String;Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/f/b$b;->a(Ljava/lang/String;Lcn/thinkingdata/analytics/TDConfig;)V

    return-void
.end method

.method private a(Ljava/lang/String;Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    if-nez v3, :cond_0

    const-string v0, "ThinkingAnalytics.DataHandle"

    const-string v2, "Could found config object for sendToken. Canceling..."

    invoke-static {v0, v2}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, v3, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->d(Lcn/thinkingdata/analytics/f/b;)Ljava/util/Map;

    move-result-object v4

    monitor-enter v4

    :try_start_0
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->d(Lcn/thinkingdata/analytics/f/b;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    :cond_2
    :try_start_1
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->e(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/e;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/f/e;->h()Z

    move-result v0

    if-nez v0, :cond_3

    return-void

    :cond_3
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->e(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/e;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/f/e;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcn/thinkingdata/analytics/TDConfig;->isShouldFlush(Ljava/lang/String;)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v0, :cond_4

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_4
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v5

    monitor-enter v5

    :try_start_2
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v0

    sget-object v4, Lcn/thinkingdata/analytics/f/c$c;->b:Lcn/thinkingdata/analytics/f/c$c;

    const/16 v6, 0x32

    invoke-virtual {v0, v4, v2, v6}, Lcn/thinkingdata/analytics/f/c;->a(Lcn/thinkingdata/analytics/f/c$c;Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_7

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v4, 0x0

    aget-object v5, v0, v4

    const/4 v6, 0x1

    aget-object v7, v0, v6

    const/4 v8, 0x0

    :try_start_3
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :try_start_4
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V
    :try_end_4
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_6
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :try_start_5
    const-string v9, "data"

    invoke-virtual {v7, v9, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    const-string v9, "#app_id"

    :try_start_6
    iget-object v10, v3, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_6 .. :try_end_6} :catch_7
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    const-string v9, "#flush_time"

    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v7, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v14

    iget-object v12, v1, Lcn/thinkingdata/analytics/f/b$b;->c:Lcn/thinkingdata/analytics/utils/g;

    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/TDConfig;->getServerUrl()Ljava/lang/String;

    move-result-object v13

    const/4 v15, 0x0

    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/TDConfig;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v16

    invoke-direct {v1, v0}, Lcn/thinkingdata/analytics/f/b$b;->a(Lorg/json/JSONArray;)Ljava/util/Map;

    move-result-object v17

    invoke-interface/range {v12 .. v17}, Lcn/thinkingdata/analytics/utils/g;->a(Ljava/lang/String;Ljava/lang/String;ZLjavax/net/ssl/SSLSocketFactory;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "code"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_8
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_6
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    const-string v0, "ThinkingAnalytics.DataHandle"

    :try_start_9
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "[ThinkingData] Debug: Send event, Request = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v11, 0x4

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_6
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    const-string v0, "ThinkingAnalytics.DataHandle"

    :try_start_a
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "[ThinkingData] Debug: Send event, Response ="

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_3
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_6
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "ThinkingAnalytics.DataHandle"

    invoke-static {v0, v8}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v7

    monitor-enter v7

    :try_start_b
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v0

    sget-object v8, Lcn/thinkingdata/analytics/f/c$c;->b:Lcn/thinkingdata/analytics/f/c$c;

    invoke-virtual {v0, v5, v8, v2}, Lcn/thinkingdata/analytics/f/c;->a(Ljava/lang/String;Lcn/thinkingdata/analytics/f/c$c;Ljava/lang/String;)I

    move-result v0

    monitor-exit v7
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    sget-object v5, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    const-string v4, "Events flushed. [left = %d]"

    invoke-static {v5, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    :try_start_c
    monitor-exit v7
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    throw v0

    :catchall_1
    move-exception v0

    const/4 v3, 0x1

    goto/16 :goto_6

    :catch_1
    const/4 v7, 0x1

    goto/16 :goto_2

    :catch_2
    move-exception v0

    const-string v9, "ThinkingAnalytics.DataHandle"

    :try_start_d
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid data: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_d .. :try_end_d} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_d .. :try_end_d} :catch_7
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_3
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    :catchall_2
    move-exception v0

    const/4 v3, 0x0

    goto/16 :goto_6

    :catch_3
    move-exception v0

    goto :goto_1

    :catch_4
    move-exception v0

    goto/16 :goto_3

    :catch_5
    move-exception v0

    const-string v9, "ThinkingAnalytics.DataHandle"

    :try_start_e
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "The data is invalid: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
    :try_end_e
    .catch Lcn/thinkingdata/analytics/utils/g$a; {:try_start_e .. :try_end_e} :catch_4
    .catch Ljava/nio/charset/MalformedInputException; {:try_start_e .. :try_end_e} :catch_7
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_3
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_6
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    :catch_6
    nop

    const-string v0, "Cannot post message due to JSONException, the data will be deleted"

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_7

    const-string v7, "ThinkingAnalytics.DataHandle"

    invoke-static {v7, v0}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v7

    monitor-enter v7

    :try_start_f
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v0

    sget-object v8, Lcn/thinkingdata/analytics/f/c$c;->b:Lcn/thinkingdata/analytics/f/c$c;

    invoke-virtual {v0, v5, v8, v2}, Lcn/thinkingdata/analytics/f/c;->a(Ljava/lang/String;Lcn/thinkingdata/analytics/f/c$c;Ljava/lang/String;)I

    move-result v0

    monitor-exit v7
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    sget-object v5, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    const-string v4, "Events flushed. [left = %d]"

    invoke-static {v5, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :goto_0
    const-string v5, "ThinkingAnalytics.DataHandle"

    invoke-static {v5, v4}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    move v4, v0

    goto/16 :goto_5

    :catchall_3
    move-exception v0

    :try_start_10
    monitor-exit v7
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    throw v0

    :goto_1
    :try_start_11
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot post message to ["

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/TDConfig;->getServerUrl()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "] due to "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_9

    goto/16 :goto_4

    :catch_7
    const/4 v7, 0x0

    :goto_2
    :try_start_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot interpret "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/TDConfig;->getServerUrl()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " as a URL. The data will be deleted."

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_5

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_8

    const-string v8, "ThinkingAnalytics.DataHandle"

    invoke-static {v8, v0}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    if-eqz v7, :cond_9

    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v7

    monitor-enter v7

    :try_start_13
    iget-object v0, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v0

    sget-object v8, Lcn/thinkingdata/analytics/f/c$c;->b:Lcn/thinkingdata/analytics/f/c$c;

    invoke-virtual {v0, v5, v8, v2}, Lcn/thinkingdata/analytics/f/c;->a(Ljava/lang/String;Lcn/thinkingdata/analytics/f/c$c;Ljava/lang/String;)I

    move-result v0

    monitor-exit v7
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    sget-object v5, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    const-string v4, "Events flushed. [left = %d]"

    invoke-static {v5, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    :catchall_4
    move-exception v0

    :try_start_14
    monitor-exit v7
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    throw v0

    :catchall_5
    move-exception v0

    move v3, v7

    goto :goto_6

    :goto_3
    :try_start_15
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot post message to ["

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lcn/thinkingdata/analytics/TDConfig;->getServerUrl()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "] due to "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_9

    :goto_4
    const-string v5, "ThinkingAnalytics.DataHandle"

    invoke-static {v5, v0}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    :goto_5
    if-gtz v4, :cond_4

    return-void

    :goto_6
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_a

    const-string v7, "ThinkingAnalytics.DataHandle"

    invoke-static {v7, v8}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a
    if-eqz v3, :cond_b

    iget-object v3, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v3}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v3

    monitor-enter v3

    :try_start_16
    iget-object v7, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v7}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v7

    sget-object v8, Lcn/thinkingdata/analytics/f/c$c;->b:Lcn/thinkingdata/analytics/f/c$c;

    invoke-virtual {v7, v5, v8, v2}, Lcn/thinkingdata/analytics/f/c;->a(Ljava/lang/String;Lcn/thinkingdata/analytics/f/c$c;Ljava/lang/String;)I

    move-result v2

    monitor-exit v3
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_6

    sget-object v3, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v4

    const-string v2, "Events flushed. [left = %d]"

    invoke-static {v3, v2, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ThinkingAnalytics.DataHandle"

    invoke-static {v3, v2}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :catchall_6
    move-exception v0

    :try_start_17
    monitor-exit v3
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_6

    throw v0

    :cond_b
    :goto_7
    throw v0

    :catchall_7
    move-exception v0

    :try_start_18
    monitor-exit v5
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_7

    throw v0

    :catchall_8
    move-exception v0

    :try_start_19
    monitor-exit v4
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_8

    throw v0
.end method

.method static synthetic b(Lcn/thinkingdata/analytics/f/b$b;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    return-object p0
.end method

.method private b(Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V
    .locals 12

    const-string v0, "errorReasons"

    const-string v1, "errorProperties"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "appid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p1, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "properties"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-static {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sharedInstance(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getPresetProperties()Lcn/thinkingdata/analytics/TDPresetProperties;

    move-result-object v3

    const-string v4, "#device_id"

    if-eqz v3, :cond_0

    sget-object v5, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v3, v3, Lcn/thinkingdata/analytics/TDPresetProperties;->deviceId:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v3, ""

    :goto_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    sget-object v5, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v3, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcn/thinkingdata/analytics/f/e;->e(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/e;

    move-result-object v3

    iget-object v4, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcn/thinkingdata/analytics/f/e;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    :cond_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "&deviceId="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const-string v3, "&source=client&data="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->isDebugOnly()Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "&dryRun=1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "uploading message("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "):\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v5, "ThinkingAnalytics.DataHandle"

    invoke-static {v5, p2}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v6, p0, Lcn/thinkingdata/analytics/f/b$b;->c:Lcn/thinkingdata/analytics/utils/g;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getDebugUrl()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v10

    const-string p2, "1"

    invoke-direct {p0, p2}, Lcn/thinkingdata/analytics/f/b$b;->d(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v11

    const/4 v9, 0x1

    invoke-interface/range {v6 .. v11}, Lcn/thinkingdata/analytics/utils/g;->a(Ljava/lang/String;Ljava/lang/String;ZLjavax/net/ssl/SSLSocketFactory;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p2, "errorLevel"

    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    const/4 v6, -0x1

    if-ne p2, v6, :cond_5

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->isDebugOnly()Z

    move-result p2

    if-eqz p2, :cond_4

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "The data will be discarded due to this device is not allowed to debug for: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_4
    sget-object p2, Lcn/thinkingdata/analytics/TDConfig$TDMode;->NORMAL:Lcn/thinkingdata/analytics/TDConfig$TDMode;

    invoke-virtual {p1, p2}, Lcn/thinkingdata/analytics/TDConfig;->setMode(Lcn/thinkingdata/analytics/TDConfig$TDMode;)Lcn/thinkingdata/analytics/TDConfig;

    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Fallback to normal mode due to the device is not allowed to debug for: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    iget-object v6, p0, Lcn/thinkingdata/analytics/f/b$b;->d:Ljava/util/Map;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    const/4 v7, 0x1

    if-eqz v6, :cond_6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_7

    :cond_6
    iget-object v6, p0, Lcn/thinkingdata/analytics/f/b$b;->d:Ljava/util/Map;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-interface {v6, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->setAllowDebug()V

    :cond_7
    if-eqz p2, :cond_c

    :try_start_0
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " Error Properties: \n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error Reasons: \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    nop

    :cond_9
    :goto_1
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-eqz p1, :cond_d

    if-eq v7, p2, :cond_b

    const/4 p1, 0x2

    if-ne p1, p2, :cond_a

    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "Invalid data format. Please refer to the logcat log for detail info."

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_a
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown error level: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_b
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "Invalid properties. Please refer to the logcat log for detail info."

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Upload debug data successfully for "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    return-void
.end method

.method static synthetic b(Lcn/thinkingdata/analytics/f/b$b;Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/f/b$b;->b(Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V

    return-void
.end method

.method private d(Ljava/lang/String;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcn/thinkingdata/analytics/f/e;->i()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TA-Integration-Type"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcn/thinkingdata/analytics/f/e;->j()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TA-Integration-Version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "TA-Integration-Count"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "TA-Integration-Extra"

    const-string v1, "Android"

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method a()V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x6

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method a(Lcn/thinkingdata/analytics/f/a;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x5

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-boolean p1, p1, Lcn/thinkingdata/analytics/f/a;->i:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method a(Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method a(Ljava/lang/String;J)V
    .locals 4

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->hasMessages(ILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v1, v3, p1}, Landroid/os/Handler;->hasMessages(ILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    iput v2, v1, Landroid/os/Message;->what:I

    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {p1, v1, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "ThinkingAnalytics.DataHandle"

    :try_start_2
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The app might be quiting: "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method b(Lcn/thinkingdata/analytics/f/a;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-boolean p1, p1, Lcn/thinkingdata/analytics/f/a;->i:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method b(Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method c(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b;->a:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->hasMessages(ILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    const/4 v2, 0x0

    iput v2, v1, Landroid/os/Message;->what:I

    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$b;->b:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
