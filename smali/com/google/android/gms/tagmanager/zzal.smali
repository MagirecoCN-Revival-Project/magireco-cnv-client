.class public final Lcom/google/android/gms/tagmanager/zzal;
.super Lcom/google/android/gms/common/api/internal/BasePendingResult;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/internal/BasePendingResult<",
        "Lcom/google/android/gms/tagmanager/ContainerHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final zza:Lcom/google/android/gms/common/util/Clock;

.field private final zzb:Lcom/google/android/gms/tagmanager/zzai;

.field private final zzc:Landroid/os/Looper;

.field private final zzd:Lcom/google/android/gms/tagmanager/zzec;

.field private final zze:I

.field private final zzf:Landroid/content/Context;

.field private final zzg:Lcom/google/android/gms/tagmanager/TagManager;

.field private final zzh:Ljava/lang/String;

.field private final zzi:Lcom/google/android/gms/tagmanager/zzam;

.field private zzj:Lcom/google/android/gms/tagmanager/zzak;

.field private final zzk:Lcom/google/android/gms/internal/gtm/zzrm;

.field private volatile zzl:Lcom/google/android/gms/tagmanager/zzaa;

.field private volatile zzm:Z

.field private zzn:Lcom/google/android/gms/internal/gtm/zzai;

.field private zzo:J

.field private zzp:Ljava/lang/String;

.field private zzq:Lcom/google/android/gms/tagmanager/zzaj;

.field private zzr:Lcom/google/android/gms/tagmanager/zzac;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzap;)V
    .locals 21

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p4

    .line 1
    new-instance v10, Lcom/google/android/gms/tagmanager/zzem;

    invoke-direct {v10, v8, v9}, Lcom/google/android/gms/tagmanager/zzem;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v11, Lcom/google/android/gms/tagmanager/zzej;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v11

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    move-object/from16 v4, p6

    .line 2
    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/tagmanager/zzej;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzap;Lcom/google/android/gms/tagmanager/zzeh;Lcom/google/android/gms/tagmanager/zzei;[B)V

    new-instance v1, Lcom/google/android/gms/internal/gtm/zzrm;

    .line 1
    invoke-direct {v1, v8}, Lcom/google/android/gms/internal/gtm/zzrm;-><init>(Landroid/content/Context;)V

    .line 3
    invoke-static {}, Lcom/google/android/gms/common/util/DefaultClock;->getInstance()Lcom/google/android/gms/common/util/Clock;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/tagmanager/zzdf;

    .line 4
    invoke-static {}, Lcom/google/android/gms/common/util/DefaultClock;->getInstance()Lcom/google/android/gms/common/util/Clock;

    move-result-object v20

    const/4 v13, 0x1

    const/4 v14, 0x5

    const-wide/32 v15, 0xdbba0

    const-wide/16 v17, 0x1388

    const-string v19, "refreshing"

    move-object v12, v3

    invoke-direct/range {v12 .. v20}, Lcom/google/android/gms/tagmanager/zzdf;-><init>(IIJJLjava/lang/String;Lcom/google/android/gms/common/util/Clock;)V

    new-instance v4, Lcom/google/android/gms/tagmanager/zzam;

    invoke-direct {v4, v8, v9}, Lcom/google/android/gms/tagmanager/zzam;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    if-nez p3, :cond_0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    goto :goto_0

    :cond_0
    move-object/from16 v5, p3

    :goto_0
    invoke-direct {v0, v5}, Lcom/google/android/gms/common/api/internal/BasePendingResult;-><init>(Landroid/os/Looper;)V

    iput-object v8, v0, Lcom/google/android/gms/tagmanager/zzal;->zzf:Landroid/content/Context;

    move-object/from16 v5, p2

    iput-object v5, v0, Lcom/google/android/gms/tagmanager/zzal;->zzg:Lcom/google/android/gms/tagmanager/TagManager;

    if-nez p3, :cond_1

    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    goto :goto_1

    :cond_1
    move-object/from16 v5, p3

    :goto_1
    iput-object v5, v0, Lcom/google/android/gms/tagmanager/zzal;->zzc:Landroid/os/Looper;

    iput-object v9, v0, Lcom/google/android/gms/tagmanager/zzal;->zzh:Ljava/lang/String;

    move/from16 v5, p5

    iput v5, v0, Lcom/google/android/gms/tagmanager/zzal;->zze:I

    iput-object v10, v0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    iput-object v11, v0, Lcom/google/android/gms/tagmanager/zzal;->zzq:Lcom/google/android/gms/tagmanager/zzaj;

    iput-object v1, v0, Lcom/google/android/gms/tagmanager/zzal;->zzk:Lcom/google/android/gms/internal/gtm/zzrm;

    new-instance v1, Lcom/google/android/gms/tagmanager/zzai;

    const/4 v5, 0x0

    .line 7
    invoke-direct {v1, v0, v5}, Lcom/google/android/gms/tagmanager/zzai;-><init>(Lcom/google/android/gms/tagmanager/zzal;Lcom/google/android/gms/tagmanager/zzah;)V

    iput-object v1, v0, Lcom/google/android/gms/tagmanager/zzal;->zzb:Lcom/google/android/gms/tagmanager/zzai;

    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzai;->zzd()Lcom/google/android/gms/internal/gtm/zzah;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzut;->zzA()Lcom/google/android/gms/internal/gtm/zzuz;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzai;

    iput-object v1, v0, Lcom/google/android/gms/tagmanager/zzal;->zzn:Lcom/google/android/gms/internal/gtm/zzai;

    iput-object v2, v0, Lcom/google/android/gms/tagmanager/zzal;->zza:Lcom/google/android/gms/common/util/Clock;

    iput-object v3, v0, Lcom/google/android/gms/tagmanager/zzal;->zzd:Lcom/google/android/gms/tagmanager/zzec;

    iput-object v4, v0, Lcom/google/android/gms/tagmanager/zzal;->zzi:Lcom/google/android/gms/tagmanager/zzam;

    .line 9
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/tagmanager/zzal;->zzv()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 10
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzea;->zza()Lcom/google/android/gms/tagmanager/zzea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzea;->zzb()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzal;->zzo(Ljava/lang/String;)V

    .line 11
    :cond_2
    invoke-virtual/range {p6 .. p6}, Lcom/google/android/gms/tagmanager/zzap;->zza()Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/android/gms/tagmanager/zzal;)J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzo:J

    return-wide v0
.end method

.method static bridge synthetic zzb(Lcom/google/android/gms/tagmanager/zzal;)Lcom/google/android/gms/internal/gtm/zzai;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzn:Lcom/google/android/gms/internal/gtm/zzai;

    return-object p0
.end method

.method static bridge synthetic zzc(Lcom/google/android/gms/tagmanager/zzal;)Lcom/google/android/gms/common/util/Clock;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/zzal;->zza:Lcom/google/android/gms/common/util/Clock;

    return-object p0
.end method

.method static bridge synthetic zze(Lcom/google/android/gms/tagmanager/zzal;)Lcom/google/android/gms/tagmanager/zzaa;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    return-object p0
.end method

.method static bridge synthetic zzf(Lcom/google/android/gms/tagmanager/zzal;)Lcom/google/android/gms/tagmanager/zzam;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzi:Lcom/google/android/gms/tagmanager/zzam;

    return-object p0
.end method

.method static bridge synthetic zzg(Lcom/google/android/gms/tagmanager/zzal;)Lcom/google/android/gms/tagmanager/zzec;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzd:Lcom/google/android/gms/tagmanager/zzec;

    return-object p0
.end method

.method static bridge synthetic zzi(Lcom/google/android/gms/tagmanager/zzal;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/zzal;->zzr(J)V

    return-void
.end method

.method static bridge synthetic zzj(Lcom/google/android/gms/tagmanager/zzal;Lcom/google/android/gms/internal/gtm/zzai;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/zzal;->zzt(Lcom/google/android/gms/internal/gtm/zzai;)V

    return-void
.end method

.method static bridge synthetic zzk(Lcom/google/android/gms/tagmanager/zzal;Lcom/google/android/gms/internal/gtm/zzai;JZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/tagmanager/zzal;->zzu(Lcom/google/android/gms/internal/gtm/zzai;JZ)V

    return-void
.end method

.method static bridge synthetic zzp(Lcom/google/android/gms/tagmanager/zzal;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzm:Z

    const/4 p0, 0x0

    return p0
.end method

.method static bridge synthetic zzq(Lcom/google/android/gms/tagmanager/zzal;)Z
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzal;->zzv()Z

    move-result p0

    return p0
.end method

.method private final declared-synchronized zzr(J)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzq:Lcom/google/android/gms/tagmanager/zzaj;

    if-nez v0, :cond_0

    const-string p1, "Refresh requested, but no network load scheduler."

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzn:Lcom/google/android/gms/internal/gtm/zzai;

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzai;->zzh()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p1, p2, v1}, Lcom/google/android/gms/tagmanager/zzaj;->zza(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private final zzs(Z)V
    .locals 11

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    new-instance v1, Lcom/google/android/gms/tagmanager/zzae;

    const/4 v2, 0x0

    .line 1
    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/tagmanager/zzae;-><init>(Lcom/google/android/gms/tagmanager/zzal;Lcom/google/android/gms/tagmanager/zzad;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/zzak;->zzd(Lcom/google/android/gms/tagmanager/zzdg;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzq:Lcom/google/android/gms/tagmanager/zzaj;

    new-instance v1, Lcom/google/android/gms/tagmanager/zzag;

    .line 2
    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/tagmanager/zzag;-><init>(Lcom/google/android/gms/tagmanager/zzal;Lcom/google/android/gms/tagmanager/zzaf;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/zzaj;->zzc(Lcom/google/android/gms/tagmanager/zzdg;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    iget v1, p0, Lcom/google/android/gms/tagmanager/zzal;->zze:I

    .line 3
    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/zzak;->zza(I)Lcom/google/android/gms/internal/gtm/zzrs;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 4
    new-instance v0, Lcom/google/android/gms/tagmanager/zzaa;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzg:Lcom/google/android/gms/tagmanager/TagManager;

    iget-object v9, p0, Lcom/google/android/gms/tagmanager/zzal;->zzc:Landroid/os/Looper;

    new-instance v10, Lcom/google/android/gms/tagmanager/Container;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzal;->zzf:Landroid/content/Context;

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/TagManager;->getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/tagmanager/zzal;->zzh:Ljava/lang/String;

    const-wide/16 v6, 0x0

    move-object v2, v10

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/tagmanager/Container;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Ljava/lang/String;JLcom/google/android/gms/internal/gtm/zzrs;)V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzal;->zzb:Lcom/google/android/gms/tagmanager/zzai;

    invoke-direct {v0, v1, v9, v10, v2}, Lcom/google/android/gms/tagmanager/zzaa;-><init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/zzy;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    :cond_0
    new-instance v0, Lcom/google/android/gms/tagmanager/zzac;

    .line 6
    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/tagmanager/zzac;-><init>(Lcom/google/android/gms/tagmanager/zzal;Z)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzr:Lcom/google/android/gms/tagmanager/zzac;

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzal;->zzv()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzq:Lcom/google/android/gms/tagmanager/zzaj;

    const-wide/16 v0, 0x0

    const-string v2, ""

    .line 8
    invoke-interface {p1, v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzaj;->zza(JLjava/lang/String;)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    .line 9
    invoke-interface {p1}, Lcom/google/android/gms/tagmanager/zzak;->zzb()V

    return-void
.end method

.method private final declared-synchronized zzt(Lcom/google/android/gms/internal/gtm/zzai;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    if-eqz v0, :cond_0

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzrl;->zze()Lcom/google/android/gms/internal/gtm/zzrk;

    move-result-object v0

    const-wide/16 v1, 0x0

    .line 2
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzrk;->zzc(J)Lcom/google/android/gms/internal/gtm/zzrk;

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzaa;->zzl()Lcom/google/android/gms/internal/gtm/zzaa;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/gtm/zzrk;->zza(Lcom/google/android/gms/internal/gtm/zzaa;)Lcom/google/android/gms/internal/gtm/zzrk;

    iget-wide v1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzo:J

    .line 4
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzrk;->zzc(J)Lcom/google/android/gms/internal/gtm/zzrk;

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzaa;->zzj()Lcom/google/android/gms/internal/gtm/zzz;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzut;->zzA()Lcom/google/android/gms/internal/gtm/zzuz;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/gtm/zzaa;

    .line 6
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/gtm/zzrk;->zza(Lcom/google/android/gms/internal/gtm/zzaa;)Lcom/google/android/gms/internal/gtm/zzrk;

    .line 7
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/gtm/zzrk;->zzb(Lcom/google/android/gms/internal/gtm/zzai;)Lcom/google/android/gms/internal/gtm/zzrk;

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzut;->zzA()Lcom/google/android/gms/internal/gtm/zzuz;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzrl;

    invoke-interface {p1, v0}, Lcom/google/android/gms/tagmanager/zzak;->zzc(Lcom/google/android/gms/internal/gtm/zzrl;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private final declared-synchronized zzu(Lcom/google/android/gms/internal/gtm/zzai;JZ)V
    .locals 9

    monitor-enter p0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzal;->isReady()Z

    move-result p4

    if-eqz p4, :cond_1

    iget-object p4, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p4, :cond_0

    goto :goto_0

    .line 9
    :cond_0
    monitor-exit p0

    return-void

    .line 1
    :cond_1
    :goto_0
    :try_start_1
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzn:Lcom/google/android/gms/internal/gtm/zzai;

    iput-wide p2, p0, Lcom/google/android/gms/tagmanager/zzal;->zzo:J

    iget-object p4, p0, Lcom/google/android/gms/tagmanager/zzal;->zzi:Lcom/google/android/gms/tagmanager/zzam;

    .line 2
    invoke-virtual {p4}, Lcom/google/android/gms/tagmanager/zzam;->zza()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    iget-wide v4, p0, Lcom/google/android/gms/tagmanager/zzal;->zzo:J

    add-long/2addr v4, v0

    iget-object p4, p0, Lcom/google/android/gms/tagmanager/zzal;->zza:Lcom/google/android/gms/common/util/Clock;

    .line 3
    invoke-interface {p4}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v4, v6

    .line 4
    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 5
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 6
    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzal;->zzr(J)V

    new-instance p4, Lcom/google/android/gms/tagmanager/Container;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzal;->zzf:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzg:Lcom/google/android/gms/tagmanager/TagManager;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/TagManager;->getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/tagmanager/zzal;->zzh:Ljava/lang/String;

    move-object v2, p4

    move-wide v6, p2

    move-object v8, p1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/tagmanager/Container;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Ljava/lang/String;JLcom/google/android/gms/internal/gtm/zzai;)V

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    if-nez p1, :cond_2

    .line 8
    new-instance p1, Lcom/google/android/gms/tagmanager/zzaa;

    iget-object p2, p0, Lcom/google/android/gms/tagmanager/zzal;->zzg:Lcom/google/android/gms/tagmanager/TagManager;

    iget-object p3, p0, Lcom/google/android/gms/tagmanager/zzal;->zzc:Landroid/os/Looper;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzb:Lcom/google/android/gms/tagmanager/zzai;

    invoke-direct {p1, p2, p3, p4, v0}, Lcom/google/android/gms/tagmanager/zzaa;-><init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/zzy;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    goto :goto_1

    .line 11
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    .line 9
    invoke-virtual {p1, p4}, Lcom/google/android/gms/tagmanager/zzaa;->zzc(Lcom/google/android/gms/tagmanager/Container;)V

    .line 10
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzal;->isReady()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzr:Lcom/google/android/gms/tagmanager/zzac;

    invoke-virtual {p1, p4}, Lcom/google/android/gms/tagmanager/zzac;->zza(Lcom/google/android/gms/tagmanager/Container;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/zzal;->setResult(Lcom/google/android/gms/common/api/Result;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private final zzv()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzea;->zza()Lcom/google/android/gms/tagmanager/zzea;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzea;->zze()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzea;->zze()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzh:Ljava/lang/String;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzea;->zzc()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method protected final bridge synthetic createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/zzal;->zzd(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object p1

    return-object p1
.end method

.method protected final zzd(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzl:Lcom/google/android/gms/tagmanager/zzaa;

    return-object p1

    .line 1
    :cond_0
    sget-object v0, Lcom/google/android/gms/common/api/Status;->RESULT_TIMEOUT:Lcom/google/android/gms/common/api/Status;

    if-ne p1, v0, :cond_1

    const-string v0, "timer expired: setting result to failure"

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    .line 3
    :cond_1
    new-instance v0, Lcom/google/android/gms/tagmanager/zzaa;

    invoke-direct {v0, p1}, Lcom/google/android/gms/tagmanager/zzaa;-><init>(Lcom/google/android/gms/common/api/Status;)V

    return-object v0
.end method

.method final declared-synchronized zzh()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzp:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final zzl()V
    .locals 9

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    iget v1, p0, Lcom/google/android/gms/tagmanager/zzal;->zze:I

    .line 1
    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/zzak;->zza(I)Lcom/google/android/gms/internal/gtm/zzrs;

    move-result-object v8

    const/4 v0, 0x0

    if-eqz v8, :cond_0

    new-instance v1, Lcom/google/android/gms/tagmanager/Container;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzal;->zzf:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzal;->zzg:Lcom/google/android/gms/tagmanager/TagManager;

    .line 2
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/TagManager;->getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/gms/tagmanager/zzal;->zzh:Ljava/lang/String;

    const-wide/16 v6, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/google/android/gms/tagmanager/Container;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Ljava/lang/String;JLcom/google/android/gms/internal/gtm/zzrs;)V

    .line 3
    new-instance v2, Lcom/google/android/gms/tagmanager/zzaa;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzal;->zzg:Lcom/google/android/gms/tagmanager/TagManager;

    iget-object v4, p0, Lcom/google/android/gms/tagmanager/zzal;->zzc:Landroid/os/Looper;

    new-instance v5, Lcom/google/android/gms/tagmanager/zzab;

    invoke-direct {v5, p0}, Lcom/google/android/gms/tagmanager/zzab;-><init>(Lcom/google/android/gms/tagmanager/zzal;)V

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/google/android/gms/tagmanager/zzaa;-><init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/zzy;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/zzal;->setResult(Lcom/google/android/gms/common/api/Result;)V

    goto :goto_0

    :cond_0
    const-string v1, "Default was requested, but no default container was found"

    .line 4
    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    .line 5
    new-instance v2, Lcom/google/android/gms/common/api/Status;

    const/16 v3, 0xa

    invoke-direct {v2, v3, v1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/zzal;->zzd(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/tagmanager/zzal;->setResult(Lcom/google/android/gms/common/api/Result;)V

    .line 3
    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzq:Lcom/google/android/gms/tagmanager/zzaj;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzj:Lcom/google/android/gms/tagmanager/zzak;

    return-void
.end method

.method public final zzm()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzal;->zzs(Z)V

    return-void
.end method

.method public final zzn()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/tagmanager/zzal;->zzs(Z)V

    return-void
.end method

.method final declared-synchronized zzo(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzal;->zzp:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzal;->zzq:Lcom/google/android/gms/tagmanager/zzaj;

    if-eqz v0, :cond_0

    .line 1
    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/zzaj;->zzb(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
