.class public Lcz/msebera/android/httpclient/entity/InputStreamEntity;
.super Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;
.source "InputStreamEntity.java"


# instance fields
.field private final content:Ljava/io/InputStream;

.field private final length:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    const-wide/16 v0, -0x1

    .line 58
    invoke-direct {p0, p1, v0, v1}, Lcz/msebera/android/httpclient/entity/InputStreamEntity;-><init>(Ljava/io/InputStream;J)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;J)V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-direct {p0, p1, p2, p3, v0}, Lcz/msebera/android/httpclient/entity/InputStreamEntity;-><init>(Ljava/io/InputStream;JLcz/msebera/android/httpclient/entity/ContentType;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JLcz/msebera/android/httpclient/entity/ContentType;)V
    .locals 1

    .line 93
    invoke-direct {p0}, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;-><init>()V

    const-string v0, "Source input stream"

    .line 94
    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/InputStream;

    iput-object p1, p0, Lcz/msebera/android/httpclient/entity/InputStreamEntity;->content:Ljava/io/InputStream;

    .line 95
    iput-wide p2, p0, Lcz/msebera/android/httpclient/entity/InputStreamEntity;->length:J

    if-eqz p4, :cond_0

    .line 97
    invoke-virtual {p4}, Lcz/msebera/android/httpclient/entity/ContentType;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/entity/InputStreamEntity;->setContentType(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lcz/msebera/android/httpclient/entity/ContentType;)V
    .locals 2

    const-wide/16 v0, -0x1

    .line 82
    invoke-direct {p0, p1, v0, v1, p2}, Lcz/msebera/android/httpclient/entity/InputStreamEntity;-><init>(Ljava/io/InputStream;JLcz/msebera/android/httpclient/entity/ContentType;)V

    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lcz/msebera/android/httpclient/entity/InputStreamEntity;->content:Ljava/io/InputStream;

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .line 111
    iget-wide v0, p0, Lcz/msebera/android/httpclient/entity/InputStreamEntity;->length:J

    return-wide v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Output stream"

    .line 128
    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 129
    iget-object v0, p0, Lcz/msebera/android/httpclient/entity/InputStreamEntity;->content:Ljava/io/InputStream;

    const/16 v1, 0x1000

    :try_start_0
    new-array v1, v1, [B

    .line 133
    iget-wide v2, p0, Lcz/msebera/android/httpclient/entity/InputStreamEntity;->length:J

    const/4 v4, -0x1

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    cmp-long v8, v2, v5

    if-gez v8, :cond_0

    .line 135
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-eq v2, v4, :cond_2

    .line 136
    invoke-virtual {p1, v1, v7, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    :goto_1
    cmp-long v8, v2, v5

    if-lez v8, :cond_2

    const-wide/16 v8, 0x1000

    .line 142
    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v9, v8

    invoke-virtual {v0, v1, v7, v9}, Ljava/io/InputStream;->read([BII)I

    move-result v8

    if-ne v8, v4, :cond_1

    goto :goto_2

    .line 146
    :cond_1
    invoke-virtual {p1, v1, v7, v8}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    int-to-long v8, v8

    sub-long/2addr v2, v8

    goto :goto_1

    .line 151
    :cond_2
    :goto_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw p1
.end method
