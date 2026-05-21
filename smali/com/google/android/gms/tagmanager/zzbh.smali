.class public final Lcom/google/android/gms/tagmanager/zzbh;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"


# static fields
.field private static zza:Lcom/google/android/gms/tagmanager/zzbh;

.field private static final zzb:Ljava/lang/Object;


# instance fields
.field private final zzc:Lcom/google/android/gms/tagmanager/zzec;

.field private final zzd:Lcom/google/android/gms/tagmanager/zzcc;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzbh;->zzb:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzcc;->zzb(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzcc;

    move-result-object p1

    new-instance v0, Lcom/google/android/gms/tagmanager/zzex;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzex;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzbh;->zzd:Lcom/google/android/gms/tagmanager/zzcc;

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzbh;->zzc:Lcom/google/android/gms/tagmanager/zzec;

    return-void
.end method

.method public static zzb(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzbh;
    .locals 2

    sget-object v0, Lcom/google/android/gms/tagmanager/zzbh;->zzb:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/android/gms/tagmanager/zzbh;->zza:Lcom/google/android/gms/tagmanager/zzbh;

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/tagmanager/zzbh;

    .line 1
    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/zzbh;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/google/android/gms/tagmanager/zzbh;->zza:Lcom/google/android/gms/tagmanager/zzbh;

    :cond_0
    sget-object p0, Lcom/google/android/gms/tagmanager/zzbh;->zza:Lcom/google/android/gms/tagmanager/zzbh;

    .line 2
    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Z
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzbh;->zzc:Lcom/google/android/gms/tagmanager/zzec;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzec;->zza()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "Too many urls sent too quickly with the TagManagerSender, rate limiting invoked."

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzbh;->zzd:Lcom/google/android/gms/tagmanager/zzcc;

    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 4
    invoke-virtual {v0, p1, v1, v2}, Lcom/google/android/gms/tagmanager/zzcc;->zzf(Ljava/lang/String;J)V

    const/4 p1, 0x1

    return p1
.end method
