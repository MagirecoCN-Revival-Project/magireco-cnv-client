.class public Lio/kamihama/magianative/CNCNDownloadUI$UpdateRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/kamihama/magianative/CNCNDownloadUI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UpdateRunnable"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    :try_start_0
    invoke-static {}, Lio/kamihama/magianative/CNCNDownloadUI;->buildStatusText()Ljava/lang/String;

    move-result-object v1

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->tvLog:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->fileProgress:[I

    if-eqz v0, :cond_2

    const/4 v3, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v4, 0xf

    if-ge v2, v4, :cond_1

    aget v4, v0, v2

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/16 v4, 0xf

    div-int v3, v3, v4

    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->progressBarOverall:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_2

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setProgress(I)V

    :cond_2
    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->tvSpeed:Landroid/widget/TextView;

    if-eqz v0, :cond_6

    sget-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->fileSpeed:[F

    if-eqz v1, :cond_6

    sget-object v3, Lio/kamihama/magianative/CNCNDownloadUI;->fileStatus:[I

    if-eqz v3, :cond_6

    const/4 v5, 0x0

    const/4 v2, 0x0

    :goto_1
    const/16 v4, 0xf

    if-ge v2, v4, :cond_4

    aget v4, v3, v2

    const/4 v6, 0x1

    if-ne v4, v6, :cond_3

    aget v6, v1, v2

    add-float/2addr v5, v6

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    invoke-static {v5}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-le v2, v3, :cond_5

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u6838\u5fc3\u5f00\u53d1: B\u7ad9 @MadeInMagius\u3010B\u7ad9xhs tx\u540c\u540d\u3011 | \u5982\u679c\u9700\u8981\u8054\u7cfb\u8bf7\u5148b\u7ad9\u79c1\u4fe1\uff0c\u4f1a\u63d0\u4f9b\u7fa4\u804a | \u8be5\u6e38\u620f\u652f\u6301\u540e\u7eed\u5267\u60c5\u66f4\u65b0 | "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " MB/s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_6
    return-void

    :catch_0
    move-exception v0

    return-void
.end method
