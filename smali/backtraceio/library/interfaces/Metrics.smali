.class public interface abstract Lbacktraceio/library/interfaces/Metrics;
.super Ljava/lang/Object;
.source "Metrics.java"


# virtual methods
.method public abstract addSummedEvent(Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "metricGroupName"
        }
    .end annotation
.end method

.method public abstract addSummedEvent(Ljava/lang/String;Ljava/util/Map;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "metricGroupName",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract addUniqueEvent(Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation
.end method

.method public abstract addUniqueEvent(Ljava/lang/String;Ljava/util/Map;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract count()I
.end method

.method public abstract enable(Lbacktraceio/library/models/BacktraceMetricsSettings;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "settings"
        }
    .end annotation
.end method

.method public abstract getSummedEvents()Ljava/util/concurrent/ConcurrentLinkedDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "Lbacktraceio/library/models/metrics/SummedEvent;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getUniqueEvents()Ljava/util/concurrent/ConcurrentLinkedDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "Lbacktraceio/library/models/metrics/UniqueEvent;",
            ">;"
        }
    .end annotation
.end method

.method public abstract send()V
.end method

.method public abstract sendStartupEvent()V
.end method

.method public abstract setMaximumNumberOfEvents(I)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maximumNumberOfEvents"
        }
    .end annotation
.end method

.method public abstract setSummedEventsOnServerResponse(Lbacktraceio/library/events/EventsOnServerResponseEventListener;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callback"
        }
    .end annotation
.end method

.method public abstract setSummedEventsRequestHandler(Lbacktraceio/library/events/EventsRequestHandler;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "eventsRequestHandler"
        }
    .end annotation
.end method

.method public abstract setUniqueEventsOnServerResponse(Lbacktraceio/library/events/EventsOnServerResponseEventListener;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callback"
        }
    .end annotation
.end method

.method public abstract setUniqueEventsRequestHandler(Lbacktraceio/library/events/EventsRequestHandler;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "eventsRequestHandler"
        }
    .end annotation
.end method
