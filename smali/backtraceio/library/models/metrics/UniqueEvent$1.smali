.class Lbacktraceio/library/models/metrics/UniqueEvent$1;
.super Ljava/util/ArrayList;
.source "UniqueEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/models/metrics/UniqueEvent;-><init>(Ljava/lang/String;JLjava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lbacktraceio/library/models/metrics/UniqueEvent;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lbacktraceio/library/models/metrics/UniqueEvent;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$name"
        }
    .end annotation

    .line 34
    iput-object p1, p0, Lbacktraceio/library/models/metrics/UniqueEvent$1;->this$0:Lbacktraceio/library/models/metrics/UniqueEvent;

    iput-object p2, p0, Lbacktraceio/library/models/metrics/UniqueEvent$1;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    invoke-virtual {p0, p2}, Lbacktraceio/library/models/metrics/UniqueEvent$1;->add(Ljava/lang/Object;)Z

    return-void
.end method
