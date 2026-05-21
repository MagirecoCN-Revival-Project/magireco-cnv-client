.class Ljp/f4samurai/web/WebViewHelper$6;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->stopLoading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 77
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    invoke-virtual {v0}, Ljp/f4samurai/web/WebViewImpl;->stopLoading()V

    return-void
.end method
