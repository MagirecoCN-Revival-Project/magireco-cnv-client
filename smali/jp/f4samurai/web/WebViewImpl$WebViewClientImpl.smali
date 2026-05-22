.class Ljp/f4samurai/web/WebViewImpl$WebViewClientImpl;
.super Landroid/webkit/WebViewClient;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/web/WebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebViewClientImpl"
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/web/WebViewImpl;


# direct methods
.method private constructor <init>(Ljp/f4samurai/web/WebViewImpl;)V
    .locals 0

    .line 108
    iput-object p1, p0, Ljp/f4samurai/web/WebViewImpl$WebViewClientImpl;->this$0:Ljp/f4samurai/web/WebViewImpl;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljp/f4samurai/web/WebViewImpl;Ljp/f4samurai/web/WebViewImpl$WebViewClientImpl-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Ljp/f4samurai/web/WebViewImpl$WebViewClientImpl;-><init>(Ljp/f4samurai/web/WebViewImpl;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Lio/kamihama/magianative/WebViewInterceptor;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 141
    invoke-static {p2}, Ljp/f4samurai/web/WebViewHelper;->_didFinishLoading(Ljava/lang/String;)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 134
    invoke-virtual {p1}, Landroid/webkit/WebView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "game:LOAD_SHOW"

    .line 135
    invoke-static {p1}, Ljp/f4samurai/web/WebViewHelper;->_onJsCallback(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 146
    invoke-static {p4, p2}, Ljp/f4samurai/web/WebViewHelper;->_didFailLoading(Ljava/lang/String;I)V

    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 1

    invoke-static {p1, p2}, Lio/kamihama/magianative/WebViewInterceptor;->interceptFull(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 1

    invoke-static {p1, p2}, Lio/kamihama/magianative/WebViewInterceptor;->intercept(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 4

    const-string p1, "shouldUrlLoading"

    .line 111
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "game"

    .line 112
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 113
    invoke-static {p2}, Ljp/f4samurai/web/WebViewHelper;->_onJsCallback(Ljava/lang/String;)V

    return v0

    :cond_0
    new-array p1, v0, [Z

    const/4 v1, 0x0

    aput-boolean v0, p1, v1

    .line 118
    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v2, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 121
    invoke-static {}, Ljp/f4samurai/web/WebViewImpl;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    new-instance v3, Ljp/f4samurai/web/ShouldStartLoadingWorker;

    invoke-direct {v3, v2, p1, p2}, Ljp/f4samurai/web/ShouldStartLoadingWorker;-><init>(Ljava/util/concurrent/CountDownLatch;[ZLjava/lang/String;)V

    invoke-virtual {v0, v3}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 125
    :try_start_0
    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p2, "DEBUG"

    const-string v0, "\'shouldOverrideUrlLoading\' failed"

    .line 127
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    aget-boolean p1, p1, v1

    return p1
.end method
