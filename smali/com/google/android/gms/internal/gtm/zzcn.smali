.class public final Lcom/google/android/gms/internal/gtm/zzcn;
.super Lcom/google/android/gms/internal/gtm/zzbs;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"


# instance fields
.field private volatile zza:Ljava/lang/String;

.field private zzb:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/gtm/zzbv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/gtm/zzbs;-><init>(Lcom/google/android/gms/internal/gtm/zzbv;)V

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/android/gms/internal/gtm/zzcn;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzcn;->zzf()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final zzf()Ljava/lang/String;
    .locals 7

    const-string v0, "0"

    const-string v1, "Failed to close clientId writing stream"

    .line 1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzq()Lcom/google/android/gms/analytics/zzr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/zzr;->zza()Landroid/content/Context;

    move-result-object v3

    .line 3
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    const-string v4, "ClientId should be saved from worker thread"

    .line 4
    invoke-static {v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotMainThread(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    const/4 v4, 0x0

    :try_start_1
    const-string v5, "Storing clientId"

    .line 5
    invoke-virtual {p0, v5, v2}, Lcom/google/android/gms/internal/gtm/zzbr;->zzP(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "gaClientId"

    const/4 v6, 0x0

    .line 6
    invoke-virtual {v3, v5, v6}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v4

    .line 7
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_0

    .line 9
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6

    goto :goto_0

    :catch_0
    move-exception v3

    .line 10
    :try_start_3
    invoke-virtual {p0, v1, v3}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    :cond_0
    :goto_0
    return-object v2

    :catchall_0
    move-exception v2

    goto :goto_5

    :catch_1
    move-exception v2

    goto :goto_1

    :catch_2
    move-exception v2

    goto :goto_3

    :goto_1
    :try_start_4
    const-string v3, "Error writing to clientId file"

    .line 8
    invoke-virtual {p0, v3, v2}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v4, :cond_1

    .line 9
    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    goto :goto_4

    :catch_3
    move-exception v2

    .line 10
    :goto_2
    :try_start_6
    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_4

    :goto_3
    :try_start_7
    const-string v3, "Error creating clientId file"

    .line 11
    invoke-virtual {p0, v3, v2}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-eqz v4, :cond_1

    .line 9
    :try_start_8
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_4

    :catch_4
    move-exception v2

    goto :goto_2

    :cond_1
    :goto_4
    return-object v0

    :goto_5
    if-eqz v4, :cond_2

    :try_start_9
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_5
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    goto :goto_6

    :catch_5
    move-exception v3

    .line 10
    :try_start_a
    invoke-virtual {p0, v1, v3}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    :cond_2
    :goto_6
    throw v2
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    :catch_6
    move-exception v1

    const-string v2, "Error saving clientId file"

    .line 13
    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public final zzb()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbs;->zzW()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzq()Lcom/google/android/gms/analytics/zzr;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/gtm/zzcl;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/gtm/zzcl;-><init>(Lcom/google/android/gms/internal/gtm/zzcn;)V

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/zzr;->zzg(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zzb:Ljava/util/concurrent/Future;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zzb:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 4
    :try_start_1
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string v1, "Failed to load or generate client id"

    .line 5
    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "0"

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "ClientId loading or generation was interrupted"

    .line 6
    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzS(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "0"

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    .line 4
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "0"

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    :cond_1
    const-string v0, "Loaded clientId"

    iget-object v1, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/gtm/zzbr;->zzP(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zzb:Ljava/util/concurrent/Future;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    .line 8
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 9
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method final zzc()Ljava/lang/String;
    .locals 9

    const-string v0, "gaClientId"

    const-string v1, "Failed to close client id reading stream"

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzq()Lcom/google/android/gms/analytics/zzr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/zzr;->zza()Landroid/content/Context;

    move-result-object v2

    const-string v3, "ClientId should be loaded from worker thread"

    .line 2
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotMainThread(Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 3
    :try_start_0
    invoke-virtual {v2, v0}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v4
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v5, 0x24

    :try_start_1
    new-array v6, v5, [B

    const/4 v7, 0x0

    .line 4
    invoke-virtual {v4, v6, v7, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v5

    .line 5
    invoke-virtual {v4}, Ljava/io/FileInputStream;->available()I

    move-result v8

    if-lez v8, :cond_0

    const-string v5, "clientId file seems corrupted, deleting it."

    .line 6
    invoke-virtual {p0, v5}, Lcom/google/android/gms/internal/gtm/zzbr;->zzR(Ljava/lang/String;)V

    .line 7
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 8
    invoke-virtual {v2, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v4, :cond_4

    .line 9
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6

    goto :goto_5

    :cond_0
    const/16 v8, 0xe

    if-ge v5, v8, :cond_1

    :try_start_3
    const-string v5, "clientId file is empty, deleting it."

    .line 11
    invoke-virtual {p0, v5}, Lcom/google/android/gms/internal/gtm/zzbr;->zzR(Ljava/lang/String;)V

    .line 12
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 13
    invoke-virtual {v2, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v4, :cond_4

    .line 9
    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6

    goto :goto_5

    .line 14
    :cond_1
    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    new-instance v8, Ljava/lang/String;

    .line 15
    invoke-direct {v8, v6, v7, v5}, Ljava/lang/String;-><init>([BII)V

    const-string v5, "Read client id from disk"

    .line 16
    invoke-virtual {p0, v5, v8}, Lcom/google/android/gms/internal/gtm/zzbr;->zzP(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v4, :cond_2

    .line 9
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 10
    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    :goto_0
    move-object v3, v8

    goto :goto_5

    :catch_1
    move-exception v5

    goto :goto_1

    :catch_2
    nop

    goto :goto_4

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_3
    move-exception v5

    move-object v4, v3

    :goto_1
    :try_start_7
    const-string v6, "Error reading client id file, deleting it"

    .line 17
    invoke-virtual {p0, v6, v5}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    invoke-virtual {v2, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-eqz v4, :cond_4

    .line 9
    :try_start_8
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v3, v4

    :goto_2
    if-eqz v3, :cond_3

    :try_start_9
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4

    goto :goto_3

    :catch_4
    move-exception v2

    .line 10
    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    :cond_3
    :goto_3
    throw v0

    :catch_5
    move-object v4, v3

    :goto_4
    if-eqz v4, :cond_4

    .line 9
    :try_start_a
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6

    goto :goto_5

    :catch_6
    move-exception v0

    .line 10
    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzK(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    :goto_5
    if-nez v3, :cond_5

    .line 20
    invoke-direct {p0}, Lcom/google/android/gms/internal/gtm/zzcn;->zzf()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_5
    return-object v3
.end method

.method protected final zzd()V
    .locals 0

    return-void
.end method

.method final zze()Ljava/lang/String;
    .locals 2

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zza:Ljava/lang/String;

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzbr;->zzq()Lcom/google/android/gms/analytics/zzr;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/gtm/zzcm;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/gtm/zzcm;-><init>(Lcom/google/android/gms/internal/gtm/zzcn;)V

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/zzr;->zzg(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/gtm/zzcn;->zzb:Ljava/util/concurrent/Future;

    .line 3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/gtm/zzcn;->zzb()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    .line 3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
