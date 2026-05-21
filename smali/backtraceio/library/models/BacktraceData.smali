.class public Lbacktraceio/library/models/BacktraceData;
.super Ljava/lang/Object;
.source "BacktraceData.java"


# static fields
.field private static final transient LOG_TAG:Ljava/lang/String; = "BacktraceData"


# instance fields
.field public final agent:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "agent"
    .end annotation
.end field

.field public agentVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "agentVersion"
    .end annotation
.end field

.field public annotations:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "annotations"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public attributes:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "attributes"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public classifiers:[Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "classifiers"
    .end annotation
.end field

.field public transient context:Landroid/content/Context;

.field public final lang:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lang"
    .end annotation
.end field

.field public langVersion:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "langVersion"
    .end annotation
.end field

.field public mainThread:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "mainThread"
    .end annotation
.end field

.field public transient report:Lbacktraceio/library/models/json/BacktraceReport;

.field public sourceCode:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sourceCode"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lbacktraceio/library/models/json/SourceCode;",
            ">;"
        }
    .end annotation
.end field

.field public symbolication:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "symbolication"
    .end annotation
.end field

.field threadInformationMap:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "threads"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lbacktraceio/library/models/json/ThreadInformation;",
            ">;"
        }
    .end annotation
.end field

.field public timestamp:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "timestamp"
    .end annotation
.end field

.field public uuid:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "uuid"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "report",
            "clientAttributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lbacktraceio/library/models/json/BacktraceReport;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "java"

    .line 30
    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->lang:Ljava/lang/String;

    const-string v0, "backtrace-android"

    .line 36
    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->agent:Ljava/lang/String;

    if-nez p2, :cond_0

    return-void

    .line 126
    :cond_0
    iput-object p1, p0, Lbacktraceio/library/models/BacktraceData;->context:Landroid/content/Context;

    .line 127
    iput-object p2, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    .line 129
    invoke-direct {p0}, Lbacktraceio/library/models/BacktraceData;->setReportInformation()V

    .line 130
    invoke-direct {p0}, Lbacktraceio/library/models/BacktraceData;->setThreadsInformation()V

    .line 131
    invoke-direct {p0, p3}, Lbacktraceio/library/models/BacktraceData;->setAttributes(Ljava/util/Map;)V

    return-void
.end method

.method private setAnnotations(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "complexAttributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 148
    sget-object v0, Lbacktraceio/library/models/BacktraceData;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Setting annotations"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    iget-object v0, p0, Lbacktraceio/library/models/BacktraceData;->attributes:Ljava/util/Map;

    if-eqz v0, :cond_0

    const-string v1, "error.message"

    .line 152
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lbacktraceio/library/models/BacktraceData;->attributes:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 155
    :goto_0
    invoke-static {v0, p1}, Lbacktraceio/library/models/json/Annotations;->getAnnotations(Ljava/lang/Object;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lbacktraceio/library/models/BacktraceData;->annotations:Ljava/util/Map;

    return-void
.end method

.method private setAttributes(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "clientAttributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 164
    sget-object v0, Lbacktraceio/library/models/BacktraceData;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Setting attributes"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    new-instance v0, Lbacktraceio/library/models/json/BacktraceAttributes;

    iget-object v1, p0, Lbacktraceio/library/models/BacktraceData;->context:Landroid/content/Context;

    iget-object v2, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    invoke-direct {v0, v1, v2, p1}, Lbacktraceio/library/models/json/BacktraceAttributes;-><init>(Landroid/content/Context;Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;)V

    .line 167
    iget-object p1, v0, Lbacktraceio/library/models/json/BacktraceAttributes;->attributes:Ljava/util/Map;

    iput-object p1, p0, Lbacktraceio/library/models/BacktraceData;->attributes:Ljava/util/Map;

    .line 169
    invoke-virtual {v0}, Lbacktraceio/library/models/json/BacktraceAttributes;->getComplexAttributes()Ljava/util/Map;

    move-result-object p1

    invoke-direct {p0, p1}, Lbacktraceio/library/models/BacktraceData;->setAnnotations(Ljava/util/Map;)V

    return-void
.end method

.method private setReportInformation()V
    .locals 3

    .line 176
    sget-object v0, Lbacktraceio/library/models/BacktraceData;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Setting report information"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    iget-object v0, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    iget-object v0, v0, Lbacktraceio/library/models/json/BacktraceReport;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->uuid:Ljava/lang/String;

    .line 178
    iget-object v0, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    iget-wide v0, v0, Lbacktraceio/library/models/json/BacktraceReport;->timestamp:J

    iput-wide v0, p0, Lbacktraceio/library/models/BacktraceData;->timestamp:J

    .line 179
    iget-object v0, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    iget-object v0, v0, Lbacktraceio/library/models/json/BacktraceReport;->exceptionTypeReport:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    iget-object v2, v2, Lbacktraceio/library/models/json/BacktraceReport;->classifier:Ljava/lang/String;

    aput-object v2, v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->classifiers:[Ljava/lang/String;

    const-string v0, "java.version"

    .line 180
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->langVersion:Ljava/lang/String;

    .line 181
    sget-object v0, Lbacktraceio/library/BacktraceClient;->version:Ljava/lang/String;

    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->agentVersion:Ljava/lang/String;

    return-void
.end method

.method private setThreadsInformation()V
    .locals 2

    .line 188
    sget-object v0, Lbacktraceio/library/models/BacktraceData;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Setting threads information"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    new-instance v0, Lbacktraceio/library/models/json/ThreadData;

    iget-object v1, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    iget-object v1, v1, Lbacktraceio/library/models/json/BacktraceReport;->diagnosticStack:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lbacktraceio/library/models/json/ThreadData;-><init>(Ljava/util/ArrayList;)V

    .line 190
    invoke-virtual {v0}, Lbacktraceio/library/models/json/ThreadData;->getMainThread()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lbacktraceio/library/models/BacktraceData;->mainThread:Ljava/lang/String;

    .line 191
    iget-object v0, v0, Lbacktraceio/library/models/json/ThreadData;->threadInformation:Ljava/util/HashMap;

    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->threadInformationMap:Ljava/util/Map;

    .line 192
    new-instance v0, Lbacktraceio/library/models/json/SourceCodeData;

    iget-object v1, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    iget-object v1, v1, Lbacktraceio/library/models/json/BacktraceReport;->diagnosticStack:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lbacktraceio/library/models/json/SourceCodeData;-><init>(Ljava/util/ArrayList;)V

    .line 193
    iget-object v1, v0, Lbacktraceio/library/models/json/SourceCodeData;->data:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, v0, Lbacktraceio/library/models/json/SourceCodeData;->data:Ljava/util/Map;

    :goto_0
    iput-object v0, p0, Lbacktraceio/library/models/BacktraceData;->sourceCode:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getAttachments()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 140
    iget-object v0, p0, Lbacktraceio/library/models/BacktraceData;->context:Landroid/content/Context;

    iget-object v1, p0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    iget-object v1, v1, Lbacktraceio/library/models/json/BacktraceReport;->attachmentPaths:Ljava/util/List;

    invoke-static {v0, v1}, Lbacktraceio/library/common/FileHelper;->filterOutFiles(Landroid/content/Context;Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method
