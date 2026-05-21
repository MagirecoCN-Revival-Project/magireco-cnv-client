.class public Ljp/f4samurai/MyApplication;
.super Landroid/app/Application;
.source "MyApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-static {}, Lcom/loadLib/libLoader;->loadLib()V

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 2

    const-string v0, "MagiaDump"

    const-string v1, "=== [JAVA] MyApplication.onCreate (cn_hook removed; MagiaClient loaded via Cocos2dxActivity) ==="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    return-void
.end method
