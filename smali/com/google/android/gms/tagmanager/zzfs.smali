.class public final Lcom/google/android/gms/tagmanager/zzfs;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"


# instance fields
.field private zza:Lcom/google/android/gms/analytics/GoogleAnalytics;

.field private final zzb:Landroid/content/Context;

.field private zzc:Lcom/google/android/gms/analytics/Tracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzfs;->zzb:Landroid/content/Context;

    return-void
.end method

.method private final declared-synchronized zzb(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzfs;->zza:Lcom/google/android/gms/analytics/GoogleAnalytics;

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzfs;->zzb:Landroid/content/Context;

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzfs;->zza:Lcom/google/android/gms/analytics/GoogleAnalytics;

    new-instance v0, Lcom/google/android/gms/tagmanager/zzfr;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzfr;-><init>()V

    .line 2
    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->setLogger(Lcom/google/android/gms/analytics/Logger;)V

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzfs;->zza:Lcom/google/android/gms/analytics/GoogleAnalytics;

    const-string v0, "_GTM_DEFAULT_TRACKER_"

    .line 3
    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->newTracker(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzfs;->zzc:Lcom/google/android/gms/analytics/Tracker;
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


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;
    .locals 0

    const-string p1, "_GTM_DEFAULT_TRACKER_"

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/tagmanager/zzfs;->zzb(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzfs;->zzc:Lcom/google/android/gms/analytics/Tracker;

    return-object p1
.end method
