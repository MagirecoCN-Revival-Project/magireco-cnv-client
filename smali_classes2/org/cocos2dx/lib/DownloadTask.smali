.class Lorg/cocos2dx/lib/DownloadTask;
.super Ljava/lang/Object;
.source "Cocos2dxDownloader.java"


# instance fields
.field bytesReceived:J

.field data:[B

.field handle:Lcom/loopj/android/http/RequestHandle;

.field handler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

.field totalBytesExpected:J

.field totalBytesReceived:J


# direct methods
.method constructor <init>()V
    .locals 1

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 228
    iput-object v0, p0, Lorg/cocos2dx/lib/DownloadTask;->handle:Lcom/loopj/android/http/RequestHandle;

    .line 229
    iput-object v0, p0, Lorg/cocos2dx/lib/DownloadTask;->handler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    .line 230
    invoke-virtual {p0}, Lorg/cocos2dx/lib/DownloadTask;->resetStatus()V

    return-void
.end method


# virtual methods
.method resetStatus()V
    .locals 2

    const-wide/16 v0, 0x0

    .line 234
    iput-wide v0, p0, Lorg/cocos2dx/lib/DownloadTask;->bytesReceived:J

    .line 235
    iput-wide v0, p0, Lorg/cocos2dx/lib/DownloadTask;->totalBytesReceived:J

    .line 236
    iput-wide v0, p0, Lorg/cocos2dx/lib/DownloadTask;->totalBytesExpected:J

    const/4 v0, 0x0

    .line 237
    iput-object v0, p0, Lorg/cocos2dx/lib/DownloadTask;->data:[B

    return-void
.end method
