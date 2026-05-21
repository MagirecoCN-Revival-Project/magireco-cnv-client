.class final Lcom/google/android/gms/tagmanager/zzaa;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/tagmanager/ContainerHolder;


# instance fields
.field private final zza:Landroid/os/Looper;

.field private zzb:Lcom/google/android/gms/tagmanager/Container;

.field private zzc:Lcom/google/android/gms/tagmanager/Container;

.field private final zzd:Lcom/google/android/gms/common/api/Status;

.field private zze:Lcom/google/android/gms/tagmanager/zzz;

.field private zzf:Lcom/google/android/gms/tagmanager/zzy;

.field private zzg:Z

.field private zzh:Lcom/google/android/gms/tagmanager/TagManager;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzd:Lcom/google/android/gms/common/api/Status;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zza:Landroid/os/Looper;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/zzy;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzh:Lcom/google/android/gms/tagmanager/TagManager;

    if-nez p2, :cond_0

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    :cond_0
    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzaa;->zza:Landroid/os/Looper;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzb:Lcom/google/android/gms/tagmanager/Container;

    iput-object p4, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzf:Lcom/google/android/gms/tagmanager/zzy;

    .line 2
    sget-object p2, Lcom/google/android/gms/common/api/Status;->RESULT_SUCCESS:Lcom/google/android/gms/common/api/Status;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzd:Lcom/google/android/gms/common/api/Status;

    .line 3
    invoke-virtual {p1, p0}, Lcom/google/android/gms/tagmanager/TagManager;->zza(Lcom/google/android/gms/tagmanager/zzaa;)I

    return-void
.end method

.method private final zzf()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zze:Lcom/google/android/gms/tagmanager/zzz;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzc:Lcom/google/android/gms/tagmanager/Container;

    .line 1
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/Container;->zzc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzz;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzz;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public final declared-synchronized getContainer()Lcom/google/android/gms/tagmanager/Container;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "ContainerHolder is released."

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzc:Lcom/google/android/gms/tagmanager/Container;

    if-eqz v0, :cond_1

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzb:Lcom/google/android/gms/tagmanager/Container;

    iput-object v1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzc:Lcom/google/android/gms/tagmanager/Container;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzb:Lcom/google/android/gms/tagmanager/Container;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzd:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method

.method public final declared-synchronized refresh()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    if-eqz v0, :cond_0

    const-string v0, "Refreshing a released ContainerHolder."

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzf:Lcom/google/android/gms/tagmanager/zzy;

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzy;->zzb()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized release()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    if-eqz v0, :cond_0

    const-string v0, "Releasing a released ContainerHolder."

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzh:Lcom/google/android/gms/tagmanager/TagManager;

    .line 2
    invoke-virtual {v0, p0}, Lcom/google/android/gms/tagmanager/TagManager;->zzc(Lcom/google/android/gms/tagmanager/zzaa;)Z

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzb:Lcom/google/android/gms/tagmanager/Container;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/Container;->zze()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzb:Lcom/google/android/gms/tagmanager/Container;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzc:Lcom/google/android/gms/tagmanager/Container;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzf:Lcom/google/android/gms/tagmanager/zzy;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zze:Lcom/google/android/gms/tagmanager/zzz;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized setContainerAvailableListener(Lcom/google/android/gms/tagmanager/ContainerHolder$ContainerAvailableListener;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    if-eqz v0, :cond_0

    const-string p1, "ContainerHolder is released."

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    if-nez p1, :cond_1

    const/4 p1, 0x0

    :try_start_1
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zze:Lcom/google/android/gms/tagmanager/zzz;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_2
    new-instance v0, Lcom/google/android/gms/tagmanager/zzz;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zza:Landroid/os/Looper;

    .line 2
    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/tagmanager/zzz;-><init>(Lcom/google/android/gms/tagmanager/zzaa;Lcom/google/android/gms/tagmanager/ContainerHolder$ContainerAvailableListener;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zze:Lcom/google/android/gms/tagmanager/zzz;

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzc:Lcom/google/android/gms/tagmanager/Container;

    if-eqz p1, :cond_2

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzaa;->zzf()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method final zza()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    if-eqz v0, :cond_0

    const-string v0, "getContainerId called on a released ContainerHolder."

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    const-string v0, ""

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzb:Lcom/google/android/gms/tagmanager/Container;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/Container;->getContainerId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final zzb()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    if-eqz v0, :cond_0

    const-string v0, "setCtfeUrlPathAndQuery called on a released ContainerHolder."

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    const-string v0, ""

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzf:Lcom/google/android/gms/tagmanager/zzy;

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzy;->zza()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final declared-synchronized zzc(Lcom/google/android/gms/tagmanager/Container;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzc:Lcom/google/android/gms/tagmanager/Container;

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzaa;->zzf()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized zzd(Ljava/lang/String;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzb:Lcom/google/android/gms/tagmanager/Container;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/Container;->zzd(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method final zze(Ljava/lang/String;)V
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzg:Z

    if-eqz v0, :cond_0

    const-string p1, "setCtfeUrlPathAndQuery called on a released ContainerHolder."

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzaa;->zzf:Lcom/google/android/gms/tagmanager/zzy;

    .line 2
    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/zzy;->zzc(Ljava/lang/String;)V

    return-void
.end method
