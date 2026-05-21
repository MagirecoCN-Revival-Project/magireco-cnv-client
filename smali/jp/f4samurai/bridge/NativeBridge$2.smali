.class Ljp/f4samurai/bridge/NativeBridge$2;
.super Ljava/lang/Object;
.source "NativeBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/bridge/NativeBridge;->setBacktraceLog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 123
    iput-object p1, p0, Ljp/f4samurai/bridge/NativeBridge$2;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 126
    iget-object v0, p0, Ljp/f4samurai/bridge/NativeBridge$2;->val$message:Ljava/lang/String;

    invoke-static {v0}, Ljp/f4samurai/backtrace/BacktraceHandler;->setLog(Ljava/lang/String;)V

    return-void
.end method
