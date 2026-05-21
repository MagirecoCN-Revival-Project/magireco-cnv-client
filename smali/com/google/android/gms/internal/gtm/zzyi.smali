.class final Lcom/google/android/gms/internal/gtm/zzyi;
.super Lcom/google/android/gms/internal/gtm/zzuj;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"


# direct methods
.method private constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/gtm/zzuj;-><init>(Z)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/gtm/zzyg;)V
    .locals 0

    const/4 p1, 0x1

    .line 2
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzuj;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public final zzc(Lcom/google/android/gms/internal/gtm/zzwk;I)Lcom/google/android/gms/internal/gtm/zzux;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<CT::",
            "Lcom/google/android/gms/internal/gtm/zzwk;",
            ">(TCT;I)",
            "Lcom/google/android/gms/internal/gtm/zzux<",
            "TCT;*>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "com.google.android.gms.internal.gtm.zzub"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_1

    :sswitch_1
    const-string v0, "com.google.android.gms.internal.gtm.zztz"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_1

    :sswitch_2
    const-string v0, "com.google.android.gms.internal.gtm.zztw"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :sswitch_3
    const-string v0, "com.google.android.gms.internal.gtm.zzak"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p1, -0x1

    :goto_1
    const/4 v0, 0x0

    if-eqz p1, :cond_8

    if-eq p1, v3, :cond_7

    if-eq p1, v2, :cond_4

    if-eq p1, v1, :cond_1

    return-object v0

    :cond_1
    const/16 p1, 0x65

    if-eq p2, p1, :cond_3

    const p1, 0x2d4c0bd

    if-eq p2, p1, :cond_2

    return-object v0

    .line 2
    :cond_2
    sget-object p1, Lcom/google/android/gms/internal/gtm/zze;->zza:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 3
    :cond_3
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzae;->zza:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    :cond_4
    const p1, 0x14988a0

    if-eq p2, p1, :cond_6

    const p1, 0x1ba68d3

    if-eq p2, p1, :cond_5

    return-object v0

    .line 4
    :cond_5
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzn:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 5
    :cond_6
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzm:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    :cond_7
    sparse-switch p2, :sswitch_data_1

    return-object v0

    .line 6
    :sswitch_4
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzl:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 7
    :sswitch_5
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzh:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 8
    :sswitch_6
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzi:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 9
    :sswitch_7
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzj:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 10
    :sswitch_8
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzk:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    :cond_8
    sparse-switch p2, :sswitch_data_2

    return-object v0

    .line 11
    :sswitch_9
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzg:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 12
    :sswitch_a
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzf:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 13
    :sswitch_b
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zze:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 14
    :sswitch_c
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzc:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 15
    :sswitch_d
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zza:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 16
    :sswitch_e
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzb:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    .line 17
    :sswitch_f
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzyq;->zzd:Lcom/google/android/gms/internal/gtm/zzux;

    return-object p1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x4f2c46bf -> :sswitch_3
        -0x4f2c4466 -> :sswitch_2
        -0x4f2c4463 -> :sswitch_1
        -0x4f2c445c -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x1478fa8 -> :sswitch_8
        0x14988a0 -> :sswitch_7
        0x149f2b5 -> :sswitch_6
        0x14b532c -> :sswitch_5
        0x196b0b2 -> :sswitch_4
    .end sparse-switch

    :sswitch_data_2
    .sparse-switch
        0x14988a0 -> :sswitch_f
        0x149f2b5 -> :sswitch_e
        0x14b532c -> :sswitch_d
        0x165f72e -> :sswitch_c
        0x196b0b2 -> :sswitch_b
        0x3335d57 -> :sswitch_a
        0x363ca4f -> :sswitch_9
    .end sparse-switch
.end method
