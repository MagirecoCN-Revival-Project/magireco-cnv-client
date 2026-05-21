.class public Lcn/thinkingdata/analytics/g/e;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final b:Ljava/lang/Object;

.field private static final c:Ljava/lang/Object;

.field private static d:Lcn/thinkingdata/analytics/g/e;


# instance fields
.field private final a:Lcn/thinkingdata/analytics/g/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/g/e;->b:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/g/e;->c:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcn/thinkingdata/analytics/g/f;

    invoke-direct {v0, p1}, Lcn/thinkingdata/analytics/g/f;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/g/e;->d:Lcn/thinkingdata/analytics/g/e;

    if-nez v0, :cond_1

    const-class v0, Lcn/thinkingdata/analytics/g/e;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/thinkingdata/analytics/g/e;->d:Lcn/thinkingdata/analytics/g/e;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/analytics/g/e;

    invoke-direct {v1, p0}, Lcn/thinkingdata/analytics/g/e;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcn/thinkingdata/analytics/g/e;->d:Lcn/thinkingdata/analytics/g/e;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcn/thinkingdata/analytics/g/e;->d:Lcn/thinkingdata/analytics/g/e;

    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 4

    sget-object v0, Lcn/thinkingdata/analytics/g/e;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->f:Lcn/thinkingdata/analytics/g/g;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public a(Ljava/lang/Long;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->e:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->i:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    return-void
.end method

.method public b()Ljava/lang/Long;
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->e:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method public c()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcn/thinkingdata/analytics/g/e;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->f:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v1, v2}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public d()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->i:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public e()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcn/thinkingdata/analytics/g/e;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/e;->a:Lcn/thinkingdata/analytics/g/f;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->j:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v1, v2}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
