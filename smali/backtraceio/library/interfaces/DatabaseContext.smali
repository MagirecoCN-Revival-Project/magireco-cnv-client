.class public interface abstract Lbacktraceio/library/interfaces/DatabaseContext;
.super Ljava/lang/Object;
.source "DatabaseContext.java"


# virtual methods
.method public abstract add(Lbacktraceio/library/models/BacktraceData;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceData"
        }
    .end annotation
.end method

.method public abstract add(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceDatabaseRecord"
        }
    .end annotation
.end method

.method public abstract clear()V
.end method

.method public abstract contains(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "n"
        }
    .end annotation
.end method

.method public abstract count()I
.end method

.method public abstract delete(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "record"
        }
    .end annotation
.end method

.method public abstract first()Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
.end method

.method public abstract get()Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable<",
            "Lbacktraceio/library/models/database/BacktraceDatabaseRecord;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDatabaseSize()J
.end method

.method public abstract incrementBatchRetry()V
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract last()Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
.end method

.method public abstract removeOldestRecord()Z
.end method
