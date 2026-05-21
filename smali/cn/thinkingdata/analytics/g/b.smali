.class public Lcn/thinkingdata/analytics/g/b;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final a:Lcn/thinkingdata/analytics/g/c;

.field private final b:Ljava/lang/Object;

.field private final c:Ljava/lang/Object;

.field private final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/b;->b:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/b;->c:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/b;->d:Ljava/lang/Object;

    new-instance v0, Lcn/thinkingdata/analytics/g/c;

    invoke-direct {v0, p1, p2}, Lcn/thinkingdata/analytics/g/c;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    return-void
.end method


# virtual methods
.method public a(ZLandroid/content/Context;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->f:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v1, v2}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    invoke-static {p2}, Lcn/thinkingdata/analytics/g/e;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;

    move-result-object p1

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/g/e;->c()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->f:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {p1, v2, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    invoke-static {p2}, Lcn/thinkingdata/analytics/g/e;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;

    move-result-object p1

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/g/e;->a()V

    :cond_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public a()V
    .locals 4

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->d:Lcn/thinkingdata/analytics/g/g;

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

.method public a(Ljava/lang/String;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->d:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->k:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v1, v2}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->k:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {p1, v2, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public a(Ljava/lang/String;Z)V
    .locals 2

    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "ThinkingAnalytics.Storage"

    const-string v0, "The account id cannot be empty."

    invoke-static {p1, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "account id cannot be empty"

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    iget-object p2, p0, Lcn/thinkingdata/analytics/g/b;->b:Ljava/lang/Object;

    monitor-enter p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->f:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->f:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    :cond_2
    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public a(Lorg/json/JSONObject;Ljava/util/TimeZone;Z)V
    .locals 2

    if-eqz p1, :cond_1

    :try_start_0
    invoke-static {p1}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcn/thinkingdata/analytics/g/b;->d:Ljava/lang/Object;

    monitor-enter p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->k:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {p1, v0, p2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object p2, Lcn/thinkingdata/analytics/g/g;->k:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {p1, p2, v0}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    monitor-exit p3

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_1
    :goto_0
    if-nez p3, :cond_2

    return-void

    :cond_2
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "Set super properties failed. Please refer to the SDK debug log for details."

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_1
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    return-void
.end method

.method public a(Z)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->a:Lcn/thinkingdata/analytics/g/g;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    return-void
.end method

.method public b()V
    .locals 4

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

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

.method public b(Ljava/lang/String;Z)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "ThinkingAnalytics.Storage"

    const-string v0, "The identity cannot be empty."

    invoke-static {p1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "distinct id cannot be empty"

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    iget-object p2, p0, Lcn/thinkingdata/analytics/g/b;->c:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->d:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public b(Z)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->g:Lcn/thinkingdata/analytics/g/g;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    return-void
.end method

.method public b(ZLandroid/content/Context;)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->b:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->f:Lcn/thinkingdata/analytics/g/g;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    invoke-static {p2}, Lcn/thinkingdata/analytics/g/e;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;

    move-result-object p1

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/g/e;->c()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {p2}, Lcn/thinkingdata/analytics/g/e;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;

    move-result-object p1

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/g/e;->a()V

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public c()V
    .locals 4

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->k:Lcn/thinkingdata/analytics/g/g;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

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

.method public c(Z)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->h:Lcn/thinkingdata/analytics/g/g;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V

    return-void
.end method

.method public d()Z
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->a:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public e()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->d:Lcn/thinkingdata/analytics/g/g;

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

.method public f()Z
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->g:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public g()Z
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v1, Lcn/thinkingdata/analytics/g/g;->h:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public h()Lorg/json/JSONObject;
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/b;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/b;->a:Lcn/thinkingdata/analytics/g/c;

    sget-object v2, Lcn/thinkingdata/analytics/g/g;->k:Lcn/thinkingdata/analytics/g/g;

    invoke-virtual {v1, v2}, Lcn/thinkingdata/analytics/g/a;->a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
