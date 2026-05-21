.class public Lcn/thinkingdata/core/utils/ProcessUtil;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static currentProcessName:Ljava/lang/String; = ""

.field public static runningAppList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/app/ActivityManager$RunningAppProcessInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrentProcessName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcn/thinkingdata/core/utils/ProcessUtil;->currentProcessName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object p0, Lcn/thinkingdata/core/utils/ProcessUtil;->currentProcessName:Ljava/lang/String;

    return-object p0

    :cond_0
    invoke-static {}, Lcn/thinkingdata/core/utils/ProcessUtil;->getCurrentProcessNameByApplication()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcn/thinkingdata/core/utils/ProcessUtil;->currentProcessName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object p0, Lcn/thinkingdata/core/utils/ProcessUtil;->currentProcessName:Ljava/lang/String;

    return-object p0

    :cond_1
    invoke-static {}, Lcn/thinkingdata/core/utils/ProcessUtil;->getCurrentProcessNameByActivityThread()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcn/thinkingdata/core/utils/ProcessUtil;->currentProcessName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object p0, Lcn/thinkingdata/core/utils/ProcessUtil;->currentProcessName:Ljava/lang/String;

    return-object p0

    :cond_2
    invoke-static {p0}, Lcn/thinkingdata/core/utils/ProcessUtil;->getCurrentProcessNameByActivityManager(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcn/thinkingdata/core/utils/ProcessUtil;->currentProcessName:Ljava/lang/String;

    return-object p0
.end method

.method private static getCurrentProcessNameByActivityManager(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    const-string v1, "activity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    if-eqz p0, :cond_2

    sget-object v1, Lcn/thinkingdata/core/utils/ProcessUtil;->runningAppList:Ljava/util/List;

    if-nez v1, :cond_0

    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object p0

    sput-object p0, Lcn/thinkingdata/core/utils/ProcessUtil;->runningAppList:Ljava/util/List;

    :cond_0
    sget-object p0, Lcn/thinkingdata/core/utils/ProcessUtil;->runningAppList:Ljava/util/List;

    if-eqz p0, :cond_2

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    iget v2, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v2, v0, :cond_1

    iget-object p0, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    return-object p0

    :cond_2
    const-string p0, ""

    return-object p0
.end method

.method private static getCurrentProcessNameByActivityThread()Ljava/lang/String;
    .locals 4

    const-string v0, "android.app.ActivityThread"

    :try_start_0
    const-class v1, Landroid/app/Application;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v1, "currentProcessName"

    :try_start_1
    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v1, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method private static getCurrentProcessNameByApplication()Ljava/lang/String;
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    invoke-static {}, Landroid/app/Application;->getProcessName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method
