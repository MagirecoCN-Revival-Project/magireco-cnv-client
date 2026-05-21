.class Ljp/f4samurai/bridge/NativeBridge$4;
.super Ljava/lang/Object;
.source "NativeBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/bridge/NativeBridge;->preventScreenLock(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$shouldPrevent:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .line 162
    iput-boolean p1, p0, Ljp/f4samurai/bridge/NativeBridge$4;->val$shouldPrevent:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 165
    iget-boolean v0, p0, Ljp/f4samurai/bridge/NativeBridge$4;->val$shouldPrevent:Z

    const/16 v1, 0x80

    if-eqz v0, :cond_0

    .line 166
    invoke-static {}, Ljp/f4samurai/bridge/NativeBridge;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    .line 168
    :cond_0
    invoke-static {}, Ljp/f4samurai/bridge/NativeBridge;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    :goto_0
    return-void
.end method
