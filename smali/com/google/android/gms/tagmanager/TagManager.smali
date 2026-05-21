.class public Lcom/google/android/gms/tagmanager/TagManager;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"


# static fields
.field private static zza:Lcom/google/android/gms/tagmanager/TagManager;


# instance fields
.field private final zzb:Lcom/google/android/gms/tagmanager/zzfp;

.field private final zzc:Landroid/content/Context;

.field private final zzd:Lcom/google/android/gms/tagmanager/DataLayer;

.field private final zze:Lcom/google/android/gms/tagmanager/zzey;

.field private final zzf:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzaa;",
            ">;"
        }
    .end annotation
.end field

.field private final zzg:Lcom/google/android/gms/tagmanager/zzap;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzfp;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/zzey;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzc:Landroid/content/Context;

    iput-object p4, p0, Lcom/google/android/gms/tagmanager/TagManager;->zze:Lcom/google/android/gms/tagmanager/zzey;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzb:Lcom/google/android/gms/tagmanager/zzfp;

    new-instance p2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    invoke-direct {p2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzd:Lcom/google/android/gms/tagmanager/DataLayer;

    new-instance p2, Lcom/google/android/gms/tagmanager/zzfm;

    .line 3
    invoke-direct {p2, p0}, Lcom/google/android/gms/tagmanager/zzfm;-><init>(Lcom/google/android/gms/tagmanager/TagManager;)V

    invoke-virtual {p3, p2}, Lcom/google/android/gms/tagmanager/DataLayer;->zzg(Lcom/google/android/gms/tagmanager/zzav;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/zzg;

    .line 4
    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/zzg;-><init>(Landroid/content/Context;)V

    invoke-virtual {p3, p2}, Lcom/google/android/gms/tagmanager/DataLayer;->zzg(Lcom/google/android/gms/tagmanager/zzav;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/zzap;

    .line 5
    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzap;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzg:Lcom/google/android/gms/tagmanager/zzap;

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lcom/google/android/gms/tagmanager/zzfo;

    .line 7
    invoke-direct {p2, p0}, Lcom/google/android/gms/tagmanager/zzfo;-><init>(Lcom/google/android/gms/tagmanager/TagManager;)V

    invoke-virtual {p1, p2}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 8
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzd;->zzb(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzd;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/TagManager;
    .locals 5

    const-class v0, Lcom/google/android/gms/tagmanager/TagManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/tagmanager/TagManager;->zza:Lcom/google/android/gms/tagmanager/TagManager;

    if-nez v1, :cond_1

    if-eqz p0, :cond_0

    .line 2
    new-instance v1, Lcom/google/android/gms/tagmanager/zzfn;

    invoke-direct {v1}, Lcom/google/android/gms/tagmanager/zzfn;-><init>()V

    .line 3
    new-instance v2, Lcom/google/android/gms/tagmanager/zzbe;

    invoke-direct {v2, p0}, Lcom/google/android/gms/tagmanager/zzbe;-><init>(Landroid/content/Context;)V

    new-instance v3, Lcom/google/android/gms/tagmanager/TagManager;

    .line 4
    new-instance v4, Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-direct {v4, v2}, Lcom/google/android/gms/tagmanager/DataLayer;-><init>(Lcom/google/android/gms/tagmanager/zzax;)V

    .line 5
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzff;->zzg()Lcom/google/android/gms/tagmanager/zzff;

    move-result-object v2

    invoke-direct {v3, p0, v1, v4, v2}, Lcom/google/android/gms/tagmanager/TagManager;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzfp;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/zzey;)V

    sput-object v3, Lcom/google/android/gms/tagmanager/TagManager;->zza:Lcom/google/android/gms/tagmanager/TagManager;

    goto :goto_0

    :cond_0
    const-string p0, "TagManager.getInstance requires non-null context."

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 2
    throw p0

    .line 5
    :cond_1
    :goto_0
    sget-object p0, Lcom/google/android/gms/tagmanager/TagManager;->zza:Lcom/google/android/gms/tagmanager/TagManager;

    .line 6
    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method static bridge synthetic zzb(Lcom/google/android/gms/tagmanager/TagManager;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    invoke-interface {p0}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/zzaa;

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/zzaa;->zzd(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public dispatch()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zze:Lcom/google/android/gms/tagmanager/zzey;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzey;->zza()V

    return-void
.end method

.method public getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzd:Lcom/google/android/gms/tagmanager/DataLayer;

    return-object v0
.end method

.method public loadContainerDefaultOnly(Ljava/lang/String;I)Lcom/google/android/gms/common/api/PendingResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/tagmanager/ContainerHolder;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzc:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzg:Lcom/google/android/gms/tagmanager/zzap;

    .line 1
    new-instance v7, Lcom/google/android/gms/tagmanager/zzal;

    const/4 v3, 0x0

    move-object v0, v7

    move-object v2, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/zzal;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzap;)V

    .line 2
    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/zzal;->zzl()V

    return-object v7
.end method

.method public loadContainerDefaultOnly(Ljava/lang/String;ILandroid/os/Handler;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Landroid/os/Handler;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/tagmanager/ContainerHolder;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzc:Landroid/content/Context;

    .line 3
    invoke-virtual {p3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v3

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzg:Lcom/google/android/gms/tagmanager/zzap;

    .line 4
    new-instance p3, Lcom/google/android/gms/tagmanager/zzal;

    move-object v0, p3

    move-object v2, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/zzal;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzap;)V

    .line 5
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzal;->zzl()V

    return-object p3
.end method

.method public loadContainerPreferFresh(Ljava/lang/String;I)Lcom/google/android/gms/common/api/PendingResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/tagmanager/ContainerHolder;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzc:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzg:Lcom/google/android/gms/tagmanager/zzap;

    .line 1
    new-instance v7, Lcom/google/android/gms/tagmanager/zzal;

    const/4 v3, 0x0

    move-object v0, v7

    move-object v2, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/zzal;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzap;)V

    .line 2
    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/zzal;->zzm()V

    return-object v7
.end method

.method public loadContainerPreferFresh(Ljava/lang/String;ILandroid/os/Handler;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Landroid/os/Handler;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/tagmanager/ContainerHolder;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzc:Landroid/content/Context;

    .line 3
    invoke-virtual {p3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v3

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzg:Lcom/google/android/gms/tagmanager/zzap;

    .line 4
    new-instance p3, Lcom/google/android/gms/tagmanager/zzal;

    move-object v0, p3

    move-object v2, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/zzal;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzap;)V

    .line 5
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzal;->zzm()V

    return-object p3
.end method

.method public loadContainerPreferNonDefault(Ljava/lang/String;I)Lcom/google/android/gms/common/api/PendingResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/tagmanager/ContainerHolder;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzc:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzg:Lcom/google/android/gms/tagmanager/zzap;

    .line 1
    new-instance v7, Lcom/google/android/gms/tagmanager/zzal;

    const/4 v3, 0x0

    move-object v0, v7

    move-object v2, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/zzal;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzap;)V

    .line 2
    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/zzal;->zzn()V

    return-object v7
.end method

.method public loadContainerPreferNonDefault(Ljava/lang/String;ILandroid/os/Handler;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Landroid/os/Handler;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/tagmanager/ContainerHolder;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzc:Landroid/content/Context;

    .line 3
    invoke-virtual {p3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v3

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzg:Lcom/google/android/gms/tagmanager/zzap;

    .line 4
    new-instance p3, Lcom/google/android/gms/tagmanager/zzal;

    move-object v0, p3

    move-object v2, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/zzal;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzap;)V

    .line 5
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzal;->zzn()V

    return-object p3
.end method

.method public setVerboseLoggingEnabled(Z)V
    .locals 1

    const/4 v0, 0x1

    if-eq v0, p1, :cond_0

    const/4 p1, 0x5

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    :goto_0
    sput p1, Lcom/google/android/gms/tagmanager/zzdh;->zza:I

    sget-object v0, Lcom/google/android/gms/tagmanager/zzdh;->zzb:Lcom/google/android/gms/tagmanager/zzbg;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/zzbg;->zzc(I)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/tagmanager/zzaa;)I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaa;->zza()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result p1

    return p1
.end method

.method public final zzc(Lcom/google/android/gms/tagmanager/zzaa;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaa;->zza()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method final declared-synchronized zzd(Landroid/net/Uri;)Z
    .locals 6

    monitor-enter p0

    .line 1
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzea;->zza()Lcom/google/android/gms/tagmanager/zzea;

    move-result-object v0

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/zzea;->zzd(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzea;->zzc()Ljava/lang/String;

    move-result-object p1

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzea;->zze()I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_5

    const/4 v1, 0x1

    if-eqz v2, :cond_3

    if-eq v2, v1, :cond_0

    const/4 v4, 0x2

    if-eq v2, v4, :cond_0

    goto :goto_1

    .line 15
    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 5
    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 6
    invoke-interface {v5, v4}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/tagmanager/zzaa;

    .line 7
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzea;->zzb()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/google/android/gms/tagmanager/zzaa;->zze(Ljava/lang/String;)V

    .line 9
    invoke-virtual {v5}, Lcom/google/android/gms/tagmanager/zzaa;->refresh()V

    goto :goto_0

    .line 10
    :cond_2
    invoke-virtual {v5}, Lcom/google/android/gms/tagmanager/zzaa;->zzb()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 11
    invoke-virtual {v5, v3}, Lcom/google/android/gms/tagmanager/zzaa;->zze(Ljava/lang/String;)V

    .line 12
    invoke-virtual {v5}, Lcom/google/android/gms/tagmanager/zzaa;->refresh()V

    goto :goto_0

    .line 4
    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/TagManager;->zzf:Ljava/util/concurrent/ConcurrentMap;

    .line 13
    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/tagmanager/zzaa;

    if-eqz p1, :cond_4

    .line 14
    invoke-virtual {p1, v3}, Lcom/google/android/gms/tagmanager/zzaa;->zze(Ljava/lang/String;)V

    .line 15
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaa;->refresh()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_4
    :goto_1
    monitor-exit p0

    return v1

    .line 4
    :cond_5
    :try_start_1
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_6
    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
