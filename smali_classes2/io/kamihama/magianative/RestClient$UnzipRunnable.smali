.class public Lio/kamihama/magianative/RestClient$UnzipRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/kamihama/magianative/RestClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UnzipRunnable"
.end annotation


# instance fields
.field private final deleteAfterUnzip:Z

.field private final destPath:Ljava/lang/String;

.field private final fileIndex:I

.field private final zipPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->zipPath:Ljava/lang/String;

    iput-object p2, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->destPath:Ljava/lang/String;

    iput p3, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->fileIndex:I

    iput-boolean p4, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->deleteAfterUnzip:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->zipPath:Ljava/lang/String;

    iget-object v1, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->destPath:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u23f3 \u89e3\u538b\u4e2d: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u23f3 \u6b63\u5728\u89e3\u538b..."

    const/16 v1, 0x50

    invoke-static {v3, v2, v1}, Lio/kamihama/magianative/CNCNDownloadUI;->updateSimple(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->zipPath:Ljava/lang/String;

    iget-object v1, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->destPath:Ljava/lang/String;

    invoke-static {v0, v1}, Lio/kamihama/magianative/RestClient;->unzip(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v1, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->deleteAfterUnzip:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    iget-object v0, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->zipPath:Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    iget v0, p0, Lio/kamihama/magianative/RestClient$UnzipRunnable;->fileIndex:I

    invoke-static {v0}, Lio/kamihama/magianative/CNCNDownloadUI;->markFileDone(I)V

    return-void
.end method
