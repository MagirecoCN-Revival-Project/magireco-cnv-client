.class public interface abstract Lbacktraceio/library/interfaces/Database;
.super Ljava/lang/Object;
.source "Database.java"


# virtual methods
.method public abstract add(Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
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
.end method

.method public abstract add(Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;Z)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
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
.end method

.method public abstract clear()V
.end method

.method public abstract delete(Lbacktraceio/library/models/database/BacktraceDatabaseRecord;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "record"
        }
    .end annotation
.end method

.method public abstract disableNativeIntegration()V
.end method

.method public abstract flush()V
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

.method public abstract getBreadcrumbs()Lbacktraceio/library/interfaces/Breadcrumbs;
.end method

.method public abstract getDatabaseSize()J
.end method

.method public abstract getSettings()Lbacktraceio/library/models/database/BacktraceDatabaseSettings;
.end method

.method public abstract setApi(Lbacktraceio/library/interfaces/Api;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceApi"
        }
    .end annotation
.end method

.method public abstract setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;)Ljava/lang/Boolean;
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
.end method

.method public abstract setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;Z)Ljava/lang/Boolean;
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
.end method

.method public abstract setupNativeIntegration(Lbacktraceio/library/base/BacktraceBase;Lbacktraceio/library/BacktraceCredentials;ZLbacktraceio/library/enums/UnwindingMode;)Ljava/lang/Boolean;
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
.end method

.method public abstract start()V
.end method

.method public abstract validConsistency()Z
.end method
