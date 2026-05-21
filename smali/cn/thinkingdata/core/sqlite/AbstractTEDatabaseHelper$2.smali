.class Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->deleteAsync(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

.field final synthetic val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;

.field final synthetic val$table:Ljava/lang/String;

.field final synthetic val$whereArgs:[Ljava/lang/String;

.field final synthetic val$whereClause:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    iput-object p2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$table:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$whereClause:Ljava/lang/String;

    iput-object p4, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$whereArgs:[Ljava/lang/String;

    iput-object p5, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const-wide/16 v0, 0x7d0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    iget-object v0, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$table:Ljava/lang/String;

    iget-object v2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$whereClause:Ljava/lang/String;

    iget-object v3, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$whereArgs:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$2;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Lcn/thinkingdata/core/sqlite/ITESqliteDeleteCallback;->onDeleteCallback(I)V

    :cond_0
    return-void
.end method
