.class public Ljp/f4samurai/purchase/PurchaseHelper;
.super Ljava/lang/Object;
.source "PurchaseHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PurchaseHelper"

.field private static sAppActivity:Ljp/f4samurai/AppActivity;

.field private static sPurchaseImpl:Ljp/f4samurai/purchase/PurchaseImpl;


# direct methods
.method static bridge synthetic -$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;
    .locals 1

    sget-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsPurchaseImpl()Ljp/f4samurai/purchase/PurchaseImpl;
    .locals 1

    sget-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sPurchaseImpl:Ljp/f4samurai/purchase/PurchaseImpl;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputsPurchaseImpl(Ljp/f4samurai/purchase/PurchaseImpl;)V
    .locals 0

    sput-object p0, Ljp/f4samurai/purchase/PurchaseHelper;->sPurchaseImpl:Ljp/f4samurai/purchase/PurchaseImpl;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Ljp/f4samurai/AppActivity;

    sput-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-void
.end method

.method public static _errorCallback(Ljava/lang/String;)V
    .locals 0

    .line 64
    invoke-static {p0}, Ljp/f4samurai/purchase/PurchaseHelper;->errorCallback(Ljava/lang/String;)V

    return-void
.end method

.method public static _sendReceipt(Ljava/lang/String;)V
    .locals 0

    .line 58
    invoke-static {p0}, Ljp/f4samurai/purchase/PurchaseHelper;->sendReceipt(Ljava/lang/String;)V

    return-void
.end method

.method public static native errorCallback(Ljava/lang/String;)V
.end method

.method public static finishPurchaseWithStatus(Z)V
    .locals 2

    .line 45
    sget-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/purchase/PurchaseHelper$3;

    invoke-direct {v1, p0}, Ljp/f4samurai/purchase/PurchaseHelper$3;-><init>(Z)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static prepare()V
    .locals 2

    .line 18
    sget-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/purchase/PurchaseHelper$1;

    invoke-direct {v1}, Ljp/f4samurai/purchase/PurchaseHelper$1;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static refresh()V
    .locals 1

    .line 27
    sget-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sPurchaseImpl:Ljp/f4samurai/purchase/PurchaseImpl;

    if-eqz v0, :cond_0

    .line 28
    invoke-virtual {v0}, Ljp/f4samurai/purchase/PurchaseImpl;->onDestroy()V

    const/4 v0, 0x0

    .line 29
    sput-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sPurchaseImpl:Ljp/f4samurai/purchase/PurchaseImpl;

    :cond_0
    return-void
.end method

.method public static native sendReceipt(Ljava/lang/String;)V
.end method

.method public static startPurchase(Ljava/lang/String;)V
    .locals 2

    .line 34
    sget-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/purchase/PurchaseHelper$2;

    invoke-direct {v1, p0}, Ljp/f4samurai/purchase/PurchaseHelper$2;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 1

    .line 68
    sget-object v0, Ljp/f4samurai/purchase/PurchaseHelper;->sPurchaseImpl:Ljp/f4samurai/purchase/PurchaseImpl;

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {v0}, Ljp/f4samurai/purchase/PurchaseImpl;->onDestroy()V

    :cond_0
    return-void
.end method
