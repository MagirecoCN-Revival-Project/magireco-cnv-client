.class public Lcn/thinkingdata/analytics/encrypt/e;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/encrypt/e;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Lcn/thinkingdata/analytics/encrypt/a;

.field private final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/encrypt/a;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lcn/thinkingdata/analytics/TDConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/encrypt/e;->d:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/encrypt/e;->b:Ljava/util/List;

    iput-object p1, p0, Lcn/thinkingdata/analytics/encrypt/e;->c:Lcn/thinkingdata/analytics/TDConfig;

    new-instance p1, Lcn/thinkingdata/analytics/encrypt/d;

    invoke-direct {p1}, Lcn/thinkingdata/analytics/encrypt/d;-><init>()V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static a(Ljava/lang/String;)Lcn/thinkingdata/analytics/encrypt/e;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/encrypt/e;->d:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/encrypt/e;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static a(Ljava/lang/String;Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/encrypt/e;
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/encrypt/e;->d:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/encrypt/e;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/analytics/encrypt/e;

    invoke-direct {v1, p1}, Lcn/thinkingdata/analytics/encrypt/e;-><init>(Lcn/thinkingdata/analytics/TDConfig;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private a(Lcn/thinkingdata/analytics/encrypt/a;)Z
    .locals 1

    invoke-interface {p1}, Lcn/thinkingdata/analytics/encrypt/a;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {p1}, Lcn/thinkingdata/analytics/encrypt/a;->a()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private b(Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Z
    .locals 0

    if-eqz p1, :cond_1

    iget-object p1, p1, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->publicKey:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method


# virtual methods
.method a(Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Lcn/thinkingdata/analytics/encrypt/a;
    .locals 3

    invoke-direct {p0, p1}, Lcn/thinkingdata/analytics/encrypt/e;->b(Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/thinkingdata/analytics/encrypt/e;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/encrypt/a;

    if-eqz v1, :cond_0

    invoke-virtual {p0, v1, p1}, Lcn/thinkingdata/analytics/encrypt/e;->a(Lcn/thinkingdata/analytics/encrypt/a;Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/encrypt/e;->c:Lcn/thinkingdata/analytics/TDConfig;

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->getSecreteKey()Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;

    move-result-object v0

    invoke-direct {p0, v0}, Lcn/thinkingdata/analytics/encrypt/e;->b(Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object p1

    :cond_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/encrypt/e;->a:Lcn/thinkingdata/analytics/encrypt/a;

    invoke-virtual {p0, v1, v0}, Lcn/thinkingdata/analytics/encrypt/e;->a(Lcn/thinkingdata/analytics/encrypt/a;Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/encrypt/e;->a(Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Lcn/thinkingdata/analytics/encrypt/a;

    move-result-object v1

    iput-object v1, p0, Lcn/thinkingdata/analytics/encrypt/e;->a:Lcn/thinkingdata/analytics/encrypt/a;

    :cond_2
    iget-object v1, p0, Lcn/thinkingdata/analytics/encrypt/e;->a:Lcn/thinkingdata/analytics/encrypt/a;

    if-nez v1, :cond_3

    return-object p1

    :cond_3
    iget-object v1, v0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->publicKey:Ljava/lang/String;

    const-string v2, "EC:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_4
    iget-object v2, p0, Lcn/thinkingdata/analytics/encrypt/e;->a:Lcn/thinkingdata/analytics/encrypt/a;

    invoke-interface {v2, v1}, Lcn/thinkingdata/analytics/encrypt/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    return-object p1

    :cond_5
    iget-object v2, p0, Lcn/thinkingdata/analytics/encrypt/e;->a:Lcn/thinkingdata/analytics/encrypt/a;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcn/thinkingdata/analytics/encrypt/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    return-object p1

    :cond_6
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "ekey"

    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "pkv"

    :try_start_1
    iget v0, v0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->version:I

    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "payload"

    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v3

    :catch_0
    return-object p1
.end method

.method a(Lcn/thinkingdata/analytics/encrypt/a;Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Z
    .locals 2

    if-eqz p1, :cond_0

    invoke-direct {p0, p2}, Lcn/thinkingdata/analytics/encrypt/e;->b(Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcn/thinkingdata/analytics/encrypt/e;->a(Lcn/thinkingdata/analytics/encrypt/a;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcn/thinkingdata/analytics/encrypt/a;->b()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p2, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->asymmetricEncryption:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcn/thinkingdata/analytics/encrypt/a;->a()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p2, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->symmetricEncryption:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
