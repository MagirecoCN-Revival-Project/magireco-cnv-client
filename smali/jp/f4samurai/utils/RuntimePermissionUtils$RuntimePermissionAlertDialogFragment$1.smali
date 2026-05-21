.class Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$1;
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

    .line 96
    iput-object p1, p0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$1;->this$0:Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 99
    iget-object p1, p0, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment$1;->this$0:Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    invoke-virtual {p1}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->dismiss()V

    return-void
.end method
