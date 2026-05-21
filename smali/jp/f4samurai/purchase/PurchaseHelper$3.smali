.class Ljp/f4samurai/purchase/PurchaseHelper$3;
.super Ljava/lang/Object;
.source "PurchaseHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/purchase/PurchaseHelper;->finishPurchaseWithStatus(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$status:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .line 45
    iput-boolean p1, p0, Ljp/f4samurai/purchase/PurchaseHelper$3;->val$status:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 48
    invoke-static {}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfgetsPurchaseImpl()Ljp/f4samurai/purchase/PurchaseImpl;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 49
    invoke-static {}, Ljp/f4samurai/purchase/PurchaseHelper;->-$$Nest$sfgetsPurchaseImpl()Ljp/f4samurai/purchase/PurchaseImpl;

    move-result-object v0

    iget-boolean v1, p0, Ljp/f4samurai/purchase/PurchaseHelper$3;->val$status:Z

    invoke-virtual {v0, v1}, Ljp/f4samurai/purchase/PurchaseImpl;->finishPurchaseWithStatus(Z)V

    :cond_0
    return-void
.end method
