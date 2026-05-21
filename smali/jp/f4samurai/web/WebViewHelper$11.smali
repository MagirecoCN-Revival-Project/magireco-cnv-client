.class Ljp/f4samurai/web/WebViewHelper$11;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->setWebViewRect(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$left:I

.field final synthetic val$maxHeight:I

.field final synthetic val$maxWidth:I

.field final synthetic val$top:I


# direct methods
.method constructor <init>(IIII)V
    .locals 0

    .line 119
    iput p1, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$left:I

    iput p2, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$top:I

    iput p3, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$maxWidth:I

    iput p4, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$maxHeight:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 122
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    iget v1, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$left:I

    iget v2, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$top:I

    iget v3, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$maxWidth:I

    iget v4, p0, Ljp/f4samurai/web/WebViewHelper$11;->val$maxHeight:I

    invoke-virtual {v0, v1, v2, v3, v4}, Ljp/f4samurai/web/WebViewImpl;->setWebViewRect(IIII)V

    return-void
.end method
