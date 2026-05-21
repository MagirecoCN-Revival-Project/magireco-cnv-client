.class public Lcom/squareup/tape/FileObjectQueue;
.super Ljava/lang/Object;
.source "FileObjectQueue.java"

# interfaces
.implements Lcom/squareup/tape/ObjectQueue;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;,
        Lcom/squareup/tape/FileObjectQueue$Converter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/squareup/tape/ObjectQueue<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final bytes:Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;

.field private final converter:Lcom/squareup/tape/FileObjectQueue$Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/tape/FileObjectQueue$Converter<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final file:Ljava/io/File;

.field private listener:Lcom/squareup/tape/ObjectQueue$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/tape/ObjectQueue$Listener<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final queueFile:Lcom/squareup/tape/QueueFile;


# direct methods
.method public constructor <init>(Ljava/io/File;Lcom/squareup/tape/FileObjectQueue$Converter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lcom/squareup/tape/FileObjectQueue$Converter<",
            "TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;

    invoke-direct {v0}, Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->bytes:Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;

    .line 33
    iput-object p1, p0, Lcom/squareup/tape/FileObjectQueue;->file:Ljava/io/File;

    .line 34
    iput-object p2, p0, Lcom/squareup/tape/FileObjectQueue;->converter:Lcom/squareup/tape/FileObjectQueue$Converter;

    .line 35
    new-instance p2, Lcom/squareup/tape/QueueFile;

    invoke-direct {p2, p1}, Lcom/squareup/tape/QueueFile;-><init>(Ljava/io/File;)V

    iput-object p2, p0, Lcom/squareup/tape/FileObjectQueue;->queueFile:Lcom/squareup/tape/QueueFile;

    return-void
.end method

.method static synthetic access$000(Lcom/squareup/tape/FileObjectQueue;)Lcom/squareup/tape/FileObjectQueue$Converter;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/squareup/tape/FileObjectQueue;->converter:Lcom/squareup/tape/FileObjectQueue$Converter;

    return-object p0
.end method


# virtual methods
.method public final add(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 44
    :try_start_0
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->bytes:Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;

    invoke-virtual {v0}, Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;->reset()V

    .line 45
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->converter:Lcom/squareup/tape/FileObjectQueue$Converter;

    iget-object v1, p0, Lcom/squareup/tape/FileObjectQueue;->bytes:Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;

    invoke-interface {v0, p1, v1}, Lcom/squareup/tape/FileObjectQueue$Converter;->toStream(Ljava/lang/Object;Ljava/io/OutputStream;)V

    .line 46
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->queueFile:Lcom/squareup/tape/QueueFile;

    iget-object v1, p0, Lcom/squareup/tape/FileObjectQueue;->bytes:Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;

    invoke-virtual {v1}, Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;->getArray()[B

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/squareup/tape/FileObjectQueue;->bytes:Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;

    invoke-virtual {v3}, Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;->size()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/squareup/tape/QueueFile;->add([BII)V

    .line 47
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->listener:Lcom/squareup/tape/ObjectQueue$Listener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0, p1}, Lcom/squareup/tape/ObjectQueue$Listener;->onAdd(Lcom/squareup/tape/ObjectQueue;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p1

    .line 49
    new-instance v0, Lcom/squareup/tape/FileException;

    iget-object v1, p0, Lcom/squareup/tape/FileObjectQueue;->file:Ljava/io/File;

    const-string v2, "Failed to add entry."

    invoke-direct {v0, v2, p1, v1}, Lcom/squareup/tape/FileException;-><init>(Ljava/lang/String;Ljava/io/IOException;Ljava/io/File;)V

    throw v0
.end method

.method public final close()V
    .locals 4

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->queueFile:Lcom/squareup/tape/QueueFile;

    invoke-virtual {v0}, Lcom/squareup/tape/QueueFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 76
    new-instance v1, Lcom/squareup/tape/FileException;

    iget-object v2, p0, Lcom/squareup/tape/FileObjectQueue;->file:Ljava/io/File;

    const-string v3, "Failed to close."

    invoke-direct {v1, v3, v0, v2}, Lcom/squareup/tape/FileException;-><init>(Ljava/lang/String;Ljava/io/IOException;Ljava/io/File;)V

    throw v1
.end method

.method public peek()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->queueFile:Lcom/squareup/tape/QueueFile;

    invoke-virtual {v0}, Lcom/squareup/tape/QueueFile;->peek()[B

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 57
    :cond_0
    iget-object v1, p0, Lcom/squareup/tape/FileObjectQueue;->converter:Lcom/squareup/tape/FileObjectQueue$Converter;

    invoke-interface {v1, v0}, Lcom/squareup/tape/FileObjectQueue$Converter;->from([B)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 59
    new-instance v1, Lcom/squareup/tape/FileException;

    iget-object v2, p0, Lcom/squareup/tape/FileObjectQueue;->file:Ljava/io/File;

    const-string v3, "Failed to peek."

    invoke-direct {v1, v3, v0, v2}, Lcom/squareup/tape/FileException;-><init>(Ljava/lang/String;Ljava/io/IOException;Ljava/io/File;)V

    throw v1
.end method

.method public final remove()V
    .locals 4

    .line 65
    :try_start_0
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->queueFile:Lcom/squareup/tape/QueueFile;

    invoke-virtual {v0}, Lcom/squareup/tape/QueueFile;->remove()V

    .line 66
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->listener:Lcom/squareup/tape/ObjectQueue$Listener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0}, Lcom/squareup/tape/ObjectQueue$Listener;->onRemove(Lcom/squareup/tape/ObjectQueue;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 68
    new-instance v1, Lcom/squareup/tape/FileException;

    iget-object v2, p0, Lcom/squareup/tape/FileObjectQueue;->file:Ljava/io/File;

    const-string v3, "Failed to remove."

    invoke-direct {v1, v3, v0, v2}, Lcom/squareup/tape/FileException;-><init>(Ljava/lang/String;Ljava/io/IOException;Ljava/io/File;)V

    throw v1
.end method

.method public setListener(Lcom/squareup/tape/ObjectQueue$Listener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/tape/ObjectQueue$Listener<",
            "TT;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->queueFile:Lcom/squareup/tape/QueueFile;

    new-instance v1, Lcom/squareup/tape/FileObjectQueue$1;

    invoke-direct {v1, p0, p1}, Lcom/squareup/tape/FileObjectQueue$1;-><init>(Lcom/squareup/tape/FileObjectQueue;Lcom/squareup/tape/ObjectQueue$Listener;)V

    invoke-virtual {v0, v1}, Lcom/squareup/tape/QueueFile;->forEach(Lcom/squareup/tape/QueueFile$ElementReader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 93
    new-instance v0, Lcom/squareup/tape/FileException;

    iget-object v1, p0, Lcom/squareup/tape/FileObjectQueue;->file:Ljava/io/File;

    const-string v2, "Unable to iterate over QueueFile contents."

    invoke-direct {v0, v2, p1, v1}, Lcom/squareup/tape/FileException;-><init>(Ljava/lang/String;Ljava/io/IOException;Ljava/io/File;)V

    throw v0

    .line 96
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/squareup/tape/FileObjectQueue;->listener:Lcom/squareup/tape/ObjectQueue$Listener;

    return-void
.end method

.method public size()I
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue;->queueFile:Lcom/squareup/tape/QueueFile;

    invoke-virtual {v0}, Lcom/squareup/tape/QueueFile;->size()I

    move-result v0

    return v0
.end method
