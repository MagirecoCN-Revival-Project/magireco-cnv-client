.class Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;->updateAsync(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

.field final synthetic val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;

.field final synthetic val$table:Ljava/lang/String;

.field final synthetic val$values:Landroid/content/ContentValues;

.field final synthetic val$whereArgs:[Ljava/lang/String;

.field final synthetic val$whereClause:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    iput-object p2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$table:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$values:Landroid/content/ContentValues;

    iput-object p4, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$whereClause:Ljava/lang/String;

    iput-object p5, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$whereArgs:[Ljava/lang/String;

    iput-object p6, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->this$0:Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$table:Ljava/lang/String;

    iget-object v2, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$values:Landroid/content/ContentValues;

    iget-object v3, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$whereClause:Ljava/lang/String;

    iget-object v4, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$whereArgs:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcn/thinkingdata/core/sqlite/AbstractTEDatabaseHelper$3;->val$callback:Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Lcn/thinkingdata/core/sqlite/ITESqliteUpdateCallback;->onUpdateCallback(I)V

    :cond_0
    return-void
.end method
