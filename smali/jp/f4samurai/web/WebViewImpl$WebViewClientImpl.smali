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

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljp/f4samurai/web/WebViewImpl$WebViewClientImpl;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    return-object v0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 8

    const-string v0, "MagiaHook-URL"

    invoke-static {v0, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "/magica/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/16 v2, 0x8

    add-int/2addr v1, v2

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :cond_0
    const-string v2, "api/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_1

    :cond_1
    const-string v2, "/data/data/io.kamihama.totentanz/files/magica/"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MagiaHook-Path"

    invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_9

    const-string v4, "MagiaHook-Found"

    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "application/octet-stream"

    const-string v5, ".png"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v4, "image/png"

    goto :goto_0

    :cond_2
    const-string v5, ".jpg"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v4, "image/jpeg"

    goto :goto_0

    :cond_3
    const-string v5, ".jpeg"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v4, "image/jpeg"

    goto :goto_0

    :cond_4
    const-string v5, ".json"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v4, "application/json"

    goto :goto_0

    :cond_5
    const-string v5, ".js"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v4, "application/javascript"

    goto :goto_0

    :cond_6
    const-string v5, ".css"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v4, "text/css"

    goto :goto_0

    :cond_7
    const-string v5, ".html"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    const-string v4, "text/html"

    :cond_8
    :goto_0
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance v6, Landroid/webkit/WebResourceResponse;

    const-string v7, "utf-8"

    invoke-direct {v6, v4, v7, v5}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    return-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v5

    const-string v6, "MagiaHook-Err"

    invoke-virtual {v5}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    :goto_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
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
