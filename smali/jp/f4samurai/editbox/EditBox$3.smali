.class Ljp/f4samurai/editbox/EditBox$3;
.super Ljava/lang/Object;
.source "EditBox.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/editbox/EditBox;-><init>(Landroid/content/Context;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/editbox/EditBox;


# direct methods
.method constructor <init>(Ljp/f4samurai/editbox/EditBox;)V
    .locals 0

    .line 65
    iput-object p1, p0, Ljp/f4samurai/editbox/EditBox$3;->this$0:Ljp/f4samurai/editbox/EditBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x6

    if-ne p2, p1, :cond_1

    .line 69
    iget-object p1, p0, Ljp/f4samurai/editbox/EditBox$3;->this$0:Ljp/f4samurai/editbox/EditBox;

    invoke-static {p1}, Ljp/f4samurai/editbox/EditBox;->-$$Nest$fgetactivity(Ljp/f4samurai/editbox/EditBox;)Ljp/f4samurai/AppActivity;

    move-result-object p1

    invoke-virtual {p1}, Ljp/f4samurai/AppActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 71
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
