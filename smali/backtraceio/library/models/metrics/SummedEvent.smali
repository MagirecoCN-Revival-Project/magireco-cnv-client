.class public final Lbacktraceio/library/models/metrics/SummedEvent;
.super Lbacktraceio/library/models/metrics/Event;
.source "SummedEvent.java"


# instance fields
.field private final name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "metric_group"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lbacktraceio/library/models/metrics/SummedEvent;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "summedEvent"
        }
    .end annotation

    .line 30
    iget-object v0, p1, Lbacktraceio/library/models/metrics/SummedEvent;->name:Ljava/lang/String;

    iget-wide v1, p1, Lbacktraceio/library/models/metrics/SummedEvent;->timestamp:J

    iget-object p1, p1, Lbacktraceio/library/models/metrics/SummedEvent;->attributes:Ljava/util/Map;

    invoke-direct {p0, v0, v1, v2, p1}, Lbacktraceio/library/models/metrics/SummedEvent;-><init>(Ljava/lang/String;JLjava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 16
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p0, p1, v0}, Lbacktraceio/library/models/metrics/SummedEvent;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JLjava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "timestamp",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p2, p3}, Lbacktraceio/library/models/metrics/Event;-><init>(J)V

    .line 25
    iput-object p1, p0, Lbacktraceio/library/models/metrics/SummedEvent;->name:Ljava/lang/String;

    .line 26
    invoke-virtual {p0, p4}, Lbacktraceio/library/models/metrics/SummedEvent;->addAttributesImpl(Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
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
            ">;)V"
        }
    .end annotation

    .line 20
    invoke-static {}, Lbacktraceio/library/common/BacktraceTimeHelper;->getTimestampSeconds()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1, p2}, Lbacktraceio/library/models/metrics/SummedEvent;-><init>(Ljava/lang/String;JLjava/util/Map;)V

    return-void
.end method


# virtual methods
.method public addAttributes(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 39
    invoke-virtual {p0, p1}, Lbacktraceio/library/models/metrics/SummedEvent;->addAttributesImpl(Ljava/util/Map;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lbacktraceio/library/models/metrics/SummedEvent;->name:Ljava/lang/String;

    return-object v0
.end method
