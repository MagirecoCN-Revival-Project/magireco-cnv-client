.class Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$2;
.super Ljava/lang/Object;
.source "RuntimePermissionUtils.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;


# direct methods
.method constructor <init>(Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;)V
    .locals 0

    .line 86
    iput-object p1, p0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$2;->this$0:Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 89
    iget-object p1, p0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$2;->this$0:Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    invoke-virtual {p1}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->dismiss()V

    .line 91
    new-instance p1, Landroid/content/Intent;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "package:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$2;->this$0:Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    invoke-virtual {v0}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v0, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {p1, v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p2, 0x10000000

    .line 92
    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 93
    iget-object p2, p0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$2;->this$0:Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    invoke-virtual {p2}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
