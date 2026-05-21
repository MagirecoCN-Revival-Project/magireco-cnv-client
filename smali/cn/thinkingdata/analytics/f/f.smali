.class public Lcn/thinkingdata/analytics/f/f;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/content/Context;",
            "Lcn/thinkingdata/analytics/f/f;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Ljava/lang/String;

.field private b:I

.field private c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/f/f;->d:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 5

    const-string v0, "integer"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v1, 0xa

    iput v1, p0, Lcn/thinkingdata/analytics/f/f;->b:I

    const/16 v1, 0x2710

    iput v1, p0, Lcn/thinkingdata/analytics/f/f;->c:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    :try_start_0
    iput-object v2, p0, Lcn/thinkingdata/analytics/f/f;->a:Ljava/lang/String;

    const-string v3, "TADeFaultMainProcessName"

    const-string v4, "string"

    invoke-virtual {v1, v3, v4, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcn/thinkingdata/analytics/f/f;->a:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    const-string v3, "TARetentionDays"

    invoke-virtual {v1, v3, v0, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    iput v3, p0, Lcn/thinkingdata/analytics/f/f;->b:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    const-string v3, "TADatabaseLimit"

    invoke-virtual {v1, v3, v0, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcn/thinkingdata/analytics/f/f;->c:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    invoke-static {p1}, Lcn/thinkingdata/analytics/TDPresetProperties;->initDisableList(Landroid/content/Context;)V

    return-void
.end method

.method public static a(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/f;
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/f/f;->d:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/f/f;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/analytics/f/f;

    invoke-direct {v1, p0}, Lcn/thinkingdata/analytics/f/f;-><init>(Landroid/content/Context;)V

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


# virtual methods
.method public a()J
    .locals 4

    iget v0, p0, Lcn/thinkingdata/analytics/f/f;->b:I

    const/16 v1, 0xa

    if-gt v0, v1, :cond_0

    if-gez v0, :cond_1

    :cond_0
    const/16 v0, 0xa

    :cond_1
    int-to-long v0, v0

    const-wide/32 v2, 0x5265c00

    mul-long v2, v2, v0

    return-wide v2
.end method

.method public b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/f;->a:Ljava/lang/String;

    return-object v0
.end method

.method public c()I
    .locals 2

    iget v0, p0, Lcn/thinkingdata/analytics/f/f;->c:I

    const/16 v1, 0x1388

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method
