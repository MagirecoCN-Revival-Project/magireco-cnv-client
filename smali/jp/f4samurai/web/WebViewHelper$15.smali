.class Ljp/f4samurai/web/WebViewHelper$15;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->_didFinishLoading(Ljava/lang/String;)V
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

    .line 162
    iput-object p1, p0, Ljp/f4samurai/web/WebViewHelper$15;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 165
    iget-object v0, p0, Ljp/f4samurai/web/WebViewHelper$15;->val$url:Ljava/lang/String;

    invoke-static {v0}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$smdidFinishLoading(Ljava/lang/String;)V

    return-void
.end method
