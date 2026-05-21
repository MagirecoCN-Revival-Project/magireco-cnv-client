.class Lbacktraceio/library/base/BacktraceBase$1;
.super Ljava/lang/Object;
.source "BacktraceBase.java"

# interfaces
.implements Lbacktraceio/library/events/OnServerResponseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/base/BacktraceBase;->getDatabaseCallback(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;Lbacktraceio/library/events/OnServerResponseEventListener;)Lbacktraceio/library/events/OnServerResponseEventListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbacktraceio/library/base/BacktraceBase;

.field final synthetic val$customCallback:Lbacktraceio/library/events/OnServerResponseEventListener;

.field final synthetic val$record:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;


# direct methods
.method constructor <init>(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/events/OnServerResponseEventListener;Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$customCallback",
            "val$record"
        }
    .end annotation

    .line 527
    iput-object p1, p0, Lbacktraceio/library/base/BacktraceBase$1;->this$0:Lbacktraceio/library/base/BacktraceBase;

    iput-object p2, p0, Lbacktraceio/library/base/BacktraceBase$1;->val$customCallback:Lbacktraceio/library/events/OnServerResponseEventListener;

    iput-object p3, p0, Lbacktraceio/library/base/BacktraceBase$1;->val$record:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEvent(Lbacktraceio/library/models/BacktraceResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceResult"
        }
    .end annotation

    .line 530
    iget-object v0, p0, Lbacktraceio/library/base/BacktraceBase$1;->val$customCallback:Lbacktraceio/library/events/OnServerResponseEventListener;

    if-eqz v0, :cond_0

    .line 531
    invoke-interface {v0, p1}, Lbacktraceio/library/events/OnServerResponseEventListener;->onEvent(Lbacktraceio/library/models/BacktraceResult;)V

    .line 533
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/base/BacktraceBase$1;->val$record:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    if-eqz v0, :cond_1

    .line 534
    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->close()Z

    :cond_1
    if-eqz p1, :cond_2

    .line 536
    iget-object p1, p1, Lbacktraceio/library/models/BacktraceResult;->status:Lbacktraceio/library/models/types/BacktraceResultStatus;

    sget-object v0, Lbacktraceio/library/models/types/BacktraceResultStatus;->Ok:Lbacktraceio/library/models/types/BacktraceResultStatus;

    if-ne p1, v0, :cond_2

    .line 537
    iget-object p1, p0, Lbacktraceio/library/base/BacktraceBase$1;->this$0:Lbacktraceio/library/base/BacktraceBase;

    iget-object p1, p1, Lbacktraceio/library/base/BacktraceBase;->database:Lbacktraceio/library/interfaces/Database;

    iget-object v0, p0, Lbacktraceio/library/base/BacktraceBase$1;->val$record:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    invoke-interface {p1, v0}, Lbacktraceio/library/interfaces/Database;->delete(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)V

    :cond_2
    return-void
.end method
