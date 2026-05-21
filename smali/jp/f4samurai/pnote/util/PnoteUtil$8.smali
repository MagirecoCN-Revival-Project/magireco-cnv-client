.class Ljp/f4samurai/pnote/util/PnoteUtil$8;
.super Ljava/lang/Object;
.source "PnoteUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/pnote/util/PnoteUtil;->registSingleTag(Landroid/content/Context;IILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$guid:Ljava/lang/String;

.field final synthetic val$index:I

.field final synthetic val$tag:I


# direct methods
.method constructor <init>(IILandroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 399
    iput p1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$tag:I

    iput p2, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$index:I

    iput-object p3, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$context:Landroid/content/Context;

    iput-object p4, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$guid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 402
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 403
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->APP_ID:Ljava/lang/String;

    const-string v2, "app_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    iget v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$tag:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 405
    iget v2, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$tag:I

    const-string v3, ""

    if-gez v2, :cond_0

    move-object v1, v3

    .line 408
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "tag"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$index:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$context:Landroid/content/Context;

    invoke-static {v1}, Ljp/f4samurai/pnote/util/PnoteUtil;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 410
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const-string v2, "device_id"

    .line 413
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$guid:Ljava/lang/String;

    if-eqz v1, :cond_2

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 415
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$8;->val$guid:Ljava/lang/String;

    const-string v2, "guid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    :cond_2
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->API_VERSION:Ljava/lang/String;

    const-string v2, "api_version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    const-string v1, "tag/regist"

    .line 419
    invoke-static {v1, v0}, Ljp/f4samurai/pnote/util/PnoteUtil;->post(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_3
    :goto_0
    return-void
.end method
