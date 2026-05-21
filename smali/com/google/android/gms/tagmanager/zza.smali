.class final Lcom/google/android/gms/tagmanager/zza;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzc;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/tagmanager/zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zza;->zza:Lcom/google/android/gms/tagmanager/zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zza;->zza:Lcom/google/android/gms/tagmanager/zzd;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzd;->zza(Lcom/google/android/gms/tagmanager/zzd;)Landroid/content/Context;

    move-result-object v1

    .line 1
    invoke-static {v1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Unknown exception. Could not get the Advertising Id Info."

    .line 2
    invoke-static {v2, v1}, Lcom/google/android/gms/tagmanager/zzdh;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v1

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zza;->zza:Lcom/google/android/gms/tagmanager/zzd;

    .line 3
    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/zzd;->zze()V

    const-string v2, "GooglePlayServicesNotAvailableException getting Advertising Id Info"

    .line 4
    invoke-static {v2, v1}, Lcom/google/android/gms/tagmanager/zzdh;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_2
    move-exception v1

    const-string v2, "IOException getting Ad Id Info"

    .line 5
    invoke-static {v2, v1}, Lcom/google/android/gms/tagmanager/zzdh;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_3
    move-exception v1

    const-string v2, "GooglePlayServicesRepairableException getting Advertising Id Info"

    .line 6
    invoke-static {v2, v1}, Lcom/google/android/gms/tagmanager/zzdh;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_4
    move-exception v1

    const-string v2, "IllegalStateException getting Advertising Id Info"

    .line 7
    invoke-static {v2, v1}, Lcom/google/android/gms/tagmanager/zzdh;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-object v0
.end method
