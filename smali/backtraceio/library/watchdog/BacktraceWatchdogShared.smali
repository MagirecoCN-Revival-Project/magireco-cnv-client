.class Lbacktraceio/library/watchdog/BacktraceWatchdogShared;
.super Ljava/lang/Object;
.source "BacktraceWatchdogShared.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static sendReportCauseBlockedThread(Lbacktraceio/library/BacktraceClient;Ljava/lang/Thread;Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "backtraceClient",
            "thread",
            "onApplicationNotRespondingEvent",
            "LOG_TAG"
        }
    .end annotation

    .line 25
    new-instance v0, Lbacktraceio/library/watchdog/BacktraceWatchdogTimeoutException;

    invoke-direct {v0}, Lbacktraceio/library/watchdog/BacktraceWatchdogTimeoutException;-><init>()V

    .line 26
    invoke-virtual {p1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    invoke-virtual {v0, p1}, Lbacktraceio/library/watchdog/BacktraceWatchdogTimeoutException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    const-string p1, "Blocked thread detected, sending a report"

    .line 27
    invoke-static {p3, p1, v0}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    if-eqz p2, :cond_0

    .line 29
    invoke-interface {p2, v0}, Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;->onEvent(Lbacktraceio/library/watchdog/BacktraceWatchdogTimeoutException;)V

    goto :goto_0

    :cond_0
    if-eqz p0, :cond_1

    .line 31
    new-instance p1, Lbacktraceio/library/models/json/BacktraceReport;

    new-instance p2, Lbacktraceio/library/watchdog/BacktraceWatchdogShared$1;

    invoke-direct {p2}, Lbacktraceio/library/watchdog/BacktraceWatchdogShared$1;-><init>()V

    invoke-direct {p1, v0, p2}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;)V

    .line 34
    invoke-virtual {p0, p1}, Lbacktraceio/library/BacktraceClient;->send(Lbacktraceio/library/models/json/BacktraceReport;)V

    :cond_1
    :goto_0
    return-void
.end method
