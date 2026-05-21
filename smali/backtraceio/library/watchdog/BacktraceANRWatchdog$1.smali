.class Lbacktraceio/library/watchdog/BacktraceANRWatchdog$1;
.super Ljava/lang/Object;
.source "BacktraceANRWatchdog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

.field final synthetic val$threadWatcher:Lbacktraceio/library/watchdog/BacktraceThreadWatcher;


# direct methods
.method constructor <init>(Lbacktraceio/library/watchdog/BacktraceANRWatchdog;Lbacktraceio/library/watchdog/BacktraceThreadWatcher;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$threadWatcher"
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog$1;->this$0:Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

    iput-object p2, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog$1;->val$threadWatcher:Lbacktraceio/library/watchdog/BacktraceThreadWatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 113
    iget-object v0, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog$1;->val$threadWatcher:Lbacktraceio/library/watchdog/BacktraceThreadWatcher;

    invoke-virtual {v0}, Lbacktraceio/library/watchdog/BacktraceThreadWatcher;->tickCounter()V

    return-void
.end method
