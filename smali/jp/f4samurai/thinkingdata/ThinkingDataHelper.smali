.class public Ljp/f4samurai/thinkingdata/ThinkingDataHelper;
.super Ljava/lang/Object;
.source "ThinkingDataHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingDataHelper"

.field private static TE_APP_KEY:Ljava/lang/String; = "7ebb302663eb420ba26bd536889a04a2"

.field private static TE_URL:Ljava/lang/String; = "https://te-data.magi-reco.com"

.field private static sAppActivity:Ljp/f4samurai/AppActivity;


# direct methods
.method static bridge synthetic -$$Nest$sfgetTE_APP_KEY()Ljava/lang/String;
    .locals 1

    sget-object v0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->TE_APP_KEY:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetTE_URL()Ljava/lang/String;
    .locals 1

    sget-object v0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->TE_URL:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;
    .locals 1

    sget-object v0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smcallLogin()V
    .locals 0

    invoke-static {}, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->callLogin()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Ljp/f4samurai/AppActivity;

    sput-object v0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-void
.end method

.method public static _login()V
    .locals 2

    .line 37
    sget-object v0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$2;

    invoke-direct {v1}, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$2;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static native callLogin()V
.end method

.method public static initialize()V
    .locals 2

    .line 23
    sget-object v0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$1;

    invoke-direct {v1}, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$1;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static login(Ljava/lang/String;)V
    .locals 2

    .line 46
    sget-object v0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$3;

    invoke-direct {v1, p0}, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$3;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method
