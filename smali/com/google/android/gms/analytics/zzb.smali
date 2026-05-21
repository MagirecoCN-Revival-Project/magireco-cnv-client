.class public final Lcom/google/android/gms/analytics/zzb;
.super Lcom/google/android/gms/internal/gtm/zzbr;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/analytics/zzt;


# static fields
.field private static zza:Ljava/text/DecimalFormat;


# instance fields
.field private final zzb:Lcom/google/android/gms/internal/gtm/zzbv;

.field private final zzc:Ljava/lang/String;

.field private final zzd:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/gtm/zzbv;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzbr;-><init>(Lcom/google/android/gms/internal/gtm/zzbv;)V

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/analytics/zzb;->zzb:Lcom/google/android/gms/internal/gtm/zzbv;

    iput-object p2, p0, Lcom/google/android/gms/analytics/zzb;->zzc:Ljava/lang/String;

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/analytics/zzb;->zza(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/analytics/zzb;->zzd:Landroid/net/Uri;

    return-void
.end method

.method static zza(Ljava/lang/String;)Landroid/net/Uri;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    new-instance v0, Landroid/net/Uri$Builder;

    .line 2
    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "uri"

    .line 3
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "google-analytics.com"

    .line 4
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 5
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 6
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static zzc(D)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/google/android/gms/analytics/zzb;->zza:Ljava/text/DecimalFormat;

    if-nez v0, :cond_0

    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.######"

    .line 1
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/analytics/zzb;->zza:Ljava/text/DecimalFormat;

    :cond_0
    sget-object v0, Lcom/google/android/gms/analytics/zzb;->zza:Ljava/text/DecimalFormat;

    .line 2
    invoke-virtual {v0, p0, p1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static zzd(Lcom/google/android/gms/analytics/zzh;)Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/zzh;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    .line 1
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-class v1, Lcom/google/android/gms/internal/gtm/zzaz;

    .line 2
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzaz;

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    if-eqz v1, :cond_7

    .line 3
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaz;->zzd()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 4
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_2

    :cond_1
    :goto_1
    move-object v6, v4

    goto :goto_2

    .line 5
    :cond_2
    instance-of v7, v6, Ljava/lang/String;

    if-eqz v7, :cond_3

    .line 6
    check-cast v6, Ljava/lang/String;

    .line 7
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_6

    goto :goto_1

    .line 8
    :cond_3
    instance-of v7, v6, Ljava/lang/Double;

    if-eqz v7, :cond_4

    .line 9
    check-cast v6, Ljava/lang/Double;

    .line 10
    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    cmpl-double v9, v7, v2

    if-eqz v9, :cond_1

    .line 11
    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/google/android/gms/analytics/zzb;->zzc(D)Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 12
    :cond_4
    instance-of v7, v6, Ljava/lang/Boolean;

    if-eqz v7, :cond_5

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-eq v6, v7, :cond_1

    const-string v6, "1"

    goto :goto_2

    .line 13
    :cond_5
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    :cond_6
    :goto_2
    if-eqz v6, :cond_0

    .line 14
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 13
    :cond_7
    const-class v1, Lcom/google/android/gms/internal/gtm/zzbe;

    .line 15
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbe;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzf()Ljava/lang/String;

    move-result-object v5

    const-string v6, "t"

    .line 16
    invoke-static {v0, v6, v5}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zze()Ljava/lang/String;

    move-result-object v5

    const-string v6, "cid"

    .line 17
    invoke-static {v0, v6, v5}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzg()Ljava/lang/String;

    move-result-object v5

    const-string v6, "uid"

    .line 18
    invoke-static {v0, v6, v5}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "sc"

    .line 19
    invoke-static {v0, v5, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzo()Z

    move-result v5

    const-string v6, "ni"

    .line 20
    invoke-static {v0, v6, v5}, Lcom/google/android/gms/analytics/zzb;->zzg(Ljava/util/Map;Ljava/lang/String;Z)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzd()Ljava/lang/String;

    move-result-object v5

    const-string v6, "adid"

    .line 21
    invoke-static {v0, v6, v5}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzn()Z

    move-result v1

    const-string v5, "ate"

    .line 22
    invoke-static {v0, v5, v1}, Lcom/google/android/gms/analytics/zzb;->zzg(Ljava/util/Map;Ljava/lang/String;Z)V

    :cond_8
    const-class v1, Lcom/google/android/gms/internal/gtm/zzbf;

    .line 23
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbf;

    if-eqz v1, :cond_a

    const-string v5, "cd"

    .line 24
    invoke-static {v0, v5, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbf;->zzd()I

    move-result v1

    int-to-double v5, v1

    cmpl-double v1, v5, v2

    if-eqz v1, :cond_9

    .line 25
    invoke-static {v5, v6}, Lcom/google/android/gms/analytics/zzb;->zzc(D)Ljava/lang/String;

    move-result-object v1

    const-string v2, "a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    const-string v1, "dr"

    .line 26
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_a
    const-class v1, Lcom/google/android/gms/internal/gtm/zzbc;

    .line 27
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbc;

    if-eqz v1, :cond_b

    const-string v1, "ec"

    .line 28
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ea"

    .line 29
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "el"

    .line 30
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    const-class v1, Lcom/google/android/gms/internal/gtm/zzaw;

    .line 31
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzaw;

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzl()Ljava/lang/String;

    move-result-object v2

    const-string v3, "cn"

    .line 32
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzm()Ljava/lang/String;

    move-result-object v2

    const-string v3, "cs"

    .line 33
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzk()Ljava/lang/String;

    move-result-object v2

    const-string v3, "cm"

    .line 34
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzj()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ck"

    .line 35
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzf()Ljava/lang/String;

    move-result-object v2

    const-string v3, "cc"

    .line 36
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzi()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ci"

    .line 37
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zze()Ljava/lang/String;

    move-result-object v2

    const-string v3, "anid"

    .line 38
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzh()Ljava/lang/String;

    move-result-object v2

    const-string v3, "gclid"

    .line 39
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzg()Ljava/lang/String;

    move-result-object v2

    const-string v3, "dclid"

    .line 40
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzaw;->zzd()Ljava/lang/String;

    move-result-object v1

    const-string v2, "aclid"

    .line 41
    invoke-static {v0, v2, v1}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_c
    const-class v1, Lcom/google/android/gms/internal/gtm/zzbd;

    .line 42
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbd;

    if-eqz v1, :cond_d

    const-string v1, "exd"

    .line 43
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    const-class v1, Lcom/google/android/gms/internal/gtm/zzbg;

    .line 44
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbg;

    if-eqz v1, :cond_e

    const-string v1, "sn"

    .line 45
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sa"

    .line 46
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "st"

    .line 47
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_e
    const-class v1, Lcom/google/android/gms/internal/gtm/zzbh;

    .line 48
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbh;

    if-eqz v1, :cond_f

    const-string v1, "utv"

    .line 49
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "utc"

    .line 50
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "utl"

    .line 51
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_f
    const-class v1, Lcom/google/android/gms/internal/gtm/zzax;

    .line 52
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzax;

    if-eqz v1, :cond_11

    .line 53
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzax;->zzd()Ljava/util/Map;

    move-result-object v1

    .line 54
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_10
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 55
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/google/android/gms/analytics/zzd;->zzb(I)Ljava/lang/String;

    move-result-object v3

    .line 56
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 57
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_11
    const-class v1, Lcom/google/android/gms/internal/gtm/zzay;

    .line 58
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzay;

    if-eqz v1, :cond_13

    .line 59
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzay;->zzd()Ljava/util/Map;

    move-result-object v1

    .line 60
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_12
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 61
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/google/android/gms/analytics/zzd;->zze(I)Ljava/lang/String;

    move-result-object v3

    .line 62
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_12

    .line 63
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/google/android/gms/analytics/zzb;->zzc(D)Ljava/lang/String;

    move-result-object v2

    .line 64
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_13
    const-class v1, Lcom/google/android/gms/internal/gtm/zzbb;

    .line 65
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbb;

    if-eqz v1, :cond_19

    .line 66
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbb;->zze()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x1

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_14

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/analytics/ecommerce/Promotion;

    .line 67
    invoke-static {v4}, Lcom/google/android/gms/analytics/zzd;->zzm(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->zza(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    add-int/2addr v4, v3

    goto :goto_5

    .line 68
    :cond_14
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbb;->zzd()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x1

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_15

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/analytics/ecommerce/Product;

    .line 69
    invoke-static {v4}, Lcom/google/android/gms/analytics/zzd;->zzk(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/android/gms/analytics/ecommerce/Product;->zza(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    add-int/2addr v4, v3

    goto :goto_6

    :cond_15
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbb;->zzf()Ljava/util/Map;

    move-result-object v1

    .line 70
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 71
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 72
    invoke-static {v2}, Lcom/google/android/gms/analytics/zzd;->zzh(I)Ljava/lang/String;

    move-result-object v6

    .line 73
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v7, 0x1

    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_17

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/gms/analytics/ecommerce/Product;

    .line 74
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7}, Lcom/google/android/gms/analytics/zzd;->zzi(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_16

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_9

    :cond_16
    new-instance v10, Ljava/lang/String;

    invoke-direct {v10, v9}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v9, v10

    :goto_9
    invoke-virtual {v8, v9}, Lcom/google/android/gms/analytics/ecommerce/Product;->zza(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v0, v8}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 75
    :cond_17
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_18

    .line 76
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "nm"

    invoke-virtual {v5, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_19
    const-class v1, Lcom/google/android/gms/internal/gtm/zzba;

    .line 77
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzba;

    if-eqz v1, :cond_1a

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzba;->zzd()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ul"

    .line 78
    invoke-static {v0, v3, v2}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget v2, v1, Lcom/google/android/gms/internal/gtm/zzba;->zza:I

    iget v1, v1, Lcom/google/android/gms/internal/gtm/zzba;->zzb:I

    if-lez v2, :cond_1a

    if-lez v1, :cond_1a

    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x17

    .line 79
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sr"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1a
    const-class v1, Lcom/google/android/gms/internal/gtm/zzav;

    .line 80
    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/gtm/zzav;

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzav;->zzf()Ljava/lang/String;

    move-result-object v1

    const-string v2, "an"

    .line 81
    invoke-static {v0, v2, v1}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzav;->zzd()Ljava/lang/String;

    move-result-object v1

    const-string v2, "aid"

    .line 82
    invoke-static {v0, v2, v1}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzav;->zze()Ljava/lang/String;

    move-result-object v1

    const-string v2, "aiid"

    .line 83
    invoke-static {v0, v2, v1}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzav;->zzg()Ljava/lang/String;

    move-result-object p0

    const-string v1, "av"

    .line 84
    invoke-static {v0, v1, p0}, Lcom/google/android/gms/analytics/zzb;->zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1b
    return-object v0
.end method

.method private static zzf(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private static zzg(Ljava/util/Map;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    const-string p2, "1"

    .line 1
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method


# virtual methods
.method public final zzb()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/analytics/zzb;->zzd:Landroid/net/Uri;

    return-object v0
.end method

.method public final zze(Lcom/google/android/gms/analytics/zzh;)V
    .locals 13

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/zzh;->zzm()Z

    move-result v0

    const-string v1, "Can\'t deliver not submitted measurement"

    .line 2
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    const-string v0, "deliver should be called on worker thread"

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotMainThread(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/analytics/zzh;

    .line 4
    invoke-direct {v0, p1}, Lcom/google/android/gms/analytics/zzh;-><init>(Lcom/google/android/gms/analytics/zzh;)V

    const-class v1, Lcom/google/android/gms/internal/gtm/zzbe;

    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/zzh;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzbe;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzf()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzz()Lcom/google/android/gms/internal/gtm/zzfb;

    move-result-object p1

    invoke-static {v0}, Lcom/google/android/gms/analytics/zzb;->zzd(Lcom/google/android/gms/analytics/zzh;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "Ignoring measurement without type"

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/gtm/zzfb;->zzc(Ljava/util/Map;Ljava/lang/String;)V

    return-void

    .line 8
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zze()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzz()Lcom/google/android/gms/internal/gtm/zzfb;

    move-result-object p1

    .line 10
    invoke-static {v0}, Lcom/google/android/gms/analytics/zzb;->zzd(Lcom/google/android/gms/analytics/zzh;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "Ignoring measurement without client id"

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/gtm/zzfb;->zzc(Ljava/util/Map;Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object v2, p0, Lcom/google/android/gms/analytics/zzb;->zzb:Lcom/google/android/gms/internal/gtm/zzbv;

    .line 11
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzbv;->zzc()Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getAppOptOut()Z

    move-result v2

    if-nez v2, :cond_7

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zze()Ljava/lang/String;

    move-result-object v2

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v2}, Lcom/google/android/gms/internal/gtm/zzfs;->zzj(DLjava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 13
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    const-string v0, "Sampling enabled. Hit sampled out. sampling rate"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/gtm/zzbr;->zzG(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 14
    :cond_2
    invoke-static {v0}, Lcom/google/android/gms/analytics/zzb;->zzd(Lcom/google/android/gms/analytics/zzh;)Ljava/util/Map;

    move-result-object v3

    const-string v0, "v"

    const-string v2, "1"

    .line 15
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    sget-object v0, Lcom/google/android/gms/internal/gtm/zzbt;->zzb:Ljava/lang/String;

    const-string v2, "_v"

    invoke-interface {v3, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/zzb;->zzc:Ljava/lang/String;

    const-string v2, "tid"

    .line 17
    invoke-interface {v3, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/zzb;->zzb:Lcom/google/android/gms/internal/gtm/zzbv;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzbv;->zzc()Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->isDryRunEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, ", "

    .line 22
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    :cond_3
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "="

    .line 24
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 26
    :cond_4
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Dry run is enabled. GoogleAnalytics would have sent"

    .line 27
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/gtm/zzbr;->zzN(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_5
    new-instance v12, Ljava/util/HashMap;

    .line 28
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 29
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzg()Ljava/lang/String;

    move-result-object v0

    const-string v2, "uid"

    invoke-static {v12, v2, v0}, Lcom/google/android/gms/internal/gtm/zzfs;->zzg(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-class v0, Lcom/google/android/gms/internal/gtm/zzav;

    .line 30
    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/zzh;->zzc(Ljava/lang/Class;)Lcom/google/android/gms/analytics/zzj;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzav;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzav;->zzf()Ljava/lang/String;

    move-result-object v2

    const-string v4, "an"

    .line 31
    invoke-static {v12, v4, v2}, Lcom/google/android/gms/internal/gtm/zzfs;->zzg(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzav;->zzd()Ljava/lang/String;

    move-result-object v2

    const-string v4, "aid"

    .line 32
    invoke-static {v12, v4, v2}, Lcom/google/android/gms/internal/gtm/zzfs;->zzg(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzav;->zzg()Ljava/lang/String;

    move-result-object v2

    const-string v4, "av"

    .line 33
    invoke-static {v12, v4, v2}, Lcom/google/android/gms/internal/gtm/zzfs;->zzg(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzav;->zze()Ljava/lang/String;

    move-result-object v0

    const-string v2, "aiid"

    .line 34
    invoke-static {v12, v2, v0}, Lcom/google/android/gms/internal/gtm/zzfs;->zzg(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    new-instance v0, Lcom/google/android/gms/internal/gtm/zzbx;

    const-wide/16 v5, 0x0

    .line 35
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zze()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/google/android/gms/analytics/zzb;->zzc:Ljava/lang/String;

    .line 36
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzbe;->zzd()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/lit8 v9, v1, 0x1

    const-wide/16 v10, 0x0

    move-object v4, v0

    invoke-direct/range {v4 .. v12}, Lcom/google/android/gms/internal/gtm/zzbx;-><init>(JLjava/lang/String;Ljava/lang/String;ZJLjava/util/Map;)V

    .line 37
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzs()Lcom/google/android/gms/internal/gtm/zzbq;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/gtm/zzbq;->zza(Lcom/google/android/gms/internal/gtm/zzbx;)J

    move-result-wide v0

    .line 38
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v1, "_s"

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/internal/gtm/zzex;

    .line 39
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzz()Lcom/google/android/gms/internal/gtm/zzfb;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/zzh;->zza()J

    move-result-wide v4

    const/4 v6, 0x1

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/gtm/zzex;-><init>(Lcom/google/android/gms/internal/gtm/zzbr;Ljava/util/Map;JZ)V

    .line 40
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzs()Lcom/google/android/gms/internal/gtm/zzbq;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzbq;->zzh(Lcom/google/android/gms/internal/gtm/zzex;)V

    :cond_7
    return-void
.end method
