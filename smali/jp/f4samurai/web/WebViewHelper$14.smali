.class Ljp/f4samurai/web/WebViewHelper$14;
.super Ljava/lang/Object;
.source "WebViewHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/web/WebViewHelper;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 146
    iput-object p1, p0, Ljp/f4samurai/web/WebViewHelper$14;->val$key:Ljava/lang/String;

    iput-object p2, p0, Ljp/f4samurai/web/WebViewHelper$14;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 148
    invoke-static {}, Ljp/f4samurai/web/WebViewHelper;->-$$Nest$sfgetsHeader()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Ljp/f4samurai/web/WebViewHelper$14;->val$key:Ljava/lang/String;

    iget-object v2, p0, Ljp/f4samurai/web/WebViewHelper$14;->val$value:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
