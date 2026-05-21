.class Lorg/cocos2dx/lib/HeadTaskHandler;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "Cocos2dxDownloader.java"


# instance fields
.field private _downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

.field _host:Ljava/lang/String;

.field _id:I

.field _path:Ljava/lang/String;

.field _url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxDownloader;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 109
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    .line 110
    iput-object p1, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    .line 111
    iput p2, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_id:I

    .line 112
    iput-object p3, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_host:Ljava/lang/String;

    .line 113
    iput-object p4, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_url:Ljava/lang/String;

    .line 114
    iput-object p5, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_path:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method LogD(Ljava/lang/String;)V
    .locals 1

    const-string v0, "Cocos2dxDownloader"

    .line 105
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onFailure(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V
    .locals 1

    .line 139
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onFailure(code:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " headers:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " throwable:"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " id:"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_id:I

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lorg/cocos2dx/lib/HeadTaskHandler;->LogD(Ljava/lang/String;)V

    if-eqz p4, :cond_0

    .line 142
    invoke-virtual {p4}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const-string p2, ""

    .line 144
    :goto_0
    iget-object p3, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget p4, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_id:I

    const/4 v0, 0x0

    invoke-virtual {p3, p4, p1, p2, v0}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->onFinish(IILjava/lang/String;[B)V

    return-void
.end method

.method public onFinish()V
    .locals 1

    .line 134
    iget-object v0, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->runNextTaskIfExists()V

    return-void
.end method

.method public onSuccess(I[Lcz/msebera/android/httpclient/Header;[B)V
    .locals 3

    const/4 p1, 0x0

    .line 119
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    .line 120
    :goto_0
    array-length v0, p2

    if-ge p1, v0, :cond_1

    .line 121
    aget-object v0, p2, p1

    .line 122
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Accept-Ranges"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 123
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object p1

    const-string p2, "bytes"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 127
    :cond_1
    :goto_1
    iget-object p1, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_host:Ljava/lang/String;

    invoke-static {p1, p3}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->setResumingSupport(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 128
    iget-object p1, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_downloader:Lorg/cocos2dx/lib/Cocos2dxDownloader;

    iget p2, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_id:I

    iget-object p3, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_url:Ljava/lang/String;

    iget-object v0, p0, Lorg/cocos2dx/lib/HeadTaskHandler;->_path:Ljava/lang/String;

    invoke-static {p1, p2, p3, v0}, Lorg/cocos2dx/lib/Cocos2dxDownloader;->createTask(Lorg/cocos2dx/lib/Cocos2dxDownloader;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method
