.class Ljp/f4samurai/editbox/EditBox$1;
.super Ljava/lang/Object;
.source "EditBox.java"

# interfaces
.implements Landroid/text/TextWatcher;


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

    .line 38
    iput-object p1, p0, Ljp/f4samurai/editbox/EditBox$1;->this$0:Ljp/f4samurai/editbox/EditBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 46
    iget-object p2, p0, Ljp/f4samurai/editbox/EditBox$1;->this$0:Ljp/f4samurai/editbox/EditBox;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Ljp/f4samurai/editbox/EditBox;->-$$Nest$fputmText(Ljp/f4samurai/editbox/EditBox;Ljava/lang/String;)V

    return-void
.end method
