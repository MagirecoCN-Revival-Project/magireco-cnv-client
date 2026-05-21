.class public interface abstract Lbacktraceio/library/interfaces/Api;
.super Ljava/lang/Object;
.source "Api.java"


# virtual methods
.method public abstract enableSummedEvents(Lbacktraceio/library/services/BacktraceMetrics;)Lbacktraceio/library/services/SummedEventsHandler;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceMetrics"
        }
    .end annotation
.end method

.method public abstract enableUniqueEvents(Lbacktraceio/library/services/BacktraceMetrics;)Lbacktraceio/library/services/UniqueEventsHandler;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceMetrics"
        }
    .end annotation
.end method

.method public abstract send(Lbacktraceio/library/models/BacktraceData;Lbacktraceio/library/events/OnServerResponseEventListener;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "callback"
        }
    .end annotation
.end method

.method public abstract sendEventsPayload(Lbacktraceio/library/models/metrics/SummedEventsPayload;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payload"
        }
    .end annotation
.end method

.method public abstract sendEventsPayload(Lbacktraceio/library/models/metrics/UniqueEventsPayload;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payload"
        }
    .end annotation
.end method

.method public abstract setOnServerError(Lbacktraceio/library/events/OnServerErrorEventListener;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "onServerError"
        }
    .end annotation
.end method

.method public abstract setRequestHandler(Lbacktraceio/library/events/RequestHandler;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "requestHandler"
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
