.class public abstract Lcom/enhance/gameservice/IGameTuningService$Stub;
.super Landroid/os/Binder;
.source "IGameTuningService.java"

# interfaces
.implements Lcom/enhance/gameservice/IGameTuningService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/enhance/gameservice/IGameTuningService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/enhance/gameservice/IGameTuningService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.enhance.gameservice.IGameTuningService"

.field static final TRANSACTION_boostUp:I = 0x3

.field static final TRANSACTION_getAbstractTemperature:I = 0x4

.field static final TRANSACTION_setFramePerSecond:I = 0x2

.field static final TRANSACTION_setGamePowerSaving:I = 0x5

.field static final TRANSACTION_setPreferredResolution:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.enhance.gameservice.IGameTuningService"

    .line 42
    invoke-virtual {p0, p0, v0}, Lcom/enhance/gameservice/IGameTuningService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/enhance/gameservice/IGameTuningService;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.enhance.gameservice.IGameTuningService"

    .line 53
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 54
    instance-of v1, v0, Lcom/enhance/gameservice/IGameTuningService;

    if-eqz v1, :cond_1

    .line 55
    check-cast v0, Lcom/enhance/gameservice/IGameTuningService;

    return-object v0

    .line 57
    :cond_1
    new-instance v0, Lcom/enhance/gameservice/IGameTuningService$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/enhance/gameservice/IGameTuningService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lcom/enhance/gameservice/IGameTuningService;
    .locals 1

    .line 267
    sget-object v0, Lcom/enhance/gameservice/IGameTuningService$Stub$Proxy;->sDefaultImpl:Lcom/enhance/gameservice/IGameTuningService;

    return-object v0
.end method

.method public static setDefaultImpl(Lcom/enhance/gameservice/IGameTuningService;)Z
    .locals 1

    .line 257
    sget-object v0, Lcom/enhance/gameservice/IGameTuningService$Stub$Proxy;->sDefaultImpl:Lcom/enhance/gameservice/IGameTuningService;

    if-nez v0, :cond_1

    if-eqz p0, :cond_0

    .line 261
    sput-object p0, Lcom/enhance/gameservice/IGameTuningService$Stub$Proxy;->sDefaultImpl:Lcom/enhance/gameservice/IGameTuningService;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    .line 258
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "setDefaultImpl() called twice"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x1

    const-string v1, "com.enhance.gameservice.IGameTuningService"

    if-eq p1, v0, :cond_6

    const/4 v2, 0x2

    if-eq p1, v2, :cond_5

    const/4 v2, 0x3

    if-eq p1, v2, :cond_4

    const/4 v2, 0x4

    if-eq p1, v2, :cond_3

    const/4 v2, 0x5

    if-eq p1, v2, :cond_1

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_0

    .line 123
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 70
    :cond_0
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 113
    :cond_1
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 116
    :goto_0
    invoke-virtual {p0, p1}, Lcom/enhance/gameservice/IGameTuningService$Stub;->setGamePowerSaving(Z)I

    move-result p1

    .line 117
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 118
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v0

    .line 105
    :cond_3
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0}, Lcom/enhance/gameservice/IGameTuningService$Stub;->getAbstractTemperature()I

    move-result p1

    .line 107
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 108
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v0

    .line 95
    :cond_4
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 97
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 98
    invoke-virtual {p0, p1}, Lcom/enhance/gameservice/IGameTuningService$Stub;->boostUp(I)I

    move-result p1

    .line 99
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 100
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v0

    .line 85
    :cond_5
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 88
    invoke-virtual {p0, p1}, Lcom/enhance/gameservice/IGameTuningService$Stub;->setFramePerSecond(I)I

    move-result p1

    .line 89
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 90
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v0

    .line 75
    :cond_6
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 78
    invoke-virtual {p0, p1}, Lcom/enhance/gameservice/IGameTuningService$Stub;->setPreferredResolution(I)I

    move-result p1

    .line 79
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 80
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v0
.end method
