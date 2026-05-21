.class public Ljp/f4samurai/utils/RuntimePermissionUtils;
.super Ljava/lang/Object;
.source "RuntimePermissionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;,
        Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;
    }
.end annotation


# static fields
.field public static final REQUEST_CAMERA_PERMISSION:I = 0x1

.field public static final REQUEST_MANAGE_STORAGE_PERMISSION:I = 0x3

.field public static final REQUEST_POST_NOTIFICATIONS:I = 0x4

.field public static final REQUEST_STORAGE_PERMISSION:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs checkGrantResults(I[I)Z
    .locals 2

    .line 48
    array-length p0, p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    aget p0, p1, v0

    if-nez p0, :cond_0

    return v1

    :cond_0
    return v0
.end method

.method public static hasSelfPermissions(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 38
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x17

    if-ge v0, v2, :cond_0

    return v1

    .line 41
    :cond_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static requestPermission(Ljp/f4samurai/AppActivity;Ljava/lang/String;ILjp/f4samurai/utils/RuntimePermissionUtils$Callback;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 33
    invoke-static {p0, v0, p2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 34
    invoke-virtual {p0, p3}, Ljp/f4samurai/AppActivity;->setPermissionCallback(Ljp/f4samurai/utils/RuntimePermissionUtils$Callback;)V

    return-void
.end method

.method public static shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 2

    .line 55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 56
    invoke-virtual {p0, p1}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public static showAlertDialog(Landroid/app/FragmentManager;Ljava/lang/String;)V
    .locals 1

    .line 62
    invoke-static {p1}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->newInstance(Ljava/lang/String;)Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;

    move-result-object p1

    const-string v0, "RuntimePermissionApplicationSettingsDialogFragment"

    .line 63
    invoke-virtual {p1, p0, v0}, Ljp/f4samurai/utils/RuntimePermissionUtils$RuntimePermissionAlertDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
