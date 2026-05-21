.class public final Lcom/google/android/gms/internal/gtm/zzs;
.super Lcom/google/android/gms/internal/gtm/zzuz;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/internal/gtm/zzwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/gtm/zzuz<",
        "Lcom/google/android/gms/internal/gtm/zzs;",
        "Lcom/google/android/gms/internal/gtm/zzr;",
        ">;",
        "Lcom/google/android/gms/internal/gtm/zzwl;"
    }
.end annotation


# static fields
.field private static final zza:Lcom/google/android/gms/internal/gtm/zzs;


# instance fields
.field private zze:I

.field private zzf:Lcom/google/android/gms/internal/gtm/zzve;

.field private zzg:I

.field private zzh:I

.field private zzi:Z

.field private zzj:Z

.field private zzk:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/gtm/zzs;

    .line 1
    invoke-direct {v0}, Lcom/google/android/gms/internal/gtm/zzs;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/gtm/zzs;->zza:Lcom/google/android/gms/internal/gtm/zzs;

    const-class v1, Lcom/google/android/gms/internal/gtm/zzs;

    .line 2
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/gtm/zzuz;->zzak(Ljava/lang/Class;Lcom/google/android/gms/internal/gtm/zzuz;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzuz;-><init>()V

    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/google/android/gms/internal/gtm/zzs;->zzk:B

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzs;->zzaf()Lcom/google/android/gms/internal/gtm/zzve;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzs;->zzf:Lcom/google/android/gms/internal/gtm/zzve;

    return-void
.end method

.method static synthetic zza()Lcom/google/android/gms/internal/gtm/zzs;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzs;->zza:Lcom/google/android/gms/internal/gtm/zzs;

    return-object v0
.end method


# virtual methods
.method protected final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    add-int/lit8 p1, p1, -0x1

    if-eqz p1, :cond_5

    const/4 p3, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x2

    if-eq p1, v4, :cond_4

    if-eq p1, v3, :cond_3

    const/4 v3, 0x0

    if-eq p1, v2, :cond_2

    if-eq p1, v1, :cond_1

    if-nez p2, :cond_0

    const/4 p3, 0x0

    :cond_0
    iput-byte p3, p0, Lcom/google/android/gms/internal/gtm/zzs;->zzk:B

    return-object v3

    .line 1
    :cond_1
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzs;->zza:Lcom/google/android/gms/internal/gtm/zzs;

    return-object p1

    .line 4
    :cond_2
    new-instance p1, Lcom/google/android/gms/internal/gtm/zzr;

    .line 3
    invoke-direct {p1, v3}, Lcom/google/android/gms/internal/gtm/zzr;-><init>(Lcom/google/android/gms/internal/gtm/zzn;)V

    return-object p1

    .line 1
    :cond_3
    new-instance p1, Lcom/google/android/gms/internal/gtm/zzs;

    .line 4
    invoke-direct {p1}, Lcom/google/android/gms/internal/gtm/zzs;-><init>()V

    return-object p1

    :cond_4
    const/4 p1, 0x6

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "zze"

    aput-object p2, p1, v0

    const-string p2, "zzj"

    aput-object p2, p1, p3

    const-string p2, "zzg"

    aput-object p2, p1, v4

    const-string p2, "zzf"

    aput-object p2, p1, v3

    const-string p2, "zzh"

    aput-object p2, p1, v2

    const-string p2, "zzi"

    aput-object p2, p1, v1

    .line 0
    sget-object p2, Lcom/google/android/gms/internal/gtm/zzs;->zza:Lcom/google/android/gms/internal/gtm/zzs;

    const-string p3, "\u0001\u0005\u0000\u0001\u0001\u0006\u0005\u0000\u0001\u0001\u0001\u1007\u0003\u0002\u1504\u0000\u0003\u0016\u0004\u1004\u0001\u0006\u1007\u0002"

    .line 2
    invoke-static {p2, p3, p1}, Lcom/google/android/gms/internal/gtm/zzs;->zzaj(Lcom/google/android/gms/internal/gtm/zzwk;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_5
    iget-byte p1, p0, Lcom/google/android/gms/internal/gtm/zzs;->zzk:B

    .line 1
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public final zzc()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzs;->zzf:Lcom/google/android/gms/internal/gtm/zzve;

    return-object v0
.end method
