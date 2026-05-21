.class Lcn/thinkingdata/core/router/ClassUtils$1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/core/router/ClassUtils;->getFileNameByPackageName(Landroid/content/Context;Ljava/lang/String;Lcn/thinkingdata/core/router/LogisticsCenter$OnLoadPluginCallBack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcn/thinkingdata/core/router/LogisticsCenter$OnLoadPluginCallBack;

.field final synthetic val$classNames:Ljava/util/Set;

.field final synthetic val$packageName:Ljava/lang/String;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Lcn/thinkingdata/core/router/LogisticsCenter$OnLoadPluginCallBack;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$path:Ljava/lang/String;

    iput-object p2, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$packageName:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$classNames:Ljava/util/Set;

    iput-object p4, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$callback:Lcn/thinkingdata/core/router/LogisticsCenter$OnLoadPluginCallBack;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$path:Ljava/lang/String;

    const-string v1, ".zip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$path:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".tmp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Ldalvik/system/DexFile;->loadDex(Ljava/lang/String;Ljava/lang/String;I)Ldalvik/system/DexFile;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Ldalvik/system/DexFile;

    iget-object v1, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$path:Ljava/lang/String;

    invoke-direct {v0, v1}, Ldalvik/system/DexFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_0
    :try_start_1
    invoke-virtual {v0}, Ldalvik/system/DexFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$classNames:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$callback:Lcn/thinkingdata/core/router/LogisticsCenter$OnLoadPluginCallBack;

    iget-object v2, p0, Lcn/thinkingdata/core/router/ClassUtils$1;->val$classNames:Ljava/util/Set;

    invoke-interface {v1, v2}, Lcn/thinkingdata/core/router/LogisticsCenter$OnLoadPluginCallBack;->onPluginLoadSuccess(Ljava/util/Set;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_3

    goto :goto_3

    :catchall_0
    move-exception v1

    goto :goto_2

    :catchall_1
    move-exception v0

    const/4 v1, 0x0

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_2
    :try_start_2
    const-string v2, "TRouter"

    const-string v3, "Scan map file in dex files made error."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    if-eqz v0, :cond_3

    :goto_3
    :try_start_3
    invoke-virtual {v0}, Ldalvik/system/DexFile;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :catchall_2
    :cond_3
    return-void

    :catchall_3
    move-exception v1

    if-eqz v0, :cond_4

    :try_start_4
    invoke-virtual {v0}, Ldalvik/system/DexFile;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    :catchall_4
    :cond_4
    throw v1
.end method
