.class public Lbacktraceio/library/models/json/ThreadInformation;
.super Ljava/lang/Object;
.source "ThreadInformation.java"


# instance fields
.field private final fault:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "fault"
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private final stack:Ljava/util/ArrayList;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "stack"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lbacktraceio/library/models/BacktraceStackFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "threadName",
            "fault",
            "stack"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Ljava/util/ArrayList<",
            "Lbacktraceio/library/models/BacktraceStackFrame;",
            ">;)V"
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p3, :cond_0

    .line 42
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    iput-object p3, p0, Lbacktraceio/library/models/json/ThreadInformation;->stack:Ljava/util/ArrayList;

    .line 43
    iput-object p1, p0, Lbacktraceio/library/models/json/ThreadInformation;->name:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lbacktraceio/library/models/json/ThreadInformation;->fault:Ljava/lang/Boolean;

    return-void
.end method

.method constructor <init>(Ljava/lang/Thread;Ljava/util/ArrayList;Ljava/lang/Boolean;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "thread",
            "stack",
            "currentThread"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Thread;",
            "Ljava/util/ArrayList<",
            "Lbacktraceio/library/models/BacktraceStackFrame;",
            ">;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .line 55
    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p3, p2}, Lbacktraceio/library/models/json/ThreadInformation;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/ArrayList;)V

    return-void
.end method
