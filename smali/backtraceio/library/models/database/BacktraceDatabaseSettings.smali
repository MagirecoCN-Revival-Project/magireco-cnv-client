.class public Lbacktraceio/library/models/database/BacktraceDatabaseSettings;
.super Ljava/lang/Object;
.source "BacktraceDatabaseSettings.java"


# instance fields
.field private _maxDatabaseSize:J

.field private autoSendMode:Z

.field private databasePath:Ljava/lang/String;

.field private maxRecordCount:I

.field private retryBehavior:Lbacktraceio/library/enums/database/RetryBehavior;

.field private retryInterval:I

.field private retryLimit:I

.field private retryOrder:Lbacktraceio/library/enums/database/RetryOrder;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "path"
        }
    .end annotation

    .line 48
    sget-object v0, Lbacktraceio/library/enums/database/RetryOrder;->Queue:Lbacktraceio/library/enums/database/RetryOrder;

    invoke-direct {p0, p1, v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;-><init>(Ljava/lang/String;Lbacktraceio/library/enums/database/RetryOrder;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lbacktraceio/library/enums/database/RetryOrder;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "path",
            "retryOrder"
        }
    .end annotation

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->maxRecordCount:I

    const-wide/16 v1, 0x0

    .line 23
    iput-wide v1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->_maxDatabaseSize:J

    .line 28
    iput-boolean v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->autoSendMode:Z

    .line 33
    sget-object v0, Lbacktraceio/library/enums/database/RetryBehavior;->ByInterval:Lbacktraceio/library/enums/database/RetryBehavior;

    iput-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryBehavior:Lbacktraceio/library/enums/database/RetryBehavior;

    const/4 v0, 0x5

    .line 38
    iput v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryInterval:I

    const/4 v0, 0x3

    .line 43
    iput v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryLimit:I

    .line 45
    sget-object v0, Lbacktraceio/library/enums/database/RetryOrder;->Stack:Lbacktraceio/library/enums/database/RetryOrder;

    .line 52
    iput-object p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->databasePath:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryOrder:Lbacktraceio/library/enums/database/RetryOrder;

    return-void
.end method


# virtual methods
.method public getDatabasePath()Ljava/lang/String;
    .locals 1

    .line 69
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->databasePath:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxDatabaseSize()J
    .locals 4

    .line 61
    iget-wide v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->_maxDatabaseSize:J

    const-wide/16 v2, 0x3e8

    mul-long v0, v0, v2

    mul-long v0, v0, v2

    return-wide v0
.end method

.method public getMaxRecordCount()I
    .locals 1

    .line 77
    iget v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->maxRecordCount:I

    return v0
.end method

.method public getRetryBehavior()Lbacktraceio/library/enums/database/RetryBehavior;
    .locals 1

    .line 93
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryBehavior:Lbacktraceio/library/enums/database/RetryBehavior;

    return-object v0
.end method

.method public getRetryInterval()I
    .locals 1

    .line 101
    iget v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryInterval:I

    return v0
.end method

.method public getRetryLimit()I
    .locals 1

    .line 112
    iget v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryLimit:I

    return v0
.end method

.method public getRetryOrder()Lbacktraceio/library/enums/database/RetryOrder;
    .locals 1

    .line 123
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryOrder:Lbacktraceio/library/enums/database/RetryOrder;

    return-object v0
.end method

.method public isAutoSendMode()Z
    .locals 1

    .line 85
    iget-boolean v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->autoSendMode:Z

    return v0
.end method

.method public setAutoSendMode(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "autoSendMode"
        }
    .end annotation

    .line 89
    iput-boolean p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->autoSendMode:Z

    return-void
.end method

.method public setDatabasePath(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "databasePath"
        }
    .end annotation

    .line 73
    iput-object p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->databasePath:Ljava/lang/String;

    return-void
.end method

.method public setMaxDatabaseSize(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 65
    iput-wide p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->_maxDatabaseSize:J

    return-void
.end method

.method public setMaxRecordCount(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maxRecordCount"
        }
    .end annotation

    .line 81
    iput p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->maxRecordCount:I

    return-void
.end method

.method public setRetryBehavior(Lbacktraceio/library/enums/database/RetryBehavior;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "retryBehavior"
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryBehavior:Lbacktraceio/library/enums/database/RetryBehavior;

    return-void
.end method

.method public setRetryInterval(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "retryInterval"
        }
    .end annotation

    if-lez p1, :cond_0

    .line 108
    iput p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryInterval:I

    return-void

    .line 106
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Retry interval value must be grader than zero"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setRetryLimit(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "retryLimit"
        }
    .end annotation

    .line 116
    iget v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryInterval:I

    if-lez v0, :cond_0

    .line 119
    iput p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryLimit:I

    return-void

    .line 117
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Retry limit value must be grader than zero"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setRetryOrder(Lbacktraceio/library/enums/database/RetryOrder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "retryOrder"
        }
    .end annotation

    .line 127
    iput-object p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->retryOrder:Lbacktraceio/library/enums/database/RetryOrder;

    return-void
.end method
