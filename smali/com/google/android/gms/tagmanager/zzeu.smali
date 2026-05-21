.class final Lcom/google/android/gms/tagmanager/zzeu;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"


# static fields
.field private static final zza:Lcom/google/android/gms/tagmanager/zzds;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/zzds<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final zzb:Lcom/google/android/gms/internal/gtm/zzrs;

.field private final zzc:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzbu;",
            ">;"
        }
    .end annotation
.end field

.field private final zzd:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzbu;",
            ">;"
        }
    .end annotation
.end field

.field private final zze:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzbu;",
            ">;"
        }
    .end annotation
.end field

.field private final zzf:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/internal/gtm/zzrw;",
            ">;"
        }
    .end annotation
.end field

.field private final zzg:Lcom/google/android/gms/tagmanager/DataLayer;

.field private final zzh:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzet;",
            ">;"
        }
    .end annotation
.end field

.field private volatile zzi:Ljava/lang/String;

.field private zzj:I

.field private final zzk:Lcom/google/android/gms/tagmanager/zzdl;

.field private final zzl:Lcom/google/android/gms/tagmanager/zzdb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/zzdb;"
        }
    .end annotation
.end field

.field private final zzm:Lcom/google/android/gms/tagmanager/zzdb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/zzdb;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/google/android/gms/tagmanager/zzds;

    .line 1
    invoke-static {}, Lcom/google/android/gms/tagmanager/zzfv;->zzb()Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/gtm/zzrs;Lcom/google/android/gms/tagmanager/DataLayer;Lcom/google/android/gms/tagmanager/zzaq;Lcom/google/android/gms/tagmanager/zzaq;Lcom/google/android/gms/tagmanager/zzdl;[B)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzb:Lcom/google/android/gms/internal/gtm/zzrs;

    new-instance p7, Ljava/util/HashSet;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzrs;->zzc()Ljava/util/List;

    move-result-object v0

    .line 1
    invoke-direct {p7, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object p7, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzf:Ljava/util/Set;

    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzg:Lcom/google/android/gms/tagmanager/DataLayer;

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzk:Lcom/google/android/gms/tagmanager/zzdl;

    new-instance p6, Lcom/google/android/gms/tagmanager/zzen;

    invoke-direct {p6, p0}, Lcom/google/android/gms/tagmanager/zzen;-><init>(Lcom/google/android/gms/tagmanager/zzeu;)V

    new-instance v0, Lcom/google/android/gms/tagmanager/zzs;

    .line 2
    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzs;-><init>()V

    const/high16 v0, 0x100000

    .line 3
    invoke-static {v0, p6}, Lcom/google/android/gms/tagmanager/zzs;->zza(ILcom/google/android/gms/tagmanager/zzr;)Lcom/google/android/gms/tagmanager/zzdb;

    move-result-object p6

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzl:Lcom/google/android/gms/tagmanager/zzdb;

    new-instance p6, Lcom/google/android/gms/tagmanager/zzeo;

    invoke-direct {p6, p0}, Lcom/google/android/gms/tagmanager/zzeo;-><init>(Lcom/google/android/gms/tagmanager/zzeu;)V

    new-instance v1, Lcom/google/android/gms/tagmanager/zzs;

    .line 4
    invoke-direct {v1}, Lcom/google/android/gms/tagmanager/zzs;-><init>()V

    .line 5
    invoke-static {v0, p6}, Lcom/google/android/gms/tagmanager/zzs;->zza(ILcom/google/android/gms/tagmanager/zzr;)Lcom/google/android/gms/tagmanager/zzdb;

    move-result-object p6

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzm:Lcom/google/android/gms/tagmanager/zzdb;

    new-instance p6, Ljava/util/HashMap;

    .line 6
    invoke-direct {p6}, Ljava/util/HashMap;-><init>()V

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzc:Ljava/util/Map;

    .line 7
    new-instance v0, Lcom/google/android/gms/tagmanager/zzo;

    invoke-direct {v0, p1}, Lcom/google/android/gms/tagmanager/zzo;-><init>(Landroid/content/Context;)V

    .line 8
    invoke-static {p6, v0}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 9
    new-instance v0, Lcom/google/android/gms/tagmanager/zzar;

    invoke-direct {v0, p5}, Lcom/google/android/gms/tagmanager/zzar;-><init>(Lcom/google/android/gms/tagmanager/zzaq;)V

    .line 10
    invoke-static {p6, v0}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 11
    new-instance p5, Lcom/google/android/gms/tagmanager/zzbf;

    invoke-direct {p5, p3}, Lcom/google/android/gms/tagmanager/zzbf;-><init>(Lcom/google/android/gms/tagmanager/DataLayer;)V

    .line 12
    invoke-static {p6, p5}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 13
    new-instance p5, Lcom/google/android/gms/tagmanager/zzfw;

    invoke-direct {p5, p1, p3}, Lcom/google/android/gms/tagmanager/zzfw;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;)V

    .line 14
    invoke-static {p6, p5}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    new-instance p5, Ljava/util/HashMap;

    .line 15
    invoke-direct {p5}, Ljava/util/HashMap;-><init>()V

    iput-object p5, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzd:Ljava/util/Map;

    .line 16
    new-instance p6, Lcom/google/android/gms/tagmanager/zzao;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzao;-><init>()V

    .line 17
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 18
    new-instance p6, Lcom/google/android/gms/tagmanager/zzbr;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzbr;-><init>()V

    .line 19
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 20
    new-instance p6, Lcom/google/android/gms/tagmanager/zzbs;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzbs;-><init>()V

    .line 21
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 22
    new-instance p6, Lcom/google/android/gms/tagmanager/zzbw;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzbw;-><init>()V

    .line 23
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 24
    new-instance p6, Lcom/google/android/gms/tagmanager/zzbx;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzbx;-><init>()V

    .line 25
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 26
    new-instance p6, Lcom/google/android/gms/tagmanager/zzdd;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzdd;-><init>()V

    .line 27
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 28
    new-instance p6, Lcom/google/android/gms/tagmanager/zzde;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzde;-><init>()V

    .line 29
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 30
    new-instance p6, Lcom/google/android/gms/tagmanager/zzee;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzee;-><init>()V

    .line 31
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 32
    new-instance p6, Lcom/google/android/gms/tagmanager/zzfk;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzfk;-><init>()V

    .line 33
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    new-instance p5, Ljava/util/HashMap;

    .line 34
    invoke-direct {p5}, Ljava/util/HashMap;-><init>()V

    iput-object p5, p0, Lcom/google/android/gms/tagmanager/zzeu;->zze:Ljava/util/Map;

    .line 35
    new-instance p6, Lcom/google/android/gms/tagmanager/zze;

    .line 36
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzd;->zzb(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzd;

    move-result-object v0

    invoke-direct {p6, v0}, Lcom/google/android/gms/tagmanager/zze;-><init>(Lcom/google/android/gms/tagmanager/zzd;)V

    .line 37
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 38
    new-instance p6, Lcom/google/android/gms/tagmanager/zzf;

    .line 39
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzd;->zzb(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzd;

    move-result-object v0

    invoke-direct {p6, v0}, Lcom/google/android/gms/tagmanager/zzf;-><init>(Lcom/google/android/gms/tagmanager/zzd;)V

    .line 40
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 41
    new-instance p6, Lcom/google/android/gms/tagmanager/zzh;

    invoke-direct {p6, p1}, Lcom/google/android/gms/tagmanager/zzh;-><init>(Landroid/content/Context;)V

    .line 42
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 43
    new-instance p6, Lcom/google/android/gms/tagmanager/zzi;

    invoke-direct {p6, p1}, Lcom/google/android/gms/tagmanager/zzi;-><init>(Landroid/content/Context;)V

    .line 44
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 45
    new-instance p6, Lcom/google/android/gms/tagmanager/zzj;

    invoke-direct {p6, p1}, Lcom/google/android/gms/tagmanager/zzj;-><init>(Landroid/content/Context;)V

    .line 46
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 47
    new-instance p6, Lcom/google/android/gms/tagmanager/zzk;

    invoke-direct {p6, p1}, Lcom/google/android/gms/tagmanager/zzk;-><init>(Landroid/content/Context;)V

    .line 48
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 49
    new-instance p6, Lcom/google/android/gms/tagmanager/zzl;

    invoke-direct {p6, p1}, Lcom/google/android/gms/tagmanager/zzl;-><init>(Landroid/content/Context;)V

    .line 50
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 51
    new-instance p6, Lcom/google/android/gms/tagmanager/zzt;

    invoke-direct {p6}, Lcom/google/android/gms/tagmanager/zzt;-><init>()V

    .line 52
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 53
    new-instance p6, Lcom/google/android/gms/tagmanager/zzan;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzrs;->zzb()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p6, p2}, Lcom/google/android/gms/tagmanager/zzan;-><init>(Ljava/lang/String;)V

    .line 54
    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    new-instance p2, Lcom/google/android/gms/tagmanager/zzar;

    .line 55
    invoke-direct {p2, p4}, Lcom/google/android/gms/tagmanager/zzar;-><init>(Lcom/google/android/gms/tagmanager/zzaq;)V

    .line 56
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 57
    new-instance p2, Lcom/google/android/gms/tagmanager/zzay;

    invoke-direct {p2, p3}, Lcom/google/android/gms/tagmanager/zzay;-><init>(Lcom/google/android/gms/tagmanager/DataLayer;)V

    .line 58
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 59
    new-instance p2, Lcom/google/android/gms/tagmanager/zzbi;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/zzbi;-><init>(Landroid/content/Context;)V

    .line 60
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 61
    new-instance p2, Lcom/google/android/gms/tagmanager/zzbj;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzbj;-><init>()V

    .line 62
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 63
    new-instance p2, Lcom/google/android/gms/tagmanager/zzbq;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzbq;-><init>()V

    .line 64
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 65
    new-instance p2, Lcom/google/android/gms/tagmanager/zzbt;

    invoke-direct {p2, p0}, Lcom/google/android/gms/tagmanager/zzbt;-><init>(Lcom/google/android/gms/tagmanager/zzeu;)V

    .line 66
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 67
    new-instance p2, Lcom/google/android/gms/tagmanager/zzby;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzby;-><init>()V

    .line 68
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 69
    new-instance p2, Lcom/google/android/gms/tagmanager/zzbz;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzbz;-><init>()V

    .line 70
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 71
    new-instance p2, Lcom/google/android/gms/tagmanager/zzcw;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/zzcw;-><init>(Landroid/content/Context;)V

    .line 72
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 73
    new-instance p2, Lcom/google/android/gms/tagmanager/zzcy;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzcy;-><init>()V

    .line 74
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 75
    new-instance p2, Lcom/google/android/gms/tagmanager/zzdc;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzdc;-><init>()V

    .line 76
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 77
    new-instance p2, Lcom/google/android/gms/tagmanager/zzdi;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzdi;-><init>()V

    .line 78
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 79
    new-instance p2, Lcom/google/android/gms/tagmanager/zzdj;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/zzdj;-><init>(Landroid/content/Context;)V

    .line 80
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 81
    new-instance p2, Lcom/google/android/gms/tagmanager/zzdt;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzdt;-><init>()V

    .line 82
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 83
    new-instance p2, Lcom/google/android/gms/tagmanager/zzdx;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzdx;-><init>()V

    .line 84
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 85
    new-instance p2, Lcom/google/android/gms/tagmanager/zzeb;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzeb;-><init>()V

    .line 86
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 87
    new-instance p2, Lcom/google/android/gms/tagmanager/zzed;

    invoke-direct {p2}, Lcom/google/android/gms/tagmanager/zzed;-><init>()V

    .line 88
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 89
    new-instance p2, Lcom/google/android/gms/tagmanager/zzef;

    invoke-direct {p2, p1}, Lcom/google/android/gms/tagmanager/zzef;-><init>(Landroid/content/Context;)V

    .line 90
    invoke-static {p5, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 91
    new-instance p1, Lcom/google/android/gms/tagmanager/zzev;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/zzev;-><init>()V

    .line 92
    invoke-static {p5, p1}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 93
    new-instance p1, Lcom/google/android/gms/tagmanager/zzew;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/zzew;-><init>()V

    .line 94
    invoke-static {p5, p1}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 95
    new-instance p1, Lcom/google/android/gms/tagmanager/zzfq;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/zzfq;-><init>()V

    .line 96
    invoke-static {p5, p1}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    .line 97
    new-instance p1, Lcom/google/android/gms/tagmanager/zzfx;

    invoke-direct {p1}, Lcom/google/android/gms/tagmanager/zzfx;-><init>()V

    .line 98
    invoke-static {p5, p1}, Lcom/google/android/gms/tagmanager/zzeu;->zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V

    new-instance p1, Ljava/util/HashMap;

    .line 99
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzh:Ljava/util/Map;

    .line 100
    invoke-interface {p7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzrw;

    const/4 p3, 0x0

    const/4 p4, 0x0

    .line 101
    :goto_0
    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzrw;->zza()Ljava/util/List;

    move-result-object p5

    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result p5

    const-string p6, "Unknown"

    if-ge p4, p5, :cond_1

    .line 102
    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzrw;->zza()Ljava/util/List;

    move-result-object p5

    invoke-interface {p5, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/google/android/gms/internal/gtm/zzro;

    iget-object p7, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzh:Ljava/util/Map;

    .line 103
    invoke-static {p5}, Lcom/google/android/gms/tagmanager/zzeu;->zzh(Lcom/google/android/gms/internal/gtm/zzro;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p7, v0}, Lcom/google/android/gms/tagmanager/zzeu;->zzg(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzet;

    move-result-object p7

    .line 104
    invoke-virtual {p7, p2}, Lcom/google/android/gms/tagmanager/zzet;->zzk(Lcom/google/android/gms/internal/gtm/zzrw;)V

    .line 105
    invoke-virtual {p7, p2, p5}, Lcom/google/android/gms/tagmanager/zzet;->zzg(Lcom/google/android/gms/internal/gtm/zzrw;Lcom/google/android/gms/internal/gtm/zzro;)V

    .line 106
    invoke-virtual {p7, p2, p6}, Lcom/google/android/gms/tagmanager/zzet;->zzh(Lcom/google/android/gms/internal/gtm/zzrw;Ljava/lang/String;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 107
    :cond_1
    :goto_1
    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzrw;->zzf()Ljava/util/List;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p4

    if-ge p3, p4, :cond_0

    .line 108
    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzrw;->zzf()Ljava/util/List;

    move-result-object p4

    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/android/gms/internal/gtm/zzro;

    iget-object p5, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzh:Ljava/util/Map;

    .line 109
    invoke-static {p4}, Lcom/google/android/gms/tagmanager/zzeu;->zzh(Lcom/google/android/gms/internal/gtm/zzro;)Ljava/lang/String;

    move-result-object p7

    invoke-static {p5, p7}, Lcom/google/android/gms/tagmanager/zzeu;->zzg(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzet;

    move-result-object p5

    .line 110
    invoke-virtual {p5, p2}, Lcom/google/android/gms/tagmanager/zzet;->zzk(Lcom/google/android/gms/internal/gtm/zzrw;)V

    .line 111
    invoke-virtual {p5, p2, p4}, Lcom/google/android/gms/tagmanager/zzet;->zzi(Lcom/google/android/gms/internal/gtm/zzrw;Lcom/google/android/gms/internal/gtm/zzro;)V

    .line 112
    invoke-virtual {p5, p2, p6}, Lcom/google/android/gms/tagmanager/zzet;->zzj(Lcom/google/android/gms/internal/gtm/zzrw;Ljava/lang/String;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzb:Lcom/google/android/gms/internal/gtm/zzrs;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzrs;->zzd()Ljava/util/Map;

    move-result-object p1

    .line 113
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    .line 114
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_4
    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/android/gms/internal/gtm/zzro;

    .line 115
    invoke-virtual {p4}, Lcom/google/android/gms/internal/gtm/zzro;->zzc()Ljava/util/Map;

    move-result-object p5

    sget-object p6, Lcom/google/android/gms/internal/gtm/zzb;->zzch:Lcom/google/android/gms/internal/gtm/zzb;

    invoke-virtual {p6}, Lcom/google/android/gms/internal/gtm/zzb;->toString()Ljava/lang/String;

    move-result-object p6

    invoke-interface {p5, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lcom/google/android/gms/internal/gtm/zzak;

    .line 116
    invoke-static {p5}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object p5

    invoke-static {p5}, Lcom/google/android/gms/tagmanager/zzfv;->zzg(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p5

    .line 115
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    if-nez p5, :cond_4

    iget-object p5, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzh:Ljava/util/Map;

    .line 117
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Ljava/lang/String;

    invoke-static {p5, p6}, Lcom/google/android/gms/tagmanager/zzeu;->zzg(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzet;

    move-result-object p5

    invoke-virtual {p5, p4}, Lcom/google/android/gms/tagmanager/zzet;->zzl(Lcom/google/android/gms/internal/gtm/zzro;)V

    goto :goto_2

    :cond_5
    return-void
.end method

.method private static zzg(Ljava/util/Map;Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzet;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tagmanager/zzet;"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/zzet;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/tagmanager/zzet;

    .line 2
    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzet;-><init>()V

    .line 3
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private static zzh(Lcom/google/android/gms/internal/gtm/zzro;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzro;->zzc()Ljava/util/Map;

    move-result-object p0

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzb;->zzbB:Lcom/google/android/gms/internal/gtm/zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzb;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/gtm/zzak;

    .line 2
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzfv;->zzn(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final zzi()Ljava/lang/String;
    .locals 3

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    .line 2
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    :goto_0
    iget v2, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    if-ge v1, v2, :cond_1

    const/16 v2, 0x20

    .line 3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const-string v1, ": "

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static zzj(Ljava/util/Map;Lcom/google/android/gms/tagmanager/zzbu;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzbu;",
            ">;",
            "Lcom/google/android/gms/tagmanager/zzbu;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzbu;->zze()Ljava/lang/String;

    move-result-object v0

    .line 1
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzbu;->zze()Ljava/lang/String;

    move-result-object p1

    .line 2
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Duplicate function type name: "

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 3
    :cond_0
    new-instance p1, Ljava/lang/String;

    .line 2
    invoke-direct {p1, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzbu;->zze()Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private final zzk(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/tagmanager/zzdq;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzdq;-><init>()V

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/tagmanager/zzeu;->zzo(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdq;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object p1

    sget-object p2, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    if-ne p1, p2, :cond_1

    return-void

    .line 2
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object p1

    .line 3
    instance-of p2, p1, Ljava/util/Map;

    if-eqz p2, :cond_2

    .line 4
    check-cast p1, Ljava/util/Map;

    iget-object p2, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzg:Lcom/google/android/gms/tagmanager/DataLayer;

    .line 5
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    return-void

    .line 6
    :cond_2
    instance-of p2, p1, Ljava/util/List;

    if-eqz p2, :cond_5

    .line 7
    check-cast p1, Ljava/util/List;

    .line 8
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    .line 9
    instance-of v0, p2, Ljava/util/Map;

    if-eqz v0, :cond_3

    .line 10
    check-cast p2, Ljava/util/Map;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzg:Lcom/google/android/gms/tagmanager/DataLayer;

    .line 11
    invoke-virtual {v0, p2}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    goto :goto_0

    :cond_3
    const-string p2, "pushAfterEvaluate: value not a Map"

    .line 12
    invoke-static {p2}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    return-void

    :cond_5
    const-string p1, "pushAfterEvaluate: value not a Map or List"

    .line 13
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    return-void
.end method

.method private final zzl(Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzer;Lcom/google/android/gms/tagmanager/zzdp;)Lcom/google/android/gms/tagmanager/zzds;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/internal/gtm/zzrw;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/zzer;",
            "Lcom/google/android/gms/tagmanager/zzdp;",
            ")",
            "Lcom/google/android/gms/tagmanager/zzds<",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/internal/gtm/zzro;",
            ">;>;"
        }
    .end annotation

    new-instance p4, Ljava/util/HashSet;

    .line 1
    invoke-direct {p4}, Ljava/util/HashSet;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    .line 2
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 3
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 7
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    :goto_0
    const/4 v4, 0x1

    .line 3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/gtm/zzrw;

    new-instance v6, Lcom/google/android/gms/tagmanager/zzdo;

    invoke-direct {v6}, Lcom/google/android/gms/tagmanager/zzdo;-><init>()V

    .line 4
    invoke-virtual {v5}, Lcom/google/android/gms/internal/gtm/zzrw;->zzd()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    const/4 v8, 0x1

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/gtm/zzro;

    new-instance v10, Lcom/google/android/gms/tagmanager/zzdn;

    invoke-direct {v10}, Lcom/google/android/gms/tagmanager/zzdn;-><init>()V

    .line 5
    invoke-virtual {p0, v9, p2, v10}, Lcom/google/android/gms/tagmanager/zzeu;->zzf(Lcom/google/android/gms/internal/gtm/zzro;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdn;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v10

    .line 6
    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 7
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/gtm/zzak;

    new-instance v7, Lcom/google/android/gms/tagmanager/zzds;

    invoke-virtual {v9}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v8

    .line 8
    invoke-direct {v7, v3, v8}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    goto :goto_5

    :cond_0
    if-eqz v8, :cond_1

    .line 17
    invoke-virtual {v9}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v8

    if-eqz v8, :cond_1

    goto :goto_2

    :cond_1
    const/4 v8, 0x0

    goto :goto_3

    .line 9
    :cond_2
    invoke-virtual {v5}, Lcom/google/android/gms/internal/gtm/zzrw;->zze()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/gms/internal/gtm/zzro;

    new-instance v10, Lcom/google/android/gms/tagmanager/zzdn;

    invoke-direct {v10}, Lcom/google/android/gms/tagmanager/zzdn;-><init>()V

    .line 10
    invoke-virtual {p0, v9, p2, v10}, Lcom/google/android/gms/tagmanager/zzeu;->zzf(Lcom/google/android/gms/internal/gtm/zzro;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdn;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v10

    .line 11
    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-nez v10, :cond_3

    .line 12
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/gtm/zzak;

    new-instance v7, Lcom/google/android/gms/tagmanager/zzds;

    invoke-virtual {v9}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v8

    .line 13
    invoke-direct {v7, v3, v8}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    goto :goto_5

    :cond_3
    if-eqz v8, :cond_4

    invoke-virtual {v9}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v8

    if-eqz v8, :cond_4

    const/4 v8, 0x1

    goto :goto_4

    :cond_4
    const/4 v8, 0x0

    goto :goto_4

    .line 14
    :cond_5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/gms/tagmanager/zzfv;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/gtm/zzak;

    new-instance v9, Lcom/google/android/gms/tagmanager/zzds;

    .line 15
    invoke-direct {v9, v7, v8}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    move-object v7, v9

    .line 8
    :goto_5
    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v8

    .line 16
    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 17
    invoke-interface {p3, v5, p4, v0, v6}, Lcom/google/android/gms/tagmanager/zzer;->zza(Lcom/google/android/gms/internal/gtm/zzrw;Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdo;)V

    :cond_6
    if-eqz v4, :cond_7

    invoke-virtual {v7}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v4

    if-eqz v4, :cond_7

    goto/16 :goto_0

    :cond_7
    const/4 v4, 0x0

    goto/16 :goto_1

    .line 18
    :cond_8
    invoke-interface {p4, v0}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    new-instance p1, Lcom/google/android/gms/tagmanager/zzds;

    .line 19
    invoke-direct {p1, p4, v4}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    return-object p1
.end method

.method private final zzm(Ljava/lang/String;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdm;)Lcom/google/android/gms/tagmanager/zzds;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/zzdm;",
            ")",
            "Lcom/google/android/gms/tagmanager/zzds<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation

    iget p3, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    const/4 v0, 0x1

    add-int/2addr p3, v0

    iput p3, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    iget-object p3, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzm:Lcom/google/android/gms/tagmanager/zzdb;

    .line 1
    invoke-virtual {p3, p1}, Lcom/google/android/gms/tagmanager/zzdb;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/tagmanager/zzes;

    if-nez p3, :cond_7

    iget-object p3, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzh:Ljava/util/Map;

    .line 2
    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/tagmanager/zzet;

    if-nez p3, :cond_0

    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzeu;->zzi()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    add-int/lit8 p3, p3, 0xf

    add-int/2addr p3, v0

    invoke-direct {v1, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "Invalid macro: "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    iget p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    :cond_0
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzet;->zzf()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzet;->zzc()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzet;->zzb()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzet;->zze()Ljava/util/Map;

    move-result-object v6

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzet;->zzd()Ljava/util/Map;

    move-result-object v7

    new-instance v8, Lcom/google/android/gms/tagmanager/zzdp;

    invoke-direct {v8}, Lcom/google/android/gms/tagmanager/zzdp;-><init>()V

    new-instance v9, Lcom/google/android/gms/tagmanager/zzep;

    move-object v2, v9

    move-object v3, p0

    .line 4
    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/tagmanager/zzep;-><init>(Lcom/google/android/gms/tagmanager/zzeu;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    invoke-direct {p0, v1, p2, v9, v8}, Lcom/google/android/gms/tagmanager/zzeu;->zzl(Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzer;Lcom/google/android/gms/tagmanager/zzdp;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v2

    .line 5
    check-cast v2, Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzet;->zza()Lcom/google/android/gms/internal/gtm/zzro;

    move-result-object p3

    goto :goto_0

    .line 11
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object p3

    .line 6
    check-cast p3, Ljava/util/Set;

    invoke-interface {p3}, Ljava/util/Set;->size()I

    move-result p3

    if-le p3, v0, :cond_2

    .line 7
    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzeu;->zzi()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x25

    add-int/2addr v2, v3

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "Multiple macros active for macroName "

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    :cond_2
    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object p3

    .line 8
    check-cast p3, Ljava/util/Set;

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/gtm/zzro;

    :goto_0
    if-nez p3, :cond_3

    .line 5
    iget p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzeu;->zze:Ljava/util/Map;

    new-instance v3, Lcom/google/android/gms/tagmanager/zzdn;

    invoke-direct {v3}, Lcom/google/android/gms/tagmanager/zzdn;-><init>()V

    .line 9
    invoke-direct {p0, v2, p3, p2, v3}, Lcom/google/android/gms/tagmanager/zzeu;->zzn(Ljava/util/Map;Lcom/google/android/gms/internal/gtm/zzro;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdn;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v2

    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_4

    .line 10
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    sget-object v1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    if-ne v2, v1, :cond_5

    goto :goto_2

    .line 14
    :cond_5
    new-instance v1, Lcom/google/android/gms/tagmanager/zzds;

    .line 11
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    .line 10
    :goto_2
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzro;->zza()Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object p3

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzm:Lcom/google/android/gms/tagmanager/zzdb;

    new-instance v2, Lcom/google/android/gms/tagmanager/zzes;

    .line 13
    invoke-direct {v2, v1, p3}, Lcom/google/android/gms/tagmanager/zzes;-><init>(Lcom/google/android/gms/tagmanager/zzds;Lcom/google/android/gms/internal/gtm/zzak;)V

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/tagmanager/zzdb;->zzb(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    :cond_6
    invoke-direct {p0, p3, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzk(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;)V

    iget p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    return-object v1

    .line 8
    :cond_7
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzes;->zzb()Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object p1

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/zzeu;->zzk(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;)V

    iget p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzes;->zzc()Lcom/google/android/gms/tagmanager/zzds;

    move-result-object p1

    return-object p1
.end method

.method private final zzn(Ljava/util/Map;Lcom/google/android/gms/internal/gtm/zzro;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdn;)Lcom/google/android/gms/tagmanager/zzds;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/tagmanager/zzbu;",
            ">;",
            "Lcom/google/android/gms/internal/gtm/zzro;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/zzdn;",
            ")",
            "Lcom/google/android/gms/tagmanager/zzds<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzro;->zzc()Ljava/util/Map;

    move-result-object p4

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzb;->zzbp:Lcom/google/android/gms/internal/gtm/zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzb;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/android/gms/internal/gtm/zzak;

    if-nez p4, :cond_0

    const-string p1, "No function id in properties"

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    :cond_0
    invoke-virtual {p4}, Lcom/google/android/gms/internal/gtm/zzak;->zzn()Ljava/lang/String;

    move-result-object p4

    .line 3
    invoke-interface {p1, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/tagmanager/zzbu;

    if-nez p1, :cond_1

    .line 4
    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, " has no backing implementation."

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzl:Lcom/google/android/gms/tagmanager/zzdb;

    .line 5
    invoke-virtual {v0, p2}, Lcom/google/android/gms/tagmanager/zzdb;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/zzds;

    if-nez v0, :cond_8

    new-instance v0, Ljava/util/HashMap;

    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzro;->zzc()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 8
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 9
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gms/internal/gtm/zzak;

    .line 10
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/gtm/zzak;

    new-instance v7, Lcom/google/android/gms/tagmanager/zzdq;

    invoke-direct {v7}, Lcom/google/android/gms/tagmanager/zzdq;-><init>()V

    .line 11
    invoke-direct {p0, v6, p3, v7}, Lcom/google/android/gms/tagmanager/zzeu;->zzo(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdq;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v6

    sget-object v7, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    if-ne v6, v7, :cond_2

    return-object v7

    .line 12
    :cond_2
    invoke-virtual {v6}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 13
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-virtual {p2, v5, v7}, Lcom/google/android/gms/internal/gtm/zzro;->zzd(Ljava/lang/String;Lcom/google/android/gms/internal/gtm/zzak;)V

    goto :goto_1

    :cond_3
    const/4 v3, 0x0

    .line 14
    :goto_1
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 15
    :cond_4
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/google/android/gms/tagmanager/zzbu;->zzg(Ljava/util/Set;)Z

    move-result p3

    if-nez p3, :cond_5

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzbu;->zzf()Ljava/util/Set;

    move-result-object p1

    .line 16
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 17
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    add-int/lit8 p3, p3, 0x2b

    add-int/2addr p3, v0

    add-int/2addr p3, v1

    invoke-direct {v2, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p3, "Incorrect keys for function "

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " required "

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " had "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 18
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    :cond_5
    if-eqz v3, :cond_6

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzbu;->zzb()Z

    move-result p3

    if-eqz p3, :cond_6

    goto :goto_2

    :cond_6
    const/4 v2, 0x0

    :goto_2
    new-instance p3, Lcom/google/android/gms/tagmanager/zzds;

    .line 19
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tagmanager/zzbu;->zza(Ljava/util/Map;)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object p1

    invoke-direct {p3, p1, v2}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    if-eqz v2, :cond_7

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzl:Lcom/google/android/gms/tagmanager/zzdb;

    .line 20
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/tagmanager/zzdb;->zzb(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_7
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object p1

    .line 21
    check-cast p1, Lcom/google/android/gms/internal/gtm/zzak;

    return-object p3

    :cond_8
    return-object v0
.end method

.method private final zzo(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdq;)Lcom/google/android/gms/tagmanager/zzds;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/zzdq;",
            ")",
            "Lcom/google/android/gms/tagmanager/zzds<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzN()Z

    move-result p3

    if-nez p3, :cond_0

    new-instance p2, Lcom/google/android/gms/tagmanager/zzds;

    const/4 p3, 0x1

    .line 2
    invoke-direct {p2, p1, p3}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    return-object p2

    .line 3
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzO()I

    move-result p3

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-eq p3, v0, :cond_f

    const/4 v0, 0x3

    if-eq p3, v0, :cond_9

    const/4 v0, 0x4

    if-eq p3, v0, :cond_4

    const/4 v0, 0x7

    if-eq p3, v0, :cond_1

    .line 50
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzO()I

    move-result p1

    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 50
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    new-instance p3, Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, 0xe

    invoke-direct {p3, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p2, "Unknown type: "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    .line 4
    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zzsa;->zza(Lcom/google/android/gms/internal/gtm/zzak;)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object p3

    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzuz;->zzZ()Lcom/google/android/gms/internal/gtm/zzut;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/gtm/zzal;

    .line 5
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzal;->zzm()Lcom/google/android/gms/internal/gtm/zzal;

    const/4 v0, 0x0

    .line 6
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zze()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 7
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzak;->zzm(I)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/tagmanager/zzdq;

    invoke-direct {v3}, Lcom/google/android/gms/tagmanager/zzdq;-><init>()V

    .line 8
    invoke-direct {p0, v2, p2, v3}, Lcom/google/android/gms/tagmanager/zzeu;->zzo(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdq;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    if-ne v2, v3, :cond_2

    return-object v3

    .line 9
    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-virtual {p3, v2}, Lcom/google/android/gms/internal/gtm/zzal;->zzh(Lcom/google/android/gms/internal/gtm/zzak;)Lcom/google/android/gms/internal/gtm/zzal;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    new-instance p1, Lcom/google/android/gms/tagmanager/zzds;

    .line 10
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzut;->zzA()Lcom/google/android/gms/internal/gtm/zzuz;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-direct {p1, p2, v1}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    return-object p1

    .line 11
    :cond_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzo()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 12
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzo()Ljava/lang/String;

    move-result-object p1

    .line 13
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    add-int/lit8 p3, p3, 0x4f

    add-int/2addr p3, v0

    invoke-direct {v1, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p3, "Macro cycle detected.  Current macro reference: "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".  Previous macro references: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 14
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    .line 15
    :cond_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzo()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 16
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzo()Ljava/lang/String;

    move-result-object p3

    new-instance v0, Lcom/google/android/gms/tagmanager/zzdm;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzdm;-><init>()V

    .line 17
    invoke-direct {p0, p3, p2, v0}, Lcom/google/android/gms/tagmanager/zzeu;->zzm(Ljava/lang/String;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdm;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object p3

    .line 18
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzq()Ljava/util/List;

    move-result-object v0

    new-array v2, v1, [Lcom/google/android/gms/internal/gtm/zzao;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/gtm/zzao;

    .line 19
    array-length v2, v0

    :goto_1
    if-ge v1, v2, :cond_8

    aget-object v3, v0, v1

    .line 20
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/gtm/zzak;

    .line 21
    invoke-static {v4}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Ljava/lang/String;

    if-nez v4, :cond_6

    const-string v3, "Escaping can only be applied to strings."

    .line 22
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    goto :goto_2

    .line 23
    :cond_6
    sget-object v4, Lcom/google/android/gms/internal/gtm/zzao;->zza:Lcom/google/android/gms/internal/gtm/zzao;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/gtm/zzao;->ordinal()I

    move-result v4

    const/16 v5, 0xb

    if-eq v4, v5, :cond_7

    .line 28
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1c

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Unsupported Value Escaping: "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    goto :goto_2

    .line 24
    :cond_7
    :try_start_0
    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/gtm/zzak;

    .line 25
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzn(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 24
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfy;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/google/android/gms/tagmanager/zzds;

    .line 26
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object v3

    invoke-virtual {p3}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result v5

    invoke-direct {v4, v3, v5}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p3, v4

    goto :goto_2

    :catch_0
    move-exception v3

    const-string v4, "Escape URI: unsupported encoding"

    .line 27
    invoke-static {v4, v3}, Lcom/google/android/gms/tagmanager/zzdh;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 29
    :cond_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzo()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-object p3

    .line 30
    :cond_9
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zzsa;->zza(Lcom/google/android/gms/internal/gtm/zzak;)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object p3

    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzuz;->zzZ()Lcom/google/android/gms/internal/gtm/zzut;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/gtm/zzal;

    .line 31
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzc()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzd()I

    move-result v2

    if-eq v0, v2, :cond_b

    .line 32
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzuz;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "Invalid serving value: "

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    if-eqz p3, :cond_a

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_3

    :cond_a
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_3
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    sget-object p1, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    return-object p1

    .line 33
    :cond_b
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzal;->zzk()Lcom/google/android/gms/internal/gtm/zzal;

    .line 34
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzal;->zzl()Lcom/google/android/gms/internal/gtm/zzal;

    const/4 v0, 0x0

    .line 35
    :goto_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzc()I

    move-result v2

    if-ge v0, v2, :cond_e

    .line 36
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzak;->zzk(I)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/tagmanager/zzdq;

    invoke-direct {v3}, Lcom/google/android/gms/tagmanager/zzdq;-><init>()V

    .line 37
    invoke-direct {p0, v2, p2, v3}, Lcom/google/android/gms/tagmanager/zzeu;->zzo(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdq;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v2

    .line 38
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzak;->zzl(I)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object v3

    new-instance v4, Lcom/google/android/gms/tagmanager/zzdq;

    invoke-direct {v4}, Lcom/google/android/gms/tagmanager/zzdq;-><init>()V

    .line 39
    invoke-direct {p0, v3, p2, v4}, Lcom/google/android/gms/tagmanager/zzeu;->zzo(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdq;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    if-eq v2, v4, :cond_d

    if-ne v3, v4, :cond_c

    goto :goto_5

    .line 40
    :cond_c
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-virtual {p3, v2}, Lcom/google/android/gms/internal/gtm/zzal;->zzf(Lcom/google/android/gms/internal/gtm/zzak;)Lcom/google/android/gms/internal/gtm/zzal;

    .line 41
    invoke-virtual {v3}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-virtual {p3, v2}, Lcom/google/android/gms/internal/gtm/zzal;->zzg(Lcom/google/android/gms/internal/gtm/zzak;)Lcom/google/android/gms/internal/gtm/zzal;

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_d
    :goto_5
    return-object v4

    :cond_e
    new-instance p1, Lcom/google/android/gms/tagmanager/zzds;

    .line 42
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzut;->zzA()Lcom/google/android/gms/internal/gtm/zzuz;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-direct {p1, p2, v1}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    return-object p1

    .line 43
    :cond_f
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zzsa;->zza(Lcom/google/android/gms/internal/gtm/zzak;)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object p3

    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzuz;->zzZ()Lcom/google/android/gms/internal/gtm/zzut;

    move-result-object p3

    check-cast p3, Lcom/google/android/gms/internal/gtm/zzal;

    .line 44
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzal;->zzj()Lcom/google/android/gms/internal/gtm/zzal;

    const/4 v0, 0x0

    .line 45
    :goto_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzak;->zza()I

    move-result v2

    if-ge v0, v2, :cond_11

    .line 46
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/gtm/zzak;->zzj(I)Lcom/google/android/gms/internal/gtm/zzak;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/tagmanager/zzdq;

    invoke-direct {v3}, Lcom/google/android/gms/tagmanager/zzdq;-><init>()V

    .line 47
    invoke-direct {p0, v2, p2, v3}, Lcom/google/android/gms/tagmanager/zzeu;->zzo(Lcom/google/android/gms/internal/gtm/zzak;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdq;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/tagmanager/zzeu;->zza:Lcom/google/android/gms/tagmanager/zzds;

    if-ne v2, v3, :cond_10

    return-object v3

    .line 48
    :cond_10
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-virtual {p3, v2}, Lcom/google/android/gms/internal/gtm/zzal;->zze(Lcom/google/android/gms/internal/gtm/zzak;)Lcom/google/android/gms/internal/gtm/zzal;

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_11
    new-instance p1, Lcom/google/android/gms/tagmanager/zzds;

    .line 49
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzut;->zzA()Lcom/google/android/gms/internal/gtm/zzuz;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzak;

    invoke-direct {p1, p2, v1}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    return-object p1
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/tagmanager/zzds;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tagmanager/zzds<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzj:I

    new-instance v0, Ljava/util/HashSet;

    .line 1
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Lcom/google/android/gms/tagmanager/zzdm;

    invoke-direct {v1}, Lcom/google/android/gms/tagmanager/zzdm;-><init>()V

    .line 2
    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/tagmanager/zzeu;->zzm(Ljava/lang/String;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdm;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object p1

    return-object p1
.end method

.method final declared-synchronized zzb()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzi:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized zzc(Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/zzeu;->zzd(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzf:Ljava/util/Set;

    new-instance v0, Lcom/google/android/gms/tagmanager/zzdp;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzdp;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    .line 2
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    new-instance v2, Lcom/google/android/gms/tagmanager/zzeq;

    invoke-direct {v2, p0}, Lcom/google/android/gms/tagmanager/zzeq;-><init>(Lcom/google/android/gms/tagmanager/zzeu;)V

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/google/android/gms/tagmanager/zzeu;->zzl(Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzer;Lcom/google/android/gms/tagmanager/zzdp;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object p1

    .line 3
    check-cast p1, Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzro;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzc:Ljava/util/Map;

    new-instance v2, Ljava/util/HashSet;

    .line 4
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    new-instance v3, Lcom/google/android/gms/tagmanager/zzdn;

    invoke-direct {v3}, Lcom/google/android/gms/tagmanager/zzdn;-><init>()V

    invoke-direct {p0, v1, v0, v2, v3}, Lcom/google/android/gms/tagmanager/zzeu;->zzn(Ljava/util/Map;Lcom/google/android/gms/internal/gtm/zzro;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdn;)Lcom/google/android/gms/tagmanager/zzds;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/zzeu;->zzd(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method final declared-synchronized zzd(Ljava/lang/String;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzi:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized zze(Ljava/util/List;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/gtm/zzag;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    .line 1
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzag;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzag;->zzf()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzag;->zzd()Ljava/lang/String;

    move-result-object v1

    const-string v2, "gaExperiment:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_7

    .line 5
    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzg:Lcom/google/android/gms/tagmanager/DataLayer;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzag;->zze()Z

    move-result v2

    if-nez v2, :cond_2

    const-string v0, "supplemental missing experimentSupplemental"

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    goto :goto_0

    .line 8
    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzag;->zza()Lcom/google/android/gms/internal/gtm/zzw;

    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzw;->zze()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/gtm/zzak;

    .line 10
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzn(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 11
    invoke-virtual {v1, v3}, Lcom/google/android/gms/tagmanager/DataLayer;->zzd(Ljava/lang/String;)V

    goto :goto_1

    .line 12
    :cond_3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzag;->zza()Lcom/google/android/gms/internal/gtm/zzw;

    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzw;->zzf()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/gtm/zzak;

    .line 14
    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object v3

    .line 15
    instance-of v5, v3, Ljava/util/Map;

    if-nez v5, :cond_5

    .line 16
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    new-instance v6, Ljava/lang/StringBuilder;

    add-int/lit8 v5, v5, 0x24

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "value: "

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " is not a map value, ignored."

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    goto :goto_3

    .line 17
    :cond_5
    move-object v4, v3

    check-cast v4, Ljava/util/Map;

    :goto_3
    if-eqz v4, :cond_4

    .line 18
    invoke-virtual {v1, v4}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    goto :goto_2

    .line 19
    :cond_6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzag;->zza()Lcom/google/android/gms/internal/gtm/zzw;

    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzw;->zzd()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/gtm/zzu;

    .line 21
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zzh()Z

    move-result v3

    if-nez v3, :cond_7

    const-string v2, "GaExperimentRandom: No key"

    .line 22
    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    goto :goto_4

    .line 23
    :cond_7
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zzf()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/android/gms/tagmanager/DataLayer;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 24
    instance-of v5, v3, Ljava/lang/Number;

    if-nez v5, :cond_8

    move-object v5, v4

    goto :goto_5

    .line 25
    :cond_8
    move-object v5, v3

    check-cast v5, Ljava/lang/Number;

    .line 26
    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 27
    :goto_5
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zzd()J

    move-result-wide v6

    .line 28
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zzc()J

    move-result-wide v8

    .line 29
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zzg()Z

    move-result v10

    if-eqz v10, :cond_9

    if-eqz v5, :cond_9

    .line 30
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v12, v10, v6

    if-ltz v12, :cond_9

    .line 31
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    cmp-long v5, v10, v8

    if-lez v5, :cond_a

    :cond_9
    cmp-long v3, v6, v8

    if-gtz v3, :cond_e

    .line 32
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    sub-long/2addr v8, v6

    long-to-double v8, v8

    mul-double v10, v10, v8

    long-to-double v5, v6

    add-double/2addr v10, v5

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 33
    :cond_a
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zzf()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/google/android/gms/tagmanager/DataLayer;->zzd(Ljava/lang/String;)V

    .line 34
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zzf()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v3}, Lcom/google/android/gms/tagmanager/DataLayer;->zza(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    .line 35
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zza()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_d

    const-string v5, "gtm"

    .line 36
    invoke-interface {v3, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "lifetime"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    .line 37
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zza()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v5, v6

    const-string v2, "gtm"

    invoke-static {v5}, Lcom/google/android/gms/tagmanager/DataLayer;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v3, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_b
    const-string v5, "gtm"

    .line 38
    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 39
    instance-of v6, v5, Ljava/util/Map;

    if-eqz v6, :cond_c

    .line 40
    check-cast v5, Ljava/util/Map;

    const-string v6, "lifetime"

    .line 41
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzu;->zza()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v5, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_c
    const-string v2, "GaExperimentRandom: gtm not a map"

    .line 42
    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    .line 43
    :cond_d
    :goto_6
    invoke-virtual {v1, v3}, Lcom/google/android/gms/tagmanager/DataLayer;->push(Ljava/util/Map;)V

    goto/16 :goto_4

    :cond_e
    const-string v2, "GaExperimentRandom: random range invalid"

    .line 44
    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 4
    :cond_f
    :goto_7
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x16

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Ignored supplemental: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/tagmanager/zzdh;->zzb:Lcom/google/android/gms/tagmanager/zzbg;

    .line 5
    invoke-virtual {v1, v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzd(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    .line 26
    :cond_10
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method final zzf(Lcom/google/android/gms/internal/gtm/zzro;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdn;)Lcom/google/android/gms/tagmanager/zzds;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gtm/zzro;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/tagmanager/zzdn;",
            ")",
            "Lcom/google/android/gms/tagmanager/zzds<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzeu;->zzd:Ljava/util/Map;

    .line 1
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/android/gms/tagmanager/zzeu;->zzn(Ljava/util/Map;Lcom/google/android/gms/internal/gtm/zzro;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzdn;)Lcom/google/android/gms/tagmanager/zzds;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzds;->zza()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzak;

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/tagmanager/zzfv;->zzl(Lcom/google/android/gms/internal/gtm/zzak;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/tagmanager/zzfv;->zzg(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p2

    .line 4
    invoke-static {p2}, Lcom/google/android/gms/tagmanager/zzfv;->zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/gtm/zzak;

    new-instance p3, Lcom/google/android/gms/tagmanager/zzds;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzds;->zzb()Z

    move-result p1

    invoke-direct {p3, p2, p1}, Lcom/google/android/gms/tagmanager/zzds;-><init>(Ljava/lang/Object;Z)V

    return-object p3
.end method
