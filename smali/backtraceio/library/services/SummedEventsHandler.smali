.class public Lbacktraceio/library/services/SummedEventsHandler;
.super Lbacktraceio/library/services/BacktraceEventsHandler;
.source "SummedEventsHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lbacktraceio/library/services/BacktraceEventsHandler<",
        "Lbacktraceio/library/models/metrics/SummedEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final transient LOG_TAG:Ljava/lang/String; = "SummedEventsHandler"

.field private static final urlPrefix:Ljava/lang/String; = "summed-events"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lbacktraceio/library/services/BacktraceMetrics;Lbacktraceio/library/interfaces/Api;Lbacktraceio/library/services/BacktraceHandlerThread;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x10
        }
        names = {
            "backtraceMetrics",
            "api",
            "backtraceHandlerThread"
        }
    .end annotation

    const-string v0, "summed-events"

    .line 19
    invoke-direct {p0, p1, p2, p3, v0}, Lbacktraceio/library/services/BacktraceEventsHandler;-><init>(Lbacktraceio/library/services/BacktraceMetrics;Lbacktraceio/library/interfaces/Api;Lbacktraceio/library/services/BacktraceHandlerThread;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getCount()I
    .locals 1

    .line 11
    invoke-super {p0}, Lbacktraceio/library/services/BacktraceEventsHandler;->getCount()I

    move-result v0

    return v0
.end method

.method protected bridge synthetic getEventsPayload()Lbacktraceio/library/models/metrics/EventsPayload;
    .locals 1

    .line 11
    invoke-virtual {p0}, Lbacktraceio/library/services/SummedEventsHandler;->getEventsPayload()Lbacktraceio/library/models/metrics/SummedEventsPayload;

    move-result-object v0

    return-object v0
.end method

.method protected getEventsPayload()Lbacktraceio/library/models/metrics/SummedEventsPayload;
    .locals 5

    .line 24
    iget-object v0, p0, Lbacktraceio/library/services/SummedEventsHandler;->backtraceMetrics:Lbacktraceio/library/services/BacktraceMetrics;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lbacktraceio/library/services/BacktraceMetrics;->createLocalAttributes(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 26
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    .line 28
    iget-object v2, p0, Lbacktraceio/library/services/SummedEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedDeque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbacktraceio/library/models/metrics/SummedEvent;

    .line 29
    invoke-virtual {v3, v0}, Lbacktraceio/library/models/metrics/SummedEvent;->addAttributes(Ljava/util/Map;)V

    .line 30
    new-instance v4, Lbacktraceio/library/models/metrics/SummedEvent;

    invoke-direct {v4, v3}, Lbacktraceio/library/models/metrics/SummedEvent;-><init>(Lbacktraceio/library/models/metrics/SummedEvent;)V

    invoke-virtual {v1, v4}, Ljava/util/concurrent/ConcurrentLinkedDeque;->addLast(Ljava/lang/Object;)V

    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/services/SummedEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->clear()V

    .line 34
    new-instance v0, Lbacktraceio/library/models/metrics/SummedEventsPayload;

    iget-object v2, p0, Lbacktraceio/library/services/SummedEventsHandler;->application:Ljava/lang/String;

    iget-object v3, p0, Lbacktraceio/library/services/SummedEventsHandler;->appVersion:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lbacktraceio/library/models/metrics/SummedEventsPayload;-><init>(Ljava/util/concurrent/ConcurrentLinkedDeque;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic getMaximumNumberOfEvents()I
    .locals 1

    .line 11
    invoke-super {p0}, Lbacktraceio/library/services/BacktraceEventsHandler;->getMaximumNumberOfEvents()I

    move-result v0

    return v0
.end method

.method public bridge synthetic handleMessage(Landroid/os/Message;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "msg"
        }
    .end annotation

    .line 11
    invoke-super {p0, p1}, Lbacktraceio/library/services/BacktraceEventsHandler;->handleMessage(Landroid/os/Message;)V

    return-void
.end method

.method protected onMaximumAttemptsReached(Ljava/util/concurrent/ConcurrentLinkedDeque;)V
    .locals 2
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
            "Lbacktraceio/library/models/metrics/SummedEvent;",
            ">;)V"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lbacktraceio/library/services/SummedEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v0

    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedDeque;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lbacktraceio/library/services/SummedEventsHandler;->getMaximumNumberOfEvents()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 53
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedDeque;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbacktraceio/library/models/metrics/SummedEvent;

    .line 54
    iget-object v1, p0, Lbacktraceio/library/services/SummedEventsHandler;->events:Ljava/util/concurrent/ConcurrentLinkedDeque;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;->addFirst(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public bridge synthetic send()V
    .locals 0

    .line 11
    invoke-super {p0}, Lbacktraceio/library/services/BacktraceEventsHandler;->send()V

    return-void
.end method

.method protected sendEvents(Ljava/util/concurrent/ConcurrentLinkedDeque;)V
    .locals 1
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
            "Lbacktraceio/library/models/metrics/SummedEvent;",
            ">;)V"
        }
    .end annotation

    .line 41
    invoke-virtual {p0}, Lbacktraceio/library/services/SummedEventsHandler;->getEventsPayload()Lbacktraceio/library/models/metrics/SummedEventsPayload;

    move-result-object p1

    .line 42
    iget-object v0, p0, Lbacktraceio/library/services/SummedEventsHandler;->api:Lbacktraceio/library/interfaces/Api;

    invoke-interface {v0, p1}, Lbacktraceio/library/interfaces/Api;->sendEventsPayload(Lbacktraceio/library/models/metrics/SummedEventsPayload;)V

    return-void
.end method

.method protected sendEventsPayload(Lbacktraceio/library/models/metrics/EventsPayload;)V
    .locals 1
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
            "Lbacktraceio/library/models/metrics/SummedEvent;",
            ">;)V"
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lbacktraceio/library/services/SummedEventsHandler;->api:Lbacktraceio/library/interfaces/Api;

    check-cast p1, Lbacktraceio/library/models/metrics/SummedEventsPayload;

    invoke-interface {v0, p1}, Lbacktraceio/library/interfaces/Api;->sendEventsPayload(Lbacktraceio/library/models/metrics/SummedEventsPayload;)V

    return-void
.end method

.method public bridge synthetic setMaximumNumberOfEvents(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "maximumNumberOfEvents"
        }
    .end annotation

    .line 11
    invoke-super {p0, p1}, Lbacktraceio/library/services/BacktraceEventsHandler;->setMaximumNumberOfEvents(I)V

    return-void
.end method
