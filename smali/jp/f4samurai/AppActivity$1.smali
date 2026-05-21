.class Ljp/f4samurai/AppActivity$1;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/AppActivity;->onWindowFocusChanged(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/AppActivity;


# direct methods
.method constructor <init>(Ljp/f4samurai/AppActivity;)V
    .locals 0

    .line 194
    iput-object p1, p0, Ljp/f4samurai/AppActivity$1;->this$0:Ljp/f4samurai/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 197
    iget-object v0, p0, Ljp/f4samurai/AppActivity$1;->this$0:Ljp/f4samurai/AppActivity;

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->hideNavigation()V

    return-void
.end method
