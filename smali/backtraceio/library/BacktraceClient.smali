.class public Lbacktraceio/library/BacktraceClient;
.super Lbacktraceio/library/base/BacktraceBase;
.source "BacktraceClient.java"


# instance fields
.field private anrWatchdog:Lbacktraceio/library/watchdog/BacktraceANRWatchdog;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials"
        }
    .end annotation

    const/4 v0, 0x0

    .line 34
    move-object v1, v0

    check-cast v1, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {p0, p1, p2, v0}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "database"
        }
    .end annotation

    .line 135
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "database",
            "attachments"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Lbacktraceio/library/interfaces/Database;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    .line 148
    invoke-direct/range {v0 .. v5}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "database",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Lbacktraceio/library/interfaces/Database;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 161
    invoke-direct/range {v0 .. v5}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "database",
            "attributes",
            "attachments"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Lbacktraceio/library/interfaces/Database;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 177
    invoke-direct/range {p0 .. p5}, Lbacktraceio/library/base/BacktraceBase;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "databaseSettings"
        }
    .end annotation

    .line 82
    new-instance v0, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {v0, p1, p3}, Lbacktraceio/library/BacktraceDatabase;-><init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V

    invoke-direct {p0, p1, p2, v0}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "databaseSettings",
            "attachments"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Lbacktraceio/library/models/database/BacktraceDatabaseSettings;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 95
    new-instance v0, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {v0, p1, p3}, Lbacktraceio/library/BacktraceDatabase;-><init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V

    invoke-direct {p0, p1, p2, v0, p4}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "databaseSettings",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Lbacktraceio/library/models/database/BacktraceDatabaseSettings;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 108
    new-instance v0, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {v0, p1, p3}, Lbacktraceio/library/BacktraceDatabase;-><init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V

    invoke-direct {p0, p1, p2, v0, p4}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;Ljava/util/Map;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "databaseSettings",
            "attributes",
            "attachments"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Lbacktraceio/library/models/database/BacktraceDatabaseSettings;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 123
    new-instance v3, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {v3, p1, p3}, Lbacktraceio/library/BacktraceDatabase;-><init>(Landroid/content/Context;Lbacktraceio/library/models/database/BacktraceDatabaseSettings;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "attachments"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 46
    move-object v1, v0

    check-cast v1, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {p0, p1, p2, v0, p3}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 57
    move-object v1, v0

    check-cast v1, Lbacktraceio/library/BacktraceDatabase;

    invoke-direct {p0, p1, p2, v0, p3}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Ljava/util/Map;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "credentials",
            "attributes",
            "attachments"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/BacktraceCredentials;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v3, 0x0

    .line 70
    move-object v0, v3

    check-cast v0, Lbacktraceio/library/BacktraceDatabase;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lbacktraceio/library/BacktraceClient;-><init>(Landroid/content/Context;Lbacktraceio/library/BacktraceCredentials;Lbacktraceio/library/interfaces/Database;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public disableAnr()V
    .locals 1

    .line 291
    iget-object v0, p0, Lbacktraceio/library/BacktraceClient;->anrWatchdog:Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 292
    iget-object v0, p0, Lbacktraceio/library/BacktraceClient;->anrWatchdog:Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

    invoke-virtual {v0}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->stopMonitoringAnr()V

    :cond_0
    return-void
.end method

.method public enableAnr()V
    .locals 1

    .line 243
    new-instance v0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

    invoke-direct {v0, p0}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;-><init>(Lbacktraceio/library/BacktraceClient;)V

    iput-object v0, p0, Lbacktraceio/library/BacktraceClient;->anrWatchdog:Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

    return-void
.end method

.method public enableAnr(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "timeout"
        }
    .end annotation

    const/4 v0, 0x0

    .line 252
    invoke-virtual {p0, p1, v0}, Lbacktraceio/library/BacktraceClient;->enableAnr(ILbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;)V

    return-void
.end method

.method public enableAnr(ILbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "onApplicationNotRespondingEvent"
        }
    .end annotation

    const/4 v0, 0x0

    .line 262
    invoke-virtual {p0, p1, p2, v0}, Lbacktraceio/library/BacktraceClient;->enableAnr(ILbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;Z)V

    return-void
.end method

.method public enableAnr(ILbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "timeout",
            "onApplicationNotRespondingEvent",
            "debug"
        }
    .end annotation

    .line 283
    new-instance v0, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

    invoke-direct {v0, p0, p1, p3}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;-><init>(Lbacktraceio/library/BacktraceClient;IZ)V

    iput-object v0, p0, Lbacktraceio/library/BacktraceClient;->anrWatchdog:Lbacktraceio/library/watchdog/BacktraceANRWatchdog;

    .line 284
    invoke-virtual {v0, p2}, Lbacktraceio/library/watchdog/BacktraceANRWatchdog;->setOnApplicationNotRespondingEvent(Lbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;)V

    return-void
.end method

.method public enableAnr(IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "debug"
        }
    .end annotation

    const/4 v0, 0x0

    .line 272
    invoke-virtual {p0, p1, v0, p2}, Lbacktraceio/library/BacktraceClient;->enableAnr(ILbacktraceio/library/watchdog/OnApplicationNotRespondingEvent;Z)V

    return-void
.end method

.method public send(Lbacktraceio/library/models/json/BacktraceReport;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "report"
        }
    .end annotation

    const/4 v0, 0x0

    .line 225
    invoke-virtual {p0, p1, v0}, Lbacktraceio/library/BacktraceClient;->send(Lbacktraceio/library/models/json/BacktraceReport;Lbacktraceio/library/events/OnServerResponseEventListener;)V

    return-void
.end method

.method public send(Lbacktraceio/library/models/json/BacktraceReport;Lbacktraceio/library/events/OnServerResponseEventListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "report",
            "serverResponseEventListener"
        }
    .end annotation

    .line 236
    invoke-super {p0, p1, p2}, Lbacktraceio/library/base/BacktraceBase;->send(Lbacktraceio/library/models/json/BacktraceReport;Lbacktraceio/library/events/OnServerResponseEventListener;)V

    return-void
.end method

.method public send(Ljava/lang/Exception;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "exception"
        }
    .end annotation

    const/4 v0, 0x0

    .line 205
    invoke-virtual {p0, p1, v0}, Lbacktraceio/library/BacktraceClient;->send(Ljava/lang/Exception;Lbacktraceio/library/events/OnServerResponseEventListener;)V

    return-void
.end method

.method public send(Ljava/lang/Exception;Lbacktraceio/library/events/OnServerResponseEventListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "exception",
            "serverResponseEventListener"
        }
    .end annotation

    .line 216
    new-instance v0, Lbacktraceio/library/models/json/BacktraceReport;

    invoke-direct {v0, p1}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;)V

    invoke-super {p0, v0, p2}, Lbacktraceio/library/base/BacktraceBase;->send(Lbacktraceio/library/models/json/BacktraceReport;Lbacktraceio/library/events/OnServerResponseEventListener;)V

    return-void
.end method

.method public send(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    const/4 v0, 0x0

    .line 186
    invoke-virtual {p0, p1, v0}, Lbacktraceio/library/BacktraceClient;->send(Ljava/lang/String;Lbacktraceio/library/events/OnServerResponseEventListener;)V

    return-void
.end method

.method public send(Ljava/lang/String;Lbacktraceio/library/events/OnServerResponseEventListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "serverResponseEventListener"
        }
    .end annotation

    .line 196
    new-instance v0, Lbacktraceio/library/models/json/BacktraceReport;

    invoke-direct {v0, p1}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/String;)V

    invoke-super {p0, v0, p2}, Lbacktraceio/library/base/BacktraceBase;->send(Lbacktraceio/library/models/json/BacktraceReport;Lbacktraceio/library/events/OnServerResponseEventListener;)V

    return-void
.end method
