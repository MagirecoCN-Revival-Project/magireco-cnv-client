.class public final Lcom/google/android/gms/internal/gtm/zzak;
.super Lcom/google/android/gms/internal/gtm/zzuv;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/internal/gtm/zzwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/gtm/zzuv<",
        "Lcom/google/android/gms/internal/gtm/zzak;",
        "Lcom/google/android/gms/internal/gtm/zzal;",
        ">;",
        "Lcom/google/android/gms/internal/gtm/zzwl;"
    }
.end annotation


# static fields
.field private static final zze:Lcom/google/android/gms/internal/gtm/zzvf;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/gtm/zzvf<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/gms/internal/gtm/zzao;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzf:Lcom/google/android/gms/internal/gtm/zzak;


# instance fields
.field private zzg:I

.field private zzh:I

.field private zzi:Ljava/lang/String;

.field private zzj:Lcom/google/android/gms/internal/gtm/zzvh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/gtm/zzvh<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation
.end field

.field private zzk:Lcom/google/android/gms/internal/gtm/zzvh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/gtm/zzvh<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation
.end field

.field private zzl:Lcom/google/android/gms/internal/gtm/zzvh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/gtm/zzvh<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation
.end field

.field private zzm:Ljava/lang/String;

.field private zzn:Ljava/lang/String;

.field private zzo:J

.field private zzp:Z

.field private zzq:Lcom/google/android/gms/internal/gtm/zzvh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/gtm/zzvh<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation
.end field

.field private zzr:Lcom/google/android/gms/internal/gtm/zzve;

.field private zzs:Z

.field private zzt:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/gtm/zzak$1;

    invoke-direct {v0}, Lcom/google/android/gms/internal/gtm/zzak$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/gtm/zzak;->zze:Lcom/google/android/gms/internal/gtm/zzvf;

    new-instance v0, Lcom/google/android/gms/internal/gtm/zzak;

    .line 1
    invoke-direct {v0}, Lcom/google/android/gms/internal/gtm/zzak;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/gtm/zzak;->zzf:Lcom/google/android/gms/internal/gtm/zzak;

    const-class v1, Lcom/google/android/gms/internal/gtm/zzak;

    .line 2
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/gtm/zzuz;->zzak(Ljava/lang/Class;Lcom/google/android/gms/internal/gtm/zzuz;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzuv;-><init>()V

    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzt:B

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzh:I

    const-string v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzi:Ljava/lang/String;

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzm:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzn:Ljava/lang/String;

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 6
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzaf()Lcom/google/android/gms/internal/gtm/zzve;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzr:Lcom/google/android/gms/internal/gtm/zzve;

    return-void
.end method

.method static synthetic zzA(Lcom/google/android/gms/internal/gtm/zzak;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzm:Ljava/lang/String;

    return-void
.end method

.method static synthetic zzB(Lcom/google/android/gms/internal/gtm/zzak;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzn:Ljava/lang/String;

    return-void
.end method

.method static synthetic zzC(Lcom/google/android/gms/internal/gtm/zzak;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzi:Ljava/lang/String;

    return-void
.end method

.method static synthetic zzD(Lcom/google/android/gms/internal/gtm/zzak;J)V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    iput-wide p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzo:J

    return-void
.end method

.method static synthetic zzE(Lcom/google/android/gms/internal/gtm/zzak;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    iput-boolean p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzp:Z

    return-void
.end method

.method static synthetic zzF(Lcom/google/android/gms/internal/gtm/zzak;Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->zzc()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzuz;->zzah(Lcom/google/android/gms/internal/gtm/zzvh;)Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 4
    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic zzG(Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    return-void
.end method

.method static synthetic zzH(Lcom/google/android/gms/internal/gtm/zzak;Ljava/lang/Iterable;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzr:Lcom/google/android/gms/internal/gtm/zzve;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzve;->zzc()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzve;->size()I

    move-result v1

    if-nez v1, :cond_0

    const/16 v1, 0xa

    goto :goto_0

    :cond_0
    add-int/2addr v1, v1

    .line 3
    :goto_0
    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/gtm/zzve;->zzg(I)Lcom/google/android/gms/internal/gtm/zzve;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzr:Lcom/google/android/gms/internal/gtm/zzve;

    .line 4
    :cond_1
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzao;

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzr:Lcom/google/android/gms/internal/gtm/zzve;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzao;->zza()I

    move-result v0

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/gtm/zzve;->zzh(I)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method static synthetic zzI(Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzaf()Lcom/google/android/gms/internal/gtm/zzve;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzr:Lcom/google/android/gms/internal/gtm/zzve;

    return-void
.end method

.method static synthetic zzJ(Lcom/google/android/gms/internal/gtm/zzak;Z)V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    iput-boolean p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzs:Z

    return-void
.end method

.method static synthetic zzK(Lcom/google/android/gms/internal/gtm/zzak;Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzak;->zzal()V

    iget-object p0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic zzL(Lcom/google/android/gms/internal/gtm/zzak;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzak;->zzal()V

    iget-object p0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 2
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gtm/zzsh;->zzS(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method static synthetic zzP(Lcom/google/android/gms/internal/gtm/zzak;I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzh:I

    iget p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzg:I

    return-void
.end method

.method private final zzal()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->zzc()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzuz;->zzah(Lcom/google/android/gms/internal/gtm/zzvh;)Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    :cond_0
    return-void
.end method

.method private final zzam()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->zzc()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzuz;->zzah(Lcom/google/android/gms/internal/gtm/zzvh;)Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    :cond_0
    return-void
.end method

.method private final zzan()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->zzc()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzuz;->zzah(Lcom/google/android/gms/internal/gtm/zzvh;)Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    :cond_0
    return-void
.end method

.method public static zzg()Lcom/google/android/gms/internal/gtm/zzal;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzak;->zzf:Lcom/google/android/gms/internal/gtm/zzak;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/gtm/zzuz;->zzY()Lcom/google/android/gms/internal/gtm/zzut;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzal;

    return-object v0
.end method

.method static synthetic zzh()Lcom/google/android/gms/internal/gtm/zzak;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzak;->zzf:Lcom/google/android/gms/internal/gtm/zzak;

    return-object v0
.end method

.method public static zzi()Lcom/google/android/gms/internal/gtm/zzak;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzak;->zzf:Lcom/google/android/gms/internal/gtm/zzak;

    return-object v0
.end method

.method static synthetic zzt(Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    return-void
.end method

.method static synthetic zzu(Lcom/google/android/gms/internal/gtm/zzak;Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzak;->zzam()V

    iget-object p0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic zzv(Lcom/google/android/gms/internal/gtm/zzak;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzak;->zzam()V

    iget-object p0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 2
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gtm/zzsh;->zzS(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method static synthetic zzw(Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    return-void
.end method

.method static synthetic zzx(Lcom/google/android/gms/internal/gtm/zzak;Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzak;->zzan()V

    iget-object p0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic zzy(Lcom/google/android/gms/internal/gtm/zzak;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzak;->zzan()V

    iget-object p0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 2
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/gtm/zzsh;->zzS(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method static synthetic zzz(Lcom/google/android/gms/internal/gtm/zzak;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzak;->zzag()Lcom/google/android/gms/internal/gtm/zzvh;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    return-void
.end method


# virtual methods
.method public final zzM()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzp:Z

    return v0
.end method

.method public final zzN()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzs:Z

    return v0
.end method

.method public final zzO()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzh:I

    invoke-static {v0}, Lcom/google/android/gms/internal/gtm/zzar;->zza(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public final zza()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->size()I

    move-result v0

    return v0
.end method

.method protected final zzb(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    const-class p3, Lcom/google/android/gms/internal/gtm/zzak;

    add-int/lit8 p1, p1, -0x1

    if-eqz p1, :cond_5

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x5

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    if-eq p1, v5, :cond_4

    if-eq p1, v4, :cond_3

    const/4 p3, 0x0

    if-eq p1, v3, :cond_2

    if-eq p1, v2, :cond_1

    if-nez p2, :cond_0

    const/4 v0, 0x0

    :cond_0
    iput-byte v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzt:B

    return-object p3

    .line 1
    :cond_1
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzak;->zzf:Lcom/google/android/gms/internal/gtm/zzak;

    return-object p1

    .line 5
    :cond_2
    new-instance p1, Lcom/google/android/gms/internal/gtm/zzal;

    .line 4
    invoke-direct {p1, p3}, Lcom/google/android/gms/internal/gtm/zzal;-><init>(Lcom/google/android/gms/internal/gtm/zzaj;)V

    return-object p1

    .line 1
    :cond_3
    new-instance p1, Lcom/google/android/gms/internal/gtm/zzak;

    .line 5
    invoke-direct {p1}, Lcom/google/android/gms/internal/gtm/zzak;-><init>()V

    return-object p1

    :cond_4
    const/16 p1, 0x13

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "zzg"

    aput-object p2, p1, v1

    const-string p2, "zzh"

    aput-object p2, p1, v0

    .line 0
    sget-object p2, Lcom/google/android/gms/internal/gtm/zzaq;->zza:Lcom/google/android/gms/internal/gtm/zzvd;

    aput-object p2, p1, v5

    const-string p2, "zzi"

    aput-object p2, p1, v4

    const-string p2, "zzj"

    aput-object p2, p1, v3

    aput-object p3, p1, v2

    const/4 p2, 0x6

    const-string v0, "zzk"

    aput-object v0, p1, p2

    const/4 p2, 0x7

    aput-object p3, p1, p2

    const/16 p2, 0x8

    const-string v0, "zzl"

    aput-object v0, p1, p2

    const/16 p2, 0x9

    aput-object p3, p1, p2

    const/16 p2, 0xa

    const-string v0, "zzm"

    aput-object v0, p1, p2

    const/16 p2, 0xb

    const-string v0, "zzn"

    aput-object v0, p1, p2

    const/16 p2, 0xc

    const-string v0, "zzo"

    aput-object v0, p1, p2

    const/16 p2, 0xd

    const-string v0, "zzs"

    aput-object v0, p1, p2

    const/16 p2, 0xe

    const-string v0, "zzr"

    aput-object v0, p1, p2

    const/16 p2, 0xf

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzao;->zzc()Lcom/google/android/gms/internal/gtm/zzvd;

    move-result-object v0

    aput-object v0, p1, p2

    const/16 p2, 0x10

    const-string v0, "zzq"

    aput-object v0, p1, p2

    const/16 p2, 0x11

    aput-object p3, p1, p2

    const/16 p2, 0x12

    const-string p3, "zzp"

    aput-object p3, p1, p2

    sget-object p2, Lcom/google/android/gms/internal/gtm/zzak;->zzf:Lcom/google/android/gms/internal/gtm/zzak;

    const-string p3, "\u0001\u000c\u0000\u0001\u0001\u000c\u000c\u0000\u0005\u0005\u0001\u150c\u0000\u0002\u1008\u0001\u0003\u041b\u0004\u041b\u0005\u041b\u0006\u1008\u0002\u0007\u1008\u0003\u0008\u1002\u0004\t\u1007\u0006\n\u001e\u000b\u041b\u000c\u1007\u0005"

    .line 3
    invoke-static {p2, p3, p1}, Lcom/google/android/gms/internal/gtm/zzak;->zzaj(Lcom/google/android/gms/internal/gtm/zzwk;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_5
    iget-byte p1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzt:B

    .line 1
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1
.end method

.method public final zzc()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->size()I

    move-result v0

    return v0
.end method

.method public final zzd()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->size()I

    move-result v0

    return v0
.end method

.method public final zze()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzvh;->size()I

    move-result v0

    return v0
.end method

.method public final zzf()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzo:J

    return-wide v0
.end method

.method public final zzj(I)Lcom/google/android/gms/internal/gtm/zzak;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzak;

    return-object p1
.end method

.method public final zzk(I)Lcom/google/android/gms/internal/gtm/zzak;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzk:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzak;

    return-object p1
.end method

.method public final zzl(I)Lcom/google/android/gms/internal/gtm/zzak;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzl:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzak;

    return-object p1
.end method

.method public final zzm(I)Lcom/google/android/gms/internal/gtm/zzak;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    .line 1
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/gtm/zzvh;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzak;

    return-object p1
.end method

.method public final zzn()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzn:Ljava/lang/String;

    return-object v0
.end method

.method public final zzo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzm:Ljava/lang/String;

    return-object v0
.end method

.method public final zzp()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzi:Ljava/lang/String;

    return-object v0
.end method

.method public final zzq()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/gtm/zzao;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/gtm/zzvg;

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzr:Lcom/google/android/gms/internal/gtm/zzve;

    sget-object v2, Lcom/google/android/gms/internal/gtm/zzak;->zze:Lcom/google/android/gms/internal/gtm/zzvf;

    .line 1
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzvg;-><init>(Ljava/util/List;Lcom/google/android/gms/internal/gtm/zzvf;)V

    return-object v0
.end method

.method public final zzr()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzj:Lcom/google/android/gms/internal/gtm/zzvh;

    return-object v0
.end method

.method public final zzs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/gtm/zzak;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzak;->zzq:Lcom/google/android/gms/internal/gtm/zzvh;

    return-object v0
.end method
