.class public Lio/kamihama/magianative/CNCNDownloadUI;
.super Ljava/lang/Object;
.source "CNCNDownloadUI.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/kamihama/magianative/CNCNDownloadUI$CreateUIRunnable;,
        Lio/kamihama/magianative/CNCNDownloadUI$HideRunnable;,
        Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;
    }
.end annotation


# static fields
.field public static final FILE_NAMES:[Ljava/lang/String;

.field public static final FILE_URLS:[Ljava/lang/String;

.field public static decorView:Landroid/view/ViewGroup;

.field public static fileDownloaded:[F

.field public static fileProgress:[I

.field public static fileSize:[F

.field public static fileSpeed:[F

.field public static fileStatus:[I

.field public static isShowing:Z

.field public static lastUpdateTime:J

.field public static overlayView:Landroid/widget/FrameLayout;

.field public static progressBarOverall:Landroid/widget/ProgressBar;

.field public static tvLog:Landroid/widget/TextView;

.field public static tvSpeed:Landroid/widget/TextView;

.field public static uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "https://magireco.cbnv.top/cn_base_00_db.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "https://magireco.cbnv.top/cn_base_01_json.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "https://magireco.cbnv.top/cn_base_02.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "https://magireco.cbnv.top/cn_base_03.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "https://magireco.cbnv.top/cn_base_04.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "https://magireco.cbnv.top/cn_base_05.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "https://magireco.cbnv.top/cn_base_06.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "https://magireco.cbnv.top/cn_magica_resource.zip"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "https://magireco.cbnv.top/cn_scenario_img.zip"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "https://magireco2.cbnv.top/cn_voice_01.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "https://magireco2.cbnv.top/cn_voice_02_done.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "https://magireco.cbnv.top/cn_js_update.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "https://magireco2.cbnv.top/movie.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "https://magireco2.cbnv.top/movie2.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "https://magireco2.cbnv.top/cn_scenario_update.zip"

    aput-object v2, v0, v1

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->FILE_URLS:[Ljava/lang/String;

    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "cn_base_00_db.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "cn_base_01_json.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "cn_base_02.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "cn_base_03.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "cn_base_04.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "cn_base_05.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "cn_base_06.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "cn_magica_resource.zip"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "cn_scenario_img.zip"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "cn_voice_01.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "cn_voice_02_done.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "cn_js_update.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "movie.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "movie2.zip"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "cn_scenario_update.zip"

    aput-object v2, v0, v1

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->FILE_NAMES:[Ljava/lang/String;

    const/16 v0, 0xf

    new-array v0, v0, [I

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileStatus:[I

    const/16 v0, 0xf

    new-array v0, v0, [I

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileProgress:[I

    const/16 v0, 0xf

    new-array v0, v0, [F

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileSize:[F

    const/16 v0, 0xf

    new-array v0, v0, [F

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileSpeed:[F

    const/16 v0, 0xf

    new-array v0, v0, [F

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileDownloaded:[F

    return-void
.end method

.method public static buildStatusText()Ljava/lang/String;
    .locals 11

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->FILE_NAMES:[Ljava/lang/String;

    sget-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->fileStatus:[I

    sget-object v2, Lio/kamihama/magianative/CNCNDownloadUI;->fileProgress:[I

    sget-object v8, Lio/kamihama/magianative/CNCNDownloadUI;->fileSize:[F

    sget-object v9, Lio/kamihama/magianative/CNCNDownloadUI;->fileSpeed:[F

    sget-object v10, Lio/kamihama/magianative/CNCNDownloadUI;->fileDownloaded:[F

    if-eqz v0, :cond_b

    if-eqz v1, :cond_b

    if-eqz v2, :cond_b

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "=== MagiaCN Installer ===\n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    :goto_0
    const/16 v5, 0xf

    if-ge v4, v5, :cond_a

    aget v5, v1, v4

    const/4 v6, 0x2

    if-eq v5, v6, :cond_0

    const/4 v6, 0x1

    if-eq v5, v6, :cond_1

    const-string v6, "[  ] "

    goto :goto_1

    :cond_0
    const-string v6, "[OK] "

    goto :goto_1

    :cond_1
    const-string v6, "[ > ] "

    :goto_1
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v6, v0, v4

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v7, 0x1

    if-ne v5, v7, :cond_9

    aget v6, v2, v4

    const-string v7, "  "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "%"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v10, :cond_4

    if-eqz v8, :cond_4

    aget v6, v10, v4

    invoke-static {v6}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    const/4 v6, 0x6

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v6, :cond_2

    const/4 v5, 0x0

    invoke-virtual {v7, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :cond_2
    const-string v6, "  "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "/"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v6, v8, v4

    invoke-static {v6}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    const/4 v6, 0x6

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v6, :cond_3

    const/4 v5, 0x0

    invoke-virtual {v7, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :cond_3
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "MB"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    :cond_4
    if-eqz v9, :cond_6

    aget v6, v9, v4

    invoke-static {v6}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    const/4 v6, 0x4

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v6, :cond_5

    const/4 v5, 0x0

    invoke-virtual {v7, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :cond_5
    const-string v6, "  "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "MB/s"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    :cond_6
    aget v5, v1, v4

    const/4 v6, 0x0

    if-eq v5, v6, :cond_9

    aget v6, v2, v4

    const-string v7, "\n  ["

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v7, 0x0

    :goto_2
    const/16 v5, 0xa

    if-ge v7, v5, :cond_8

    mul-int/lit8 v5, v7, 0xa

    if-ge v5, v6, :cond_7

    const-string v5, "\u2588"

    goto :goto_3

    :cond_7
    const-string v5, "\u2591"

    :goto_3
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_8
    const-string v7, "]"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v5, v1, v4

    :cond_9
    const-string v7, "\n"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_a
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    :cond_b
    const-string v3, "=== MagiaCN Installer ===\n(initializing...)"

    return-object v3
.end method

.method public static hide()V
    .locals 2

    sget-boolean v0, Lio/kamihama/magianative/CNCNDownloadUI;->isShowing:Z

    if-eqz v0, :cond_0

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->uiHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v1, Lio/kamihama/magianative/CNCNDownloadUI$HideRunnable;

    invoke-direct {v1}, Lio/kamihama/magianative/CNCNDownloadUI$HideRunnable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    sput-boolean v0, Lio/kamihama/magianative/CNCNDownloadUI;->isShowing:Z

    :cond_0
    return-void
.end method

.method public static markFileDone(I)V
    .locals 3

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileStatus:[I

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    aput v1, v0, p0

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileProgress:[I

    if-eqz v0, :cond_0

    const/16 v1, 0x64

    aput v1, v0, p0

    :cond_0
    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->uiHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    new-instance v1, Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;

    invoke-direct {v1}, Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method public static setDownloadSpeed(IF)V
    .locals 1

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileSpeed:[F

    if-eqz v0, :cond_0

    aput p1, v0, p0

    :cond_0
    return-void
.end method

.method public static setFileDownloaded(IF)V
    .locals 1

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileDownloaded:[F

    if-eqz v0, :cond_0

    aput p1, v0, p0

    :cond_0
    return-void
.end method

.method public static setFileSize(IF)V
    .locals 1

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileSize:[F

    if-eqz v0, :cond_0

    aput p1, v0, p0

    :cond_0
    return-void
.end method

.method public static show(Landroid/app/Activity;)V
    .locals 7

    sget-boolean v0, Lio/kamihama/magianative/CNCNDownloadUI;->isShowing:Z

    if-nez v0, :cond_1

    :try_start_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->uiHandler:Landroid/os/Handler;

    new-instance v0, Lio/kamihama/magianative/CNCNDownloadUI$CreateUIRunnable;

    invoke-direct {v0, p0}, Lio/kamihama/magianative/CNCNDownloadUI$CreateUIRunnable;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    const/4 v1, 0x0

    const/16 v2, 0x1e

    :goto_0
    sget-object v3, Lio/kamihama/magianative/CNCNDownloadUI;->tvLog:Landroid/widget/TextView;

    if-nez v3, :cond_0

    if-ge v1, v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    const-wide/16 v4, 0x64
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_0
    :try_start_2
    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lio/kamihama/magianative/CNCNDownloadUI;->isShowing:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :cond_1
    return-void

    :catch_1
    move-exception v0

    const-string v1, "MagiaClientJNI"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static throttledUpdate()V
    .locals 6

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->uiHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v4, Lio/kamihama/magianative/CNCNDownloadUI;->lastUpdateTime:J

    sub-long v2, v2, v4

    const-wide/16 v4, 0x1f4

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sput-wide v2, Lio/kamihama/magianative/CNCNDownloadUI;->lastUpdateTime:J

    new-instance v1, Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;

    invoke-direct {v1}, Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public static updateFileProgress(II)V
    .locals 2

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileProgress:[I

    if-eqz v0, :cond_0

    aput p1, v0, p0

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileStatus:[I

    if-eqz v0, :cond_0

    aget v1, v0, p0

    const/4 v0, 0x2

    if-eq v1, v0, :cond_0

    const/4 v0, 0x1

    sget-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->fileStatus:[I

    aput v0, v1, p0

    :cond_0
    invoke-static {}, Lio/kamihama/magianative/CNCNDownloadUI;->throttledUpdate()V

    return-void
.end method

.method public static updateSimple(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->uiHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v1, Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;

    invoke-direct {v1}, Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
