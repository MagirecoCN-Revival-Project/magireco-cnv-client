.class Ljp/f4samurai/editbox/EditBox$2;
.super Ljava/lang/Object;
.source "EditBox.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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

    .line 55
    iput-object p1, p0, Ljp/f4samurai/editbox/EditBox$2;->this$0:Ljp/f4samurai/editbox/EditBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 0

    if-nez p2, :cond_0

    .line 59
    iget-object p1, p0, Ljp/f4samurai/editbox/EditBox$2;->this$0:Ljp/f4samurai/editbox/EditBox;

    invoke-static {p1}, Ljp/f4samurai/editbox/EditBox;->-$$Nest$fgetmText(Ljp/f4samurai/editbox/EditBox;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljp/f4samurai/editbox/EditBoxHelper;->_editBoxEditingDidEnd(Ljava/lang/String;)V

    .line 60
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->closeEditBox()V

    :cond_0
    return-void
.end method
