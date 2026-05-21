.class public Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
.super Ljava/lang/Object;
.source "BacktraceDatabaseRecord.java"


# static fields
.field private static final transient LOG_TAG:Ljava/lang/String; = "BacktraceDatabaseRecord"


# instance fields
.field transient RecordWriter:Lbacktraceio/library/interfaces/DatabaseRecordWriter;

.field private final transient _path:Ljava/lang/String;

.field private diagnosticDataPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "DataPath"
    .end annotation
.end field

.field public id:Ljava/util/UUID;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Id"
    .end annotation
.end field

.field public transient locked:Z

.field private transient record:Lbacktraceio/library/models/BacktraceData;

.field private recordPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "RecordName"
    .end annotation
.end field

.field private reportPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ReportPath"
    .end annotation
.end field

.field private size:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Size"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 5

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    const/4 v1, 0x0

    .line 37
    iput-boolean v1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->locked:Z

    const-string v2, ""

    .line 74
    iput-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->_path:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v1

    const-string v0, "%s-record.json"

    .line 75
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->recordPath:Ljava/lang/String;

    new-array v3, v2, [Ljava/lang/Object;

    .line 76
    iget-object v4, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    aput-object v4, v3, v1

    const-string v4, "%s-attachment"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->diagnosticDataPath:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    .line 77
    iget-object v3, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->recordPath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lbacktraceio/library/models/BacktraceData;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "path"
        }
    .end annotation

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->locked:Z

    .line 81
    iget-object v0, p1, Lbacktraceio/library/models/BacktraceData;->uuid:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    .line 82
    iput-object p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->record:Lbacktraceio/library/models/BacktraceData;

    .line 83
    iput-object p2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->_path:Ljava/lang/String;

    .line 84
    new-instance p1, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;

    invoke-direct {p1, p2}, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->RecordWriter:Lbacktraceio/library/interfaces/DatabaseRecordWriter;

    return-void
.end method

.method private delete(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "path"
        }
    .end annotation

    .line 239
    :try_start_0
    invoke-static {p1}, Lbacktraceio/library/common/FileHelper;->isFileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 240
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Passed path exist, trying delete file on database record"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 244
    sget-object v1, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string p1, "Cannot delete file: %s"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public static readFromFile(Ljava/io/File;)Lbacktraceio/library/models/database/BacktraceDatabaseRecord;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .line 94
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Reading JSON from passed file"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-static {p0}, Lbacktraceio/library/common/FileHelper;->readFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    .line 96
    invoke-static {p0}, Lbacktraceio/library/common/BacktraceStringHelper;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p0, "JSON from passed file is null or empty"

    .line 97
    invoke-static {v0, p0}, Lbacktraceio/library/logger/BacktraceLogger;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0

    .line 100
    :cond_0
    const-class v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    invoke-static {p0, v0}, Lbacktraceio/library/common/BacktraceSerializeHelper;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;

    return-object p0
.end method

.method private save(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "prefix"
        }
    .end annotation

    const-string v0, ""

    if-nez p1, :cond_0

    .line 199
    :try_start_0
    sget-object p1, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string p2, "Passed data parameter is null"

    invoke-static {p1, p2}, Lbacktraceio/library/logger/BacktraceLogger;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    .line 202
    :cond_0
    invoke-static {p1}, Lbacktraceio/library/common/BacktraceSerializeHelper;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 203
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 204
    iget-wide v1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->size:J

    array-length v3, p1

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->size:J

    .line 205
    iget-object v1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->RecordWriter:Lbacktraceio/library/interfaces/DatabaseRecordWriter;

    invoke-interface {v1, p1, p2}, Lbacktraceio/library/interfaces/DatabaseRecordWriter;->write([BLjava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 207
    sget-object p2, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Received IOException while saving data to database"

    invoke-static {p2, v1, p1}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method


# virtual methods
.method public close()Z
    .locals 3

    .line 249
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Trying unlock database record"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .line 251
    :try_start_0
    iput-boolean v1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->locked:Z

    const/4 v2, 0x0

    .line 252
    iput-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->record:Lbacktraceio/library/models/BacktraceData;

    const-string v2, "Record unlocked"

    .line 253
    invoke-static {v0, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    .line 256
    :catch_0
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Can not unlock record"

    invoke-static {v0, v2}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public delete()V
    .locals 2

    .line 226
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Trying delete files from database"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->reportPath:Ljava/lang/String;

    invoke-direct {p0, v0}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->delete(Ljava/lang/String;)V

    .line 228
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->diagnosticDataPath:Ljava/lang/String;

    invoke-direct {p0, v0}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->delete(Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->recordPath:Ljava/lang/String;

    invoke-direct {p0, v0}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->delete(Ljava/lang/String;)V

    return-void
.end method

.method public getBacktraceData(Landroid/content/Context;)Lbacktraceio/library/models/BacktraceData;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->record:Lbacktraceio/library/models/BacktraceData;

    if-eqz v0, :cond_0

    return-object v0

    .line 134
    :cond_0
    invoke-virtual {p0}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->valid()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 135
    sget-object p1, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v0, "Database record is invalid"

    invoke-static {p1, v0}, Lbacktraceio/library/logger/BacktraceLogger;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    .line 139
    :cond_1
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->diagnosticDataPath:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lbacktraceio/library/common/FileHelper;->readFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 140
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->reportPath:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lbacktraceio/library/common/FileHelper;->readFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 144
    :try_start_0
    sget-object v3, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Deserialization diagnostic data"

    invoke-static {v3, v4}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    const-class v3, Lbacktraceio/library/models/BacktraceData;

    invoke-static {v0, v3}, Lbacktraceio/library/common/BacktraceSerializeHelper;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbacktraceio/library/models/BacktraceData;

    .line 152
    const-class v3, Lbacktraceio/library/models/json/BacktraceReport;

    invoke-static {v2, v3}, Lbacktraceio/library/common/BacktraceSerializeHelper;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbacktraceio/library/models/json/BacktraceReport;

    iput-object v2, v0, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    .line 155
    iput-object p1, v0, Lbacktraceio/library/models/BacktraceData;->context:Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 158
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Exception occurs on deserialization of diagnostic data"

    invoke-static {v0, v2, p1}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method public getDiagnosticDataPath()Ljava/lang/String;
    .locals 1

    .line 108
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->diagnosticDataPath:Ljava/lang/String;

    return-object v0
.end method

.method public getRecordPath()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->recordPath:Ljava/lang/String;

    return-object v0
.end method

.method public getReportPath()Ljava/lang/String;
    .locals 1

    .line 112
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->reportPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 116
    iget-wide v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->size:J

    return-wide v0
.end method

.method public save()Z
    .locals 8

    const/4 v0, 0x0

    .line 170
    :try_start_0
    sget-object v1, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Trying saving data to internal app storage"

    invoke-static {v1, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->record:Lbacktraceio/library/models/BacktraceData;

    const-string v3, "%s-attachment"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    iget-object v6, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    aput-object v6, v5, v0

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->save(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->diagnosticDataPath:Ljava/lang/String;

    .line 172
    iget-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->record:Lbacktraceio/library/models/BacktraceData;

    iget-object v2, v2, Lbacktraceio/library/models/BacktraceData;->report:Lbacktraceio/library/models/json/BacktraceReport;

    const-string v3, "%s-report"

    new-array v5, v4, [Ljava/lang/Object;

    iget-object v6, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    aput-object v6, v5, v0

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->save(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->reportPath:Ljava/lang/String;

    .line 174
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->_path:Ljava/lang/String;

    const-string v5, "%s-record.json"

    new-array v6, v4, [Ljava/lang/Object;

    iget-object v7, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    aput-object v7, v6, v0

    .line 175
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->recordPath:Ljava/lang/String;

    .line 177
    invoke-static {p0}, Lbacktraceio/library/common/BacktraceSerializeHelper;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 178
    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 179
    iget-wide v5, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->size:J

    array-length v2, v2

    int-to-long v2, v2

    add-long/2addr v5, v2

    iput-wide v5, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->size:J

    .line 180
    iget-object v2, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->RecordWriter:Lbacktraceio/library/interfaces/DatabaseRecordWriter;

    const-string v3, "%s-record"

    new-array v5, v4, [Ljava/lang/Object;

    iget-object v6, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->id:Ljava/util/UUID;

    aput-object v6, v5, v0

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p0, v3}, Lbacktraceio/library/interfaces/DatabaseRecordWriter;->write(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "Saving data to internal app storage successful"

    .line 181
    invoke-static {v1, v2}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v4

    :catch_0
    move-exception v1

    .line 184
    sget-object v2, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Received IOException while saving data to database"

    invoke-static {v2, v3, v1}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public setSize(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "size"
        }
    .end annotation

    .line 120
    iput-wide p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->size:J

    return-void
.end method

.method public valid()Z
    .locals 1

    .line 218
    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->diagnosticDataPath:Ljava/lang/String;

    invoke-static {v0}, Lbacktraceio/library/common/FileHelper;->isFileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecord;->reportPath:Ljava/lang/String;

    .line 219
    invoke-static {v0}, Lbacktraceio/library/common/FileHelper;->isFileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
