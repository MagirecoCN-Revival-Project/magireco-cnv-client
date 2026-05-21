.class Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->insertAsync(Ljava/lang/String;Landroid/content/ContentValues;Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

.field final synthetic val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;

.field final synthetic val$table:Ljava/lang/String;

.field final synthetic val$values:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;Landroid/content/ContentValues;Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    iput-object p2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->val$table:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->val$values:Landroid/content/ContentValues;

    iput-object p4, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->val$table:Ljava/lang/String;

    iget-object v2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->val$values:Landroid/content/ContentValues;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    iget-object v2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$1;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;

    if-eqz v2, :cond_0

    invoke-interface {v2, v0, v1}, Lcn/thinkingdata/core/sqlite/ITESqliteInsertCallback;->onInsertCallback(J)V

    :cond_0
    return-void
.end method
