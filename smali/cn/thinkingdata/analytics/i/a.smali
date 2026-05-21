.class public Lcn/thinkingdata/analytics/i/a;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static b:Lcn/thinkingdata/analytics/i/a;


# instance fields
.field private final a:Ljava/util/concurrent/ExecutorService;


# direct methods
.method private constructor <init>()V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v8, Lcn/thinkingdata/analytics/i/a$a;

    invoke-direct {v8, p0}, Lcn/thinkingdata/analytics/i/a$a;-><init>(Lcn/thinkingdata/analytics/i/a;)V

    const/4 v2, 0x1

    const/4 v3, 0x1

    const-wide/16 v4, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/i/a;->a:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public static declared-synchronized a()Lcn/thinkingdata/analytics/i/a;
    .locals 2

    const-class v0, Lcn/thinkingdata/analytics/i/a;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/thinkingdata/analytics/i/a;->b:Lcn/thinkingdata/analytics/i/a;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/analytics/i/a;

    invoke-direct {v1}, Lcn/thinkingdata/analytics/i/a;-><init>()V

    sput-object v1, Lcn/thinkingdata/analytics/i/a;->b:Lcn/thinkingdata/analytics/i/a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    sget-object v1, Lcn/thinkingdata/analytics/i/a;->b:Lcn/thinkingdata/analytics/i/a;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object v1

    :goto_1
    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public a(Ljava/lang/Runnable;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/i/a;->a:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method
