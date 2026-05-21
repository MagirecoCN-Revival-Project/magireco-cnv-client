.class public Ljp/f4samurai/backtrace/BacktraceHandler;
.super Ljava/lang/Object;
.source "BacktraceHandler.java"


# static fields
.field private static final ANR_TIMEOUT:I = 0xbb8

.field private static final ENDPOINT_URL:Ljava/lang/String; = "https://totentanz-9b.magica-us.com/backtrace"

.field private static final SUBMISSION_TOKEN:Ljava/lang/String; = "snaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

.field private static sBacktraceClient:Lbacktraceio/library/BacktraceClient;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setLog(Ljava/lang/String;)V
    .locals 1

    .line 76
    sget-object v0, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    invoke-virtual {v0, p0}, Lbacktraceio/library/BacktraceClient;->addBreadcrumb(Ljava/lang/String;)Z

    return-void
.end method

.method public static setLogData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 81
    new-instance v0, Ljp/f4samurai/backtrace/BacktraceHandler$2;

    invoke-direct {v0, p0, p1}, Ljp/f4samurai/backtrace/BacktraceHandler$2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    sget-object p0, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    const-string p1, "LogData"

    invoke-virtual {p0, p1, v0}, Lbacktraceio/library/BacktraceClient;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;)Z

    return-void
.end method

.method public static setUserId(Ljava/lang/String;)V
    .locals 2

    .line 68
    new-instance v0, Ljp/f4samurai/backtrace/BacktraceHandler$1;

    invoke-direct {v0, p0}, Ljp/f4samurai/backtrace/BacktraceHandler$1;-><init>(Ljava/lang/String;)V

    .line 71
    sget-object p0, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    const-string v1, "UserId"

    invoke-virtual {p0, v1, v0}, Lbacktraceio/library/BacktraceClient;->addBreadcrumb(Ljava/lang/String;Ljava/util/Map;)Z

    return-void
.end method

.method public static startBacktrace(Landroid/content/Context;)V
    .locals 5

    .line 26
    sget-object v0, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    if-eqz v0, :cond_0

    return-void

    .line 32
    :cond_0
    new-instance v0, Lbacktraceio/library/BacktraceCredentials;

    const-string v1, "https://totentanz-9b.magica-us.com/backtrace"

    const-string v2, "snaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

    invoke-direct {v0, v1, v2}, Lbacktraceio/library/BacktraceCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 39
    new-instance v2, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;

    invoke-direct {v2, v1}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x64

    .line 40
    invoke-virtual {v2, v1}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->setMaxRecordCount(I)V

    const-wide/16 v3, 0x64

    .line 41
    invoke-virtual {v2, v3, v4}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->setMaxDatabaseSize(J)V

    .line 42
    sget-object v1, Lbacktraceio/library/enums/database/RetryBehavior;->ByInterval:Lbacktraceio/library/enums/database/RetryBehavior;

    invoke-virtual {v2, v1}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->setRetryBehavior(Lbacktraceio/library/enums/database/RetryBehavior;)V

    const/4 v1, 0x1

    .line 43
    invoke-virtual {v2, v1}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->setAutoSendMode(Z)V

    .line 44
    sget-object v3, Lbacktraceio/library/enums/database/RetryOrder;->Queue:Lbacktraceio/library/enums/database/RetryOrder;

    invoke-virtual {v2, v3}, Lbacktraceio/library/models/database/BacktraceDatabaseSettings;->setRetryOrder(Lbacktraceio/library/enums/database/RetryOrder;)V

    .line 46
    new-instance v3, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {v3, p0, v2}, Lbacktraceio/library/BacktraceDatabase;-><init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V

    .line 49
    new-instance v2, Lbacktraceio/library/BacktraceClient;

    invoke-direct {v2, p0, v0, v3}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;)V

    sput-object v2, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    .line 50
    invoke-virtual {v2}, Lbacktraceio/library/BacktraceClient;->enableNativeIntegration()V

    .line 52
    sget-object v2, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    const/16 v4, 0xbb8

    invoke-virtual {v2, v4}, Lbacktraceio/library/BacktraceClient;->enableAnr(I)V

    .line 54
    sget-object v2, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    invoke-virtual {v2, p0}, Lbacktraceio/library/BacktraceClient;->enableBreadcrumbs(Landroid/content/Context;)Z

    .line 56
    sget-object p0, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    invoke-virtual {p0}, Lbacktraceio/library/BacktraceClient;->enableProguard()V

    .line 59
    sget-object p0, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    invoke-static {p0}, Lbacktraceio/library/models/BacktraceExceptionHandler;->enable(Lbacktraceio/library/BacktraceClient;)V

    .line 61
    sget-object p0, Ljp/f4samurai/backtrace/BacktraceHandler;->sBacktraceClient:Lbacktraceio/library/BacktraceClient;

    invoke-virtual {v3, p0, v0, v1}, Lbacktraceio/library/BacktraceDatabase;->setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;Z)Ljava/lang/Boolean;

    return-void
.end method
