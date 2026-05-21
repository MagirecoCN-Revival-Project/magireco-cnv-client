.class public Lio/kamihama/magianative/RestClient;
.super Ljava/lang/Object;
.source "RestClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/kamihama/magianative/RestClient$UnzipRunnable;,
        Lio/kamihama/magianative/RestClient$DownloadRunnable;
    }
.end annotation


# static fields
.field private static final JSON:Lokhttp3/MediaType;

.field private static http1Client:Lokhttp3/OkHttpClient;


# instance fields
.field private final Endpoint:Ljava/lang/String;

.field private final LogTag:Ljava/lang/String;

.field private UserAgent:Ljava/lang/String;

.field private client:Lokhttp3/OkHttpClient;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "application/json; charset=utf-8"

    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    sput-object v0, Lio/kamihama/magianative/RestClient;->JSON:Lokhttp3/MediaType;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "https://totentanz-9b.magica-us.com"

    iput-object v0, p0, Lio/kamihama/magianative/RestClient;->Endpoint:Ljava/lang/String;

    const-string v0, "MagiaClientJNI"

    iput-object v0, p0, Lio/kamihama/magianative/RestClient;->LogTag:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "okhttp3 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "http.agent"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/kamihama/magianative/RestClient;->UserAgent:Ljava/lang/String;

    invoke-static {}, Lio/kamihama/magianative/RestClient;->getUnsafeOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lio/kamihama/magianative/RestClient;->client:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public static checkAndApplyHotUpdate()V
    .locals 9

    const-string v0, "MagiaClientJNI"

    new-instance v1, Ljava/io/File;

    const-string v2, "/data/data/io.kamihama.totentanz/files/madomagi/magica/cn_base_done.flag"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "[\u70ed\u66f4] flag\u4e0d\u5b58\u5728\uff0c\u8df3\u8fc7"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v5, 0x0

    :goto_0
    invoke-static {}, Lio/kamihama/magianative/RestClient;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_1

    const/16 v2, 0x1e

    if-ge v5, v2, :cond_1

    add-int/lit8 v5, v5, 0x1

    const-wide/16 v6, 0x64

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    goto :goto_0

    :cond_1
    if-eqz v1, :cond_2

    invoke-static {v1}, Lio/kamihama/magianative/CNCNDownloadUI;->show(Landroid/app/Activity;)V

    const-string v2, "[\u70ed\u66f4] UI\u5df2\u663e\u793a"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :try_start_1
    const-string v1, "https://raw.githubusercontent.com/HiiragiNemu/magireco-cn-patch/main/version_scenario.json"

    invoke-static {v1}, Lio/kamihama/magianative/RestClient;->fetchVersionJson(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v2, "version"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "scenario_version"

    invoke-static {v3}, Lio/kamihama/magianative/RestClient;->readLocalVersionInt(Ljava/lang/String;)I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[\u70ed\u66f4] scenario server="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " local="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-le v2, v3, :cond_3

    const-string v4, "[\u70ed\u66f4] scenario\u9700\u8981\u66f4\u65b0\uff0c\u5f00\u59cb\u4e0b\u8f7d"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "https://magireco-assets.madeinmagius.top/cn_scenario_update.zip"

    const-string v5, "/data/data/io.kamihama.totentanz/files/cn_scenario_update.zip"

    const-string v6, "cn_scenario_update.zip"

    const/16 v7, 0xe

    invoke-static {v4, v5, v6, v7}, Lio/kamihama/magianative/RestClient;->cnDownloadFileFull(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, "[\u70ed\u66f4] scenario\u89e3\u538b\u4e2d..."

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_scenario_update.zip"

    const-string v5, "/data/data/io.kamihama.totentanz/files/"

    invoke-static {v4, v5}, Lio/kamihama/magianative/RestClient;->unzip(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    const-string v5, "/data/data/io.kamihama.totentanz/files/cn_scenario_update.zip"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    const-string v4, "scenario_version"

    invoke-static {v4, v2}, Lio/kamihama/magianative/RestClient;->saveLocalVersionInt(Ljava/lang/String;I)V

    const-string v4, "[\u70ed\u66f4] scenario\u66f4\u65b0\u5b8c\u6210"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    const-string v4, "[\u70ed\u66f4] scenario\u65e0\u9700\u66f4\u65b0"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    goto :goto_2

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    :try_start_2
    const-string v1, "https://raw.githubusercontent.com/HiiragiNemu/magireco-cn-patch/main/version_js.json"

    invoke-static {v1}, Lio/kamihama/magianative/RestClient;->fetchVersionJson(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_4

    const-string v2, "version"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "js_version"

    invoke-static {v3}, Lio/kamihama/magianative/RestClient;->readLocalVersionInt(Ljava/lang/String;)I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[\u70ed\u66f4] js server="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " local="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-le v2, v3, :cond_4

    const-string v4, "[\u70ed\u66f4] js\u9700\u8981\u66f4\u65b0\uff0c\u5f00\u59cb\u4e0b\u8f7d"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "https://magireco-assets.magireco.top/cn_js_update.zip"

    const-string v5, "/data/data/io.kamihama.totentanz/files/cn_js_update_hot.zip"

    const-string v6, "cn_js_update.zip"

    const/16 v7, 0xb

    invoke-static {v4, v5, v6, v7}, Lio/kamihama/magianative/RestClient;->cnDownloadFileFull(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "[\u70ed\u66f4] js\u89e3\u538b\u4e2d..."

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_js_update_hot.zip"

    const-string v5, "/data/data/io.kamihama.totentanz/files/"

    invoke-static {v4, v5}, Lio/kamihama/magianative/RestClient;->unzip(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    const-string v5, "/data/data/io.kamihama.totentanz/files/cn_js_update_hot.zip"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    const-string v4, "js_version"

    invoke-static {v4, v2}, Lio/kamihama/magianative/RestClient;->saveLocalVersionInt(Ljava/lang/String;I)V

    const-string v4, "[\u70ed\u66f4] js\u66f4\u65b0\u5b8c\u6210"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_4
    const-string v4, "[\u70ed\u66f4] js\u65e0\u9700\u66f4\u65b0"

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :goto_3
    goto :goto_4

    :catch_2
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    const-string v1, "[\u70ed\u66f4] \u68c0\u67e5\u5b8c\u6bd5\uff0c\u5173\u95edUI"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lio/kamihama/magianative/CNCNDownloadUI;->hide()V

    return-void
.end method

.method public static cnDownloadFileFull(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 12

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_0

    const-string v11, "MagiaClientJNI"

    const-string v2, "[cnDL] \u5df2\u5b58\u5728\u8df3\u8fc7"

    invoke-static {v11, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p3}, Lio/kamihama/magianative/CNCNDownloadUI;->markFileDone(I)V

    const/4 v11, 0x1

    return v11

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v11, ".part"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v10, 0x0

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_1

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->length()J

    move-result-wide v10

    long-to-int v10, v10

    :cond_1
    :try_start_0
    const/4 v11, 0x0

    const-string v2, ""

    if-lez v10, :cond_2

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bytes="

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v2, "-"

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_2
    invoke-static {}, Lio/kamihama/magianative/RestClient;->getHttp1Client()Lokhttp3/OkHttpClient;

    move-result-object v11

    if-eqz v11, :cond_4

    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v3, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    const-string v5, "Range"

    invoke-virtual {v3, v5, v2}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    :cond_3
    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    invoke-virtual {v11, v3}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v11

    invoke-interface {v11}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v11

    invoke-virtual {v11}, Lokhttp3/Response;->code()I

    move-result v3

    const/16 v5, 0xc8

    if-eq v3, v5, :cond_6

    const/16 v5, 0xce

    if-eq v3, v5, :cond_6

    :cond_4
    invoke-static {p3}, Lio/kamihama/magianative/RestClient;->getFallbackUrl(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_e

    const-string v5, "MagiaClientJNI"

    const-string v11, "[cnDL] \u5207\u6362\u5907\u7528"

    invoke-static {v5, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lio/kamihama/magianative/RestClient;->getHttp1Client()Lokhttp3/OkHttpClient;

    move-result-object v11

    if-eqz v11, :cond_e

    new-instance v5, Lokhttp3/Request$Builder;

    invoke-direct {v5}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v5, v3}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_5

    const-string v3, "Range"

    invoke-virtual {v5, v3, v2}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    :cond_5
    invoke-virtual {v5}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v5

    invoke-virtual {v11, v5}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v11

    invoke-interface {v11}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v11

    invoke-virtual {v11}, Lokhttp3/Response;->code()I

    move-result v3

    const/16 v5, 0xc8

    if-eq v3, v5, :cond_6

    const/16 v5, 0xce

    if-eq v3, v5, :cond_6

    goto/16 :goto_2

    :cond_6
    invoke-virtual {v11}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v11

    if-eqz v11, :cond_e

    invoke-virtual {v11}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v2

    long-to-int v9, v2

    if-gtz v9, :cond_7

    const/4 v9, 0x0

    :cond_7
    invoke-virtual {v11}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    int-to-float v2, v10

    int-to-float v11, v9

    add-float/2addr v2, v11

    const v11, 0x49742400    # 1000000.0f

    div-float v2, v2, v11

    invoke-static {p3, v2}, Lio/kamihama/magianative/CNCNDownloadUI;->setFileSize(IF)V

    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    new-instance v7, Ljava/io/FileOutputStream;

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-direct {v7, v11, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    const v2, 0x40000

    new-array v4, v2, [B

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    long-to-int v8, v2

    invoke-static {p3, v10}, Lio/kamihama/magianative/CNCNDownloadUI;->updateFileProgress(II)V

    :goto_0
    invoke-virtual {v1, v4}, Ljava/io/InputStream;->read([B)I

    move-result v11

    const/4 v2, -0x1

    if-eq v11, v2, :cond_d

    const/4 v2, 0x0

    invoke-virtual {v7, v4, v2, v11}, Ljava/io/FileOutputStream;->write([BII)V

    add-int/2addr v5, v11

    add-int/2addr v6, v11

    const v2, 0x40000

    if-lt v6, v2, :cond_9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    long-to-int v2, v2

    sub-int v11, v2, v8

    move v8, v2

    if-lez v11, :cond_8

    const/16 v2, 0x32

    if-le v11, v2, :cond_8

    int-to-float v2, v6

    const v6, 0x447a0000    # 1000.0f

    mul-float v2, v2, v6

    int-to-float v6, v11

    div-float v2, v2, v6

    const v6, 0x49742400    # 1000000.0f

    div-float v2, v2, v6

    invoke-static {p3, v2}, Lio/kamihama/magianative/CNCNDownloadUI;->setDownloadSpeed(IF)V

    :cond_8
    const/4 v6, 0x0

    add-int v11, v10, v5

    int-to-float v2, v11

    const v11, 0x49742400    # 1000000.0f

    div-float v2, v2, v11

    invoke-static {p3, v2}, Lio/kamihama/magianative/CNCNDownloadUI;->setFileDownloaded(IF)V

    :cond_9
    if-lez v9, :cond_b

    add-int v11, v10, v5

    if-lez v11, :cond_b

    add-int v2, v10, v9

    if-lez v2, :cond_b

    int-to-float v11, v11

    int-to-float v2, v2

    div-float v11, v11, v2

    const v2, 0x42c80000    # 100.0f

    mul-float v11, v11, v2

    float-to-int v11, v11

    if-gtz v11, :cond_a

    const/4 v11, 0x0

    goto :goto_1

    :cond_a
    const/16 v2, 0x64

    if-le v11, v2, :cond_c

    move v11, v2

    goto :goto_1

    :cond_b
    const/4 v11, 0x0

    :cond_c
    :goto_1
    invoke-static {p3, v11}, Lio/kamihama/magianative/CNCNDownloadUI;->updateFileProgress(II)V

    goto :goto_0

    :cond_d
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    const-string v11, "MagiaClientJNI"

    const-string v2, "[cnDL] \u2713 \u5b8c\u6210"

    invoke-static {v11, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v11, 0x1

    return v11

    :cond_e
    :goto_2
    const-string v11, "MagiaClientJNI"

    const-string v2, "[cnDL] \u2717 \u5168\u90e8\u5931\u8d25"

    invoke-static {v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v11, 0x0

    return v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v2

    const-string v11, "MagiaClientJNI"

    const-string v3, "[cnDL] \u5f02\u5e38(\u5df2\u4e0d\u518d\u91cd\u8bd5)"

    invoke-static {v11, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v11, 0x0

    return v11

    const/4 v11, 0x0

    return v11
.end method

.method private static downloadAllFiles()V
    .locals 7

    const/16 v6, 0xf

    new-array v0, v6, [Ljava/lang/Thread;

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_base_00_db.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_base_00_db.zip"

    const-string v5, "cn_base_00_db.zip"

    const/4 v6, 0x0

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x0

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_base_01_json.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_base_01_json.zip"

    const-string v5, "cn_base_01_json.zip"

    const/4 v6, 0x1

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x1

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_base_02.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_base_02.zip"

    const-string v5, "cn_base_02.zip"

    const/4 v6, 0x2

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x2

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_base_03.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_base_03.zip"

    const-string v5, "cn_base_03.zip"

    const/4 v6, 0x3

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x3

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_base_04.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_base_04.zip"

    const-string v5, "cn_base_04.zip"

    const/4 v6, 0x4

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x4

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_base_05.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_base_05.zip"

    const-string v5, "cn_base_05.zip"

    const/4 v6, 0x5

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x5

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_base_06.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_base_06.zip"

    const-string v5, "cn_base_06.zip"

    const/4 v6, 0x6

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x6

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_magica_resource.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_magica_resource.zip"

    const-string v5, "cn_magica_resource.zip"

    const/4 v6, 0x7

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/4 v6, 0x7

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.madeinmagius.top/cn_scenario_img.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_scenario_img.zip"

    const-string v5, "cn_scenario_img.zip"

    const/16 v6, 0x8

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/16 v6, 0x8

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.madeinmagius.top/cn_voice_01.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_voice_01.zip"

    const-string v5, "cn_voice_01.zip"

    const/16 v6, 0x9

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/16 v6, 0x9

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.madeinmagius.top/cn_voice_02_done.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_voice_02_done.zip"

    const-string v5, "cn_voice_02_done.zip"

    const/16 v6, 0xa

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/16 v6, 0xa

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.magireco.top/cn_js_update.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_js_update.zip"

    const-string v5, "cn_js_update.zip"

    const/16 v6, 0xb

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/16 v6, 0xb

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.madeinmagius.top/movie.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/movie.zip"

    const-string v5, "movie.zip"

    const/16 v6, 0xc

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/16 v6, 0xc

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.madeinmagius.top/movie2.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/movie2.zip"

    const-string v5, "movie2.zip"

    const/16 v6, 0xd

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/16 v6, 0xd

    aput-object v2, v0, v6

    new-instance v1, Lio/kamihama/magianative/RestClient$DownloadRunnable;

    const-string v3, "https://magireco-assets.madeinmagius.top/cn_scenario_update.zip"

    const-string v4, "/data/data/io.kamihama.totentanz/files/cn_scenario_update.zip"

    const-string v5, "cn_scenario_update.zip"

    const/16 v6, 0xe

    invoke-direct {v1, v3, v4, v5, v6}, Lio/kamihama/magianative/RestClient$DownloadRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    const/16 v6, 0xe

    aput-object v2, v0, v6

    const/4 v3, 0x0

    :goto_0
    const/16 v4, 0xf

    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    invoke-static {v1}, Lio/kamihama/magianative/RestClient;->joinThread(Ljava/lang/Thread;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static fetchVersionJson(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lokhttp3/OkHttpClient;

    invoke-direct {v0}, Lokhttp3/OkHttpClient;-><init>()V

    new-instance v1, Lokhttp3/Request$Builder;

    invoke-direct {v1}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v1, p0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Response;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object v2

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getCurrentActivity()Landroid/app/Activity;
    .locals 6

    :try_start_0
    const-string v0, "android.app.ActivityThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "currentActivityThread"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v1, "mActivities"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/ArrayMap;

    invoke-virtual {v2}, Landroid/util/ArrayMap;->size()I

    move-result v3

    if-lez v3, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "activity"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :cond_0
    const/4 v0, 0x0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "MagiaClientJNI"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getFallbackUrl(I)Ljava/lang/String;
    .locals 2
    .param p0, "fileIndex"    # I

    const/16 v0, 0xf

    if-ge p0, v0, :cond_0

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->FILE_URLS:[Ljava/lang/String;

    if-eqz v0, :cond_0

    aget-object v1, v0, p0

    return-object v1

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getHttp1Client()Lokhttp3/OkHttpClient;
    .locals 4

    sget-object v0, Lio/kamihama/magianative/RestClient;->http1Client:Lokhttp3/OkHttpClient;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    const-wide v1, 0x7530

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide v1, 0x1d4c0

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide v1, 0x1d4c0

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sget-object v2, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lio/kamihama/magianative/RestClient;->http1Client:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method private static getUnsafeOkHttpClient()Lokhttp3/OkHttpClient;
    .locals 8

    .prologue
    const/4 v6, 0x1

    :try_start_0
    new-array v5, v6, [Ljavax/net/ssl/TrustManager;

    const/4 v6, 0x0

    new-instance v7, Lio/kamihama/magianative/RestClient$1;

    invoke-direct {v7}, Lio/kamihama/magianative/RestClient$1;-><init>()V

    aput-object v7, v5, v6

    const-string v6, "SSL"

    invoke-static {v6}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    const/4 v6, 0x0

    new-instance v7, Ljava/security/SecureRandom;

    invoke-direct {v7}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v3, v6, v5, v7}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    invoke-virtual {v3}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v4

    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    const/4 v6, 0x0

    aget-object v6, v5, v6

    check-cast v6, Ljavax/net/ssl/X509TrustManager;

    invoke-virtual {v0, v4, v6}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v6, Lio/kamihama/magianative/RestClient$2;

    invoke-direct {v6}, Lio/kamihama/magianative/RestClient$2;-><init>()V

    invoke-virtual {v0, v6}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide v4, 0x7530

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v6}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide v4, 0x1d4c0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v6}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide v4, 0x1d4c0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v6}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    sget-object v7, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v6}, Lokhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v1

    return-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    const-string v2, "MagiaClientJNI"

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    return-object v1
.end method

.method public static joinThread(Ljava/lang/Thread;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Thread;

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method private postRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    sget-object v5, Lio/kamihama/magianative/RestClient;->JSON:Lokhttp3/MediaType;

    invoke-static {v5, p2}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v0

    new-instance v5, Lokhttp3/Request$Builder;

    invoke-direct {v5}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v5, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5, v0}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v5

    const-string v6, "User-Agent"

    invoke-virtual {v5, v6}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    const-string v6, "User-Agent"

    iget-object v7, p0, Lio/kamihama/magianative/RestClient;->UserAgent:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    iget-object v5, p0, Lio/kamihama/magianative/RestClient;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v5, v3}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v5

    invoke-interface {v5}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Response;->code()I

    move-result v5

    const/16 v6, 0x133

    if-eq v5, v6, :cond_0

    invoke-virtual {v4}, Lokhttp3/Response;->code()I

    move-result v5

    const/16 v6, 0x134

    if-ne v5, v6, :cond_2

    :cond_0
    const-string v5, "Location"

    invoke-virtual {v4, v5}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v3}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5, v0}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v5

    const-string v6, "User-Agent"

    invoke-virtual {v5, v6}, Lokhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    const-string v6, "User-Agent"

    iget-object v7, p0, Lio/kamihama/magianative/RestClient;->UserAgent:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    iget-object v5, p0, Lio/kamihama/magianative/RestClient;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v5, v3}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v5

    invoke-interface {v5}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v5

    :goto_0
    return-object v5

    :cond_1
    const-string v5, ""

    goto :goto_0

    :cond_2
    invoke-virtual {v4}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual {v4}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    :cond_3
    const-string v5, ""

    goto :goto_0
.end method

.method private static readLocalVersionInt(Ljava/lang/String;)I
    .locals 6

    :try_start_0
    const-string v0, "android.app.ActivityThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "currentActivityThread"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "getApplication"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    const-string v3, "MagiaCN"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, p0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v5

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    return v1
.end method

.method public static restartApp()V
    .locals 6

    const-string v0, "MagiaClientJNI"

    const-string v1, "[CN] restartApp \u5f00\u59cb"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-static {}, Lio/kamihama/magianative/RestClient;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_0

    const v3, 0x10c00000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    const-wide/16 v4, 0x1f4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    const-wide/16 v4, 0x3e8

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    return-void
.end method

.method private static saveLocalVersionInt(Ljava/lang/String;I)V
    .locals 6

    :try_start_0
    const-string v0, "android.app.ActivityThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "currentActivityThread"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "getApplication"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    const-string v3, "MagiaCN"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method public static startCNDownload()V
    .locals 14

    const-string v0, "MagiaClientJNI"

    const-string v1, "[CN] startCNDownload \u88ab\u8c03\u7528"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lio/kamihama/magianative/RestClient;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    :try_start_0
    if-eqz v1, :cond_0

    invoke-static {v1}, Lio/kamihama/magianative/CNCNDownloadUI;->show(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    const-string v1, "/data/data/io.kamihama.totentanz/files/madomagi/magica/cn_base_done.flag"

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lio/kamihama/magianative/CNCNDownloadUI;->hide()V

    goto :goto_3

    :cond_1
    const-string v1, "[CN] \u5f00\u59cb\u5168\u65b0\u5b89\u88c5(14\u7ebf\u7a0b\u5e76\u53d1\u6a21\u5f0f)"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "/data/data/io.kamihama.totentanz/files/madomagi/magica"

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    invoke-static {}, Lio/kamihama/magianative/RestClient;->downloadAllFiles()V

    :goto_1
    sget-object v5, Lio/kamihama/magianative/CNCNDownloadUI;->fileStatus:[I

    if-eqz v5, :cond_3

    const/4 v6, 0x0

    const/16 v7, 0xf

    :goto_2
    if-ge v6, v7, :cond_3

    aget v8, v5, v6

    const/4 v9, 0x2

    if-lt v8, v9, :cond_2

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_2
    const-wide/16 v8, 0xc8

    :try_start_1
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    goto :goto_1

    :cond_3
    const-string v1, "\u2705 \u5b89\u88c5\u5b8c\u6210\uff01\u5199\u5165\u6807\u8bb0..."

    const-string v2, "\ud83d\udd17 \u6e38\u620f\u5373\u5c06\u91cd\u542f"

    const/16 v5, 0x64

    invoke-static {v1, v2, v5}, Lio/kamihama/magianative/CNCNDownloadUI;->updateSimple(Ljava/lang/String;Ljava/lang/String;I)V

    :try_start_2
    const-string v1, "/data/data/io.kamihama.totentanz/files/madomagi/magica/cn_base_done.flag"

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    new-instance v2, Ljava/io/FileOutputStream;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v3, "done"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    invoke-static {}, Lio/kamihama/magianative/CNCNDownloadUI;->hide()V

    const-string v1, "[CN] \u2605 \u5b89\u88c5\u5b8c\u6210\uff0c\u51c6\u5907\u91cd\u542f"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_3
    const-wide/16 v2, 0x7d0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    invoke-static {}, Lio/kamihama/magianative/RestClient;->restartApp()V

    goto :goto_3

    :catch_3
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lio/kamihama/magianative/CNCNDownloadUI;->hide()V

    :goto_3
    return-void
.end method

.method public static unzip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p0, "zipFilePath"    # Ljava/lang/String;
    .param p1, "destPath"    # Ljava/lang/String;

    const-string v0, "MagiaClientJNI"

    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    :cond_0
    new-instance v2, Ljava/util/zip/ZipInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v3

    :goto_0
    if-eqz v3, :cond_4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_2

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    new-instance v6, Ljava/io/BufferedOutputStream;

    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/16 v7, 0x1000

    new-array v7, v7, [B

    const/4 v8, 0x0

    :goto_1
    invoke-virtual {v2, v7}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v9

    move v8, v9

    const/4 v10, -0x1

    if-eq v9, v10, :cond_1

    const/4 v9, 0x0

    invoke-virtual {v6, v7, v9, v8}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_1

    :cond_1
    invoke-virtual {v6}, Ljava/io/BufferedOutputStream;->close()V

    goto :goto_2

    :cond_2
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    :cond_3
    :goto_2
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    move-object v3, v5

    goto :goto_0

    :cond_4
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u3010\u89e3\u538b\u3011\u6210\u529f: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u3010\u89e3\u538b\u3011\u5931\u8d25: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    return-void
.end method


# virtual methods
.method public GetEndpoint(I)Ljava/lang/String;
    .locals 5
    .param p1, "version"    # I

    .prologue
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v2, "version"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    const-string v2, "https://totentanz-9b.magica-us.com/magica/api/snaa"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lio/kamihama/magianative/RestClient;->postRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    :goto_0
    return-object v2

    :catch_0
    move-exception v0

    const-string v2, "MagiaClientJNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error adding version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, ""

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v2, "MagiaClientJNI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error with request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, ""

    goto :goto_0
.end method
