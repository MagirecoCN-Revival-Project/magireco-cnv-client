.class final Lcom/google/android/gms/internal/gtm/zzsl;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"


# instance fields
.field public zza:I

.field public zzb:J

.field public zzc:Ljava/lang/Object;

.field public final zzd:Lcom/google/android/gms/internal/gtm/zzuj;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzuj;->zza()Lcom/google/android/gms/internal/gtm/zzuj;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzsl;->zzd:Lcom/google/android/gms/internal/gtm/zzuj;

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/gtm/zzuj;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/gtm/zzsl;->zzd:Lcom/google/android/gms/internal/gtm/zzuj;

    return-void
.end method
