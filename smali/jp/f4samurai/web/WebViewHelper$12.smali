.class Ljp/f4samurai/web/WebViewHelper$12;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->setVisible(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$visible:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .line 127
    iput-boolean p1, p0, Ljp/f4samurai/web/WebViewHelper$12;->val$visible:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 130
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsWebView()Ljp/f4samurai/web/WebViewImpl;

    move-result-object v0

    iget-boolean v1, p0, Ljp/f4samurai/web/WebViewHelper$12;->val$visible:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Ljp/f4samurai/web/WebViewImpl;->setVisibility(I)V

    return-void
.end method
