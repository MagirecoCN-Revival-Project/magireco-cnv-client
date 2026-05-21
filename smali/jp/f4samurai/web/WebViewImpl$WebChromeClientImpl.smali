.class Ljp/f4samurai/web/WebViewImpl$WebChromeClientImpl;
.super Landroid/webkit/WebChromeClient;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/web/WebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebChromeClientImpl"
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/web/WebViewImpl;


# direct methods
.method private constructor <init>(Ljp/f4samurai/web/WebViewImpl;)V
    .locals 0

    .line 172
    iput-object p1, p0, Ljp/f4samurai/web/WebViewImpl$WebChromeClientImpl;->this$0:Ljp/f4samurai/web/WebViewImpl;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljp/f4samurai/web/WebViewImpl;Ljp/f4samurai/web/WebViewImpl$WebChromeClientImpl-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Ljp/f4samurai/web/WebViewImpl$WebChromeClientImpl;-><init>(Ljp/f4samurai/web/WebViewImpl;)V

    return-void
.end method


# virtual methods
.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    if-nez p3, :cond_0

    .line 176
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p1

    return p1

    :cond_0
    const-string v0, "game"

    .line 179
    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 180
    invoke-static {p3}, Ljp/f4samurai/web/WebViewHelper;->_onJsCallback(Ljava/lang/String;)V

    .line 181
    invoke-virtual {p4}, Landroid/webkit/JsResult;->cancel()V

    const/4 p1, 0x1

    return p1

    .line 184
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p1

    return p1
.end method
