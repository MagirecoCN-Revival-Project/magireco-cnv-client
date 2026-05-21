.class public Ljp/f4samurai/bridge/MultipleInstallReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MultipleInstallReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 12
    new-instance v0, Lcom/adjust/sdk/AdjustReferrerReceiver;

    invoke-direct {v0}, Lcom/adjust/sdk/AdjustReferrerReceiver;-><init>()V

    invoke-virtual {v0, p1, p2}, Lcom/adjust/sdk/AdjustReferrerReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
