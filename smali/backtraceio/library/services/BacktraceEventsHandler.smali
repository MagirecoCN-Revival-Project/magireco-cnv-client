.class abstract Lbacktraceio/library/services/BacktraceEventsHandler;
.super Landroid/os/Handler;
.source "BacktraceEventsHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lbacktraceio/library/models/metrics/Event;",
        ">",
        "Landroid/os/Handler;"
    }
.end annotation


# static fields
.field private static final transient LOG_TAG:Ljava/lang/String; = "BacktraceEventsHandler"


# instance fields
.field protected final api:Lbacktraceio/library/interfaces/Api;

.field protected appVersion:Ljava/lang/String;

.field protected application:Ljava/lang/String;

.field protected final backtraceHandlerThread:Lbacktraceio/library/services/BacktraceHandlerThread;

.field protected final backtraceMetrics:Lbacktraceio/library/services/BacktraceMetrics;

.field protected events:Ljava/util/concurrent/ConcurrentLinkedDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "TT;>;"
        }
    .end annotation
.end field

.field private maximumNumberOfEvents:I

.field private final submissionUrl:Ljava/lang/String;

.field private final timeBetweenRetriesMillis:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lbacktraceio/library/services/BacktraceMetrics;Lbacktraceio/library/interfaces/Api;Lbacktraceio/library/services/BacktraceHandlerThread;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x10,
            0x0
        }
        names = {
            "backtraceMetrics",
            "api",
            "backtraceHandlerThread",
            "urlPrefix"
        }
    .end annotation

    .line 81
    invoke-virtual {p3}, Lbacktraceio/library/services/BacktraceHandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 47
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    iput-object v0, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    const/16 v0, 0x15e

    .line 53
    iput v0, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->maximumNumberOfEvents:I

    .line 82
    invoke-virtual {p3}, Lbacktraceio/library/services/BacktraceHandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 85
    iput-object p1, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->backtraceMetrics:Lbacktraceio/library/services/BacktraceMetrics;

    .line 86
    iput-object p3, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->backtraceHandlerThread:Lbacktraceio/library/services/BacktraceHandlerThread;

    .line 87
    iput-object p2, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->api:Lbacktraceio/library/interfaces/Api;

    .line 88
    iget-object p2, p1, Lbacktraceio/library/services/BacktraceMetrics;->settings:Lbacktraceio/library/models/BacktraceMetricsSettings;

    invoke-virtual {p2, p4}, Lbacktraceio/library/models/BacktraceMetricsSettings;->getSubmissionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->submissionUrl:Ljava/lang/String;

    .line 89
    iget-object p2, p1, Lbacktraceio/library/services/BacktraceMetrics;->settings:Lbacktraceio/library/models/BacktraceMetricsSettings;

    invoke-virtual {p2}, Lbacktraceio/library/models/BacktraceMetricsSettings;->getTimeBetweenRetriesMillis()I

    move-result p2

    iput p2, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->timeBetweenRetriesMillis:I

    .line 91
    iget-object p2, p1, Lbacktraceio/library/services/BacktraceMetrics;->settings:Lbacktraceio/library/models/BacktraceMetricsSettings;

    invoke-virtual {p2}, Lbacktraceio/library/models/BacktraceMetricsSettings;->getTimeIntervalMillis()J

    move-result-wide p2

    .line 93
    new-instance p4, Lbacktraceio/library/models/json/BacktraceAttributes;

    iget-object p1, p1, Lbacktraceio/library/services/BacktraceMetrics;->context:Landroid/content/Context;

    const/4 v0, 0x0

    invoke-direct {p4, p1, v0, v0}, Lbacktraceio/library/models/json/BacktraceAttributes;-><init>(Landroid/content/Context;Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;)V

    .line 94
    invoke-virtual {p4}, Lbacktraceio/library/models/json/BacktraceAttributes;->getApplicationName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->application:Ljava/lang/String;

    .line 95
    invoke-virtual {p4}, Lbacktraceio/library/models/json/BacktraceAttributes;->getApplicationVersionOrEmpty()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->appVersion:Ljava/lang/String;

    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    if-eqz p1, :cond_0

    .line 99
    new-instance p1, Lbacktraceio/library/services/BacktraceEventsHandler$1;

    invoke-direct {p1, p0, p0, p2, p3}, Lbacktraceio/library/services/BacktraceEventsHandler$1;-><init>(Lbacktraceio/library/services/BacktraceEventsHandler;Lbacktraceio/library/services/BacktraceEventsHandler;J)V

    invoke-virtual {p0, p1, p2, p3}, Lbacktraceio/library/services/BacktraceEventsHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void

    .line 83
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "Handler thread is not alive, this should not happen"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private calculateNextRetryTime(I)J
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "numRetries"
        }
    .end annotation

    .line 157
    iget v0, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->timeBetweenRetriesMillis:I

    int-to-double v0, v0

    add-int/lit8 p1, p1, -0x1

    int-to-double v2, p1

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    mul-double v4, v0, v2

    const-wide/16 v6, 0x0

    const-wide v8, 0x41124f8000000000L    # 300000.0

    .line 158
    invoke-static/range {v4 .. v9}, Lbacktraceio/library/common/BacktraceMathHelper;->clamp(DDD)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    mul-double v2, v2, v0

    add-double/2addr v2, v0

    .line 160
    invoke-static {v0, v1, v2, v3}, Lbacktraceio/library/common/BacktraceMathHelper;->uniform(DD)D

    move-result-wide v0

    double-to-long v0, v0

    return-wide v0
.end method

.method private getEventsResult(Lbacktraceio/library/services/BacktraceHandlerInputEvents;)Lbacktraceio/library/models/metrics/EventsResult;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 166
    iget-object v0, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->eventsRequestHandler:Lbacktraceio/library/events/EventsRequestHandler;

    if-eqz v0, :cond_0

    .line 167
    sget-object v0, Lbacktraceio/library/services/BacktraceEventsHandler;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Sending using custom request handler"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v0, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->eventsRequestHandler:Lbacktraceio/library/events/EventsRequestHandler;

    iget-object p1, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->payload:Lbacktraceio/library/models/metrics/EventsPayload;

    invoke-interface {v0, p1}, Lbacktraceio/library/events/EventsRequestHandler;->onRequest(Lbacktraceio/library/models/metrics/EventsPayload;)Lbacktraceio/library/models/metrics/EventsResult;

    move-result-object p1

    goto :goto_0

    .line 170
    :cond_0
    sget-object v0, Lbacktraceio/library/services/BacktraceEventsHandler;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Sending report using default request handler"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v0, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->payload:Lbacktraceio/library/models/metrics/EventsPayload;

    invoke-static {v0}, Lbacktraceio/library/common/BacktraceSerializeHelper;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 172
    iget-object v1, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->submissionUrl:Ljava/lang/String;

    iget-object v2, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->payload:Lbacktraceio/library/models/metrics/EventsPayload;

    iget-object p1, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->serverErrorEventListener:Lbacktraceio/library/events/OnServerErrorEventListener;

    invoke-static {v1, v0, v2, p1}, Lbacktraceio/library/services/BacktraceReportSender;->sendEvents(Ljava/lang/String;Ljava/lang/String;Lbacktraceio/library/models/metrics/EventsPayload;Lbacktraceio/library/events/OnServerErrorEventListener;)Lbacktraceio/library/models/metrics/EventsResult;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private retrySendEvents(Lbacktraceio/library/services/BacktraceHandlerInputEvents;I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "statusCode"
        }
    .end annotation

    const/16 v0, 0x1f5

    if-le p2, v0, :cond_2

    const/16 v0, 0x1f9

    if-eq p2, v0, :cond_2

    .line 180
    iget-object p2, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->payload:Lbacktraceio/library/models/metrics/EventsPayload;

    iget v0, p2, Lbacktraceio/library/models/metrics/EventsPayload;->numRetries:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p2, Lbacktraceio/library/models/metrics/EventsPayload;->numRetries:I

    const/4 p2, 0x3

    if-ge v0, p2, :cond_1

    .line 181
    iget p2, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->timeBetweenRetriesMillis:I

    if-nez p2, :cond_0

    goto :goto_0

    .line 186
    :cond_0
    new-instance p2, Lbacktraceio/library/services/BacktraceEventsHandler$2;

    invoke-direct {p2, p0, p1, v0}, Lbacktraceio/library/services/BacktraceEventsHandler$2;-><init>(Lbacktraceio/library/services/BacktraceEventsHandler;Lbacktraceio/library/services/BacktraceHandlerInputEvents;I)V

    .line 193
    invoke-direct {p0, v0}, Lbacktraceio/library/services/BacktraceEventsHandler;->calculateNextRetryTime(I)J

    move-result-wide v0

    .line 186
    invoke-virtual {p0, p2, v0, v1}, Lbacktraceio/library/services/BacktraceEventsHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    .line 182
    :cond_1
    :goto_0
    iget-object p1, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->payload:Lbacktraceio/library/models/metrics/EventsPayload;

    invoke-virtual {p1}, Lbacktraceio/library/models/metrics/EventsPayload;->getEvents()Ljava/util/concurrent/ConcurrentLinkedDeque;

    move-result-object p1

    invoke-virtual {p0, p1}, Lbacktraceio/library/services/BacktraceEventsHandler;->onMaximumAttemptsReached(Ljava/util/concurrent/ConcurrentLinkedDeque;)V

    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 113
    iget-object v0, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v0

    return v0
.end method

.method protected abstract getEventsPayload()Lbacktraceio/library/models/metrics/EventsPayload;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lbacktraceio/library/models/metrics/EventsPayload<",
            "TT;>;"
        }
    .end annotation
.end method

.method public getMaximumNumberOfEvents()I
    .locals 1

    .line 117
    iget v0, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->maximumNumberOfEvents:I

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "msg"
        }
    .end annotation

    .line 137
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;

    .line 138
    invoke-direct {p0, p1}, Lbacktraceio/library/services/BacktraceEventsHandler;->getEventsResult(Lbacktraceio/library/services/BacktraceHandlerInputEvents;)Lbacktraceio/library/models/metrics/EventsResult;

    move-result-object v0

    .line 140
    iget-object v1, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->eventsOnServerResponseEventListener:Lbacktraceio/library/events/EventsOnServerResponseEventListener;

    if-eqz v1, :cond_0

    .line 141
    sget-object v1, Lbacktraceio/library/services/BacktraceEventsHandler;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Processing result using custom event"

    invoke-static {v1, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    iget-object v1, p1, Lbacktraceio/library/services/BacktraceHandlerInputEvents;->eventsOnServerResponseEventListener:Lbacktraceio/library/events/EventsOnServerResponseEventListener;

    invoke-interface {v1, v0}, Lbacktraceio/library/events/EventsOnServerResponseEventListener;->onEvent(Lbacktraceio/library/models/metrics/EventsResult;)V

    .line 145
    :cond_0
    invoke-virtual {v0}, Lbacktraceio/library/models/metrics/EventsResult;->getStatusCode()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lbacktraceio/library/services/BacktraceEventsHandler;->retrySendEvents(Lbacktraceio/library/services/BacktraceHandlerInputEvents;I)V

    return-void
.end method

.method protected onMaximumAttemptsReached(Ljava/util/concurrent/ConcurrentLinkedDeque;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "events"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "TT;>;)V"
        }
    .end annotation

    return-void
.end method

.method public send()V
    .locals 1

    .line 125
    iget-object v0, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 128
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {p0, v0}, Lbacktraceio/library/services/BacktraceEventsHandler;->sendEvents(Ljava/util/concurrent/ConcurrentLinkedDeque;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected abstract sendEvents(Ljava/util/concurrent/ConcurrentLinkedDeque;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "events"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "TT;>;)V"
        }
    .end annotation
.end method

.method protected abstract sendEventsPayload(Lbacktraceio/library/models/metrics/EventsPayload;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payload"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbacktraceio/library/models/metrics/EventsPayload<",
            "TT;>;)V"
        }
    .end annotation
.end method

.method public setMaximumNumberOfEvents(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maximumNumberOfEvents"
        }
    .end annotation

    .line 121
    iput p1, p0, Lbacktraceio/library/services/BacktraceEventsHandler;->maximumNumberOfEvents:I

    return-void
.end method
