.class Ljp/f4samurai/pnote/util/PnoteUtil$10;
.super Ljava/lang/Object;
.source "PnoteUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/pnote/util/PnoteUtil;->listNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$by:Ljava/lang/String;

.field final synthetic val$optionalParams:Ljava/util/Map;

.field final synthetic val$status:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    .line 486
    iput-object p1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$by:Ljava/lang/String;

    iput-object p2, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$status:Ljava/lang/String;

    iput-object p3, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$optionalParams:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 489
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 492
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->APP_ID:Ljava/lang/String;

    const-string v2, "app_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->API_VERSION:Ljava/lang/String;

    const-string v2, "api_version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$by:Ljava/lang/String;

    const-string v2, "by"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$status:Ljava/lang/String;

    const-string v2, "status"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "start"

    const-string v2, "end"

    const-string v3, "page"

    .line 498
    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x3

    if-ge v2, v3, :cond_1

    .line 500
    iget-object v3, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$optionalParams:Ljava/util/Map;

    aget-object v4, v1, v2

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$optionalParams:Ljava/util/Map;

    aget-object v4, v1, v2

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, ""

    if-eq v3, v4, :cond_0

    .line 501
    aget-object v3, v1, v2

    iget-object v4, p0, Ljp/f4samurai/pnote/util/PnoteUtil$10;->val$optionalParams:Ljava/util/Map;

    aget-object v5, v1, v2

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 507
    :cond_1
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    goto :goto_1

    :cond_2
    :try_start_0
    const-string v1, "notification/list"

    .line 512
    invoke-static {v1, v0}, Ljp/f4samurai/pnote/util/PnoteUtil;->post(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
