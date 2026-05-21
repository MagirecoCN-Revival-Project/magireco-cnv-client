.class final Lcom/google/android/gms/tagmanager/zzel;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-tagmanager-v4-impl@@17.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/gtm/zzrl;

.field final synthetic zzb:Lcom/google/android/gms/tagmanager/zzem;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzem;Lcom/google/android/gms/internal/gtm/zzrl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzel;->zzb:Lcom/google/android/gms/tagmanager/zzem;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzel;->zza:Lcom/google/android/gms/internal/gtm/zzrl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    const-string v0, "error closing stream for writing resource to disk"

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzel;->zzb:Lcom/google/android/gms/tagmanager/zzem;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzel;->zza:Lcom/google/android/gms/internal/gtm/zzrl;

    .line 1
    invoke-virtual {v1}, Lcom/google/android/gms/tagmanager/zzem;->zze()Ljava/io/File;

    move-result-object v1

    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    .line 2
    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_5

    .line 4
    :try_start_1
    invoke-virtual {v2}, Lcom/google/android/gms/internal/gtm/zzsh;->zzX()I

    move-result v4

    .line 5
    new-array v4, v4, [B

    .line 6
    invoke-static {v4}, Lcom/google/android/gms/internal/gtm/zzto;->zzF([B)Lcom/google/android/gms/internal/gtm/zzto;

    move-result-object v5

    .line 4
    invoke-virtual {v2, v5}, Lcom/google/android/gms/internal/gtm/zzsh;->zzaq(Lcom/google/android/gms/internal/gtm/zzto;)V

    .line 7
    invoke-virtual {v5}, Lcom/google/android/gms/internal/gtm/zzto;->zzG()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 4
    :try_start_2
    invoke-virtual {v3, v4}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 12
    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    .line 13
    :catch_0
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v4

    .line 3
    :try_start_4
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "byte array"

    .line 4
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 8
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x48

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v7, "Serializing "

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " to a "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " threw an IOException (should never happen)."

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 9
    invoke-direct {v5, v2, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catch_2
    :try_start_5
    const-string v2, "Error writing resource to disk. Removing resource from disk."

    .line 10
    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    .line 11
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 12
    :try_start_6
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    return-void

    .line 13
    :catch_3
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    return-void

    .line 12
    :goto_0
    :try_start_7
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_1

    .line 13
    :catch_4
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zzc(Ljava/lang/String;)V

    .line 14
    :goto_1
    throw v1

    :catch_5
    const-string v0, "Error opening resource file for writing"

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdh;->zza(Ljava/lang/String;)V

    return-void
.end method
