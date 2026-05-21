.class public abstract Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source ""


# instance fields
.field private final mPool:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 8

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    new-instance p1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v2, 0x1

    const/4 v3, 0x1

    const-wide/16 v4, 0x0

    move-object v1, p1

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object p1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->mPool:Ljava/util/concurrent/ExecutorService;

    return-void
.end method


# virtual methods
.method protected deleteAsync(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;)V
    .locals 8

    iget-object v0, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->mPool:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;-><init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;)V

    invoke-interface {v0, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected insertAsync(Ljava/lang/String;Landroid/content/ContentValues;Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->mPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;-><init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;Landroid/content/ContentValues;Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected rawQueryAsync(Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->mPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;

    invoke-direct {v1, p0, p1, p2, p3}, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;-><init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected updateAsync(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;)V
    .locals 9

    iget-object v0, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->mPool:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;-><init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;)V

    invoke-interface {v0, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
