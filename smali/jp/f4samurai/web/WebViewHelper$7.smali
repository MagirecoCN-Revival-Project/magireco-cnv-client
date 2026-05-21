.class Ljp/f4samurai/web/WebViewHelper$7;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->loadHtmlString(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$baseUrl:Ljava/lang/String;

.field final synthetic val$string:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 83
    iput-object p1, p0, Ljp/f4samurai/web/WebViewHelper$7;->val$baseUrl:Ljava/lang/String;

    iput-object p2, p0, Ljp/f4samurai/web/WebViewHelper$7;->val$string:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 86
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    iget-object v5, p0, Ljp/f4samurai/web/WebViewHelper$7;->val$baseUrl:Ljava/lang/String;

    iget-object v2, p0, Ljp/f4samurai/web/WebViewHelper$7;->val$string:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "UTF-8"

    move-object v1, v5

    invoke-virtual/range {v0 .. v5}, Ljp/f4samurai/web/WebViewImpl;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
