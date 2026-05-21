.class Ljp/f4samurai/web/WebViewImpl$Javascript;
.super Ljava/lang/Object;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/web/WebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Javascript"
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/web/WebViewImpl;


# direct methods
.method private constructor <init>(Ljp/f4samurai/web/WebViewImpl;)V
    .locals 0

    .line 163
    iput-object p1, p0, Ljp/f4samurai/web/WebViewImpl$Javascript;->this$0:Ljp/f4samurai/web/WebViewImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Ljp/f4samurai/web/WebViewImpl;Ljp/f4samurai/web/WebViewImpl$Javascript-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Ljp/f4samurai/web/WebViewImpl$Javascript;-><init>(Ljp/f4samurai/web/WebViewImpl;)V

    return-void
.end method


# virtual methods
.method public jsCallback(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v0, "game"

    .line 166
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    invoke-static {p1}, Ljp/f4samurai/web/WebViewHelper;->_onJsCallback(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
