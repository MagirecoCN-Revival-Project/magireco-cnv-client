.class Lcn/thinkingdata/analytics/TDConfig$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/TDConfig;->getRemoteConfig()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/TDConfig;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    const-string v0, "disable_event_list"

    const-string v1, "asymmetric"

    const-string v2, "symmetric"

    const-string v3, "version"

    const-string v4, "key"

    const-string v5, "secret_key"

    const-string v6, "Getting remote config failed due to: "

    const-string v7, "ThinkingAnalytics.TDConfig"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    const/4 v8, 0x0

    :try_start_0
    new-instance v9, Ljava/net/URL;

    iget-object v10, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v10}, Lcn/thinkingdata/analytics/TDConfig;->access$000(Lcn/thinkingdata/analytics/TDConfig;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v9

    check-cast v9, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v10, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v10}, Lcn/thinkingdata/analytics/TDConfig;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v10

    if-eqz v10, :cond_0

    instance-of v11, v9, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v11, :cond_0

    move-object v11, v9

    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v11, v10}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    :cond_0
    const/16 v10, 0x3a98

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v10, 0x4e20

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v10, "GET"

    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v10, 0xc8

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v11

    if-ne v10, v11, :cond_7

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    new-instance v10, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/InputStreamReader;

    invoke-direct {v11, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v10, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    :goto_0
    invoke-virtual {v10}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_1

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_1
    new-instance v12, Lorg/json/JSONObject;

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v12, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v11, "code"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "0"

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    iget-object v11, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v11}, Lcn/thinkingdata/analytics/TDConfig;->access$100(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/g/d;

    move-result-object v11

    sget-object v13, Lcn/thinkingdata/analytics/g/g;->c:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v11, v13}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    iget-object v13, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v13}, Lcn/thinkingdata/analytics/TDConfig;->access$100(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/g/d;

    move-result-object v13

    sget-object v14, Lcn/thinkingdata/analytics/g/g;->b:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v13, v14}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    const-string v14, "data"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    const-string v14, "sync_interval"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    mul-int/lit16 v11, v11, 0x3e8

    const-string v14, "sync_batch_size"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    new-instance v14, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    invoke-direct {v14, v4, v3, v2, v1}, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v5, v14}, Lcn/thinkingdata/analytics/TDConfig;->access$202(Lcn/thinkingdata/analytics/TDConfig;Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ThinkingData] Info: Get remote config success ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v2, v2, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    const/4 v3, 0x4

    invoke-static {v2, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "):\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v1}, Lcn/thinkingdata/analytics/TDConfig;->access$300(Lcn/thinkingdata/analytics/TDConfig;)Ljava/util/concurrent/locks/ReadWriteLock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v2, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v2}, Lcn/thinkingdata/analytics/TDConfig;->access$400(Lcn/thinkingdata/analytics/TDConfig;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    :try_start_4
    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v0}, Lcn/thinkingdata/analytics/TDConfig;->access$300(Lcn/thinkingdata/analytics/TDConfig;)Ljava/util/concurrent/locks/ReadWriteLock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_2

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v1}, Lcn/thinkingdata/analytics/TDConfig;->access$300(Lcn/thinkingdata/analytics/TDConfig;)Ljava/util/concurrent/locks/ReadWriteLock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catch_0
    move-exception v0

    :try_start_5
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_4
    :goto_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v0}, Lcn/thinkingdata/analytics/TDConfig;->access$100(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/g/d;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->b:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v13, :cond_5

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v0}, Lcn/thinkingdata/analytics/TDConfig;->access$100(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/g/d;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->b:Lcn/thinkingdata/analytics/g/g;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    :cond_5
    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v0}, Lcn/thinkingdata/analytics/TDConfig;->access$100(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/g/d;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->c:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v11, :cond_6

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig$a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {v0}, Lcn/thinkingdata/analytics/TDConfig;->access$100(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/g/d;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->c:Lcn/thinkingdata/analytics/g/g;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    :cond_6
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V

    goto :goto_3

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Getting remote config failed, responseCode is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :goto_3
    if-eqz v8, :cond_8

    :try_start_6
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_8
    :goto_4
    if-eqz v9, :cond_c

    goto/16 :goto_b

    :catch_2
    move-exception v0

    goto :goto_5

    :catch_3
    move-exception v0

    goto :goto_7

    :catch_4
    move-exception v0

    goto :goto_9

    :catchall_1
    move-exception v0

    move-object v9, v8

    goto/16 :goto_c

    :catch_5
    move-exception v0

    move-object v9, v8

    :goto_5
    :try_start_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    if-eqz v8, :cond_9

    :try_start_8
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_6

    :catch_6
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_9
    :goto_6
    if-eqz v9, :cond_c

    goto :goto_b

    :catch_7
    move-exception v0

    move-object v9, v8

    :goto_7
    :try_start_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    if-eqz v8, :cond_a

    :try_start_a
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_8

    goto :goto_8

    :catch_8
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_a
    :goto_8
    if-eqz v9, :cond_c

    goto :goto_b

    :catch_9
    move-exception v0

    move-object v9, v8

    :goto_9
    :try_start_b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    if-eqz v8, :cond_b

    :try_start_c
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_a

    goto :goto_a

    :catch_a
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_b
    :goto_a
    if-eqz v9, :cond_c

    :goto_b
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_c
    return-void

    :catchall_2
    move-exception v0

    :goto_c
    if-eqz v8, :cond_d

    :try_start_d
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_b

    goto :goto_d

    :catch_b
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    :cond_d
    :goto_d
    if-eqz v9, :cond_e

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_e
    throw v0
.end method
