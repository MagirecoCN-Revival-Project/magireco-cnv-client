.class public Lcn/thinkingdata/analytics/TDConfig;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/analytics/TDConfig$NetworkType;,
        Lcn/thinkingdata/analytics/TDConfig$TDMode;,
        Lcn/thinkingdata/analytics/TDConfig$ModeEnum;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.TDConfig"

.field public static final VERSION:Ljava/lang/String; = "3.0.0-beta.1"

.field private static final sInstances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/TDConfig;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private volatile mAllowedDebug:Z

.field private final mConfigStoragePlugin:Lcn/thinkingdata/analytics/g/d;

.field private final mConfigUrl:Ljava/lang/String;

.field public final mContext:Landroid/content/Context;

.field private final mContextConfig:Lcn/thinkingdata/analytics/f/f;

.field private final mDebugUrl:Ljava/lang/String;

.field private mDefaultTimeZone:Ljava/util/TimeZone;

.field private final mDisabledEvents:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mDisabledEventsLock:Ljava/util/concurrent/locks/ReadWriteLock;

.field mEnableEncrypt:Z

.field private mEnableMutiprocess:Z

.field private volatile mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

.field private mNetworkType:I

.field private mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field private final mServerUrl:Ljava/lang/String;

.field public final mToken:Ljava/lang/String;

.field private volatile mTrackOldData:Z

.field private volatile name:Ljava/lang/String;

.field private secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/TDConfig;->sInstances:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEvents:Ljava/util/Set;

    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEventsLock:Ljava/util/concurrent/locks/ReadWriteLock;

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig$ModeEnum;->NORMAL:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    iput-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    const/16 v0, 0xff

    iput v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mNetworkType:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mTrackOldData:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mEnableEncrypt:Z

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcn/thinkingdata/analytics/f/f;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/f;

    move-result-object v1

    iput-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mContextConfig:Lcn/thinkingdata/analytics/f/f;

    iput-object p2, p0, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/sync"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mServerUrl:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/data_debug"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mDebugUrl:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "/config?appid="

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcn/thinkingdata/analytics/TDConfig;->mConfigUrl:Ljava/lang/String;

    new-instance p3, Lcn/thinkingdata/analytics/g/d;

    invoke-direct {p3, p1, p2}, Lcn/thinkingdata/analytics/g/d;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p3, p0, Lcn/thinkingdata/analytics/TDConfig;->mConfigStoragePlugin:Lcn/thinkingdata/analytics/g/d;

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mEnableMutiprocess:Z

    return-void
.end method

.method static synthetic access$000(Lcn/thinkingdata/analytics/TDConfig;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/TDConfig;->mConfigUrl:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/g/d;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/TDConfig;->mConfigStoragePlugin:Lcn/thinkingdata/analytics/g/d;

    return-object p0
.end method

.method static synthetic access$202(Lcn/thinkingdata/analytics/TDConfig;Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    return-object p1
.end method

.method static synthetic access$300(Lcn/thinkingdata/analytics/TDConfig;)Ljava/util/concurrent/locks/ReadWriteLock;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEventsLock:Ljava/util/concurrent/locks/ReadWriteLock;

    return-object p0
.end method

.method static synthetic access$400(Lcn/thinkingdata/analytics/TDConfig;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEvents:Ljava/util/Set;

    return-object p0
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 1

    :try_start_0
    const-string v0, ""

    invoke-static {p0, p1, v0}, Lcn/thinkingdata/analytics/TDConfig;->getInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    invoke-static {p0, p1, p2, p1}, Lcn/thinkingdata/analytics/TDConfig;->getInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 6

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig;->sInstances:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string v2, " "

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v2, " "

    const-string v3, ""

    invoke-virtual {p3, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {v1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/thinkingdata/analytics/TDConfig;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_2

    :try_start_1
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    new-instance p2, Lcn/thinkingdata/analytics/TDConfig;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/net/URL;->getPort()I

    move-result v4

    if-lez v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/net/URL;->getPort()I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :cond_1
    const-string v2, ""

    :goto_0
    :try_start_3
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, p0, p1, v2}, Lcn/thinkingdata/analytics/TDConfig;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p2, p3}, Lcn/thinkingdata/analytics/TDConfig;->setName(Ljava/lang/String;)V

    invoke-interface {v1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p2}, Lcn/thinkingdata/analytics/TDConfig;->getRemoteConfig()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v2, p2

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "ThinkingAnalytics.TDConfig"

    :try_start_4
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid server URL: "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_2
    :goto_1
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p0
.end method

.method private getRemoteConfig()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcn/thinkingdata/analytics/TDConfig$a;

    invoke-direct {v1, p0}, Lcn/thinkingdata/analytics/TDConfig$a;-><init>(Lcn/thinkingdata/analytics/TDConfig;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public enableEncrypt(ILjava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mEnableEncrypt:Z

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    if-nez v0, :cond_0

    new-instance v0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    invoke-direct {v0}, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    iput p1, v0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->version:I

    iput-object p2, v0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->publicKey:Ljava/lang/String;

    const-string p1, "RSA"

    iput-object p1, v0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->asymmetricEncryption:Ljava/lang/String;

    const-string p1, "AES"

    iput-object p1, v0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->symmetricEncryption:Ljava/lang/String;

    :cond_0
    return-object p0
.end method

.method public enableEncrypt(Z)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mEnableEncrypt:Z

    return-object p0
.end method

.method public getDebugUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDebugUrl:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getDefaultTimeZone()Ljava/util/TimeZone;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDefaultTimeZone:Ljava/util/TimeZone;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFlushBulkSize()I
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mConfigStoragePlugin:Lcn/thinkingdata/analytics/g/d;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->b:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getFlushInterval()I
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mConfigStoragePlugin:Lcn/thinkingdata/analytics/g/d;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->c:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method getMainProcessName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mContextConfig:Lcn/thinkingdata/analytics/f/f;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/f/f;->b()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMode()Lcn/thinkingdata/analytics/TDConfig$ModeEnum;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->name:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSecreteKey()Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    return-object v0
.end method

.method public getServerUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mServerUrl:Ljava/lang/String;

    return-object v0
.end method

.method getTDConfigMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/TDConfig;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig;->sInstances:Ljava/util/Map;

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method isDebug()Z
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig$ModeEnum;->DEBUG:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    invoke-virtual {v0, v1}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isDebugOnly()Z
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig$ModeEnum;->DEBUG_ONLY:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    invoke-virtual {v0, v1}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method isDisabledEvent(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEventsLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEvents:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEventsLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return p1

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mDisabledEventsLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public isEnableMutiprocess()Z
    .locals 1

    iget-boolean v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mEnableMutiprocess:Z

    return v0
.end method

.method public isNormal()Z
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig$ModeEnum;->NORMAL:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    invoke-virtual {v0, v1}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized isShouldFlush(Ljava/lang/String;)Z
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;)I

    move-result p1

    iget v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mNetworkType:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setAllowDebug()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mAllowedDebug:Z

    return-void
.end method

.method public declared-synchronized setDefaultTimeZone(Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mDefaultTimeZone:Ljava/util/TimeZone;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setMode(Lcn/thinkingdata/analytics/TDConfig$ModeEnum;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    return-object p0
.end method

.method public setMode(Lcn/thinkingdata/analytics/TDConfig$TDMode;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig$b;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    sget-object p1, Lcn/thinkingdata/analytics/TDConfig$ModeEnum;->NORMAL:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    goto :goto_0

    :cond_1
    sget-object p1, Lcn/thinkingdata/analytics/TDConfig$ModeEnum;->DEBUG_ONLY:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    goto :goto_0

    :cond_2
    sget-object p1, Lcn/thinkingdata/analytics/TDConfig$ModeEnum;->DEBUG:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    :goto_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mMode:Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    :goto_1
    return-object p0
.end method

.method public setMutiprocess(Z)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mEnableMutiprocess:Z

    return-object p0
.end method

.method declared-synchronized setNetworkType(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcn/thinkingdata/analytics/TDConfig$b;->b:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 p1, 0x1f

    iput p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mNetworkType:I

    goto :goto_0

    :cond_1
    const/16 p1, 0x8

    iput p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mNetworkType:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-direct {p0}, Lcn/thinkingdata/analytics/TDConfig;->getRemoteConfig()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_0
    :goto_0
    monitor-exit p0

    return-object p0
.end method

.method public setSecretKey(Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Lcn/thinkingdata/analytics/TDConfig;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDConfig;->secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    if-nez v0, :cond_0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig;->secreteKey:Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    :cond_0
    return-object p0
.end method

.method public setTrackOldData(Z)Lcn/thinkingdata/analytics/TDConfig;
    .locals 0

    iput-boolean p1, p0, Lcn/thinkingdata/analytics/TDConfig;->mTrackOldData:Z

    return-object p0
.end method

.method public shouldThrowException()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public trackOldData()Z
    .locals 1

    iget-boolean v0, p0, Lcn/thinkingdata/analytics/TDConfig;->mTrackOldData:Z

    return v0
.end method
