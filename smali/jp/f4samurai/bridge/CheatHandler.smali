.class public Ljp/f4samurai/bridge/CheatHandler;
.super Ljava/lang/Object;
.source "CheatHandler.java"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mIsUnauthorizedUser:Z


# direct methods
.method static bridge synthetic -$$Nest$mcloseApplication(Ljp/f4samurai/bridge/CheatHandler;)V
    .locals 0

    invoke-direct {p0}, Ljp/f4samurai/bridge/CheatHandler;->closeApplication()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ljp/f4samurai/bridge/CheatHandler;->mIsUnauthorizedUser:Z

    .line 24
    check-cast p1, Landroid/app/Activity;

    iput-object p1, p0, Ljp/f4samurai/bridge/CheatHandler;->mActivity:Landroid/app/Activity;

    const-string p1, "product"

    .line 26
    invoke-static {p1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    const-string p1, "release"

    invoke-static {p1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 27
    invoke-direct {p0}, Ljp/f4samurai/bridge/CheatHandler;->fromGooglePlay()Z

    move-result p1

    if-nez p1, :cond_0

    .line 28
    new-instance p1, Ljp/f4samurai/bridge/CheatHandler$1;

    invoke-direct {p1, p0}, Ljp/f4samurai/bridge/CheatHandler$1;-><init>(Ljp/f4samurai/bridge/CheatHandler;)V

    const-string v0, "GooglePlayStore\u4ee5\u5916\u304b\u3089\u30a4\u30f3\u30b9\u30c8\u30fc\u30eb\u3057\u305f\u30a2\u30d7\u30ea\u306f\u3054\u5229\u7528\u3067\u304d\u307e\u305b\u3093\u3002"

    .line 34
    invoke-direct {p0, v0, p1}, Ljp/f4samurai/bridge/CheatHandler;->showDialog(Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    return-void

    .line 37
    :cond_0
    iput-boolean v0, p0, Ljp/f4samurai/bridge/CheatHandler;->mIsUnauthorizedUser:Z

    goto :goto_0

    .line 39
    :cond_1
    iput-boolean v0, p0, Ljp/f4samurai/bridge/CheatHandler;->mIsUnauthorizedUser:Z

    :goto_0
    return-void
.end method

.method private closeApplication()V
    .locals 3

    .line 76
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x15

    if-lt v0, v2, :cond_0

    .line 77
    iget-object v0, p0, Ljp/f4samurai/bridge/CheatHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finishAndRemoveTask()V

    .line 78
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 80
    :cond_0
    iget-object v0, p0, Ljp/f4samurai/bridge/CheatHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 81
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    :goto_0
    return-void
.end method

.method private fromGooglePlay()Z
    .locals 2

    .line 48
    iget-object v0, p0, Ljp/f4samurai/bridge/CheatHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Ljp/f4samurai/bridge/CheatHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "com.android.vending"

    .line 50
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private hasIntegrity(Ljava/lang/String;)Z
    .locals 3

    const-string v0, "\\."

    .line 57
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 58
    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x1

    aget-object p1, p1, v1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    .line 61
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "basicIntegrity"

    .line 64
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_0

    return v1

    :cond_0
    return v2

    :catch_0
    move-exception p1

    .line 70
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    return v1
.end method

.method private showDialog(Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 2

    .line 86
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Ljp/f4samurai/bridge/CheatHandler;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 87
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string p1, "OK"

    .line 88
    invoke-virtual {v0, p1, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const/4 p1, 0x0

    .line 89
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 90
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 91
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method


# virtual methods
.method public isUnauthorizedUser()Z
    .locals 1

    .line 44
    iget-boolean v0, p0, Ljp/f4samurai/bridge/CheatHandler;->mIsUnauthorizedUser:Z

    return v0
.end method
