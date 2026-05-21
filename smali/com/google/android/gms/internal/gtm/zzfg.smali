.class public final Lcom/google/android/gms/internal/gtm/zzfg;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/gtm/zzfh;

.field private final zzb:Ljava/lang/String;

.field private final zzc:J


# direct methods
.method synthetic constructor <init>(Lcom/google/android/gms/internal/gtm/zzfh;Ljava/lang/String;JLcom/google/android/gms/internal/gtm/zzff;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "monitoring"

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    const-wide/16 v0, 0x0

    cmp-long p2, p3, v0

    if-lez p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 2
    :goto_0
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zzb:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zzc:J

    return-void
.end method

.method private final zzd()J
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzfh;->zzc(Lcom/google/android/gms/internal/gtm/zzfh;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzf()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private final zze()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zzb:Ljava/lang/String;

    const-string v1, ":count"

    .line 1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final zzf()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zzb:Ljava/lang/String;

    const-string v1, ":start"

    .line 1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final zzg()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzC()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-static {v2}, Lcom/google/android/gms/internal/gtm/zzfh;->zzc(Lcom/google/android/gms/internal/gtm/zzfh;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 2
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zze()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzb()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzf()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 6
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method


# virtual methods
.method public final zza()Landroid/util/Pair;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzd()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    move-wide v0, v2

    goto :goto_0

    .line 7
    :cond_0
    iget-object v4, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    .line 2
    invoke-virtual {v4}, Lcom/google/android/gms/internal/gtm/zzbr;->zzC()Lcom/google/android/gms/common/util/Clock;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 1
    :goto_0
    iget-wide v4, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zzc:J

    const/4 v6, 0x0

    cmp-long v7, v0, v4

    if-gez v7, :cond_1

    return-object v6

    :cond_1
    add-long/2addr v4, v4

    cmp-long v7, v0, v4

    if-lez v7, :cond_2

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzg()V

    return-object v6

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzfh;->zzc(Lcom/google/android/gms/internal/gtm/zzfh;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzb()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-static {v1}, Lcom/google/android/gms/internal/gtm/zzfh;->zzc(Lcom/google/android/gms/internal/gtm/zzfh;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zze()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzg()V

    if-eqz v0, :cond_4

    cmp-long v1, v4, v2

    if-gtz v1, :cond_3

    goto :goto_1

    :cond_3
    new-instance v1, Landroid/util/Pair;

    .line 7
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :cond_4
    :goto_1
    return-object v6
.end method

.method protected final zzb()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zzb:Ljava/lang/String;

    const-string v1, ":value"

    .line 1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzc(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzd()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzg()V

    :cond_0
    if-nez p1, :cond_1

    const-string p1, ""

    :cond_1
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzfh;->zzc(Lcom/google/android/gms/internal/gtm/zzfh;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zze()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    const-wide/16 v4, 0x1

    cmp-long v6, v0, v2

    if-gtz v6, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzfh;->zzc(Lcom/google/android/gms/internal/gtm/zzfh;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzb()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zze()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 7
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 8
    monitor-exit p0

    return-void

    .line 9
    :cond_2
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    .line 10
    invoke-virtual {v2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    const-wide v6, 0x7fffffffffffffffL

    and-long/2addr v2, v6

    add-long/2addr v0, v4

    .line 11
    div-long/2addr v6, v0

    iget-object v4, p0, Lcom/google/android/gms/internal/gtm/zzfg;->zza:Lcom/google/android/gms/internal/gtm/zzfh;

    invoke-static {v4}, Lcom/google/android/gms/internal/gtm/zzfh;->zzc(Lcom/google/android/gms/internal/gtm/zzfh;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 12
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    cmp-long v5, v2, v6

    if-gez v5, :cond_3

    .line 13
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zzb()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 14
    :cond_3
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzfg;->zze()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v4, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 15
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 16
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
