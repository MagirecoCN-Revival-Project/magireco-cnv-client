.class public Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;
.super Ljava/lang/Object;
.source "BacktraceDatabaseRecordWriter.java"

# interfaces
.implements Lbacktraceio/library/interfaces/DatabaseRecordWriter;


# static fields
.field private static final transient LOG_TAG:Ljava/lang/String; = "BacktraceDatabaseRecordWriter"


# instance fields
.field private final _destinationPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "path"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->_destinationPath:Ljava/lang/String;

    return-void
.end method

.method private saveTemporaryFile(Ljava/lang/String;[B)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "path",
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Saving temporary file"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 88
    invoke-virtual {v0, p2}, Ljava/io/FileOutputStream;->write([B)V

    .line 89
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    return-void
.end method

.method private saveValidRecord(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourcePath",
            "destinationPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 70
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 73
    :cond_0
    sget-object v0, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Can not rename file"

    invoke-static {v0, v1}, Lbacktraceio/library/logger/BacktraceLogger;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    new-instance v0, Ljava/io/IOException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    const-string p1, "Can not rename file. Source path: %s, destination path: %s"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private toJsonFile(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 55
    sget-object p1, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->LOG_TAG:Ljava/lang/String;

    const-string v0, "Passed object to serialization is null"

    invoke-static {p1, v0}, Lbacktraceio/library/logger/BacktraceLogger;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, ""

    return-object p1

    .line 58
    :cond_0
    invoke-static {p1}, Lbacktraceio/library/common/BacktraceSerializeHelper;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public write(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    invoke-direct {p0, p1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->toJsonFile(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 33
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 34
    invoke-virtual {p0, p1, p2}, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->write([BLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public write([BLjava/lang/String;)Ljava/lang/String;
    .locals 4
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const-string p2, "%s.json"

    .line 38
    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 39
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->_destinationPath:Ljava/lang/String;

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p2, v0, v2

    const-string v2, "temp_%s"

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 40
    invoke-direct {p0, v0, p1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->saveTemporaryFile(Ljava/lang/String;[B)V

    .line 42
    new-instance p1, Ljava/io/File;

    iget-object v1, p0, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->_destinationPath:Ljava/lang/String;

    invoke-direct {p1, v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    .line 43
    invoke-direct {p0, v0, p1}, Lbacktraceio/library/models/database/BacktraceDatabaseRecordWriter;->saveValidRecord(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method
