.class final Lcom/google/android/gms/internal/gtm/zztf;
.super Lcom/google/android/gms/internal/gtm/zztj;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"


# instance fields
.field private final zze:[B

.field private zzf:I

.field private zzg:I

.field private zzh:I


# direct methods
.method synthetic constructor <init>([BIIZLcom/google/android/gms/internal/gtm/zzte;)V
    .locals 0

    const/4 p2, 0x0

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/gtm/zztj;-><init>(Lcom/google/android/gms/internal/gtm/zzti;)V

    const p2, 0x7fffffff

    iput p2, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzh:I

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zztf;->zze:[B

    const/4 p1, 0x0

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzf:I

    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 1

    const/4 v0, 0x0

    throw v0
.end method

.method public final zzb(I)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/gtm/zzvk;
        }
    .end annotation

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzh:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzh:I

    iget v1, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzf:I

    iget v2, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzg:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzf:I

    if-lez v1, :cond_0

    iput v1, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzg:I

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzf:I

    goto :goto_0

    :cond_0
    iput v0, p0, Lcom/google/android/gms/internal/gtm/zztf;->zzg:I

    :goto_0
    return p1
.end method

.method public final zzc()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    throw v0
.end method

.method public final zzd()Lcom/google/android/gms/internal/gtm/zztd;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    throw v0
.end method

.method public final zze()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    throw v0
.end method

.method public final zzf()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    throw v0
.end method

.method public final zzg(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/gtm/zzvk;
        }
    .end annotation

    const/4 p1, 0x0

    throw p1
.end method

.method public final zzh(I)V
    .locals 0

    const/4 p1, 0x0

    throw p1
.end method

.method public final zzi()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    throw v0
.end method

.method public final zzj()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    throw v0
.end method

.method public final zzk(I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p1, 0x0

    throw p1
.end method
