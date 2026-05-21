.class Ljp/f4samurai/web/WebViewHelper$3;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->setTouchEnable(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$enable:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .line 50
    iput-boolean p1, p0, Ljp/f4samurai/web/WebViewHelper$3;->val$enable:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 52
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    iget-boolean v1, p0, Ljp/f4samurai/web/WebViewHelper$3;->val$enable:Z

    invoke-virtual {v0, v1}, Ljp/f4samurai/web/WebViewImpl;->setTouchEnable(Z)V

    return-void
.end method
