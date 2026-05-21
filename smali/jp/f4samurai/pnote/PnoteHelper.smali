.class public Ljp/f4samurai/pnote/PnoteHelper;
.super Ljava/lang/Object;
.source "PnoteHelper.java"

# interfaces
.implements Ljp/f4samurai/pnote/util/PnoteUtil$RegistDeviceCallback;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static isRegistDevice:Ljava/lang/Boolean;

.field private static sAppActivity:Ljp/f4samurai/AppActivity;

.field private static sTmpMid:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;
    .locals 1

    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smcallStartRegist()V
    .locals 0

    invoke-static {}, Ljp/f4samurai/pnote/PnoteHelper;->callStartRegist()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Ljp/f4samurai/pnote/PnoteHelper;->isRegistDevice:Ljava/lang/Boolean;

    const-string v0, "PnoteHelper"

    .line 31
    sput-object v0, Ljp/f4samurai/pnote/PnoteHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Ljp/f4samurai/AppActivity;

    sput-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    .line 50
    invoke-static {v0}, Ljp/f4samurai/pnote/util/PnoteUtil;->initialize(Landroid/content/Context;)V

    .line 52
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 53
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d0032

    .line 54
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 56
    new-instance v1, Landroid/app/NotificationChannel;

    const/4 v2, 0x4

    const-string v3, "\u30a4\u30d9\u30f3\u30c8\u901a\u77e5"

    invoke-direct {v1, v0, v3, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    const-string v0, "\u30a4\u30d9\u30f3\u30c8\u306e\u958b\u50ac\u7b49\u3001\u30b2\u30fc\u30e0\u5185\u306e\u304a\u77e5\u3089\u305b\u3092\u901a\u77e5\u3057\u307e\u3059\u3002"

    .line 57
    invoke-virtual {v1, v0}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 58
    invoke-virtual {v1, v0}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    .line 59
    invoke-virtual {v1, v0}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 60
    invoke-virtual {v1, v0}, Landroid/app/NotificationChannel;->enableLights(Z)V

    const v2, -0xff0100

    .line 61
    invoke-virtual {v1, v2}, Landroid/app/NotificationChannel;->setLightColor(I)V

    .line 62
    invoke-virtual {v1, v0}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    .line 64
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const-string v2, "notification"

    invoke-virtual {v0, v2}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 65
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_0
    return-void
.end method

.method public static _callStartRegist()V
    .locals 2

    .line 36
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/pnote/PnoteHelper$1;

    invoke-direct {v1}, Ljp/f4samurai/pnote/PnoteHelper$1;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static native callStartRegist()V
.end method

.method public static getIsRegistDevice()Ljava/lang/Boolean;
    .locals 1

    .line 103
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->isRegistDevice:Ljava/lang/Boolean;

    return-object v0
.end method

.method public static sendTags(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 99
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-static {v0, p1, p0}, Ljp/f4samurai/pnote/util/PnoteUtil;->registTags(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static startRegist(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    .line 70
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Ljp/f4samurai/pnote/PnoteHelper;->isRegistDevice:Ljava/lang/Boolean;

    .line 71
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/pnote/PnoteHelper$2;

    invoke-direct {v1, p0}, Ljp/f4samurai/pnote/PnoteHelper$2;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static unregist()V
    .locals 2

    const/4 v0, 0x0

    .line 83
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Ljp/f4samurai/pnote/PnoteHelper;->isRegistDevice:Ljava/lang/Boolean;

    .line 84
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/pnote/PnoteHelper$3;

    invoke-direct {v1}, Ljp/f4samurai/pnote/PnoteHelper$3;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    .line 115
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "mid"

    .line 117
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 119
    sput-object p1, Ljp/f4samurai/pnote/PnoteHelper;->sTmpMid:Ljava/lang/String;

    .line 120
    invoke-static {p0}, Ljp/f4samurai/pnote/util/PnoteUtil;->setRegistDeviceCallback(Ljp/f4samurai/pnote/util/PnoteUtil$RegistDeviceCallback;)V

    .line 121
    invoke-static {}, Ljp/f4samurai/pnote/PnoteHelper;->_callStartRegist()V

    :cond_0
    return-void
.end method

.method public registDeviceCallback()V
    .locals 2

    .line 108
    sget-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sTmpMid:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 109
    sget-object v1, Ljp/f4samurai/pnote/PnoteHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-static {v1, v0}, Ljp/f4samurai/pnote/util/PnoteUtil;->sendMessageCounter(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 110
    sput-object v0, Ljp/f4samurai/pnote/PnoteHelper;->sTmpMid:Ljava/lang/String;

    :cond_0
    return-void
.end method
