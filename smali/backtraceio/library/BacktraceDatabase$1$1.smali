.class Lbacktraceio/library/BacktraceDatabase$1$1;
.super Ljava/lang/Object;
.source "BacktraceDatabase.java"

# interfaces
.implements Lbacktraceio/library/events/OnServerResponseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/BacktraceDatabase$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lbacktraceio/library/BacktraceDatabase$1;

.field final synthetic val$currentRecord:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

.field final synthetic val$threadWaiter:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lbacktraceio/library/BacktraceDatabase$1;Lbacktraceio/library/models/database/BacktraceDatabaseRecord;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$1",
            "val$currentRecord",
            "val$threadWaiter"
        }
    .end annotation

    .line 300
    iput-object p1, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->this$1:Lbacktraceio/library/BacktraceDatabase$1;

    iput-object p2, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->val$currentRecord:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    iput-object p3, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->val$threadWaiter:Ljava/util/concurrent/CountDownLatch;

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

    .line 303
    iget-object p1, p1, Lbacktraceio/library/models/BacktraceResult;->status:Lbacktraceio/library/models/types/BacktraceResultStatus;

    sget-object v0, Lbacktraceio/library/models/types/BacktraceResultStatus;->Ok:Lbacktraceio/library/models/types/BacktraceResultStatus;

    if-ne p1, v0, :cond_0

    .line 304
    iget-object p1, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->this$1:Lbacktraceio/library/BacktraceDatabase$1;

    iget-object p1, p1, Lbacktraceio/library/BacktraceDatabase$1;->this$0:Lbacktraceio/library/BacktraceDatabase;

    invoke-static {p1}, Lbacktraceio/library/BacktraceDatabase;->access$000(Lbacktraceio/library/BacktraceDatabase;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Timer - deleting record"

    invoke-static {p1, v0}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    iget-object p1, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->this$1:Lbacktraceio/library/BacktraceDatabase$1;

    iget-object p1, p1, Lbacktraceio/library/BacktraceDatabase$1;->this$0:Lbacktraceio/library/BacktraceDatabase;

    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->val$currentRecord:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    invoke-virtual {p1, v0}, Lbacktraceio/library/BacktraceDatabase;->delete(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)V

    goto :goto_0

    .line 307
    :cond_0
    iget-object p1, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->this$1:Lbacktraceio/library/BacktraceDatabase$1;

    iget-object p1, p1, Lbacktraceio/library/BacktraceDatabase$1;->this$0:Lbacktraceio/library/BacktraceDatabase;

    invoke-static {p1}, Lbacktraceio/library/BacktraceDatabase;->access$000(Lbacktraceio/library/BacktraceDatabase;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Timer - closing record"

    invoke-static {p1, v0}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    iget-object p1, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->val$currentRecord:Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    invoke-virtual {p1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->close()Z

    .line 311
    :goto_0
    iget-object p1, p0, Lbacktraceio/library/BacktraceDatabase$1$1;->val$threadWaiter:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
