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
    .locals 3

    const-string v0, "MagiaDump"

    const-string v1, "=== [JAVA] MyApplication.onCreate standard load start ==="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "cn_hook"

    :try_start_0
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v1, "MagiaDump"

    const-string v2, "=== [JAVA] libcn_hook.so standard load SUCCESS! ==="

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "MagiaDump"

    const-string v0, "=== [JAVA] libcn_hook.so standard load FAILED! ==="

    invoke-static {v2, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    return-void
.end method
