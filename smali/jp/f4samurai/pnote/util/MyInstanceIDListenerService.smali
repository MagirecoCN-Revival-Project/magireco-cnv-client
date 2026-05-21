.class public Ljp/f4samurai/pnote/util/MyInstanceIDListenerService;
.super Lcom/google/firebase/iid/FirebaseInstanceIdService;
.source "MyInstanceIDListenerService.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Pnote"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/google/firebase/iid/FirebaseInstanceIdService;-><init>()V

    return-void
.end method


# virtual methods
.method public onTokenRefresh()V
    .locals 1

    .line 22
    invoke-static {}, Ljp/f4samurai/pnote/PnoteHelper;->getIsRegistDevice()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 23
    invoke-static {}, Ljp/f4samurai/pnote/PnoteHelper;->_callStartRegist()V

    :cond_0
    return-void
.end method
