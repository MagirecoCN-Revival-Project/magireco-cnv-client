.class public Ljp/f4samurai/web/WebViewHelper;
.super Ljava/lang/Object;
.source "WebViewHelper.java"


# static fields
.field private static sAppActivity:Ljp/f4samurai/AppActivity;

.field private static sFrameLayout:Landroid/widget/FrameLayout;

.field private static sHeader:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sWebView:Ljp/f4samurai/web/WebViewImpl;


# direct methods
.method static bridge synthetic -$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;
    .locals 1

    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsFrameLayout()Landroid/widget/FrameLayout;
    .locals 1

    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sFrameLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsHeader()Ljava/util/Map;
    .locals 1

    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sHeader:Ljava/util/Map;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;
    .locals 1

    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sWebView:Ljp/f4samurai/web/WebViewImpl;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputsHeader(Ljava/util/Map;)V
    .locals 0

    sput-object p0, Ljp/f4samurai/web/WebViewHelper;->sHeader:Ljava/util/Map;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputsWebView(Ljp/f4samurai/web/WebViewImpl;)V
    .locals 0

    sput-object p0, Ljp/f4samurai/web/WebViewHelper;->sWebView:Ljp/f4samurai/web/WebViewImpl;

    return-void
.end method

.method static bridge synthetic -$$Nest$smdidFailLoading(Ljava/lang/String;I)V
    .locals 0

    invoke-static {p0, p1}, Ljp/f4samurai/web/WebViewHelper;->didFailLoading(Ljava/lang/String;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdidFinishLoading(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Ljp/f4samurai/web/WebViewHelper;->didFinishLoading(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smonJsCallback(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Ljp/f4samurai/web/WebViewHelper;->onJsCallback(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljp/f4samurai/AppActivity;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    sput-object p1, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    .line 21
    sput-object p2, Ljp/f4samurai/web/WebViewHelper;->sFrameLayout:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static _didFailLoading(Ljava/lang/String;I)V
    .locals 2

    .line 173
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$16;

    invoke-direct {v1, p0, p1}, Ljp/f4samurai/web/WebViewHelper$16;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static _didFinishLoading(Ljava/lang/String;)V
    .locals 2

    .line 162
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$15;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$15;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static _onJsCallback(Ljava/lang/String;)V
    .locals 2

    .line 184
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$17;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$17;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static _shouldStartLoading(Ljava/lang/String;)Z
    .locals 0

    .line 156
    invoke-static {p0}, Ljp/f4samurai/web/WebViewHelper;->shouldStartLoading(Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 146
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$14;

    invoke-direct {v1, p0, p1}, Ljp/f4samurai/web/WebViewHelper$14;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 104
    sget-object p0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance p1, Ljp/f4samurai/web/WebViewHelper$9;

    invoke-direct {p1}, Ljp/f4samurai/web/WebViewHelper$9;-><init>()V

    invoke-virtual {p0, p1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static clearCache(Z)V
    .locals 2

    .line 137
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$13;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$13;-><init>(Z)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static createWebView()V
    .locals 2

    .line 25
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$1;

    invoke-direct {v1}, Ljp/f4samurai/web/WebViewHelper$1;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static native didFailLoading(Ljava/lang/String;I)V
.end method

.method private static native didFinishLoading(Ljava/lang/String;)V
.end method

.method public static evaluateJS(Ljava/lang/String;)V
    .locals 2

    .line 92
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$8;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$8;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static loadFile(Ljava/lang/String;)V
    .locals 2

    .line 66
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$5;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$5;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static loadHtmlString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 83
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$7;

    invoke-direct {v1, p1, p0}, Ljp/f4samurai/web/WebViewHelper$7;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static loadUrl(Ljava/lang/String;)V
    .locals 2

    .line 58
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$4;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$4;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static native onJsCallback(Ljava/lang/String;)V
.end method

.method public static removeWebView()V
    .locals 2

    .line 40
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$2;

    invoke-direct {v1}, Ljp/f4samurai/web/WebViewHelper$2;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 112
    sget-object p0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance p1, Ljp/f4samurai/web/WebViewHelper$10;

    invoke-direct {p1}, Ljp/f4samurai/web/WebViewHelper$10;-><init>()V

    invoke-virtual {p0, p1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setTouchEnable(Z)V
    .locals 2

    .line 50
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$3;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$3;-><init>(Z)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setVisible(Z)V
    .locals 2

    .line 127
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$12;

    invoke-direct {v1, p0}, Ljp/f4samurai/web/WebViewHelper$12;-><init>(Z)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setWebViewRect(IIII)V
    .locals 2

    .line 119
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$11;

    invoke-direct {v1, p0, p1, p2, p3}, Ljp/f4samurai/web/WebViewHelper$11;-><init>(IIII)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static native shouldStartLoading(Ljava/lang/String;)Z
.end method

.method public static stopLoading()V
    .locals 2

    .line 74
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/web/WebViewHelper$6;

    invoke-direct {v1}, Ljp/f4samurai/web/WebViewHelper$6;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 1

    .line 212
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sWebView:Ljp/f4samurai/web/WebViewImpl;

    if-eqz v0, :cond_0

    .line 213
    invoke-virtual {v0}, Ljp/f4samurai/web/WebViewImpl;->destroy()V

    :cond_0
    return-void
.end method

.method public onKeyDown()Z
    .locals 2

    .line 194
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sWebView:Ljp/f4samurai/web/WebViewImpl;

    invoke-virtual {v0}, Ljp/f4samurai/web/WebViewImpl;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    const-string v1, "androidBackKey();"

    .line 196
    invoke-static {v1}, Ljp/f4samurai/web/WebViewHelper;->evaluateJS(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onPause()V
    .locals 1

    .line 202
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sWebView:Ljp/f4samurai/web/WebViewImpl;

    if-eqz v0, :cond_0

    .line 203
    invoke-virtual {v0}, Ljp/f4samurai/web/WebViewImpl;->pauseTimers()V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 207
    sget-object v0, Ljp/f4samurai/web/WebViewHelper;->sWebView:Ljp/f4samurai/web/WebViewImpl;

    if-eqz v0, :cond_0

    .line 208
    invoke-virtual {v0}, Ljp/f4samurai/web/WebViewImpl;->resumeTimers()V

    :cond_0
    return-void
.end method
