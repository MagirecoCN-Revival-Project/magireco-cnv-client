.class Ljp/f4samurai/bridge/NativeBridge$3;
.super Ljava/lang/Object;
.source "NativeBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/bridge/NativeBridge;->setBacktraceLogData(Ljava/lang/String;Ljava/lang/String;)V
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

    .line 132
    iput-object p1, p0, Ljp/f4samurai/bridge/NativeBridge$3;->val$key:Ljava/lang/String;

    iput-object p2, p0, Ljp/f4samurai/bridge/NativeBridge$3;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 135
    iget-object v0, p0, Ljp/f4samurai/bridge/NativeBridge$3;->val$key:Ljava/lang/String;

    iget-object v1, p0, Ljp/f4samurai/bridge/NativeBridge$3;->val$value:Ljava/lang/String;

    invoke-static {v0, v1}, Ljp/f4samurai/backtrace/BacktraceHandler;->setLogData(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
