.class Lorg/cocos2dx/lib/FileTaskHandler;
.super Lcom/loopj/android/http/FileAsyncHttpResponseHandler;
.source "Cocos2dxDownloader.java"


# instance fields
.field private _downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

.field _finalFile:Ljava/io/File;

.field _id:I

.field private _initFileLen:J

.field private _lastBytesWritten:J


# direct methods
.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxDownloader;ILjava/io/File;Ljava/io/File;)V
    .locals 1

    const/4 v0, 0x1

    .line 161
    invoke-direct {p0, p3, v0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;-><init>(Ljava/io/File;Z)V

    .line 162
    iput-object p4, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_finalFile:Ljava/io/File;

    .line 163
    iput-object p1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    .line 164
    iput p2, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_id:I

    .line 165
    invoke-virtual {p0}, Lorg/cocos2dx/lib/FileTaskHandler;->getTargetFile()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide p1

    iput-wide p1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_initFileLen:J

    const-wide/16 p1, 0x0

    .line 166
    iput-wide p1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_lastBytesWritten:J

    return-void
.end method


# virtual methods
.method LogD(Ljava/lang/String;)V
    .locals 1

    const-string v0, "Cocos2dxDownloader"

    .line 157
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onFailure(I[Lcz/msebera/android/httpclient/Header;Ljava/lang/Throwable;Ljava/io/File;)V
    .locals 2

    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onFailure(i:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " headers:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " throwable:"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " file:"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lorg/cocos2dx/lib/FileTaskHandler;->LogD(Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 195
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const-string p2, ""

    .line 197
    :goto_0
    iget-object p3, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget p4, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_id:I

    const/4 v0, 0x0

    invoke-virtual {p3, p4, p1, p2, v0}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onFinish(IILjava/lang/String;[B)V

    return-void
.end method

.method public onFinish()V
    .locals 1

    .line 187
    iget-object v0, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->runNextTaskIfExists()V

    return-void
.end method

.method public onProgress(JJ)V
    .locals 10

    .line 172
    iget-wide v0, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_lastBytesWritten:J

    sub-long v4, p1, v0

    .line 173
    iget-wide v0, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_initFileLen:J

    add-long v6, p1, v0

    add-long v8, p3, v0

    .line 175
    iget-object v2, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget v3, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_id:I

    invoke-virtual/range {v2 .. v9}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onProgress(IJJJ)V

    .line 176
    iput-wide p1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_lastBytesWritten:J

    return-void
.end method

.method public onStart()V
    .locals 2

    .line 181
    iget-object v0, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget v1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_id:I

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onStart(I)V

    return-void
.end method

.method public onSuccess(I[Lcz/msebera/android/httpclient/Header;Ljava/io/File;)V
    .locals 2

    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSuccess(i:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " headers:"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " file:"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/cocos2dx/lib/FileTaskHandler;->LogD(Ljava/lang/String;)V

    .line 207
    iget-object p1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_finalFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 208
    iget-object p1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_finalFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 209
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Dest file is directory:"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_finalFile:Ljava/io/File;

    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 212
    :cond_0
    iget-object p1, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_finalFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_1

    .line 213
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Can\'t remove old file:"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_finalFile:Ljava/io/File;

    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 218
    :cond_1
    invoke-virtual {p0}, Lorg/cocos2dx/lib/FileTaskHandler;->getTargetFile()Ljava/io/File;

    move-result-object p1

    .line 219
    iget-object p3, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_finalFile:Ljava/io/File;

    invoke-virtual {p1, p3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-object p1, p2

    .line 221
    :goto_0
    iget-object p3, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget v0, p0, Lorg/cocos2dx/lib/FileTaskHandler;->_id:I

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onFinish(IILjava/lang/String;[B)V

    return-void
.end method
