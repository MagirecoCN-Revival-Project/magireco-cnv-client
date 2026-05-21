.class public Ljp/f4samurai/purchase/PurchaseImpl;
.super Ljava/lang/Object;
.source "PurchaseImpl.java"

# interfaces
.implements Lcom/android/billingclient/api/PurchasesUpdatedListener;
.implements Lcom/android/billingclient/api/BillingClientStateListener;
.implements Lcom/android/billingclient/api/ProductDetailsResponseListener;
.implements Lcom/android/billingclient/api/ConsumeResponseListener;
.implements Lcom/android/billingclient/api/PurchasesResponseListener;


# static fields
.field public static PURCHASE_DEVELOPER_PAYLOAD:Ljava/lang/String; = null

.field public static PURCHASE_LICENSE_KEY:Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "PurchaseImpl"

.field private static mProgressPurchase:Ljava/lang/String;

.field private static mSetupDone:Z


# instance fields
.field private billingClient:Lcom/android/billingclient/api/BillingClient;

.field private mAppActivity:Landroid/app/Activity;

.field private mProductIdList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPurchaseList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;"
        }
    .end annotation
.end field

.field myProductDetailsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/ProductDetails;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/app/Application;)V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mAppActivity:Landroid/app/Activity;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mProductIdList:Ljava/util/ArrayList;

    .line 38
    iput-object p1, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    const-string p1, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAravu8fbNPOl8KLLTphSmbIv5rHeYFiYemM9et3EC808EYW/W1vh6YU9JEcllTQejTeaPpasM7xrzh9LL2DLtg0Xb+hu2Jdqqrr5pfmAOQNn5YMRbkQG+C6ZCNvhmoDBNNj7mNopIpqE9iI7wdKGDzQlcUCgGi+CVE4fz/7i/eXf/kGeueg+7Ktaj03Rm+lK6sNlXpvbSw2WdMHJDNFN1eYNKXSHT30x0WQ9DwgHwMZlUVGnci6vzs9gx44oGvSN2v+ZawliJ360Vl5zLWFMTC7aRGxhAQ6f3mIWvMdoXclors3KYqdzv3iKZpbOz4ZfFswGzfmx0l4bEPnlQOd4q2QIDAQAB"

    .line 48
    sput-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->PURCHASE_LICENSE_KEY:Ljava/lang/String;

    const-string p1, "q3hy8nhJx92xxXkMXbJHIstmi9oT9GvtwBnxyufR"

    .line 49
    sput-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->PURCHASE_DEVELOPER_PAYLOAD:Ljava/lang/String;

    .line 50
    invoke-direct {p0, p2}, Ljp/f4samurai/purchase/PurchaseImpl;->InitializeBillingClient(Landroid/app/Application;)V

    return-void
.end method

.method private InitializeBillingClient(Landroid/app/Application;)V
    .locals 0

    .line 54
    invoke-static {p1}, Lcom/android/billingclient/api/BillingClient;->newBuilder(Landroid/content/Context;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object p1

    .line 55
    invoke-virtual {p1, p0}, Lcom/android/billingclient/api/BillingClient$Builder;->setListener(Lcom/android/billingclient/api/PurchasesUpdatedListener;)Lcom/android/billingclient/api/BillingClient$Builder;

    .line 56
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingClient$Builder;->enablePendingPurchases()Lcom/android/billingclient/api/BillingClient$Builder;

    .line 57
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingClient$Builder;->build()Lcom/android/billingclient/api/BillingClient;

    move-result-object p1

    iput-object p1, p0, Ljp/f4samurai/purchase/PurchaseImpl;->billingClient:Lcom/android/billingclient/api/BillingClient;

    .line 58
    invoke-virtual {p1, p0}, Lcom/android/billingclient/api/BillingClient;->startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V

    return-void
.end method

.method private executeErrorCallback(Ljava/lang/String;)V
    .locals 0

    .line 141
    invoke-static {p1}, Ljp/f4samurai/purchase/PurchaseHelper;->_errorCallback(Ljava/lang/String;)V

    return-void
.end method

.method private verifyReceipt()V
    .locals 7

    const-string v0, "&"

    const-string v1, "UTF-8"

    .line 111
    iget-object v2, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    if-eqz v2, :cond_3

    const/4 v3, 0x0

    .line 113
    :try_start_0
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/billingclient/api/Purchase;

    .line 114
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v4
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v5, 0x1

    const-string v6, "\u8cfc\u5165\u306e\u8a8d\u8a3c\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    if-ne v4, v5, :cond_1

    .line 116
    :try_start_1
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    .line 117
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 118
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "COMMAND_TYPE="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "3"

    invoke-static {v4, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 119
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "INAPP_PURCHASE_DATA="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 120
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "INAPP_DATA_SIGNATURE="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 121
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    invoke-static {v0}, Ljp/f4samurai/purchase/PurchaseHelper;->_sendReceipt(Ljava/lang/String;)V

    goto :goto_0

    .line 124
    :cond_0
    invoke-direct {p0, v6}, Ljp/f4samurai/purchase/PurchaseImpl;->executeErrorCallback(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p0, v3}, Ljp/f4samurai/purchase/PurchaseImpl;->finishPurchaseWithStatus(Z)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne v4, v0, :cond_2

    const-string v0, "\u30a2\u30a4\u30c6\u30e0\u306e\u3054\u8cfc\u5165\u306f\u4fdd\u7559\u4e2d\u3068\u306a\u3063\u3066\u3044\u307e\u3059\u3002\n\u304a\u652f\u6255\u3044\u5b8c\u4e86\u5f8c\u3001\u9806\u6b21\u53cd\u6620\u3055\u308c\u307e\u3059\u3002"

    .line 128
    invoke-direct {p0, v0}, Ljp/f4samurai/purchase/PurchaseImpl;->executeErrorCallback(Ljava/lang/String;)V

    .line 129
    invoke-virtual {p0, v3}, Ljp/f4samurai/purchase/PurchaseImpl;->finishPurchaseWithStatus(Z)V

    goto :goto_0

    :cond_2
    if-nez v4, :cond_3

    .line 131
    invoke-direct {p0, v6}, Ljp/f4samurai/purchase/PurchaseImpl;->executeErrorCallback(Ljava/lang/String;)V

    .line 132
    invoke-virtual {p0, v3}, Ljp/f4samurai/purchase/PurchaseImpl;->finishPurchaseWithStatus(Z)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 135
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public finishPurchaseWithStatus(Z)V
    .locals 4

    .line 91
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 94
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/billingclient/api/Purchase;

    .line 95
    iget-object v2, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    if-eqz p1, :cond_1

    .line 97
    invoke-virtual {p0, v0}, Ljp/f4samurai/purchase/PurchaseImpl;->handlePurchase(Lcom/android/billingclient/api/Purchase;)Ljava/lang/String;

    move-result-object p1

    .line 98
    sget-object v2, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/android/billingclient/api/Purchase;->getProducts()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :cond_1
    iget-object p1, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_2

    .line 101
    invoke-direct {p0}, Ljp/f4samurai/purchase/PurchaseImpl;->verifyReceipt()V

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 103
    iput-object p1, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    :goto_0
    return-void
.end method

.method getProductDetails(Ljava/lang/String;)Lcom/android/billingclient/api/ProductDetails;
    .locals 4

    .line 192
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->myProductDetailsList:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 193
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string v0, "Exec [Get ProductIds] first"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 195
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/billingclient/api/ProductDetails;

    .line 196
    invoke-virtual {v2}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v1, v2

    goto :goto_0

    :cond_2
    if-nez v1, :cond_3

    .line 199
    sget-object v0, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is not found"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_1
    return-object v1
.end method

.method handlePurchase(Lcom/android/billingclient/api/Purchase;)Ljava/lang/String;
    .locals 2

    .line 277
    invoke-virtual {p1}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 282
    invoke-static {}, Lcom/android/billingclient/api/ConsumeParams;->newBuilder()Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object v0

    .line 283
    invoke-virtual {p1}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/android/billingclient/api/ConsumeParams$Builder;->setPurchaseToken(Ljava/lang/String;)Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object p1

    .line 284
    invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams$Builder;->build()Lcom/android/billingclient/api/ConsumeParams;

    move-result-object p1

    .line 285
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->billingClient:Lcom/android/billingclient/api/BillingClient;

    invoke-virtual {v0, p1, p0}, Lcom/android/billingclient/api/BillingClient;->consumeAsync(Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)V

    const-string p1, "purchased"

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    if-ne v0, p1, :cond_1

    const-string p1, "pending"

    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    const-string p1, "unspecified state"

    goto :goto_0

    :cond_2
    const-string p1, "error"

    :goto_0
    return-object p1
.end method

.method public onBillingServiceDisconnected()V
    .locals 2

    .line 165
    sget-object v0, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string v1, "onBillingServiceDisconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V
    .locals 1

    if-nez p1, :cond_0

    .line 148
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string v0, "onBillingSetupFinished: null BillingResult"

    invoke-static {p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 152
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v0

    .line 153
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getDebugMessage()Ljava/lang/String;

    move-result-object p1

    .line 154
    invoke-virtual {p0, v0, p1}, Ljp/f4samurai/purchase/PurchaseImpl;->showResponseCode(ILjava/lang/String;)V

    if-nez v0, :cond_1

    .line 157
    invoke-virtual {p0}, Ljp/f4samurai/purchase/PurchaseImpl;->queryPurchases()V

    const/4 p1, 0x1

    .line 158
    sput-boolean p1, Ljp/f4samurai/purchase/PurchaseImpl;->mSetupDone:Z

    :cond_1
    return-void
.end method

.method public onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
    .locals 1

    if-nez p1, :cond_0

    .line 297
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string p2, "onConsumeResponse: null BillingResult"

    invoke-static {p1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 300
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p2

    .line 301
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getDebugMessage()Ljava/lang/String;

    move-result-object v0

    .line 302
    invoke-virtual {p0, p2, v0}, Ljp/f4samurai/purchase/PurchaseImpl;->showResponseCode(ILjava/lang/String;)V

    .line 304
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    if-nez p1, :cond_1

    .line 305
    invoke-direct {p0}, Ljp/f4samurai/purchase/PurchaseImpl;->verifyReceipt()V

    goto :goto_0

    :cond_1
    const-string p1, "\u8cfc\u5165\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    .line 307
    invoke-direct {p0, p1}, Ljp/f4samurai/purchase/PurchaseImpl;->executeErrorCallback(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onDestroy()V
    .locals 0

    return-void
.end method

.method public onProductDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/ProductDetails;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 173
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string p2, "onProductDetailsResponse: null BillingResult"

    invoke-static {p1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 176
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v0

    .line 177
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getDebugMessage()Ljava/lang/String;

    move-result-object p1

    .line 178
    invoke-virtual {p0, v0, p1}, Ljp/f4samurai/purchase/PurchaseImpl;->showResponseCode(ILjava/lang/String;)V

    if-nez v0, :cond_1

    .line 182
    iput-object p2, p0, Ljp/f4samurai/purchase/PurchaseImpl;->myProductDetailsList:Ljava/util/List;

    .line 184
    :cond_1
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->mProgressPurchase:Ljava/lang/String;

    if-eqz p1, :cond_2

    .line 185
    iget-object p2, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mAppActivity:Landroid/app/Activity;

    invoke-virtual {p0, p2, p1}, Ljp/f4samurai/purchase/PurchaseImpl;->startPurchase(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 209
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string p2, "onPurchasesUpdated: null BillingResult"

    invoke-static {p1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 212
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v0

    .line 213
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getDebugMessage()Ljava/lang/String;

    move-result-object p1

    .line 214
    invoke-virtual {p0, v0, p1}, Ljp/f4samurai/purchase/PurchaseImpl;->showResponseCode(ILjava/lang/String;)V

    if-eqz v0, :cond_2

    const/4 p1, 0x1

    const-string p2, "\u8cfc\u5165\u51e6\u7406\u3092\u30ad\u30e3\u30f3\u30bb\u30eb\u3057\u307e\u3057\u305f"

    if-eq v0, p1, :cond_1

    .line 229
    invoke-direct {p0, p2}, Ljp/f4samurai/purchase/PurchaseImpl;->executeErrorCallback(Ljava/lang/String;)V

    goto :goto_0

    .line 226
    :cond_1
    invoke-direct {p0, p2}, Ljp/f4samurai/purchase/PurchaseImpl;->executeErrorCallback(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    if-nez p2, :cond_3

    .line 219
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string p2, "onPurchasesUpdated: null purchase list"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 221
    :cond_3
    iput-object p2, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    .line 222
    invoke-direct {p0}, Ljp/f4samurai/purchase/PurchaseImpl;->verifyReceipt()V

    :goto_0
    return-void
.end method

.method public onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    .line 266
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    const-string v0, "billingClient.onQueryPurchaseResponse"

    invoke-virtual {p0, p1, v0}, Ljp/f4samurai/purchase/PurchaseImpl;->showResponseCode(ILjava/lang/String;)V

    .line 268
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_0

    .line 269
    iput-object p2, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mPurchaseList:Ljava/util/List;

    .line 270
    invoke-direct {p0}, Ljp/f4samurai/purchase/PurchaseImpl;->verifyReceipt()V

    :cond_0
    return-void
.end method

.method public queryProductDetails(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 236
    sget-object v0, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string v1, "queryProductDetails"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 238
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 239
    invoke-static {}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product;->newBuilder()Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v2

    .line 240
    invoke-virtual {v2, v1}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->setProductId(Ljava/lang/String;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v1

    const-string v2, "inapp"

    .line 241
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->setProductType(Ljava/lang/String;)Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;

    move-result-object v1

    .line 242
    invoke-virtual {v1}, Lcom/android/billingclient/api/QueryProductDetailsParams$Product$Builder;->build()Lcom/android/billingclient/api/QueryProductDetailsParams$Product;

    move-result-object v1

    .line 239
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 245
    :cond_0
    invoke-static {}, Lcom/android/billingclient/api/QueryProductDetailsParams;->newBuilder()Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;

    move-result-object p1

    .line 246
    invoke-virtual {p1, v0}, Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;->setProductList(Ljava/util/List;)Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;

    move-result-object p1

    .line 247
    invoke-virtual {p1}, Lcom/android/billingclient/api/QueryProductDetailsParams$Builder;->build()Lcom/android/billingclient/api/QueryProductDetailsParams;

    move-result-object p1

    .line 248
    sget-object v0, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string v1, "queryProductDetailsAsync"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->billingClient:Lcom/android/billingclient/api/BillingClient;

    invoke-virtual {v0, p1, p0}, Lcom/android/billingclient/api/BillingClient;->queryProductDetailsAsync(Lcom/android/billingclient/api/QueryProductDetailsParams;Lcom/android/billingclient/api/ProductDetailsResponseListener;)V

    return-void
.end method

.method public queryPurchases()V
    .locals 3

    .line 254
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->billingClient:Lcom/android/billingclient/api/BillingClient;

    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingClient;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 255
    sget-object v0, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string v1, "queryPurchases: BillingClient is not ready"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    :cond_0
    sget-object v0, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    const-string v1, "queryPurchases: INAPP"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->billingClient:Lcom/android/billingclient/api/BillingClient;

    invoke-static {}, Lcom/android/billingclient/api/QueryPurchasesParams;->newBuilder()Lcom/android/billingclient/api/QueryPurchasesParams$Builder;

    move-result-object v1

    const-string v2, "inapp"

    .line 259
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/QueryPurchasesParams$Builder;->setProductType(Ljava/lang/String;)Lcom/android/billingclient/api/QueryPurchasesParams$Builder;

    move-result-object v1

    .line 260
    invoke-virtual {v1}, Lcom/android/billingclient/api/QueryPurchasesParams$Builder;->build()Lcom/android/billingclient/api/QueryPurchasesParams;

    move-result-object v1

    .line 258
    invoke-virtual {v0, v1, p0}, Lcom/android/billingclient/api/BillingClient;->queryPurchasesAsync(Lcom/android/billingclient/api/QueryPurchasesParams;Lcom/android/billingclient/api/PurchasesResponseListener;)V

    return-void
.end method

.method showResponseCode(ILjava/lang/String;)V
    .locals 2

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    .line 338
    :pswitch_0
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:ITEM_NOT_OWNED "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 335
    :pswitch_1
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:ITEM_ALREADY_OWNED "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 332
    :pswitch_2
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:ERROR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 329
    :pswitch_3
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:DEVELOPER_ERROR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 326
    :pswitch_4
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:ITEM_UNAVAILABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 323
    :pswitch_5
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:BILLING_UNAVAILABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 320
    :pswitch_6
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:SERVICE_UNAVAILABLE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 317
    :pswitch_7
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:USER_CANCELED "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 314
    :pswitch_8
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:OK "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 341
    :pswitch_9
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:SERVICE_DISCONNECTED "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 344
    :pswitch_a
    sget-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingResponseCode:FEATURE_NOT_SUPPORTED "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public startPurchase(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    .line 62
    sget-boolean v0, Ljp/f4samurai/purchase/PurchaseImpl;->mSetupDone:Z

    if-nez v0, :cond_0

    const-string p1, "\u8cfc\u5165\u304c\u3067\u304d\u306a\u3044\u72b6\u614b\u3067\u3059\u3002\n\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    .line 63
    invoke-direct {p0, p1}, Ljp/f4samurai/purchase/PurchaseImpl;->executeErrorCallback(Ljava/lang/String;)V

    return-void

    .line 66
    :cond_0
    invoke-virtual {p0, p2}, Ljp/f4samurai/purchase/PurchaseImpl;->getProductDetails(Ljava/lang/String;)Lcom/android/billingclient/api/ProductDetails;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 68
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 69
    invoke-static {}, Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams;->newBuilder()Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;

    move-result-object v1

    .line 70
    invoke-virtual {v1, v0}, Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;->setProductDetails(Lcom/android/billingclient/api/ProductDetails;)Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;

    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams$Builder;->build()Lcom/android/billingclient/api/BillingFlowParams$ProductDetailsParams;

    move-result-object v0

    .line 69
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    invoke-static {}, Lcom/android/billingclient/api/BillingFlowParams;->newBuilder()Lcom/android/billingclient/api/BillingFlowParams$Builder;

    move-result-object v0

    .line 75
    invoke-virtual {v0, p2}, Lcom/android/billingclient/api/BillingFlowParams$Builder;->setProductDetailsParamsList(Ljava/util/List;)Lcom/android/billingclient/api/BillingFlowParams$Builder;

    move-result-object p2

    .line 76
    invoke-virtual {p2}, Lcom/android/billingclient/api/BillingFlowParams$Builder;->build()Lcom/android/billingclient/api/BillingFlowParams;

    move-result-object p2

    .line 77
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->billingClient:Lcom/android/billingclient/api/BillingClient;

    invoke-virtual {v0, p1, p2}, Lcom/android/billingclient/api/BillingClient;->launchBillingFlow(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    .line 78
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getDebugMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Ljp/f4samurai/purchase/PurchaseImpl;->showResponseCode(ILjava/lang/String;)V

    const/4 p1, 0x0

    .line 79
    sput-object p1, Ljp/f4samurai/purchase/PurchaseImpl;->mProgressPurchase:Ljava/lang/String;

    goto :goto_0

    .line 83
    :cond_1
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mProductIdList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    iget-object v0, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mProductIdList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljp/f4samurai/purchase/PurchaseImpl;->queryProductDetails(Ljava/util/List;)V

    .line 85
    sput-object p2, Ljp/f4samurai/purchase/PurchaseImpl;->mProgressPurchase:Ljava/lang/String;

    .line 86
    iput-object p1, p0, Ljp/f4samurai/purchase/PurchaseImpl;->mAppActivity:Landroid/app/Activity;

    :goto_0
    return-void
.end method
