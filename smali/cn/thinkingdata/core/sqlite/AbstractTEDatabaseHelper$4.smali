.class Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->rawQueryAsync(Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

.field final synthetic val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;

.field final synthetic val$selectionArgs:[Ljava/lang/String;

.field final synthetic val$sql:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    iput-object p2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->val$sql:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->val$selectionArgs:[Ljava/lang/String;

    iput-object p4, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->val$sql:Ljava/lang/String;

    iget-object v3, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->val$selectionArgs:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    invoke-interface {v1, v0}, Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;->onQuerySuccess(Landroid/database/Cursor;)V

    goto :goto_0

    :cond_0
    invoke-interface {v1}, Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;->onQueryFail()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    :try_start_1
    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$4;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;

    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcn/thinkingdata/core/sqlite/ITESqliteQueryCallback;->onQueryFail()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    if-eqz v0, :cond_3

    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    return-void

    :goto_2
    if-eqz v0, :cond_4

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v1
.end method
