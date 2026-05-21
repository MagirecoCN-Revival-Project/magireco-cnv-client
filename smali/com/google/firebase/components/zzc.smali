.class public final Lcom/google/firebase/components/zzc;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/components/zzc$zza;,
        Lcom/google/firebase/components/zzc$zzb;
    }
.end annotation


# instance fields
.field private final zza:Landroid/content/Context;

.field private final zzb:Lcom/google/firebase/components/zzc$zzb;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 45
    new-instance v0, Lcom/google/firebase/components/zzc$zza;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/firebase/components/zzc$zza;-><init>(B)V

    invoke-direct {p0, p1, v0}, Lcom/google/firebase/components/zzc;-><init>(Landroid/content/Context;Lcom/google/firebase/components/zzc$zzb;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/google/firebase/components/zzc$zzb;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/google/firebase/components/zzc;->zza:Landroid/content/Context;

    .line 51
    iput-object p2, p0, Lcom/google/firebase/components/zzc;->zzb:Lcom/google/firebase/components/zzc$zzb;

    return-void
.end method

.method private static zza(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/google/firebase/components/ComponentRegistrar;",
            ">;"
        }
    .end annotation

    const-string v0, "Could not instantiate %s."

    const-string v1, "ComponentDiscovery"

    .line 60
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 61
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 63
    :try_start_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 64
    const-class v7, Lcom/google/firebase/components/ComponentRegistrar;

    invoke-virtual {v7, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v6, "Class %s is not an instance of %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v3, v7, v4

    const-string v8, "com.google.firebase.components.ComponentRegistrar"

    aput-object v8, v7, v5

    .line 67
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 65
    invoke-static {v1, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 70
    :cond_0
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/components/ComponentRegistrar;

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v6

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v4

    .line 76
    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception v6

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v4

    .line 74
    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_2
    move-exception v6

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v4

    const-string v3, "Class %s is not an found."

    .line 72
    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_1
    return-object v2
.end method


# virtual methods
.method public final zza()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/components/ComponentRegistrar;",
            ">;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/google/firebase/components/zzc;->zzb:Lcom/google/firebase/components/zzc$zzb;

    iget-object v1, p0, Lcom/google/firebase/components/zzc;->zza:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/google/firebase/components/zzc$zzb;->zza(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/components/zzc;->zza(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
