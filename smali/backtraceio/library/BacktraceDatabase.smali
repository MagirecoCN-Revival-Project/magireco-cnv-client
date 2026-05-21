.class public Lbacktraceio/library/BacktraceDatabase;
.super Ljava/lang/Object;
.source "BacktraceDatabase.java"

# interfaces
.implements Lbacktraceio/library/interfaces/Database;


# static fields
.field private static _timer:Ljava/util/Timer;

.field private static _timerBackgroundWork:Z


# instance fields
.field private BacktraceApi:Lbacktraceio/library/interfaces/Api;

.field private final transient LOG_TAG:Ljava/lang/String;

.field private _applicationContext:Landroid/content/Context;

.field private final _crashpadDatabasePathPrefix:Ljava/lang/String;

.field private final _crashpadHandlerName:Ljava/lang/String;

.field private _enable:Z

.field private backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

.field private backtraceDatabaseFileContext:Lbacktraceio/library/interfaces/DatabaseFileContext;

.field private breadcrumbs:Lbacktraceio/library/interfaces/Breadcrumbs;

.field private databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "/libcrashpad_handler.so"

    .line 40
    iput-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->_crashpadHandlerName:Ljava/lang/String;

    const-string v0, "/crashpad"

    .line 41
    iput-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->_crashpadDatabasePathPrefix:Ljava/lang/String;

    const-string v0, "BacktraceDatabase"

    .line 45
    iput-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->LOG_TAG:Ljava/lang/String;

    const/4 v1, 0x0

    .line 51
    iput-boolean v1, p0, Lbacktraceio/library/BacktraceDatabase;->_enable:Z

    const-string v1, "Disabled instance of BacktraceDatabase created, native crashes won\'t be captured"

    .line 89
    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "databaseSettings"
        }
    .end annotation

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "/libcrashpad_handler.so"

    .line 40
    iput-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->_crashpadHandlerName:Ljava/lang/String;

    const-string v0, "/crashpad"

    .line 41
    iput-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->_crashpadDatabasePathPrefix:Ljava/lang/String;

    const-string v0, "BacktraceDatabase"

    .line 45
    iput-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->LOG_TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Lbacktraceio/library/BacktraceDatabase;->_enable:Z

    if-eqz p2, :cond_3

    if-eqz p1, :cond_3

    .line 111
    invoke-virtual {p2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getDatabasePath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getDatabasePath()Ljava/lang/String;

    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 116
    invoke-virtual {p2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getDatabasePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lbacktraceio/library/common/FileHelper;->isFileExists(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 117
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getDatabasePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {p2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getDatabasePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lbacktraceio/library/common/FileHelper;->isFileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 119
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Incorrect database path or application doesn\'t have permission to write to this path"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 124
    :cond_1
    :goto_0
    iput-object p1, p0, Lbacktraceio/library/BacktraceDatabase;->_applicationContext:Landroid/content/Context;

    .line 125
    iput-object p2, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    .line 126
    new-instance p1, Lbacktraceio/library/services/BacktraceDatabaseContext;

    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->_applicationContext:Landroid/content/Context;

    invoke-direct {p1, v0, p2}, Lbacktraceio/library/services/BacktraceDatabaseContext;-><init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V

    iput-object p1, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    .line 128
    new-instance p1, Lbacktraceio/library/services/BacktraceDatabaseFileContext;

    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->getDatabasePath()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    .line 129
    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getMaxDatabaseSize()J

    move-result-wide v0

    iget-object v2, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    .line 130
    invoke-virtual {v2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getMaxRecordCount()I

    move-result v2

    invoke-direct {p1, p2, v0, v1, v2}, Lbacktraceio/library/services/BacktraceDatabaseFileContext;-><init>(Ljava/lang/String;JI)V

    iput-object p1, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseFileContext:Lbacktraceio/library/interfaces/DatabaseFileContext;

    .line 131
    new-instance p1, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;

    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->getDatabasePath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lbacktraceio/library/breadcrumbs/BacktraceBreadcrumbs;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lbacktraceio/library/BacktraceDatabase;->breadcrumbs:Lbacktraceio/library/interfaces/Breadcrumbs;

    return-void

    .line 113
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Database path is null or empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 108
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Database settings or application context is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "path"
        }
    .end annotation

    .line 98
    new-instance v0, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-direct {v0, p2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lbacktraceio/library/BacktraceDatabase;-><init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V

    return-void
.end method

.method static synthetic access$000(Lbacktraceio/library/BacktraceDatabase;)Ljava/lang/String;
    .locals 0

    .line 38
    iget-object p0, p0, Lbacktraceio/library/BacktraceDatabase;->LOG_TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lbacktraceio/library/BacktraceDatabase;)Lbacktraceio/library/interfaces/DatabaseContext;
    .locals 0

    .line 38
    iget-object p0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    return-object p0
.end method

.method static synthetic access$200()Z
    .locals 1

    .line 38
    sget-boolean v0, Lbacktraceio/library/BacktraceDatabase;->_timerBackgroundWork:Z

    return v0
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    .line 38
    sput-boolean p0, Lbacktraceio/library/BacktraceDatabase;->_timerBackgroundWork:Z

    return p0
.end method

.method static synthetic access$300()Ljava/util/Timer;
    .locals 1

    .line 38
    sget-object v0, Lbacktraceio/library/BacktraceDatabase;->_timer:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$302(Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0

    .line 38
    sput-object p0, Lbacktraceio/library/BacktraceDatabase;->_timer:Ljava/util/Timer;

    return-object p0
.end method

.method static synthetic access$400(Lbacktraceio/library/BacktraceDatabase;)Landroid/content/Context;
    .locals 0

    .line 38
    iget-object p0, p0, Lbacktraceio/library/BacktraceDatabase;->_applicationContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$500(Lbacktraceio/library/BacktraceDatabase;)Lbacktraceio/library/interfaces/Api;
    .locals 0

    .line 38
    iget-object p0, p0, Lbacktraceio/library/BacktraceDatabase;->BacktraceApi:Lbacktraceio/library/interfaces/Api;

    return-object p0
.end method

.method static synthetic access$600(Lbacktraceio/library/BacktraceDatabase;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->setupTimer()V

    return-void
.end method

.method private native disable()V
.end method

.method private getDatabasePath()Ljava/lang/String;
    .locals 1

    .line 135
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getDatabasePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private native initialize(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZLbacktraceio/library/enums/UnwindingMode;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "url",
            "databasePath",
            "handlerPath",
            "attributeKeys",
            "attributeValues",
            "attachmentPaths",
            "enableClientSideUnwinding",
            "unwindingMode"
        }
    .end annotation
.end method

.method private loadReports()V
    .locals 3

    .line 414
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseFileContext:Lbacktraceio/library/interfaces/DatabaseFileContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseFileContext;->getRecords()Ljava/lang/Iterable;

    move-result-object v0

    .line 416
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 417
    invoke-static {v1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->readFromFile(Ljava/io/File;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    move-result-object v1

    .line 418
    invoke-virtual {v1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->valid()Z

    move-result v2

    if-nez v2, :cond_0

    .line 419
    invoke-virtual {v1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->delete()V

    goto :goto_0

    .line 422
    :cond_0
    iget-object v2, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v2, v1}, Lbacktraceio/library/interfaces/DatabaseContext;->add(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    .line 423
    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->validateDatabaseSize()Z

    .line 424
    invoke-virtual {v1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->close()Z

    goto :goto_0

    :cond_1
    return-void
.end method

.method private removeOrphaned()V
    .locals 2

    .line 366
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->get()Ljava/lang/Iterable;

    move-result-object v0

    .line 367
    iget-object v1, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseFileContext:Lbacktraceio/library/interfaces/DatabaseFileContext;

    invoke-interface {v1, v0}, Lbacktraceio/library/interfaces/DatabaseFileContext;->removeOrphaned(Ljava/lang/Iterable;)V

    return-void
.end method

.method private setupTimer()V
    .locals 6

    .line 261
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sput-object v0, Lbacktraceio/library/BacktraceDatabase;->_timer:Ljava/util/Timer;

    .line 262
    new-instance v1, Lbacktraceio/library/BacktraceDatabase$1;

    invoke-direct {v1, p0}, Lbacktraceio/library/BacktraceDatabase$1;-><init>(Lbacktraceio/library/BacktraceDatabase;)V

    iget-object v2, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    .line 332
    invoke-virtual {v2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getRetryInterval()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    iget-object v4, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-virtual {v4}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getRetryInterval()I

    move-result v4

    mul-int/lit16 v4, v4, 0x3e8

    int-to-long v4, v4

    .line 262
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    return-void
.end method

.method private validateDatabaseSize()Z
    .locals 8

    .line 440
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->count()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-virtual {v2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getMaxRecordCount()I

    move-result v2

    const/4 v3, 0x0

    if-le v0, v2, :cond_0

    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    .line 441
    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getMaxRecordCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 442
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->removeOldestRecord()Z

    move-result v0

    if-nez v0, :cond_0

    .line 443
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Can\'t remove last record. Database size is invalid"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    .line 448
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getMaxDatabaseSize()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-eqz v0, :cond_4

    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    .line 449
    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->getDatabaseSize()J

    move-result-wide v4

    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getMaxDatabaseSize()J

    move-result-wide v6

    cmp-long v0, v4, v6

    if-lez v0, :cond_4

    const/4 v0, 0x5

    .line 451
    :cond_1
    iget-object v2, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v2}, Lbacktraceio/library/interfaces/DatabaseContext;->getDatabaseSize()J

    move-result-wide v4

    iget-object v2, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    .line 452
    invoke-virtual {v2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getMaxDatabaseSize()J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-lez v2, :cond_2

    .line 453
    iget-object v2, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v2}, Lbacktraceio/library/interfaces/DatabaseContext;->removeOldestRecord()Z

    add-int/lit8 v0, v0, -0x1

    if-nez v0, :cond_1

    :cond_2
    if-eqz v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :cond_4
    :goto_0
    return v1
.end method


# virtual methods
.method public add(Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "backtraceReport",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbacktraceio/library/models/json/BacktraceReport;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lbacktraceio/library/models/database/BacktraceDatabaseRecord;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 376
    invoke-virtual {p0, p1, p2, v0}, Lbacktraceio/library/BacktraceDatabase;->add(Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;Z)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    move-result-object p1

    return-object p1
.end method

.method public add(Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;Z)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "backtraceReport",
            "attributes",
            "isProguardEnabled"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbacktraceio/library/models/json/BacktraceReport;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)",
            "Lbacktraceio/library/models/database/BacktraceDatabaseRecord;"
        }
    .end annotation

    .line 381
    iget-boolean v0, p0, Lbacktraceio/library/BacktraceDatabase;->_enable:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 385
    :cond_0
    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->validateDatabaseSize()Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    .line 390
    :cond_1
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->_applicationContext:Landroid/content/Context;

    invoke-virtual {p1, v0, p2, p3}, Lbacktraceio/library/models/json/BacktraceReport;->toBacktraceData(Landroid/content/Context;Ljava/util/Map;Z)Lbacktraceio/library/models/BacktraceData;

    move-result-object p1

    .line 391
    iget-object p2, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {p2, p1}, Lbacktraceio/library/interfaces/DatabaseContext;->add(Lbacktraceio/library/models/BacktraceData;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    return-object v1
.end method

.method public native addAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "value"
        }
    .end annotation
.end method

.method public clear()V
    .locals 1

    .line 357
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    if-eqz v0, :cond_0

    .line 358
    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->clear()V

    .line 360
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseFileContext:Lbacktraceio/library/interfaces/DatabaseFileContext;

    if-eqz v0, :cond_1

    .line 361
    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseFileContext;->clear()V

    :cond_1
    return-void
.end method

.method public count()I
    .locals 1

    .line 410
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->count()I

    move-result v0

    return v0
.end method

.method public delete(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "record"
        }
    .end annotation

    .line 403
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    if-nez v0, :cond_0

    return-void

    .line 406
    :cond_0
    invoke-interface {v0, p1}, Lbacktraceio/library/interfaces/DatabaseContext;->delete(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)Z

    return-void
.end method

.method public disableNativeIntegration()V
    .locals 0

    .line 221
    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->disable()V

    return-void
.end method

.method public flush()V
    .locals 3

    .line 336
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->BacktraceApi:Lbacktraceio/library/interfaces/Api;

    if-eqz v0, :cond_2

    .line 341
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->first()Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    .line 343
    iget-object v1, p0, Lbacktraceio/library/BacktraceDatabase;->_applicationContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->getBacktraceData(Landroid/content/Context;)Lbacktraceio/library/models/BacktraceData;

    move-result-object v1

    .line 344
    invoke-virtual {p0, v0}, Lbacktraceio/library/BacktraceDatabase;->delete(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)V

    if-eqz v1, :cond_0

    .line 346
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->BacktraceApi:Lbacktraceio/library/interfaces/Api;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lbacktraceio/library/interfaces/Api;->send(Lbacktraceio/library/models/BacktraceData;Lbacktraceio/library/events/OnServerResponseEventListener;)V

    .line 348
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->first()Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    move-result-object v0

    goto :goto_0

    :cond_1
    return-void

    .line 337
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "BacktraceApi is required if you want to use Flush method"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable<",
            "Lbacktraceio/library/models/database/BacktraceDatabaseRecord;",
            ">;"
        }
    .end annotation

    .line 395
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 399
    :cond_0
    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->get()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public getBreadcrumbs()Lbacktraceio/library/interfaces/Breadcrumbs;
    .locals 1

    .line 226
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->breadcrumbs:Lbacktraceio/library/interfaces/Breadcrumbs;

    return-object v0
.end method

.method public getDatabaseSize()J
    .locals 2

    .line 465
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->getDatabaseSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSettings()Lbacktraceio/library/models/database/BacktraceDatabaseSettings;
    .locals 1

    .line 257
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    return-object v0
.end method

.method public setApi(Lbacktraceio/library/interfaces/Api;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceApi"
        }
    .end annotation

    .line 353
    iput-object p1, p0, Lbacktraceio/library/BacktraceDatabase;->BacktraceApi:Lbacktraceio/library/interfaces/Api;

    return-void
.end method

.method public setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "client",
            "credentials"
        }
    .end annotation

    const/4 v0, 0x0

    .line 145
    invoke-virtual {p0, p1, p2, v0}, Lbacktraceio/library/BacktraceDatabase;->setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;Z)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "client",
            "credentials",
            "enableClientSideUnwinding"
        }
    .end annotation

    .line 157
    sget-object v0, Lbacktraceio/library/enums/UnwindingMode;->REMOTE_DUMPWITHOUTCRASH:Lbacktraceio/library/enums/UnwindingMode;

    invoke-virtual {p0, p1, p2, p3, v0}, Lbacktraceio/library/BacktraceDatabase;->setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;ZLbacktraceio/library/enums/UnwindingMode;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;ZLbacktraceio/library/enums/UnwindingMode;)Ljava/lang/Boolean;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "client",
            "credentials",
            "enableClientSideUnwinding",
            "unwindingMode"
        }
    .end annotation

    .line 171
    invoke-virtual {p0}, Lbacktraceio/library/BacktraceDatabase;->getSettings()Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    move-result-object v1

    const/4 v2, 0x0

    .line 172
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    if-nez v1, :cond_0

    return-object v3

    .line 174
    :cond_0
    invoke-virtual {p2}, Lbacktraceio/library/BacktraceCredentials;->getMinidumpSubmissionUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v3

    .line 179
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lbacktraceio/library/BacktraceDatabase;->_applicationContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/libcrashpad_handler.so"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 182
    new-instance v4, Lbacktraceio/library/models/json/BacktraceAttributes;

    iget-object v5, p0, Lbacktraceio/library/BacktraceDatabase;->_applicationContext:Landroid/content/Context;

    iget-object v6, p1, Lbacktraceio/library/base/BacktraceBase;->attributes:Ljava/util/Map;

    invoke-direct {v4, v5, v6}, Lbacktraceio/library/models/json/BacktraceAttributes;-><init>(Landroid/content/Context;Ljava/util/Map;)V

    .line 183
    iget-object v5, v4, Lbacktraceio/library/models/json/BacktraceAttributes;->attributes:Ljava/util/Map;

    const-string v6, "error.type"

    const-string v7, "Crash"

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    iget-object v5, v4, Lbacktraceio/library/models/json/BacktraceAttributes;->attributes:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    new-array v6, v2, [Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    .line 185
    iget-object v4, v4, Lbacktraceio/library/models/json/BacktraceAttributes;->attributes:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    new-array v6, v2, [Ljava/lang/String;

    invoke-interface {v4, v6}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, [Ljava/lang/String;

    .line 188
    iget-object v4, p1, Lbacktraceio/library/base/BacktraceBase;->attachments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    new-array v7, v4, [Ljava/lang/String;

    .line 191
    iget-object v8, p1, Lbacktraceio/library/base/BacktraceBase;->attachments:Ljava/util/List;

    if-eqz v8, :cond_2

    .line 192
    :goto_0
    iget-object v8, p1, Lbacktraceio/library/base/BacktraceBase;->attachments:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_2

    .line 193
    iget-object v8, p1, Lbacktraceio/library/base/BacktraceBase;->attachments:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    aput-object v8, v7, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    add-int/lit8 v4, v4, -0x1

    .line 196
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->breadcrumbs:Lbacktraceio/library/interfaces/Breadcrumbs;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/Breadcrumbs;->getBreadcrumbLogPath()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v7, v4

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lbacktraceio/library/BacktraceDatabase;->getSettings()Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    move-result-object v2

    invoke-virtual {v2}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getDatabasePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/crashpad"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 200
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-object v0, p0

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move v7, p3

    move-object v8, p4

    .line 203
    invoke-direct/range {v0 .. v8}, Lbacktraceio/library/BacktraceDatabase;->initialize(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZLbacktraceio/library/enums/UnwindingMode;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public start()V
    .locals 3

    .line 230
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    if-nez v0, :cond_0

    return-void

    .line 234
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseContext:Lbacktraceio/library/interfaces/DatabaseContext;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseContext;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 235
    iput-boolean v1, p0, Lbacktraceio/library/BacktraceDatabase;->_enable:Z

    return-void

    .line 239
    :cond_1
    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->loadReports()V

    .line 241
    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->removeOrphaned()V

    .line 243
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->getRetryBehavior()Lbacktraceio/library/enums/database/RetryBehavior;

    move-result-object v0

    sget-object v2, Lbacktraceio/library/enums/database/RetryBehavior;->ByInterval:Lbacktraceio/library/enums/database/RetryBehavior;

    if-eq v0, v2, :cond_2

    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->databaseSettings:Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    .line 244
    invoke-virtual {v0}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->isAutoSendMode()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 245
    :cond_2
    invoke-direct {p0}, Lbacktraceio/library/BacktraceDatabase;->setupTimer()V

    .line 248
    :cond_3
    iput-boolean v1, p0, Lbacktraceio/library/BacktraceDatabase;->_enable:Z

    return-void
.end method

.method public validConsistency()Z
    .locals 1

    .line 371
    iget-object v0, p0, Lbacktraceio/library/BacktraceDatabase;->backtraceDatabaseFileContext:Lbacktraceio/library/interfaces/DatabaseFileContext;

    invoke-interface {v0}, Lbacktraceio/library/interfaces/DatabaseFileContext;->validFileConsistency()Z

    move-result v0

    return v0
.end method
