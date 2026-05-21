.class final Lcom/google/android/gms/internal/gtm/zzsn;
.super Lcom/google/android/gms/internal/gtm/zzsp;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"


# instance fields
.field private final zza:[B

.field private zzb:I

.field private zzc:I

.field private zzd:I

.field private zze:I


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;Z)V
    .locals 1

    const/4 p2, 0x0

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/gtm/zzsp;-><init>(Lcom/google/android/gms/internal/gtm/zzso;)V

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    .line 2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result p2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/2addr p2, v0

    iput p2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result p2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result p1

    add-int/2addr p2, p1

    iput p2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    return-void
.end method

.method private final zzU()B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    if-eq v0, v1, :cond_0

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 2
    aget-byte v0, v1, v0

    return v0

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzj()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0
.end method

.method private final zzV()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x4

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzW()I

    move-result v0

    return v0
.end method

.method private final zzW()I
    .locals 4

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    add-int/lit8 v2, v0, 0x4

    iput v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 1
    aget-byte v2, v1, v0

    and-int/lit16 v2, v2, 0xff

    add-int/lit8 v3, v0, 0x1

    aget-byte v3, v1, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    add-int/lit8 v3, v0, 0x2

    aget-byte v3, v1, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    add-int/lit8 v0, v0, 0x3

    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    or-int/2addr v0, v2

    return v0
.end method

.method private final zzX()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    if-eq v1, v0, :cond_8

    .line 1
    iget-object v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    add-int/lit8 v3, v0, 0x1

    .line 2
    aget-byte v0, v2, v0

    if-ltz v0, :cond_0

    iput v3, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return v0

    :cond_0
    sub-int/2addr v1, v3

    const/16 v4, 0x9

    if-ge v1, v4, :cond_1

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaa()J

    move-result-wide v0

    long-to-int v1, v0

    return v1

    :cond_1
    add-int/lit8 v1, v3, 0x1

    .line 4
    aget-byte v3, v2, v3

    shl-int/lit8 v3, v3, 0x7

    xor-int/2addr v0, v3

    if-gez v0, :cond_2

    xor-int/lit8 v0, v0, -0x80

    goto :goto_0

    :cond_2
    add-int/lit8 v3, v1, 0x1

    .line 5
    aget-byte v1, v2, v1

    shl-int/lit8 v1, v1, 0xe

    xor-int/2addr v0, v1

    if-ltz v0, :cond_4

    xor-int/lit16 v0, v0, 0x3f80

    :cond_3
    move v1, v3

    goto :goto_0

    :cond_4
    add-int/lit8 v1, v3, 0x1

    .line 6
    aget-byte v3, v2, v3

    shl-int/lit8 v3, v3, 0x15

    xor-int/2addr v0, v3

    if-gez v0, :cond_5

    const v2, -0x1fc080

    xor-int/2addr v0, v2

    goto :goto_0

    :cond_5
    add-int/lit8 v3, v1, 0x1

    .line 7
    aget-byte v1, v2, v1

    shl-int/lit8 v4, v1, 0x1c

    xor-int/2addr v0, v4

    const v4, 0xfe03f80

    xor-int/2addr v0, v4

    if-gez v1, :cond_3

    add-int/lit8 v1, v3, 0x1

    .line 8
    aget-byte v3, v2, v3

    if-gez v3, :cond_7

    add-int/lit8 v3, v1, 0x1

    aget-byte v1, v2, v1

    if-gez v1, :cond_3

    add-int/lit8 v1, v3, 0x1

    aget-byte v3, v2, v3

    if-gez v3, :cond_7

    add-int/lit8 v3, v1, 0x1

    aget-byte v1, v2, v1

    if-gez v1, :cond_3

    add-int/lit8 v1, v3, 0x1

    aget-byte v2, v2, v3

    if-ltz v2, :cond_6

    goto :goto_0

    .line 9
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zze()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0

    .line 4
    :cond_7
    :goto_0
    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return v0

    .line 1
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzj()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0
.end method

.method private final zzY()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzZ()J

    move-result-wide v0

    return-wide v0
.end method

.method private final zzZ()J
    .locals 9

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    add-int/lit8 v2, v0, 0x8

    iput v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 1
    aget-byte v2, v1, v0

    int-to-long v2, v2

    const-wide/16 v4, 0xff

    and-long/2addr v2, v4

    add-int/lit8 v6, v0, 0x1

    aget-byte v6, v1, v6

    int-to-long v6, v6

    and-long/2addr v6, v4

    const/16 v8, 0x8

    shl-long/2addr v6, v8

    or-long/2addr v2, v6

    add-int/lit8 v6, v0, 0x2

    aget-byte v6, v1, v6

    int-to-long v6, v6

    and-long/2addr v6, v4

    const/16 v8, 0x10

    shl-long/2addr v6, v8

    or-long/2addr v2, v6

    add-int/lit8 v6, v0, 0x3

    aget-byte v6, v1, v6

    int-to-long v6, v6

    and-long/2addr v6, v4

    const/16 v8, 0x18

    shl-long/2addr v6, v8

    or-long/2addr v2, v6

    add-int/lit8 v6, v0, 0x4

    aget-byte v6, v1, v6

    int-to-long v6, v6

    and-long/2addr v6, v4

    const/16 v8, 0x20

    shl-long/2addr v6, v8

    or-long/2addr v2, v6

    add-int/lit8 v6, v0, 0x5

    aget-byte v6, v1, v6

    int-to-long v6, v6

    and-long/2addr v6, v4

    const/16 v8, 0x28

    shl-long/2addr v6, v8

    or-long/2addr v2, v6

    add-int/lit8 v6, v0, 0x6

    aget-byte v6, v1, v6

    int-to-long v6, v6

    and-long/2addr v6, v4

    const/16 v8, 0x30

    shl-long/2addr v6, v8

    or-long/2addr v2, v6

    add-int/lit8 v0, v0, 0x7

    aget-byte v0, v1, v0

    int-to-long v0, v0

    and-long/2addr v0, v4

    const/16 v4, 0x38

    shl-long/2addr v0, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private final zzaa()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x40

    if-ge v2, v3, :cond_1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzU()B

    move-result v3

    and-int/lit8 v4, v3, 0x7f

    int-to-long v4, v4

    shl-long/2addr v4, v2

    or-long/2addr v0, v4

    and-int/lit16 v3, v3, 0x80

    if-nez v3, :cond_0

    return-wide v0

    :cond_0
    add-int/lit8 v2, v2, 0x7

    goto :goto_0

    .line 2
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zze()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0
.end method

.method private final zzab(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/gtm/zzwx<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    ushr-int/lit8 v1, v1, 0x3

    shl-int/lit8 v1, v1, 0x3

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    .line 1
    :try_start_0
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzwx;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 2
    invoke-interface {p1, v1, p0, p2}, Lcom/google/android/gms/internal/gtm/zzwx;->zzh(Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzww;Lcom/google/android/gms/internal/gtm/zzuj;)V

    .line 3
    invoke-interface {p1, v1}, Lcom/google/android/gms/internal/gtm/zzwx;->zzf(Ljava/lang/Object;)V

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    iget p2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, p2, :cond_0

    .line 5
    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    return-object v1

    .line 4
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzg()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    .line 5
    throw p1
.end method

.method private final zzac(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/gtm/zzwx<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 2
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    .line 3
    :try_start_0
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzwx;->zze()Ljava/lang/Object;

    move-result-object v0

    .line 4
    invoke-interface {p1, v0, p0, p2}, Lcom/google/android/gms/internal/gtm/zzwx;->zzh(Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzww;Lcom/google/android/gms/internal/gtm/zzuj;)V

    .line 5
    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/gtm/zzwx;->zzf(Ljava/lang/Object;)V

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, v2, :cond_0

    .line 7
    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    return-object v0

    .line 6
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzg()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    .line 7
    throw p1
.end method

.method private final zzad(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzj()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1
.end method

.method private final zzae(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ne v0, p1, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzj()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1
.end method

.method private final zzaf(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-ne v0, p1, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method private final zzag(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method private final zzah(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    and-int/lit8 p1, p1, 0x3

    if-nez p1, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzg()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1
.end method

.method private final zzai(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    and-int/lit8 p1, p1, 0x7

    if-nez p1, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzg()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1
.end method

.method private final zzaj()Z
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final zzA(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzug;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzug;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_1

    if-ne p1, v1, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    .line 4
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzai(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_4

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzZ()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzug;->zze(D)V

    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zza()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzug;->zze(D)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 5
    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_6

    if-ne v0, v1, :cond_5

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 10
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzai(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_4

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzZ()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void

    .line 14
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 12
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zza()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzB(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzva;

    const/4 v1, 0x2

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzva;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_1

    if-ne p1, v1, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_4

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zze()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 4
    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_6

    if-ne v0, v1, :cond_5

    .line 8
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_4

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void

    .line 12
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 10
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zze()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzC(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzva;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_4

    .line 2
    check-cast p1, Lcom/google/android/gms/internal/gtm/zzva;

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_3

    if-ne v0, v1, :cond_2

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzf()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 8
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 6
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzah(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_9

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzW()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    goto :goto_0

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_8

    if-ne v0, v1, :cond_7

    .line 9
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzf()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_6

    return-void

    :cond_6
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_5

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 14
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 11
    :cond_8
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 12
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzah(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_9

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzW()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_9
    return-void
.end method

.method public final zzD(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzvz;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_1

    if-ne p1, v1, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    .line 4
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzai(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_4

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzZ()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzk()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 5
    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_6

    if-ne v0, v1, :cond_5

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 10
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzai(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_4

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzZ()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void

    .line 14
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 12
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzk()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzE(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzuq;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_4

    .line 2
    check-cast p1, Lcom/google/android/gms/internal/gtm/zzuq;

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_3

    if-ne v0, v1, :cond_2

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzb()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzuq;->zze(F)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 8
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 6
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzah(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_9

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzW()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzuq;->zze(F)V

    goto :goto_0

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_8

    if-ne v0, v1, :cond_7

    .line 9
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzb()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_6

    return-void

    :cond_6
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_5

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 14
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 11
    :cond_8
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 12
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzah(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_9

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzW()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_9
    return-void
.end method

.method public final zzF(Ljava/util/List;Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzwx<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    .line 1
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/gtm/zzsn;->zzab(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v2

    if-eq v2, v0, :cond_0

    .line 3
    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method public final zzG(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzva;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzva;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_0

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    goto :goto_0

    .line 5
    :cond_0
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzg()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_5

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 11
    :cond_5
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 14
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 12
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzg()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzH(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzvz;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    goto :goto_0

    .line 5
    :cond_0
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzl()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_5

    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 11
    :cond_5
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 14
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 12
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzl()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzI(Ljava/util/List;Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzwx<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 1
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/gtm/zzsn;->zzac(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v2

    if-eq v2, v0, :cond_0

    .line 3
    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method public final zzJ(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzva;

    const/4 v1, 0x5

    const/4 v2, 0x2

    if-eqz v0, :cond_4

    .line 2
    check-cast p1, Lcom/google/android/gms/internal/gtm/zzva;

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_3

    if-ne v0, v1, :cond_2

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzh()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 8
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 6
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzah(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_9

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzW()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    goto :goto_0

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_8

    if-ne v0, v1, :cond_7

    .line 9
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzh()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_6

    return-void

    :cond_6
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_5

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 14
    :cond_7
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 11
    :cond_8
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 12
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzah(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_9

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzW()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_9
    return-void
.end method

.method public final zzK(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzvz;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_1

    if-ne p1, v1, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    .line 4
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzai(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_4

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzZ()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzm()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 5
    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_6

    if-ne v0, v1, :cond_5

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    .line 10
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzai(I)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_4

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzZ()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void

    .line 14
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 12
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzm()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzL(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzva;

    const/4 v1, 0x2

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzva;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_1

    if-ne p1, v1, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_4

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzs(I)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzi()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 4
    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_6

    if-ne v0, v1, :cond_5

    .line 8
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_4

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzs(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void

    .line 12
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 10
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzi()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzM(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzvz;

    const/4 v1, 0x2

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_1

    if-ne p1, v1, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_4

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/gtm/zztj;->zzt(J)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzn()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 4
    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_6

    if-ne v0, v1, :cond_5

    .line 8
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_4

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/gtm/zztj;->zzt(J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void

    .line 12
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 10
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzn()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzN(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzO(Ljava/util/List;Z)V

    return-void
.end method

.method public final zzO(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_5

    .line 2
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzvs;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p2, :cond_3

    .line 5
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvs;

    .line 6
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzq()Lcom/google/android/gms/internal/gtm/zztd;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/gtm/zzvs;->zzi(Lcom/google/android/gms/internal/gtm/zztd;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p2

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq p2, v1, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 3
    :cond_3
    :goto_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/gtm/zzsn;->zzw(Z)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_4

    return-void

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_3

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 1
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method public final zzP(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzO(Ljava/util/List;Z)V

    return-void
.end method

.method public final zzQ(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzva;

    const/4 v1, 0x2

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzva;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_1

    if-ne p1, v1, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_4

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzj()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 4
    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_6

    if-ne v0, v1, :cond_5

    .line 8
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_4

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void

    .line 12
    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 10
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzj()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzR(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzvz;

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v1, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    goto :goto_0

    .line 5
    :cond_0
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 8
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzo()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    :goto_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v1, :cond_5

    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 11
    :cond_5
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 14
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 12
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzo()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzS()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public final zzT()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    if-ne v0, v2, :cond_0

    goto/16 :goto_3

    :cond_0
    and-int/lit8 v3, v0, 0x7

    const/4 v4, 0x1

    if-eqz v3, :cond_8

    if-eq v3, v4, :cond_7

    const/4 v1, 0x2

    if-eq v3, v1, :cond_6

    const/4 v1, 0x4

    const/4 v5, 0x3

    if-eq v3, v5, :cond_2

    const/4 v0, 0x5

    if-ne v3, v0, :cond_1

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zzsn;->zzag(I)V

    return v4

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object v0

    throw v0

    :cond_2
    ushr-int/2addr v0, v5

    shl-int/2addr v0, v5

    or-int/2addr v0, v1

    .line 2
    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    .line 4
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzc()I

    move-result v0

    const v1, 0x7fffffff

    if-eq v0, v1, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzT()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    if-ne v0, v1, :cond_5

    .line 5
    iput v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    return v4

    :cond_5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzg()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0

    .line 7
    :cond_6
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzag(I)V

    return v4

    :cond_7
    const/16 v0, 0x8

    .line 8
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzag(I)V

    return v4

    .line 0
    :cond_8
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    sub-int/2addr v0, v2

    const/16 v3, 0xa

    if-lt v0, v3, :cond_a

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_a

    add-int/lit8 v6, v2, 0x1

    .line 1
    aget-byte v2, v0, v2

    if-ltz v2, :cond_9

    iput v6, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    goto :goto_2

    :cond_9
    add-int/lit8 v5, v5, 0x1

    move v2, v6

    goto :goto_0

    :cond_a
    :goto_1
    if-ge v1, v3, :cond_c

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzU()B

    move-result v0

    if-gez v0, :cond_b

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_b
    :goto_2
    return v4

    .line 3
    :cond_c
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zze()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0

    :cond_d
    :goto_3
    return v1
.end method

.method public final zza()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzY()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public final zzb()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzV()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public final zzc()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    const v1, 0x7fffffff

    if-eqz v0, :cond_0

    return v1

    .line 1
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zze:I

    if-ne v0, v2, :cond_1

    return v1

    :cond_1
    ushr-int/lit8 v0, v0, 0x3

    return v0
.end method

.method public final zzd()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    return v0
.end method

.method public final zze()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    return v0
.end method

.method public final zzf()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzV()I

    move-result v0

    return v0
.end method

.method public final zzg()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    return v0
.end method

.method public final zzh()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzV()I

    move-result v0

    return v0
.end method

.method public final zzi()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzs(I)I

    move-result v0

    return v0
.end method

.method public final zzj()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    return v0
.end method

.method public final zzk()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzY()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzl()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzm()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzY()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzn()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/gtm/zztj;->zzt(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzo()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzp()J
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzc:I

    if-eq v1, v0, :cond_b

    .line 1
    iget-object v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    add-int/lit8 v3, v0, 0x1

    .line 2
    aget-byte v0, v2, v0

    if-ltz v0, :cond_0

    iput v3, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    int-to-long v0, v0

    return-wide v0

    :cond_0
    sub-int/2addr v1, v3

    const/16 v4, 0x9

    if-ge v1, v4, :cond_1

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaa()J

    move-result-wide v0

    return-wide v0

    :cond_1
    add-int/lit8 v1, v3, 0x1

    .line 4
    aget-byte v3, v2, v3

    shl-int/lit8 v3, v3, 0x7

    xor-int/2addr v0, v3

    if-gez v0, :cond_2

    xor-int/lit8 v0, v0, -0x80

    :goto_0
    int-to-long v2, v0

    goto/16 :goto_5

    :cond_2
    add-int/lit8 v3, v1, 0x1

    .line 5
    aget-byte v1, v2, v1

    shl-int/lit8 v1, v1, 0xe

    xor-int/2addr v0, v1

    if-ltz v0, :cond_4

    xor-int/lit16 v0, v0, 0x3f80

    int-to-long v0, v0

    :cond_3
    :goto_1
    move-wide v9, v0

    move v1, v3

    move-wide v2, v9

    goto/16 :goto_5

    :cond_4
    add-int/lit8 v1, v3, 0x1

    .line 6
    aget-byte v3, v2, v3

    shl-int/lit8 v3, v3, 0x15

    xor-int/2addr v0, v3

    if-gez v0, :cond_5

    const v2, -0x1fc080

    xor-int/2addr v0, v2

    goto :goto_0

    :cond_5
    add-int/lit8 v3, v1, 0x1

    int-to-long v4, v0

    .line 7
    aget-byte v0, v2, v1

    int-to-long v0, v0

    const/16 v6, 0x1c

    shl-long/2addr v0, v6

    xor-long/2addr v0, v4

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-ltz v6, :cond_6

    const-wide/32 v4, 0xfe03f80

    :goto_2
    xor-long/2addr v0, v4

    goto :goto_1

    :cond_6
    add-int/lit8 v6, v3, 0x1

    .line 8
    aget-byte v3, v2, v3

    int-to-long v7, v3

    const/16 v3, 0x23

    shl-long/2addr v7, v3

    xor-long/2addr v0, v7

    cmp-long v3, v0, v4

    if-gez v3, :cond_7

    const-wide v2, -0x7f01fc080L

    :goto_3
    xor-long/2addr v2, v0

    :goto_4
    move v1, v6

    goto :goto_5

    :cond_7
    add-int/lit8 v3, v6, 0x1

    .line 9
    aget-byte v6, v2, v6

    int-to-long v6, v6

    const/16 v8, 0x2a

    shl-long/2addr v6, v8

    xor-long/2addr v0, v6

    cmp-long v6, v0, v4

    if-ltz v6, :cond_8

    const-wide v4, 0x3f80fe03f80L

    goto :goto_2

    :cond_8
    add-int/lit8 v6, v3, 0x1

    .line 10
    aget-byte v3, v2, v3

    int-to-long v7, v3

    const/16 v3, 0x31

    shl-long/2addr v7, v3

    xor-long/2addr v0, v7

    cmp-long v3, v0, v4

    if-gez v3, :cond_9

    const-wide v2, -0x1fc07f01fc080L

    goto :goto_3

    :cond_9
    add-int/lit8 v3, v6, 0x1

    .line 11
    aget-byte v6, v2, v6

    int-to-long v6, v6

    const/16 v8, 0x38

    shl-long/2addr v6, v8

    xor-long/2addr v0, v6

    const-wide v6, 0xfe03f80fe03f80L

    xor-long/2addr v0, v6

    cmp-long v6, v0, v4

    if-gez v6, :cond_3

    add-int/lit8 v6, v3, 0x1

    .line 12
    aget-byte v2, v2, v3

    int-to-long v2, v2

    cmp-long v7, v2, v4

    if-ltz v7, :cond_a

    move-wide v2, v0

    goto :goto_4

    .line 13
    :cond_a
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zze()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0

    .line 4
    :goto_5
    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-wide v2

    .line 1
    :cond_b
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzj()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object v0

    throw v0
.end method

.method public final zzq()Lcom/google/android/gms/internal/gtm/zztd;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    if-nez v0, :cond_0

    .line 3
    sget-object v0, Lcom/google/android/gms/internal/gtm/zztd;->zzb:Lcom/google/android/gms/internal/gtm/zztd;

    return-object v0

    .line 4
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 5
    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/gtm/zztd;->zzq([BII)Lcom/google/android/gms/internal/gtm/zztd;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-object v1
.end method

.method public final zzr(Ljava/lang/Class;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzwt;->zza()Lcom/google/android/gms/internal/gtm/zzwt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzwt;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/gtm/zzwx;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zzsn;->zzab(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final zzs(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/gtm/zzwx<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x3

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zzsn;->zzab(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final zzt(Ljava/lang/Class;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzwt;->zza()Lcom/google/android/gms/internal/gtm/zzwt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzwt;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/gtm/zzwx;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zzsn;->zzac(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final zzu(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/gtm/zzwx<",
            "TT;>;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zzsn;->zzac(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final zzv()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzw(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzw(Z)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaf(I)V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    if-nez v0, :cond_0

    const-string p1, ""

    return-object p1

    .line 3
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzad(I)V

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int v2, v1, v0

    .line 4
    invoke-static {p1, v1, v2}, Lcom/google/android/gms/internal/gtm/zzyd;->zzf([BII)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    .line 6
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzd()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1

    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zza:[B

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 5
    sget-object v3, Lcom/google/android/gms/internal/gtm/zzvi;->zza:Ljava/nio/charset/Charset;

    invoke-direct {p1, v1, v2, v0, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-object p1
.end method

.method public final zzx()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzw(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzy(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzsr;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_5

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzsr;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_3

    if-ne p1, v3, :cond_2

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    iget v3, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v3, p1

    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge p1, v3, :cond_1

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_1

    :cond_0
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzsr;->zze(Z)V

    goto :goto_0

    .line 5
    :cond_1
    invoke-direct {p0, v3}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 8
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzS()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzsr;->zze(Z)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result p1

    if-eqz p1, :cond_4

    return-void

    :cond_4
    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_3

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    .line 5
    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_9

    if-ne v0, v3, :cond_8

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    iget v3, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    add-int/2addr v3, v0

    :goto_2
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    if-ge v0, v3, :cond_7

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_3

    :cond_6
    const/4 v0, 0x0

    :goto_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 11
    :cond_7
    invoke-direct {p0, v3}, Lcom/google/android/gms/internal/gtm/zzsn;->zzae(I)V

    return-void

    .line 14
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 12
    :cond_9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzS()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_9

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void
.end method

.method public final zzz(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/gtm/zztd;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 1
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzq()Lcom/google/android/gms/internal/gtm/zztd;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzsn;->zzX()I

    move-result v1

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzd:I

    if-eq v1, v2, :cond_0

    .line 3
    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzsn;->zzb:I

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method
