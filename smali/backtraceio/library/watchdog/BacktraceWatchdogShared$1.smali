.class Lbacktraceio/library/watchdog/BacktraceWatchdogShared$1;
.super Ljava/util/HashMap;
.source "BacktraceWatchdogShared.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/watchdog/BacktraceWatchdogShared;->sendReportCauseBlockedThread(Lbacktraceio/library/BacktraceClient;Ljava/lang/Thread;Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "error.type"

    const-string v1, "Hang"

    .line 32
    invoke-virtual {p0, v0, v1}, Lbacktraceio/library/watchdog/BacktraceWatchdogShared$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
