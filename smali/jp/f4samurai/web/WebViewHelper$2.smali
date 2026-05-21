.class Ljp/f4samurai/web/WebViewHelper$2;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->removeWebView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 42
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsFrameLayout()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 43
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    invoke-virtual {v0}, Ljp/f4samurai/web/WebViewImpl;->destroy()V

    const/4 v0, 0x0

    .line 44
    invoke-static {v0}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfputsWebView(Ljp/f4samurai/web/WebViewImpl;)V

    return-void
.end method
