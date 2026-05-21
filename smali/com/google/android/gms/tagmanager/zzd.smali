.class public final Lcom/google/android/gms/tagmanager/zzd;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"


# static fields
.field private static final zza:Ljava/lang/Object;

.field private static zzb:Lcom/google/android/gms/tagmanager/zzd;


# instance fields
.field private volatile zzc:J

.field private volatile zzd:J

.field private volatile zze:Z

.field private volatile zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

.field private volatile zzg:J

.field private volatile zzh:J

.field private final zzi:Landroid/content/Context;

.field private final zzj:Lcom/google/android/gms/common/util/Clock;

.field private final zzk:Ljava/lang/Thread;

.field private final zzl:Ljava/lang/Object;

.field private final zzm:Lcom/google/android/gms/tagmanager/zzc;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzd;->zza:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzc;Lcom/google/android/gms/common/util/Clock;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/32 v0, 0xdbba0

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzc:J

    const-wide/16 v0, 0x7530

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzd:J

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/google/android/gms/tagmanager/zzd;->zze:Z

    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzd;->zzl:Ljava/lang/Object;

    new-instance p2, Lcom/google/android/gms/tagmanager/zza;

    .line 1
    invoke-direct {p2, p0}, Lcom/google/android/gms/tagmanager/zza;-><init>(Lcom/google/android/gms/tagmanager/zzd;)V

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzd;->zzm:Lcom/google/android/gms/tagmanager/zzc;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzd;->zzj:Lcom/google/android/gms/common/util/Clock;

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzd;->zzi:Landroid/content/Context;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzd;->zzi:Landroid/content/Context;

    .line 3
    :goto_0
    invoke-interface {p3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/gms/tagmanager/zzd;->zzg:J

    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lcom/google/android/gms/tagmanager/zzb;

    .line 4
    invoke-direct {p2, p0}, Lcom/google/android/gms/tagmanager/zzb;-><init>(Lcom/google/android/gms/tagmanager/zzd;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzd;->zzk:Ljava/lang/Thread;

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/android/gms/tagmanager/zzd;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzi:Landroid/content/Context;

    return-object p0
.end method

.method public static zzb(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzd;
    .locals 4

    sget-object v0, Lcom/google/android/gms/tagmanager/zzd;->zzb:Lcom/google/android/gms/tagmanager/zzd;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzd;->zza:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/tagmanager/zzd;->zzb:Lcom/google/android/gms/tagmanager/zzd;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/tagmanager/zzd;

    const/4 v2, 0x0

    .line 1
    invoke-static {}, Lcom/google/android/gms/common/util/DefaultClock;->getInstance()Lcom/google/android/gms/common/util/Clock;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lcom/google/android/gms/tagmanager/zzd;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzc;Lcom/google/android/gms/common/util/Clock;)V

    sput-object v1, Lcom/google/android/gms/tagmanager/zzd;->zzb:Lcom/google/android/gms/tagmanager/zzd;

    iget-object p0, v1, Lcom/google/android/gms/tagmanager/zzd;->zzk:Ljava/lang/Thread;

    .line 2
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 3
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/google/android/gms/tagmanager/zzd;->zzb:Lcom/google/android/gms/tagmanager/zzd;

    return-object p0
.end method

.method static bridge synthetic zzd(Lcom/google/android/gms/tagmanager/zzd;)V
    .locals 4

    const/16 v0, 0xa

    .line 1
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    :goto_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zze:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzm:Lcom/google/android/gms/tagmanager/zzc;

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzc;->zza()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    if-eqz v0, :cond_0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzj:Lcom/google/android/gms/common/util/Clock;

    .line 3
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzh:J

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdh;->zzb:Lcom/google/android/gms/tagmanager/zzbg;

    const-string v1, "Obtained fresh AdvertisingId info from GmsCore."

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzb(Ljava/lang/String;)V

    :cond_0
    monitor-enter p0

    .line 5
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 6
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzl:Ljava/lang/Object;

    monitor-enter v0
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzd;->zzl:Ljava/lang/Object;

    iget-wide v2, p0, Lcom/google/android/gms/tagmanager/zzd;->zzc:J

    .line 7
    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 8
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 6
    :catch_0
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdh;->zzb:Lcom/google/android/gms/tagmanager/zzbg;

    const-string v1, "sleep interrupted in AdvertiserDataPoller thread; continuing"

    .line 9
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzb(Ljava/lang/String;)V

    goto :goto_0

    :catchall_1
    move-exception v0

    .line 6
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0

    :cond_1
    return-void
.end method

.method private final zzg()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzj:Lcom/google/android/gms/common/util/Clock;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gms/tagmanager/zzd;->zzh:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x36ee80

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    :cond_0
    return-void
.end method

.method private final zzh()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzj:Lcom/google/android/gms/common/util/Clock;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gms/tagmanager/zzd;->zzg:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/google/android/gms/tagmanager/zzd;->zzd:J

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzl:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzd;->zzl:Ljava/lang/Object;

    .line 2
    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzj:Lcom/google/android/gms/common/util/Clock;

    .line 4
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzg:J

    return-void

    :catchall_0
    move-exception v1

    .line 3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_0
    return-void
.end method

.method private final zzi()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zze:Z

    if-nez v0, :cond_0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzd;->zzh()V

    const-wide/16 v0, 0x1f4

    .line 2
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 3
    :catch_0
    :cond_0
    :goto_0
    :try_start_1
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public final zzc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    if-nez v0, :cond_0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzd;->zzi()V

    goto :goto_0

    .line 2
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzd;->zzh()V

    .line 3
    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzd;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zze()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zze:Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzk:Ljava/lang/Thread;

    .line 1
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    return-void
.end method

.method public final zzf()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    if-nez v0, :cond_0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzd;->zzi()V

    goto :goto_0

    .line 2
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzd;->zzh()V

    .line 3
    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzd;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzd;->zzf:Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    return v0

    :cond_2
    :goto_1
    const/4 v0, 0x1

    return v0
.end method
