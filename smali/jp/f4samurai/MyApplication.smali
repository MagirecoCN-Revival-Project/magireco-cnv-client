.class public Ljp/f4samurai/MyApplication;
.super Landroid/app/Application;
.source "MyApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-static {}, Lcom/loadLib/libLoader;->loadLib()V

    .line 9
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .line 13
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    return-void
.end method
