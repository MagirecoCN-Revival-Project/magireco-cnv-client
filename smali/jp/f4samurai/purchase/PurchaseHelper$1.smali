.class Ljp/f4samurai/purchase/PurchaseHelper$1;
.super Ljava/lang/Object;
.source "PurchaseHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/purchase/PurchaseHelper;->prepare()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 21
    new-instance v0, Ljp/f4samurai/purchase/PurchaseImpl;

    invoke-static {}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v1

    invoke-static {}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v2

    invoke-virtual {v2}, Ljp/f4samurai/AppActivity;->getApplication()Landroid/app/Application;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljp/f4samurai/purchase/PurchaseImpl;-><init>(Landroid/content/Context;Landroid/app/Application;)V

    invoke-static {v0}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfputsPurchaseImpl(Ljp/f4samurai/purchase/PurchaseImpl;)V

    return-void
.end method
