.class public Lbacktraceio/library/services/BacktraceHandlerThread;
.super Landroid/os/HandlerThread;
.source "BacktraceHandlerThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lbacktraceio/library/services/BacktraceHandlerThread$BacktraceHandler;
    }
.end annotation


# static fields
.field private static final transient LOG_TAG:Ljava/lang/String; = "BacktraceHandlerThread"


# instance fields
.field private mHandler:Lbacktraceio/library/services/BacktraceHandlerThread$BacktraceHandler;

.field private mSummedEventsHandler:Lbacktraceio/library/services/SummedEventsHandler;

.field private mUniqueEventsHandler:Lbacktraceio/library/services/UniqueEventsHandler;

.field private final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "url"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 26
    iput-object p2, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->url:Ljava/lang/String;

    .line 27
    invoke-virtual {p0}, Lbacktraceio/library/services/BacktraceHandlerThread;->start()V

    return-void
.end method


# virtual methods
.method createMessage(Lbacktraceio/library/services/BacktraceHandlerInput;)Landroid/os/Message;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 47
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 48
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    return-object v0
.end method

.method createSummedEventsHandler(Lbacktraceio/library/services/BacktraceMetrics;Lbacktraceio/library/interfaces/Api;)Lbacktraceio/library/services/SummedEventsHandler;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "backtraceMetrics",
            "api"
        }
    .end annotation

    .line 36
    new-instance v0, Lbacktraceio/library/services/SummedEventsHandler;

    invoke-direct {v0, p1, p2, p0}, Lbacktraceio/library/services/SummedEventsHandler;-><init>(Lbacktraceio/library/services/BacktraceMetrics;Lbacktraceio/library/interfaces/Api;Lbacktraceio/library/services/BacktraceHandlerThread;)V

    iput-object v0, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->mSummedEventsHandler:Lbacktraceio/library/services/SummedEventsHandler;

    return-object v0
.end method

.method createUniqueEventsHandler(Lbacktraceio/library/services/BacktraceMetrics;Lbacktraceio/library/interfaces/Api;)Lbacktraceio/library/services/UniqueEventsHandler;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "backtraceMetrics",
            "api"
        }
    .end annotation

    .line 31
    new-instance v0, Lbacktraceio/library/services/UniqueEventsHandler;

    invoke-direct {v0, p1, p2, p0}, Lbacktraceio/library/services/UniqueEventsHandler;-><init>(Lbacktraceio/library/services/BacktraceMetrics;Lbacktraceio/library/interfaces/Api;Lbacktraceio/library/services/BacktraceHandlerThread;)V

    iput-object v0, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->mUniqueEventsHandler:Lbacktraceio/library/services/UniqueEventsHandler;

    return-object v0
.end method

.method protected onLooperPrepared()V
    .locals 4

    .line 42
    invoke-super {p0}, Landroid/os/HandlerThread;->onLooperPrepared()V

    .line 43
    new-instance v0, Lbacktraceio/library/services/BacktraceHandlerThread$BacktraceHandler;

    invoke-virtual {p0}, Lbacktraceio/library/services/BacktraceHandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->url:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v1, v2, v3}, Lbacktraceio/library/services/BacktraceHandlerThread$BacktraceHandler;-><init>(Lbacktraceio/library/services/BacktraceHandlerThread;Landroid/os/Looper;Ljava/lang/String;Lbacktraceio/library/services/BacktraceHandlerThread$1;)V

    iput-object v0, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->mHandler:Lbacktraceio/library/services/BacktraceHandlerThread$BacktraceHandler;

    return-void
.end method

.method sendReport(Lbacktraceio/library/services/BacktraceHandlerInputReport;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->mHandler:Lbacktraceio/library/services/BacktraceHandlerThread$BacktraceHandler;

    invoke-virtual {p0, p1}, Lbacktraceio/library/services/BacktraceHandlerThread;->createMessage(Lbacktraceio/library/services/BacktraceHandlerInput;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Lbacktraceio/library/services/BacktraceHandlerThread$BacktraceHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method sendSummedEvents(Lbacktraceio/library/services/BacktraceHandlerInputEvents;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->mSummedEventsHandler:Lbacktraceio/library/services/SummedEventsHandler;

    invoke-virtual {p0, p1}, Lbacktraceio/library/services/BacktraceHandlerThread;->createMessage(Lbacktraceio/library/services/BacktraceHandlerInput;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Lbacktraceio/library/services/SummedEventsHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method sendUniqueEvents(Lbacktraceio/library/services/BacktraceHandlerInputEvents;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lbacktraceio/library/services/BacktraceHandlerThread;->mUniqueEventsHandler:Lbacktraceio/library/services/UniqueEventsHandler;

    invoke-virtual {p0, p1}, Lbacktraceio/library/services/BacktraceHandlerThread;->createMessage(Lbacktraceio/library/services/BacktraceHandlerInput;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Lbacktraceio/library/services/UniqueEventsHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
