.class public Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public asymmetricEncryption:Ljava/lang/String;

.field public publicKey:Ljava/lang/String;

.field public symmetricEncryption:Ljava/lang/String;

.field public version:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->publicKey:Ljava/lang/String;

    iput p2, p0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->version:I

    iput-object p3, p0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->symmetricEncryption:Ljava/lang/String;

    iput-object p4, p0, Lcn/thinkingdata/analytics/encrypt/TDSecreteKey;->asymmetricEncryption:Ljava/lang/String;

    return-void
.end method
