.class public abstract Lbacktraceio/library/models/metrics/EventsPayload;
.super Ljava/lang/Object;
.source "EventsPayload.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lbacktraceio/library/models/metrics/Event;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final transient LOG_TAG:Ljava/lang/String; = "EventsPayload"


# instance fields
.field private final appVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "appversion"
    .end annotation
.end field

.field private final application:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "application"
    .end annotation
.end field

.field private final eventsMetadata:Lbacktraceio/library/models/metrics/EventsMetadata;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "metadata"
    .end annotation
.end field

.field public transient numRetries:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "application",
            "appVersion"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lbacktraceio/library/models/metrics/EventsPayload;->numRetries:I

    .line 23
    iput-object p1, p0, Lbacktraceio/library/models/metrics/EventsPayload;->application:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lbacktraceio/library/models/metrics/EventsPayload;->appVersion:Ljava/lang/String;

    .line 25
    new-instance p1, Lbacktraceio/library/models/metrics/EventsMetadata;

    invoke-direct {p1, v0}, Lbacktraceio/library/models/metrics/EventsMetadata;-><init>(I)V

    iput-object p1, p0, Lbacktraceio/library/models/metrics/EventsPayload;->eventsMetadata:Lbacktraceio/library/models/metrics/EventsMetadata;

    return-void
.end method


# virtual methods
.method public getDroppedEvents()I
    .locals 1

    .line 29
    iget-object v0, p0, Lbacktraceio/library/models/metrics/EventsPayload;->eventsMetadata:Lbacktraceio/library/models/metrics/EventsMetadata;

    invoke-virtual {v0}, Lbacktraceio/library/models/metrics/EventsMetadata;->getDroppedEvents()I

    move-result v0

    return v0
.end method

.method public abstract getEvents()Ljava/util/concurrent/ConcurrentLinkedDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/ConcurrentLinkedDeque<",
            "TT;>;"
        }
    .end annotation
.end method

.method public setDroppedEvents(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "droppedEvents"
        }
    .end annotation

    .line 33
    iget-object v0, p0, Lbacktraceio/library/models/metrics/EventsPayload;->eventsMetadata:Lbacktraceio/library/models/metrics/EventsMetadata;

    invoke-virtual {v0, p1}, Lbacktraceio/library/models/metrics/EventsMetadata;->setDroppedEvents(I)V

    return-void
.end method
