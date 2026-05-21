.class public Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source ""


# static fields
.field private static final CPU_COUNT:I

.field private static final INIT_THREAD_COUNT:I

.field private static final MAX_THREAD_COUNT:I

.field private static final SURPLUS_THREAD_LIFE:J = 0x1eL

.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.DefaultPoolExecutor"

.field private static volatile instance:Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    sput v0, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->CPU_COUNT:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->INIT_THREAD_COUNT:I

    sput v0, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->MAX_THREAD_COUNT:I

    return-void
.end method

.method private constructor <init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;",
            "Ljava/util/concurrent/ThreadFactory;",
            ")V"
        }
    .end annotation

    new-instance v8, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor$1;

    invoke-direct {v8}, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor$1;-><init>()V

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-wide v3, p3

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    return-void
.end method

.method public static getInstance()Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;
    .locals 10

    sget-object v0, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->instance:Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;

    if-nez v0, :cond_1

    const-class v0, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->instance:Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;

    if-nez v1, :cond_0

    new-instance v1, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;

    sget v3, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->INIT_THREAD_COUNT:I

    sget v4, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->MAX_THREAD_COUNT:I

    const-wide/16 v5, 0x1e

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v2, 0x40

    invoke-direct {v8, v2}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v9, Lcn/thinkingdata/core/utils/pool/DefaultThreadFactory;

    invoke-direct {v9}, Lcn/thinkingdata/core/utils/pool/DefaultThreadFactory;-><init>()V

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v1, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->instance:Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;->instance:Lcn/thinkingdata/core/utils/pool/DefaultPoolExecutor;

    return-object v0
.end method


# virtual methods
.method protected afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    invoke-super {p0, p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->afterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    if-nez p2, :cond_0

    instance-of v0, p1, Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    :try_start_0
    check-cast p1, Ljava/util/concurrent/Future;

    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    goto :goto_0

    :catch_2
    move-exception p1

    move-object p2, p1

    :cond_0
    :goto_0
    if-eqz p2, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Running task appeared exception! Thread ["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "], because ["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "]\n"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ThinkingAnalytics.DefaultPoolExecutor"

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method
