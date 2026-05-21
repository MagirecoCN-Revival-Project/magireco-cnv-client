.class final Lcom/google/android/gms/tagmanager/zzfj;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzbk;


# instance fields
.field private final zza:Ljava/lang/String;

.field private final zzb:Landroid/content/Context;

.field private final zzc:Lcom/google/android/gms/tagmanager/zzfi;

.field private final zzd:Lcom/google/android/gms/tagmanager/zzfh;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzfi;)V
    .locals 5

    new-instance v0, Lcom/google/android/gms/tagmanager/zzfh;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzfh;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzd:Lcom/google/android/gms/tagmanager/zzfh;

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzb:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzc:Lcom/google/android/gms/tagmanager/zzfi;

    sget-object p1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 5
    invoke-virtual {p2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    invoke-virtual {p2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "-"

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2
    :cond_3
    :goto_0
    sget-object p2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v1, Landroid/os/Build;->ID:Ljava/lang/String;

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "GoogleTagManager"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "4.00"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p1, v2, v3

    const/4 p1, 0x3

    aput-object v0, v2, p1

    const/4 p1, 0x4

    aput-object p2, v2, p1

    const/4 p1, 0x5

    aput-object v1, v2, p1

    const-string p1, "%s/%s (Linux; U; Android %s; %s; %s Build/%s)"

    .line 9
    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzfj;->zza:Ljava/lang/String;

    return-void
.end method

.method static final zzc(Lcom/google/android/gms/tagmanager/zzca;)Ljava/net/URL;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzca;->zzc()Ljava/lang/String;

    move-result-object p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const-string p0, "Error trying to parse the GTM url."

    .line 3
    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final zza(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/gms/tagmanager/zzca;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x28

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    :goto_0
    if-ge v3, v0, :cond_6

    .line 2
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/tagmanager/zzca;

    .line 3
    invoke-static {v5}, Lcom/google/android/gms/tagmanager/zzfj;->zzc(Lcom/google/android/gms/tagmanager/zzca;)Ljava/net/URL;

    move-result-object v6

    if-nez v6, :cond_0

    const-string v6, "No destination: discarding hit."

    .line 19
    invoke-static {v6}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzc:Lcom/google/android/gms/tagmanager/zzfi;

    check-cast v6, Lcom/google/android/gms/tagmanager/zzdu;

    iget-object v6, v6, Lcom/google/android/gms/tagmanager/zzdu;->zza:Lcom/google/android/gms/tagmanager/zzdw;

    .line 20
    invoke-virtual {v5}, Lcom/google/android/gms/tagmanager/zzca;->zzb()J

    move-result-wide v7

    invoke-static {v6, v7, v8}, Lcom/google/android/gms/tagmanager/zzdw;->zzh(Lcom/google/android/gms/tagmanager/zzdw;J)V

    .line 21
    invoke-virtual {v5}, Lcom/google/android/gms/tagmanager/zzca;->zzb()J

    move-result-wide v5

    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v8, 0x39

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v8, "Permanent failure dispatching hitId: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/google/android/gms/tagmanager/zzdh;->zzb:Lcom/google/android/gms/tagmanager/zzbg;

    .line 22
    invoke-virtual {v6, v5}, Lcom/google/android/gms/tagmanager/zzbg;->zzd(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 4
    :cond_0
    :try_start_0
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    .line 5
    check-cast v6, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v7, 0x0

    if-eqz v4, :cond_1

    :try_start_1
    iget-object v4, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzb:Landroid/content/Context;

    .line 6
    invoke-static {v4}, Lcom/google/android/gms/tagmanager/zzdk;->zza(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v4

    const/4 v8, 0x1

    goto :goto_3

    :cond_1
    :goto_1
    :try_start_2
    const-string v4, "User-Agent"

    iget-object v8, p0, Lcom/google/android/gms/tagmanager/zzfj;->zza:Ljava/lang/String;

    .line 7
    invoke-virtual {v6, v4, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    .line 9
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    const/16 v8, 0xc8

    if-eq v4, v8, :cond_2

    new-instance v8, Ljava/lang/StringBuilder;

    const/16 v9, 0x19

    .line 10
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v9, "Bad response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzc:Lcom/google/android/gms/tagmanager/zzfi;

    .line 11
    invoke-interface {v4, v5}, Lcom/google/android/gms/tagmanager/zzfi;->zza(Lcom/google/android/gms/tagmanager/zzca;)V

    goto :goto_2

    .line 14
    :cond_2
    iget-object v4, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzc:Lcom/google/android/gms/tagmanager/zzfi;

    check-cast v4, Lcom/google/android/gms/tagmanager/zzdu;

    iget-object v4, v4, Lcom/google/android/gms/tagmanager/zzdu;->zza:Lcom/google/android/gms/tagmanager/zzdw;

    .line 12
    invoke-virtual {v5}, Lcom/google/android/gms/tagmanager/zzca;->zzb()J

    move-result-wide v8

    invoke-static {v4, v8, v9}, Lcom/google/android/gms/tagmanager/zzdw;->zzh(Lcom/google/android/gms/tagmanager/zzdw;J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_2
    if-eqz v7, :cond_3

    .line 13
    :try_start_3
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 14
    :cond_3
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    const/4 v4, 0x0

    goto :goto_6

    :catch_0
    move-exception v4

    const/4 v8, 0x0

    goto :goto_4

    :catchall_1
    move-exception v4

    const/4 v8, 0x0

    :goto_3
    if-eqz v7, :cond_4

    .line 13
    :try_start_4
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 14
    :cond_4
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 15
    throw v4
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    move-exception v4

    goto :goto_4

    :catch_2
    move-exception v6

    move v8, v4

    move-object v4, v6

    .line 12
    :goto_4
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 16
    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "Exception sending hit: "

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_5

    invoke-virtual {v7, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_5

    .line 15
    :cond_5
    new-instance v6, Ljava/lang/String;

    .line 16
    invoke-direct {v6, v7}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_5
    invoke-static {v6}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    .line 17
    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzc:Lcom/google/android/gms/tagmanager/zzfi;

    .line 18
    invoke-interface {v4, v5}, Lcom/google/android/gms/tagmanager/zzfi;->zza(Lcom/google/android/gms/tagmanager/zzca;)V

    move v4, v8

    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_6
    return-void
.end method

.method public final zzb()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzfj;->zzb:Landroid/content/Context;

    const-string v1, "connectivity"

    .line 1
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 2
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    return v0

    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/gms/tagmanager/zzdh;->zzb:Lcom/google/android/gms/tagmanager/zzbg;

    const-string v1, "...no network connectivity"

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzd(Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method
