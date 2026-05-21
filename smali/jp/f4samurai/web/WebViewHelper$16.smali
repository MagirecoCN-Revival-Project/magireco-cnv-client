.class Ljp/f4samurai/web/WebViewHelper$16;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->_didFailLoading(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$code:I

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 173
    iput-object p1, p0, Ljp/f4samurai/web/WebViewHelper$16;->val$url:Ljava/lang/String;

    iput p2, p0, Ljp/f4samurai/web/WebViewHelper$16;->val$code:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 176
    iget-object v0, p0, Ljp/f4samurai/web/WebViewHelper$16;->val$url:Ljava/lang/String;

    iget v1, p0, Ljp/f4samurai/web/WebViewHelper$16;->val$code:I

    invoke-static {v0, v1}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$smdidFailLoading(Ljava/lang/String;I)V

    return-void
.end method
