.class abstract Lcn/thinkingdata/analytics/g/i;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final b:Ljava/lang/String;

.field private final c:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Landroid/content/SharedPreferences;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/Future;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "Landroid/content/SharedPreferences;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/g/i;->c:Ljava/util/concurrent/Future;

    iput-object p2, p0, Lcn/thinkingdata/analytics/g/i;->b:Ljava/lang/String;

    return-void
.end method

.method private c()Landroid/content/SharedPreferences$Editor;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/g/i;->c:Ljava/util/concurrent/Future;

    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    move-object v1, v0

    :goto_1
    if-eqz v1, :cond_0

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    :cond_0
    return-object v0
.end method


# virtual methods
.method a()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method a(Landroid/content/SharedPreferences$Editor;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences$Editor;",
            "TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->b:Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method a(Landroid/content/SharedPreferences;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->b:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/g/i;->a()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/g/i;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/g/i;->a:Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iput-object p1, p0, Lcn/thinkingdata/analytics/g/i;->a:Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/g/i;->c:Ljava/util/concurrent/Future;

    monitor-enter p1

    :try_start_0
    invoke-direct {p0}, Lcn/thinkingdata/analytics/g/i;->c()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/i;->a:Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcn/thinkingdata/analytics/g/i;->a(Landroid/content/SharedPreferences$Editor;Ljava/lang/Object;)V

    :cond_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public b()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->a:Ljava/lang/Object;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->c:Ljava/util/concurrent/Future;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcn/thinkingdata/analytics/g/i;->c:Ljava/util/concurrent/Future;

    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v1, v2

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v2

    :try_start_1
    invoke-virtual {v2}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    if-eqz v1, :cond_0

    invoke-virtual {p0, v1}, Lcn/thinkingdata/analytics/g/i;->a(Landroid/content/SharedPreferences;)V

    :cond_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_1
    :goto_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->a:Ljava/lang/Object;

    return-object v0
.end method
