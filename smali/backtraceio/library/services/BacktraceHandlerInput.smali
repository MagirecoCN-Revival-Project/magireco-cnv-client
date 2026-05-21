.class public abstract Lbacktraceio/library/services/BacktraceHandlerInput;
.super Ljava/lang/Object;
.source "BacktraceHandlerInput.java"


# instance fields
.field public serverErrorEventListener:Lbacktraceio/library/events/OnServerErrorEventListener;


# direct methods
.method protected constructor <init>(Lbacktraceio/library/events/OnServerErrorEventListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "serverErrorEventListener"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lbacktraceio/library/services/BacktraceHandlerInput;->serverErrorEventListener:Lbacktraceio/library/events/OnServerErrorEventListener;

    return-void
.end method
