.class Ljp/f4samurai/bridge/CheatHandler$1;
.super Ljava/lang/Object;
.source "CheatHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/bridge/CheatHandler;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/bridge/CheatHandler;


# direct methods
.method constructor <init>(Ljp/f4samurai/bridge/CheatHandler;)V
    .locals 0

    .line 28
    iput-object p1, p0, Ljp/f4samurai/bridge/CheatHandler$1;->this$0:Ljp/f4samurai/bridge/CheatHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 31
    iget-object p1, p0, Ljp/f4samurai/bridge/CheatHandler$1;->this$0:Ljp/f4samurai/bridge/CheatHandler;

    invoke-static {p1}, Ljp/f4samurai/bridge/CheatHandler;->-$$Nest$mcloseApplication(Ljp/f4samurai/bridge/CheatHandler;)V

    return-void
.end method
