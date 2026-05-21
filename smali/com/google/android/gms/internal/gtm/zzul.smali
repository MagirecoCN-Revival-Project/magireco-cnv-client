.class final Lcom/google/android/gms/internal/gtm/zzul;
.super Lcom/google/android/gms/internal/gtm/zzuk;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/gtm/zzuk<",
        "Lcom/google/android/gms/internal/gtm/zzuw;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzuk;-><init>()V

    return-void
.end method


# virtual methods
.method final zza(Ljava/util/Map$Entry;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "**>;)I"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/gtm/zzuw;

    iget p1, p1, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    return p1
.end method

.method final zzb(Ljava/lang/Object;)Lcom/google/android/gms/internal/gtm/zzuo;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/internal/gtm/zzuo<",
            "Lcom/google/android/gms/internal/gtm/zzuw;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/gtm/zzuv;

    iget-object p1, p1, Lcom/google/android/gms/internal/gtm/zzuv;->zza:Lcom/google/android/gms/internal/gtm/zzuo;

    return-object p1
.end method

.method final zzc(Ljava/lang/Object;)Lcom/google/android/gms/internal/gtm/zzuo;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/internal/gtm/zzuo<",
            "Lcom/google/android/gms/internal/gtm/zzuw;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/gtm/zzuv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzuv;->zzU()Lcom/google/android/gms/internal/gtm/zzuo;

    move-result-object p1

    return-object p1
.end method

.method final zzd(Lcom/google/android/gms/internal/gtm/zzuj;Lcom/google/android/gms/internal/gtm/zzwk;I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/internal/gtm/zzuj;->zzc(Lcom/google/android/gms/internal/gtm/zzwk;I)Lcom/google/android/gms/internal/gtm/zzux;

    move-result-object p1

    return-object p1
.end method

.method final zze(Lcom/google/android/gms/internal/gtm/zzww;Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzuj;Lcom/google/android/gms/internal/gtm/zzuo;Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzxo;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/gtm/zzww;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            "Lcom/google/android/gms/internal/gtm/zzuo<",
            "Lcom/google/android/gms/internal/gtm/zzuw;",
            ">;TUB;",
            "Lcom/google/android/gms/internal/gtm/zzxo<",
            "TUT;TUB;>;)TUB;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzux;

    iget-object v0, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    iget v1, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    iget-object v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzc:Lcom/google/android/gms/internal/gtm/zzye;

    .line 1
    sget-object v2, Lcom/google/android/gms/internal/gtm/zzye;->zzn:Lcom/google/android/gms/internal/gtm/zzye;

    if-ne v0, v2, :cond_1

    .line 2
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzg()I

    move-result p1

    iget-object p3, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    iget-object p3, p3, Lcom/google/android/gms/internal/gtm/zzuw;->zza:Lcom/google/android/gms/internal/gtm/zzvc;

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/internal/gtm/zzyl;->zzc(I)Lcom/google/android/gms/internal/gtm/zzyl;

    move-result-object p3

    if-nez p3, :cond_0

    .line 4
    invoke-static {v1, p1, p5, p6}, Lcom/google/android/gms/internal/gtm/zzwz;->zzD(IILjava/lang/Object;Lcom/google/android/gms/internal/gtm/zzxo;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 5
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_0

    .line 31
    :cond_1
    iget-object p6, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    iget-object p6, p6, Lcom/google/android/gms/internal/gtm/zzuw;->zzc:Lcom/google/android/gms/internal/gtm/zzye;

    .line 6
    invoke-virtual {p6}, Lcom/google/android/gms/internal/gtm/zzye;->ordinal()I

    move-result p6

    packed-switch p6, :pswitch_data_0

    const/4 p1, 0x0

    goto/16 :goto_0

    .line 14
    :pswitch_0
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzn()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto/16 :goto_0

    .line 15
    :pswitch_1
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzi()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_0

    .line 16
    :pswitch_2
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzm()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto/16 :goto_0

    .line 17
    :pswitch_3
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzh()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_0

    .line 25
    :pswitch_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Shouldn\'t reach here."

    .line 13
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 18
    :pswitch_5
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzj()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_0

    .line 12
    :pswitch_6
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzq()Lcom/google/android/gms/internal/gtm/zztd;

    move-result-object p1

    goto :goto_0

    .line 8
    :pswitch_7
    iget-object p6, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzc:Lcom/google/android/gms/internal/gtm/zzwk;

    .line 9
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p6

    .line 10
    invoke-interface {p1, p6, p3}, Lcom/google/android/gms/internal/gtm/zzww;->zzt(Ljava/lang/Class;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    .line 6
    :pswitch_8
    iget-object p6, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzc:Lcom/google/android/gms/internal/gtm/zzwk;

    .line 7
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p6

    .line 8
    invoke-interface {p1, p6, p3}, Lcom/google/android/gms/internal/gtm/zzww;->zzr(Ljava/lang/Class;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    .line 11
    :pswitch_9
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzv()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 19
    :pswitch_a
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzS()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    goto :goto_0

    .line 20
    :pswitch_b
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzf()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_0

    .line 21
    :pswitch_c
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzk()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto :goto_0

    .line 22
    :pswitch_d
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzg()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_0

    .line 23
    :pswitch_e
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzo()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto :goto_0

    .line 24
    :pswitch_f
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzl()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto :goto_0

    .line 25
    :pswitch_10
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zzb()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    goto :goto_0

    .line 26
    :pswitch_11
    invoke-interface {p1}, Lcom/google/android/gms/internal/gtm/zzww;->zza()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    .line 27
    :goto_0
    invoke-virtual {p2}, Lcom/google/android/gms/internal/gtm/zzux;->zza()Z

    iget-object p3, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    iget-object p3, p3, Lcom/google/android/gms/internal/gtm/zzuw;->zzc:Lcom/google/android/gms/internal/gtm/zzye;

    .line 28
    invoke-virtual {p3}, Lcom/google/android/gms/internal/gtm/zzye;->ordinal()I

    move-result p3

    const/16 p6, 0x9

    if-eq p3, p6, :cond_2

    const/16 p6, 0xa

    if-eq p3, p6, :cond_2

    goto :goto_1

    :cond_2
    iget-object p3, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    .line 29
    invoke-virtual {p4, p3}, Lcom/google/android/gms/internal/gtm/zzuo;->zze(Lcom/google/android/gms/internal/gtm/zzun;)Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_3

    .line 30
    invoke-static {p3, p1}, Lcom/google/android/gms/internal/gtm/zzvi;->zzg(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :cond_3
    :goto_1
    iget-object p2, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    .line 31
    invoke-virtual {p4, p2, p1}, Lcom/google/android/gms/internal/gtm/zzuo;->zzi(Lcom/google/android/gms/internal/gtm/zzun;Ljava/lang/Object;)V

    return-object p5

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method final zzf(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/gtm/zzuv;

    iget-object p1, p1, Lcom/google/android/gms/internal/gtm/zzuv;->zza:Lcom/google/android/gms/internal/gtm/zzuo;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zzuo;->zzg()V

    return-void
.end method

.method final zzg(Lcom/google/android/gms/internal/gtm/zzww;Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzuj;Lcom/google/android/gms/internal/gtm/zzuo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gtm/zzww;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            "Lcom/google/android/gms/internal/gtm/zzuo<",
            "Lcom/google/android/gms/internal/gtm/zzuw;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzux;

    iget-object v0, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzc:Lcom/google/android/gms/internal/gtm/zzwk;

    .line 1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-interface {p1, v0, p3}, Lcom/google/android/gms/internal/gtm/zzww;->zzt(Ljava/lang/Class;Lcom/google/android/gms/internal/gtm/zzuj;)Ljava/lang/Object;

    move-result-object p1

    iget-object p2, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    .line 2
    invoke-virtual {p4, p2, p1}, Lcom/google/android/gms/internal/gtm/zzuo;->zzi(Lcom/google/android/gms/internal/gtm/zzun;Ljava/lang/Object;)V

    return-void
.end method

.method final zzh(Lcom/google/android/gms/internal/gtm/zztd;Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzuj;Lcom/google/android/gms/internal/gtm/zzuo;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gtm/zztd;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/gtm/zzuj;",
            "Lcom/google/android/gms/internal/gtm/zzuo<",
            "Lcom/google/android/gms/internal/gtm/zzuw;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    check-cast p2, Lcom/google/android/gms/internal/gtm/zzux;

    iget-object v0, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzc:Lcom/google/android/gms/internal/gtm/zzwk;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzwk;->zzao()Lcom/google/android/gms/internal/gtm/zzwj;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/gtm/zzwj;->zzD()Lcom/google/android/gms/internal/gtm/zzwk;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/gtm/zztd;->zzd()I

    move-result v1

    if-nez v1, :cond_0

    .line 2
    sget-object p1, Lcom/google/android/gms/internal/gtm/zzvi;->zzc:[B

    goto :goto_0

    .line 3
    :cond_0
    new-array v2, v1, [B

    const/4 v3, 0x0

    .line 4
    invoke-virtual {p1, v2, v3, v3, v1}, Lcom/google/android/gms/internal/gtm/zztd;->zze([BIII)V

    move-object p1, v2

    .line 5
    :goto_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 6
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/google/android/gms/internal/gtm/zzsn;

    const/4 v2, 0x1

    .line 7
    invoke-direct {v1, p1, v2}, Lcom/google/android/gms/internal/gtm/zzsn;-><init>(Ljava/nio/ByteBuffer;Z)V

    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzwt;->zza()Lcom/google/android/gms/internal/gtm/zzwt;

    move-result-object p1

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 8
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/gtm/zzwt;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/gtm/zzwx;

    move-result-object p1

    .line 10
    invoke-interface {p1, v0, v1, p3}, Lcom/google/android/gms/internal/gtm/zzwx;->zzh(Ljava/lang/Object;Lcom/google/android/gms/internal/gtm/zzww;Lcom/google/android/gms/internal/gtm/zzuj;)V

    iget-object p1, p2, Lcom/google/android/gms/internal/gtm/zzux;->zzd:Lcom/google/android/gms/internal/gtm/zzuw;

    .line 11
    invoke-virtual {p4, p1, v0}, Lcom/google/android/gms/internal/gtm/zzuo;->zzi(Lcom/google/android/gms/internal/gtm/zzun;Ljava/lang/Object;)V

    .line 12
    invoke-interface {v1}, Lcom/google/android/gms/internal/gtm/zzww;->zzc()I

    move-result p1

    const p2, 0x7fffffff

    if-ne p1, p2, :cond_1

    return-void

    .line 13
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzvk;->zzb()Lcom/google/android/gms/internal/gtm/zzvk;

    move-result-object p1

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Direct buffers not yet supported"

    .line 14
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method final zzi(Lcom/google/android/gms/internal/gtm/zzwk;)Z
    .locals 0

    .line 1
    instance-of p1, p1, Lcom/google/android/gms/internal/gtm/zzuv;

    return p1
.end method

.method final zzj(Lcom/google/android/gms/internal/gtm/zztp;Ljava/util/Map$Entry;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/gtm/zztp;",
            "Ljava/util/Map$Entry<",
            "**>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/gtm/zzuw;

    .line 2
    sget-object v1, Lcom/google/android/gms/internal/gtm/zzye;->zza:Lcom/google/android/gms/internal/gtm/zzye;

    iget-object v1, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzc:Lcom/google/android/gms/internal/gtm/zzye;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/gtm/zzye;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    return-void

    .line 14
    :pswitch_0
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 15
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zztp;->zzD(IJ)V

    return-void

    .line 13
    :pswitch_1
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 14
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzB(II)V

    return-void

    .line 12
    :pswitch_2
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 13
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zztp;->zzz(IJ)V

    return-void

    .line 11
    :pswitch_3
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 12
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzx(II)V

    return-void

    .line 15
    :pswitch_4
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 16
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzr(II)V

    return-void

    .line 10
    :pswitch_5
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 11
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzI(II)V

    return-void

    .line 16
    :pswitch_6
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 17
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/android/gms/internal/gtm/zztd;

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzd(ILcom/google/android/gms/internal/gtm/zztd;)V

    return-void

    .line 21
    :pswitch_7
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 22
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 23
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzwt;->zza()Lcom/google/android/gms/internal/gtm/zzwt;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v2, p2}, Lcom/google/android/gms/internal/gtm/zzwt;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/gtm/zzwx;

    move-result-object p2

    .line 24
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzv(ILjava/lang/Object;Lcom/google/android/gms/internal/gtm/zzwx;)V

    return-void

    .line 18
    :pswitch_8
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 19
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 20
    invoke-static {}, Lcom/google/android/gms/internal/gtm/zzwt;->zza()Lcom/google/android/gms/internal/gtm/zzwt;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v2, p2}, Lcom/google/android/gms/internal/gtm/zzwt;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/gtm/zzwx;

    move-result-object p2

    .line 21
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzq(ILjava/lang/Object;Lcom/google/android/gms/internal/gtm/zzwx;)V

    return-void

    .line 17
    :pswitch_9
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 18
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzG(ILjava/lang/String;)V

    return-void

    .line 9
    :pswitch_a
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 10
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzb(IZ)V

    return-void

    .line 8
    :pswitch_b
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 9
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzk(II)V

    return-void

    .line 7
    :pswitch_c
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 8
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zztp;->zzm(IJ)V

    return-void

    .line 6
    :pswitch_d
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 7
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzr(II)V

    return-void

    .line 5
    :pswitch_e
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 6
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zztp;->zzK(IJ)V

    return-void

    .line 4
    :pswitch_f
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 5
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zztp;->zzt(IJ)V

    return-void

    .line 3
    :pswitch_10
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 4
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/gtm/zztp;->zzo(IF)V

    return-void

    .line 2
    :pswitch_11
    iget v0, v0, Lcom/google/android/gms/internal/gtm/zzuw;->zzb:I

    .line 3
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Double;

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/gms/internal/gtm/zztp;->zzf(ID)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
