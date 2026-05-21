.class Ljp/f4samurai/web/WebViewHelper$1;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->createWebView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 27
    new-instance v0, Ljp/f4samurai/web/WebViewImpl;

    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Ljp/f4samurai/web/WebViewImpl;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfputsWebView(Ljp/f4samurai/web/WebViewImpl;)V

    .line 28
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    const-string v1, "WebView"

    invoke-virtual {v0, v1}, Ljp/f4samurai/web/WebViewImpl;->setTag(Ljava/lang/Object;)V

    .line 29
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 33
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsFrameLayout()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfputsHeader(Ljava/util/Map;)V

    return-void
.end method
