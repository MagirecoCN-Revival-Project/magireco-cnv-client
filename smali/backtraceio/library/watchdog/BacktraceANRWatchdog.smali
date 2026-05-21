.class public Lbacktraceio/library/watchdog/BacktraceANRWatchdog;
.super Ljava/lang/Thread;
.source "BacktraceANRWatchdog.java"


# static fields
.field private static final transient DEFAULT_ANR_TIMEOUT:I = 0x1388

.field private static final transient LOG_TAG:Ljava/lang/String; = "BacktraceANRWatchdog"


# instance fields
.field private final backtraceClient:Lbacktraceio/library/BacktraceClient;

.field private final debug:Z

.field private final mainThreadHandler:Landroid/os/Handler;

.field private onApplicationNotRespondingEvent:Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;

.field private volatile shouldStop:Z

.field private final timeout:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lbacktraceio/library/BacktraceClient;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "client"
        }
    .end annotation

    const/16 v0, 0x1388

    .line 62
    invoke-direct {p0, p1, v0}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;-><init>(Lbacktraceio/library/BacktraceClient;I)V

    return-void
.end method

.method public constructor <init>(Lbacktraceio/library/BacktraceClient;I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "client",
            "timeout"
        }
    .end annotation

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, p2, v0}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;-><init>(Lbacktraceio/library/BacktraceClient;IZ)V

    return-void
.end method

.method public constructor <init>(Lbacktraceio/library/BacktraceClient;IZ)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "client",
            "timeout",
            "debug"
        }
    .end annotation

    .line 82
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 39
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->mainThreadHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 54
    iput-boolean v0, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->shouldStop:Z

    .line 83
    sget-object v0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Start monitoring ANR"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    iput-object p1, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->backtraceClient:Lbacktraceio/library/BacktraceClient;

    .line 85
    iput p2, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->timeout:I

    .line 86
    iput-boolean p3, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->debug:Z

    .line 87
    invoke-virtual {p0}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->start()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 100
    iget-boolean v0, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->debug:Z

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/Debug;->waitingForDebugger()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 101
    :cond_0
    sget-object v0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Detected a debugger connection. ANR Watchdog is disabled"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 105
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 106
    :goto_0
    iget-boolean v2, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->shouldStop:Z

    if-nez v2, :cond_4

    invoke-virtual {p0}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_4

    .line 107
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v2

    .line 108
    sget-object v3, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ANR WATCHDOG - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    new-instance v2, Lbacktraceio/library/watchdog/BacktraceThreadWatcher;

    invoke-direct {v2, v0, v0}, Lbacktraceio/library/watchdog/BacktraceThreadWatcher;-><init>(II)V

    .line 110
    iget-object v4, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->mainThreadHandler:Landroid/os/Handler;

    new-instance v5, Lbacktraceio/library/watchdog/BacktraceANRWatchdog$1;

    invoke-direct {v5, p0, v2}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog$1;-><init>(Lbacktraceio/library/watchdog/BacktraceANRWatchdog;Lbacktraceio/library/watchdog/BacktraceThreadWatcher;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 117
    :try_start_0
    iget v4, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->timeout:I

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    invoke-virtual {v2}, Lbacktraceio/library/watchdog/BacktraceThreadWatcher;->tickPrivateCounter()V

    .line 124
    invoke-virtual {v2}, Lbacktraceio/library/watchdog/BacktraceThreadWatcher;->getCounter()I

    move-result v4

    invoke-virtual {v2}, Lbacktraceio/library/watchdog/BacktraceThreadWatcher;->getPrivateCounter()I

    move-result v2

    if-ne v4, v2, :cond_2

    .line 125
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "ANR is not detected"

    .line 126
    invoke-static {v3, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 130
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x1

    .line 134
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 135
    iget-object v2, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->backtraceClient:Lbacktraceio/library/BacktraceClient;

    .line 136
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v4

    iget-object v5, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->onApplicationNotRespondingEvent:Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;

    .line 135
    invoke-static {v2, v4, v5, v3}, Lbacktraceio/library/watchdog/BacktraceWatchdogShared;->sendReportCauseBlockedThread(Lbacktraceio/library/BacktraceClient;Ljava/lang/Thread;Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;Ljava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception v0

    .line 119
    sget-object v1, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Thread is interrupted"

    invoke-static {v1, v2, v0}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    return-void
.end method

.method public setOnApplicationNotRespondingEvent(Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "onApplicationNotRespondingEvent"
        }
    .end annotation

    .line 92
    iput-object p1, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->onApplicationNotRespondingEvent:Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;

    return-void
.end method

.method public stopMonitoringAnr()V
    .locals 2

    .line 141
    sget-object v0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Stop monitoring ANR"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    .line 142
    iput-boolean v0, p0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->shouldStop:Z

    return-void
.end method
