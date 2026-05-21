.class public Lio/kamihama/magianative/RestClient$DownloadRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/kamihama/magianative/RestClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DownloadRunnable"
.end annotation


# instance fields
.field private final destPath:Ljava/lang/String;

.field private final displayName:Ljava/lang/String;

.field private final fileIndex:I

.field public result:Z

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->url:Ljava/lang/String;

    iput-object p2, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->destPath:Ljava/lang/String;

    iput-object p3, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->displayName:Ljava/lang/String;

    iput p4, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->fileIndex:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->result:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->url:Ljava/lang/String;

    iget-object v1, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->destPath:Ljava/lang/String;

    iget-object v2, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->displayName:Ljava/lang/String;

    iget v3, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->fileIndex:I

    invoke-static {v0, v1, v2, v3}, Lio/kamihama/magianative/RestClient;->cnDownloadFileFull(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v4

    iput-boolean v4, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->result:Z

    if-eqz v4, :cond_0

    iget-object v0, p0, Lio/kamihama/magianative/RestClient$DownloadRunnable;->destPath:Ljava/lang/String;

    const-string v1, "/data/data/io.kamihama.totentanz/files/"

    new-instance v2, Lio/kamihama/magianative/RestClient$UnzipRunnable;

    const/4 v4, 0x1

    invoke-direct {v2, v0, v1, v3, v4}, Lio/kamihama/magianative/RestClient$UnzipRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;IZ)V

    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    :cond_0
    return-void
.end method
