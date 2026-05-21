.class Ljp/f4samurai/web/ShouldStartLoadingWorker;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private mLatch:Ljava/util/concurrent/CountDownLatch;

.field private mResult:[Z

.field private final mUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/util/concurrent/CountDownLatch;[ZLjava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Ljp/f4samurai/web/ShouldStartLoadingWorker;->mLatch:Ljava/util/concurrent/CountDownLatch;

    .line 33
    iput-object p2, p0, Ljp/f4samurai/web/ShouldStartLoadingWorker;->mResult:[Z

    .line 34
    iput-object p3, p0, Ljp/f4samurai/web/ShouldStartLoadingWorker;->mUrl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 39
    iget-object v0, p0, Ljp/f4samurai/web/ShouldStartLoadingWorker;->mResult:[Z

    iget-object v1, p0, Ljp/f4samurai/web/ShouldStartLoadingWorker;->mUrl:Ljava/lang/String;

    invoke-static {v1}, Ljp/f4samurai/web/WebViewHelper;->_shouldStartLoading(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    aput-boolean v1, v0, v2

    .line 40
    iget-object v0, p0, Ljp/f4samurai/web/ShouldStartLoadingWorker;->mLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
