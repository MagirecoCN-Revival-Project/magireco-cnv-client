.class public Ljp/f4samurai/bridge/NativeBridge;
.super Ljava/lang/Object;
.source "NativeBridge.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NativeBridge"

.field private static sAppActivity:Ljp/f4samurai/AppActivity;

.field private static sClipboardManager:Landroid/content/ClipboardManager;


# direct methods
.method static bridge synthetic -$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;
    .locals 1

    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Ljp/f4samurai/AppActivity;

    sput-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    .line 40
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    sput-object v0, Ljp/f4samurai/bridge/NativeBridge;->sClipboardManager:Landroid/content/ClipboardManager;

    return-void
.end method

.method public static _onBackKeyReleased()V
    .locals 2

    .line 176
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/bridge/NativeBridge$5;

    invoke-direct {v1}, Ljp/f4samurai/bridge/NativeBridge$5;-><init>()V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static _setRewardData(Ljava/lang/String;)V
    .locals 0

    .line 46
    invoke-static {p0}, Ljp/f4samurai/bridge/NativeBridge;->setRewardData(Ljava/lang/String;)V

    return-void
.end method

.method private static fetchFileNamesFromAppResourcesDirectory(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 220
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, ""

    .line 221
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 224
    sget-object v2, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v2}, Ljp/f4samurai/AppActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 227
    :try_start_0
    invoke-virtual {v2, p0}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 228
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, p0, v3

    .line 229
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    if-eq v5, v1, :cond_0

    const-string v5, ","

    .line 230
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 232
    :cond_0
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 235
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 239
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static fetchFileNamesFromDirectory(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 206
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    invoke-static {p0}, Ljp/f4samurai/bridge/NativeBridge;->fetchFileNamesFromAppResourcesDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 209
    :cond_0
    invoke-static {p0, p1}, Ljp/f4samurai/bridge/NativeBridge;->fetchFileNamesFromDownloadDirectory(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static fetchFileNamesFromDownloadDirectory(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 250
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, ""

    .line 251
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 254
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_1

    const/4 p1, 0x0

    .line 256
    :goto_0
    array-length v1, p0

    if-ge p1, v1, :cond_1

    if-eqz p1, :cond_0

    const-string v1, ","

    .line 258
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 260
    :cond_0
    aget-object v1, p0, p1

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 264
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getAppVersion()Ljava/lang/String;
    .locals 3

    .line 72
    :try_start_0
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v1}, Ljp/f4samurai/AppActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 73
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const-string v0, "1.0.0"

    return-object v0
.end method

.method public static getBundleId()Ljava/lang/String;
    .locals 1

    .line 67
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getClipboard()Ljava/lang/String;
    .locals 2

    .line 145
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sClipboardManager:Landroid/content/ClipboardManager;

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 147
    invoke-virtual {v0, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v0

    .line 148
    invoke-virtual {v0}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public static getDeviceName()Ljava/lang/String;
    .locals 1

    .line 84
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public static getExternalStorageDirectory()Ljava/lang/String;
    .locals 2

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLive2dViewerDirectory()Ljava/lang/String;
    .locals 3

    .line 99
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Android"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "obb"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v2}, Ljp/f4samurai/AppActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Live2dViewer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getOSVersion()Ljava/lang/String;
    .locals 1

    .line 80
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method public static getRemainStorage()I
    .locals 5

    .line 154
    new-instance v0, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 155
    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v1

    .line 156
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v3

    mul-long v1, v1, v3

    const-wide/32 v3, 0x100000

    .line 158
    div-long/2addr v1, v3

    long-to-int v0, v1

    return v0
.end method

.method public static getUUID()Ljava/lang/String;
    .locals 1

    .line 60
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isUnauthorizedUser()Z
    .locals 1

    .line 195
    const v0, 0x0

    return v0
.end method

.method public static native onBackKeyReleased()V
.end method

.method public static onCloseApplication()V
    .locals 3

    .line 185
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x15

    if-lt v0, v2, :cond_0

    .line 186
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->finishAndRemoveTask()V

    .line 187
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 189
    :cond_0
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->finish()V

    .line 190
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    :goto_0
    return-void
.end method

.method public static openUrl(Ljava/lang/String;)V
    .locals 2

    .line 88
    new-instance v0, Landroid/content/Intent;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 89
    sget-object p0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    invoke-virtual {p0, v0}, Ljp/f4samurai/AppActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static preventScreenLock(Z)V
    .locals 2

    .line 162
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sAppActivity:Ljp/f4samurai/AppActivity;

    new-instance v1, Ljp/f4samurai/bridge/NativeBridge$4;

    invoke-direct {v1, p0}, Ljp/f4samurai/bridge/NativeBridge$4;-><init>(Z)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setAdjustPushToken()V
    .locals 2

    .line 105
    invoke-static {}, Lcom/google/firebase/iid/FirebaseInstanceId;->getInstance()Lcom/google/firebase/iid/FirebaseInstanceId;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/iid/FirebaseInstanceId;->getToken()Ljava/lang/String;

    move-result-object v0

    .line 106
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adjust/sdk/Adjust;->setPushToken(Ljava/lang/String;Landroid/content/Context;)V

    return-void
.end method

.method public static setBacktraceLog(Ljava/lang/String;)V
    .locals 2

    .line 123
    return-void
.end method

.method public static setBacktraceLogData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 132
    return-void
.end method

.method public static setBacktraceUserId(Ljava/lang/String;)V
    .locals 2

    .line 114
    return-void
.end method

.method public static setClipboard(Ljava/lang/String;)V
    .locals 2

    .line 141
    sget-object v0, Ljp/f4samurai/bridge/NativeBridge;->sClipboardManager:Landroid/content/ClipboardManager;

    const-string v1, "text"

    invoke-static {v1, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    return-void
.end method

.method private static native setRewardData(Ljava/lang/String;)V
.end method

.method public static startBacktrace()V
    .locals 0

    return-void
.end method
