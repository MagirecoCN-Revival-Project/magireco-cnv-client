.class Ljp/f4samurai/web/WebViewHelper$4;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->loadUrl(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 58
    iput-object p1, p0, Ljp/f4samurai/web/WebViewHelper$4;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 60
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    iget-object v1, p0, Ljp/f4samurai/web/WebViewHelper$4;->val$url:Ljava/lang/String;

    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsHeader()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljp/f4samurai/web/WebViewImpl;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
