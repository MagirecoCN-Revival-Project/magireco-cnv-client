.class final Lcom/google/android/gms/internal/gtm/zztk;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/internal/gtm/zzww;


# instance fields
.field private final zza:Lcom/google/android/gms/internal/gtm/zztj;

.field private zzb:I

.field private zzc:I

.field private zzd:I


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/gtm/zztj;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    const-string v0, "input"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/gtm/zzvi;->zzf(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    iput-object p0, p1, Lcom/google/android/gms/internal/gtm/zztj;->zzc:Lcom/google/android/gms/internal/gtm/zztk;

    return-void
.end method

.method private final zzO(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
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

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzc:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    ushr-int/lit8 v1, v1, 0x3

    shl-int/lit8 v1, v1, 0x3

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzc:I

    .line 1
    :try_start_0
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzwx;->zze()Ljava/lang/Object;

    move-result-object v1

    .line 2
    invoke-interface {p1, v1, p0, p2}, Lcom/google/android/gms/internal/gtm/zzwx;->zzh(Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzww;Lcom/google/android/gms/internal/gtm/zzuj;)V

    .line 3
    invoke-interface {p1, v1}, Lcom/google/android/gms/internal/gtm/zzwx;->zzf(Ljava/lang/Object;)V

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    iget p2, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzc:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, p2, :cond_0

    .line 5
    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzc:I

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

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzc:I

    .line 5
    throw p1
.end method

.method private final zzU(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;
    .locals 4
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

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    iget v2, v1, Lcom/google/android/gms/internal/gtm/zztj;->zza:I

    iget v3, v1, Lcom/google/android/gms/internal/gtm/zztj;->zzb:I

    if-ge v2, v3, :cond_0

    .line 4
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzb(I)I

    move-result v0

    .line 5
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzwx;->zze()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    iget v3, v2, Lcom/google/android/gms/internal/gtm/zztj;->zza:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/google/android/gms/internal/gtm/zztj;->zza:I

    .line 6
    invoke-interface {p1, v1, p0, p2}, Lcom/google/android/gms/internal/gtm/zzwx;->zzh(Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzww;Lcom/google/android/gms/internal/gtm/zzuj;)V

    .line 7
    invoke-interface {p1, v1}, Lcom/google/android/gms/internal/gtm/zzwx;->zzf(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    const/4 p2, 0x0

    .line 8
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/gtm/zztj;->zzg(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    iget p2, p1, Lcom/google/android/gms/internal/gtm/zztj;->zza:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p1, Lcom/google/android/gms/internal/gtm/zztj;->zza:I

    .line 9
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzh(I)V

    return-object v1

    .line 1
    :cond_0
    new-instance p1, Lcom/google/android/gms/internal/gtm/zzvk;

    const-string p2, "Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit."

    .line 2
    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/gtm/zzvk;-><init>(Ljava/lang/String;)V

    .line 3
    throw p1
.end method

.method private final zzV(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzj()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1
.end method

.method private final zzW(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-ne v0, p1, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method private static final zzX(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p0, p0, 0x3

    if-nez p0, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzg()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p0

    throw p0
.end method

.method private static final zzY(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p0, p0, 0x7

    if-nez p0, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzg()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p0

    throw p0
.end method

.method public static zzp(Lcom/google/android/gms/internal/gtm/zztj;)Lcom/google/android/gms/internal/gtm/zztk;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztj;->zzc:Lcom/google/android/gms/internal/gtm/zztk;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/gtm/zztk;

    .line 1
    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/gtm/zztk;-><init>(Lcom/google/android/gms/internal/gtm/zztj;)V

    return-object v0
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

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzug;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zztk;->zzY(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    .line 6
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzug;->zze(D)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzug;->zze(D)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzY(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    .line 11
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void
.end method

.method public final zzB(Ljava/util/List;)V
    .locals 2
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

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 5
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 8
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void
.end method

.method public final zzC(Ljava/util/List;)V
    .locals 4
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

    if-eqz v0, :cond_5

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzva;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result p1

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 11
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 8
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zztk;->zzX(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result p1

    .line 10
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result v0

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 20
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 15
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 17
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzX(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    .line 11
    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
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

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zztk;->zzY(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v2

    .line 6
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzY(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    .line 11
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v2

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void
.end method

.method public final zzE(Ljava/util/List;)V
    .locals 4
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

    if-eqz v0, :cond_5

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzuq;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzuq;->zze(F)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 11
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 8
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zztk;->zzX(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    .line 10
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzuq;->zze(F)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 13
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 20
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 15
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 17
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzX(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    .line 11
    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
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

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x3

    if-ne v1, v2, :cond_3

    .line 1
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/gtm/zztk;->zzO(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 3
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 4
    iput v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method public final zzG(Ljava/util/List;)V
    .locals 2
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

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 5
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 8
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

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

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v2

    .line 5
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v2

    .line 14
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

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

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v1, v0, 0x7

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 1
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/gtm/zztk;->zzU(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 3
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 4
    iput v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method public final zzJ(Ljava/util/List;)V
    .locals 4
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

    if-eqz v0, :cond_5

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzva;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_3

    if-ne p1, v1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result p1

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_0

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 11
    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 8
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zztk;->zzX(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int v3, v1, p1

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result p1

    .line 10
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v3, :cond_4

    goto :goto_0

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_9

    if-ne v0, v1, :cond_8

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result v0

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_6

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 20
    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 15
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 17
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzX(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    .line 11
    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_a

    :goto_0
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

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zztk;->zzY(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v2

    .line 6
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eq v0, v2, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 13
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzY(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    .line 11
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v2

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    :goto_0
    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void
.end method

.method public final zzL(Ljava/util/List;)V
    .locals 2
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

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzs(I)I

    move-result p1

    .line 5
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzs(I)I

    move-result p1

    .line 8
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzs(I)I

    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzs(I)I

    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

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

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvz;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/gtm/zzth;->zzt(J)J

    move-result-wide v2

    .line 5
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/gtm/zzth;->zzt(J)J

    move-result-wide v1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/gtm/zzth;->zzt(J)J

    move-result-wide v2

    .line 14
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/gtm/zzth;->zzt(J)J

    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

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
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzw(Ljava/util/List;Z)V

    return-void
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
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzw(Ljava/util/List;Z)V

    return-void
.end method

.method public final zzQ(Ljava/util/List;)V
    .locals 2
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

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 5
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    .line 8
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzva;->zzh(I)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

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

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v2

    .line 5
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 6
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvz;->zzf(J)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 6
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v2

    .line 14
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 15
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 20
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 6
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void
.end method

.method public final zzS()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzj()Z

    move-result v0

    return v0
.end method

.method public final zzT()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzc:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzk(I)Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public final zzc()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    if-eqz v0, :cond_0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    :goto_0
    if-eqz v0, :cond_2

    .line 0
    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzc:I

    if-ne v0, v1, :cond_1

    goto :goto_1

    :cond_1
    ushr-int/lit8 v0, v0, 0x3

    return v0

    :cond_2
    :goto_1
    const v0, 0x7fffffff

    return v0
.end method

.method public final zzd()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzm()I

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzs(I)I

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzo()J

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/gtm/zzth;->zzt(J)J

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final zzq()Lcom/google/android/gms/internal/gtm/zztd;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzd()Lcom/google/android/gms/internal/gtm/zztd;

    move-result-object v0

    return-object v0
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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzwt;->zza()Lcom/google/android/gms/internal/gtm/zzwt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzwt;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/gtm/zzwx;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zztk;->zzO(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zztk;->zzO(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzwt;->zza()Lcom/google/android/gms/internal/gtm/zzwt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzwt;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/gtm/zzwx;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zztk;->zzU(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

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
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/gtm/zztk;->zzU(Lcom/google/android/gms/internal/gtm/zzwx;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

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

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zze()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzw(Ljava/util/List;Z)V
    .locals 2
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

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    .line 2
    instance-of v0, p1, Lcom/google/android/gms/internal/gtm/zzvs;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p2, :cond_3

    .line 6
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzvs;

    .line 7
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zztk;->zzq()Lcom/google/android/gms/internal/gtm/zztd;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/gtm/zzvs;->zzi(Lcom/google/android/gms/internal/gtm/zztd;)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget p2, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, p2, :cond_1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    :cond_3
    :goto_0
    if-eqz p2, :cond_4

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zztk;->zzx()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zztk;->zzv()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_3

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 1
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method

.method public final zzx()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zztk;->zzW(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzf()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzy(Ljava/util/List;)V
    .locals 2
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

    const/4 v1, 0x2

    if-eqz v0, :cond_4

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzsr;

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 p1, p1, 0x7

    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    .line 8
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzth;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result p1

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, p1

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzj()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzsr;->zze(Z)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result p1

    if-lt p1, v1, :cond_0

    .line 5
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 9
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 2
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzj()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzsr;->zze(Z)V

    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result p1

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq p1, v1, :cond_2

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    .line 5
    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_7

    if-ne v0, v1, :cond_6

    .line 15
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzth;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzth;->zzn()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v1

    add-int/2addr v1, v0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzj()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zza()I

    move-result v0

    if-lt v0, v1, :cond_5

    .line 12
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/gtm/zztk;->zzV(I)V

    return-void

    .line 16
    :cond_6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1

    .line 5
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzj()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_7

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void
.end method

.method public final zzz(Ljava/util/List;)V
    .locals 2
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

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    and-int/lit8 v0, v0, 0x7

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 1
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zztk;->zzq()Lcom/google/android/gms/internal/gtm/zztd;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzi()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zza:Lcom/google/android/gms/internal/gtm/zztj;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zztj;->zzc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzb:I

    if-eq v0, v1, :cond_0

    .line 4
    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztk;->zzd:I

    return-void

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zza()Lcom/google/android/gms/internal/gtm/zzvj;

    move-result-object p1

    throw p1
.end method
