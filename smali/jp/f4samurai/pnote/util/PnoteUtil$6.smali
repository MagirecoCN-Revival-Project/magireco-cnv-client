.class Ljp/f4samurai/pnote/util/PnoteUtil$6;
.super Ljava/lang/Object;
.source "PnoteUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/pnote/util/PnoteUtil;->registTags(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$guid:Ljava/lang/String;

.field final synthetic val$tags:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 310
    iput-object p1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$6;->val$tags:Ljava/lang/String;

    iput-object p2, p0, Ljp/f4samurai/pnote/util/PnoteUtil$6;->val$context:Landroid/content/Context;

    iput-object p3, p0, Ljp/f4samurai/pnote/util/PnoteUtil$6;->val$guid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 313
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 314
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->APP_ID:Ljava/lang/String;

    const-string v2, "app_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$6;->val$tags:Ljava/lang/String;

    const-string v2, "tags"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$6;->val$context:Landroid/content/Context;

    invoke-static {v1}, Ljp/f4samurai/pnote/util/PnoteUtil;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v2, ""

    .line 319
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    const-string v3, "device_id"

    .line 322
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$6;->val$guid:Ljava/lang/String;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 324
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$6;->val$guid:Ljava/lang/String;

    const-string v2, "guid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    :cond_1
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->API_VERSION:Ljava/lang/String;

    const-string v2, "api_version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    const-string v1, "tag/regist"

    .line 328
    invoke-static {v1, v0}, Ljp/f4samurai/pnote/util/PnoteUtil;->post(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_2
    :goto_0
    return-void
.end method
