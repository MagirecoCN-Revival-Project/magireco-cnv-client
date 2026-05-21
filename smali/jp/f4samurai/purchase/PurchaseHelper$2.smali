.class Ljp/f4samurai/purchase/PurchaseHelper$2;
.super Ljava/lang/Object;
.source "PurchaseHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/purchase/PurchaseHelper;->startPurchase(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$productId:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 34
    iput-object p1, p0, Ljp/f4samurai/purchase/PurchaseHelper$2;->val$productId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 37
    invoke-static {}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfgetsPurchaseImpl()Ljp/f4samurai/purchase/PurchaseImpl;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 38
    invoke-static {}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfgetsPurchaseImpl()Ljp/f4samurai/purchase/PurchaseImpl;

    move-result-object v0

    invoke-static {}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v1

    iget-object v2, p0, Ljp/f4samurai/purchase/PurchaseHelper$2;->val$productId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljp/f4samurai/purchase/PurchaseImpl;->startPurchase(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
