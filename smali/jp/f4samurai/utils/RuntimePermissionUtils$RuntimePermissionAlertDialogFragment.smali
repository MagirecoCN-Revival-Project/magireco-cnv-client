.class public Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;
.super Landroid/app/DialogFragment;
.source "RuntimePermissionUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/utils/RuntimePermissionUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RuntimePermissionAlertDialogFragment"
.end annotation


# static fields
.field private static final ARG_PERMISSION_NAME:Ljava/lang/String; = "permissionName"

.field public static final TAG:Ljava/lang/String; = "RuntimePermissionApplicationSettingsDialogFragment"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;)Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;
    .locals 3

    .line 72
    new-instance v0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    invoke-direct {v0}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;-><init>()V

    .line 73
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "permissionName"

    .line 74
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    invoke-virtual {v0, v1}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    .line 82
    invoke-virtual {p0}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "permissionName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 84
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u306e\u6a29\u9650\u304c\u306a\u3044\u306e\u3067\u3001\u30a2\u30d7\u30ea\u60c5\u5831\u306e\u300c\u8a31\u53ef\u300d\u304b\u3089\u8a2d\u5b9a\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 85
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$2;

    invoke-direct {v0, p0}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$2;-><init>(Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;)V

    const-string v1, "\u30a2\u30d7\u30ea\u60c5\u5831"

    .line 86
    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$1;

    invoke-direct {v0, p0}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$1;-><init>(Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;)V

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    .line 96
    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 102
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
