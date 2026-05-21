.class Lorg/cocos2dx/lib/DataTaskHandler;
.super Lcom/loopj/android/http/BinaryHttpResponseHandler;
.source "Cocos2dxDownloader.java"


# instance fields
.field private _downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

.field _id:I

.field private _lastBytesWritten:J


# direct methods
.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxDownloader;I)V
    .locals 1

    const-string v0, ".*"

    .line 53
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/loopj/android/http/BinaryHttpResponseHandler;-><init>([Ljava/lang/String;)V

    .line 54
    iput-object p1, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    .line 55
    iput p2, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_id:I

    const-wide/16 p1, 0x0

    .line 56
    iput-wide p1, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_lastBytesWritten:J

    return-void
.end method


# virtual methods
.method LogD(Ljava/lang/String;)V
    .locals 1

    const-string v0, "Cocos2dxDownloader"

    .line 49
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onFailure(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V
    .locals 1

    .line 76
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onFailure(i:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " headers:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " throwable:"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lorg/cocos2dx/lib/DataTaskHandler;->LogD(Ljava/lang/String;)V

    if-eqz p4, :cond_0

    .line 79
    invoke-virtual {p4}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const-string p2, ""

    .line 81
    :goto_0
    iget-object p3, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget p4, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_id:I

    const/4 v0, 0x0

    invoke-virtual {p3, p4, p1, p2, v0}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onFinish(IILjava/lang/String;[B)V

    return-void
.end method

.method public onFinish()V
    .locals 1

    .line 93
    iget-object v0, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->runNextTaskIfExists()V

    return-void
.end method

.method public onProgress(JJ)V
    .locals 10

    .line 62
    iget-wide v0, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_lastBytesWritten:J

    sub-long v4, p1, v0

    .line 65
    iget-object v2, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget v3, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_id:I

    move-wide v6, p1

    move-wide v8, p3

    invoke-virtual/range {v2 .. v9}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onProgress(IJJJ)V

    .line 66
    iput-wide p1, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_lastBytesWritten:J

    return-void
.end method

.method public onStart()V
    .locals 2

    .line 71
    iget-object v0, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget v1, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_id:I

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onStart(I)V

    return-void
.end method

.method public onSuccess(I[Lcz/msebera/android/httpclient/Header;[B)V
    .locals 2

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSuccess(i:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " headers:"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/cocos2dx/lib/DataTaskHandler;->LogD(Ljava/lang/String;)V

    .line 87
    iget-object p1, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget p2, p0, Lorg/cocos2dx/lib/DataTaskHandler;->_id:I

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1, p3}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onFinish(IILjava/lang/String;[B)V

    return-void
.end method
