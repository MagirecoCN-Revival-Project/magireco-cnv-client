.class Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;
.super Ljava/io/ByteArrayOutputStream;
.source "FileObjectQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/tape/FileObjectQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DirectByteArrayOutputStream"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 115
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public getArray()[B
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/squareup/tape/FileObjectQueue$DirectByteArrayOutputStream;->buf:[B

    return-object v0
.end method
