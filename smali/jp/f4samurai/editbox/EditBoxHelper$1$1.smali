.class Ljp/f4samurai/editbox/EditBoxHelper$1$1;
.super Ljava/lang/Object;
.source "EditBoxHelper.java"

# interfaces
.implements Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/editbox/EditBoxHelper$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/editbox/EditBoxHelper$1;


# direct methods
.method constructor <init>(Ljp/f4samurai/editbox/EditBoxHelper$1;)V
    .locals 0

    .line 50
    iput-object p1, p0, Ljp/f4samurai/editbox/EditBoxHelper$1$1;->this$0:Ljp/f4samurai/editbox/EditBoxHelper$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResizeWindow(I)V
    .locals 2

    .line 53
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmKeyboardLayout()Ljp/f4samurai/editbox/KeyboardLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, p1}, Ljp/f4samurai/editbox/KeyboardLayout;->setPadding(IIII)V

    return-void
.end method
