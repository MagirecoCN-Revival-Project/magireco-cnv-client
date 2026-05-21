.class Ljp/f4samurai/pnote/PnoteHelper$2;
.super Ljava/lang/Object;
.source "PnoteHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/pnote/PnoteHelper;->startRegist(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$guid:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 71
    iput-object p1, p0, Ljp/f4samurai/pnote/PnoteHelper$2;->val$guid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 74
    invoke-static {}, Ljp/f4samurai/pnote/PnoteHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/FirebaseApp;->getApps(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    invoke-static {}, Lcom/google/firebase/iid/FirebaseInstanceId;->getInstance()Lcom/google/firebase/iid/FirebaseInstanceId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/iid/FirebaseInstanceId;->getToken()Ljava/lang/String;

    move-result-object v0

    .line 76
    invoke-static {}, Ljp/f4samurai/pnote/PnoteHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v1

    iget-object v2, p0, Ljp/f4samurai/pnote/PnoteHelper$2;->val$guid:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Ljp/f4samurai/pnote/util/PnoteUtil;->registDevice(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
