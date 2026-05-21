.class Ljp/f4samurai/editbox/EditBoxHelper$1;
.super Ljava/lang/Object;
.source "EditBoxHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/editbox/EditBoxHelper;->openEditBox(Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$keyboardType:I

.field final synthetic val$maxLength:I

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;I)V
    .locals 0

    .line 40
    iput p1, p0, Ljp/f4samurai/editbox/EditBoxHelper$1;->val$keyboardType:I

    iput-object p2, p0, Ljp/f4samurai/editbox/EditBoxHelper$1;->val$text:Ljava/lang/String;

    iput p3, p0, Ljp/f4samurai/editbox/EditBoxHelper$1;->val$maxLength:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 44
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmEditBox()Ljp/f4samurai/editbox/EditBox;

    move-result-object v0

    if-eqz v0, :cond_0

    return-void

    .line 48
    :cond_0
    new-instance v0, Ljp/f4samurai/editbox/KeyboardLayout;

    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Ljp/f4samurai/editbox/KeyboardLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfputmKeyboardLayout(Ljp/f4samurai/editbox/KeyboardLayout;)V

    .line 49
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmKeyboardLayout()Ljp/f4samurai/editbox/KeyboardLayout;

    move-result-object v0

    const/16 v1, 0x53

    invoke-virtual {v0, v1}, Ljp/f4samurai/editbox/KeyboardLayout;->setGravity(I)V

    .line 50
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmKeyboardLayout()Ljp/f4samurai/editbox/KeyboardLayout;

    move-result-object v0

    new-instance v1, Ljp/f4samurai/editbox/EditBoxHelper$1$1;

    invoke-direct {v1, p0}, Ljp/f4samurai/editbox/EditBoxHelper$1$1;-><init>(Ljp/f4samurai/editbox/EditBoxHelper$1;)V

    invoke-virtual {v0, v1}, Ljp/f4samurai/editbox/KeyboardLayout;->setListener(Ljp/f4samurai/editbox/KeyboardLayout$OnKeyboardListener;)V

    .line 58
    iget v0, p0, Ljp/f4samurai/editbox/EditBoxHelper$1;->val$keyboardType:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v2, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/16 v0, 0x91

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    .line 66
    :goto_0
    new-instance v3, Ljp/f4samurai/editbox/EditBox;

    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v4

    iget-object v5, p0, Ljp/f4samurai/editbox/EditBoxHelper$1;->val$text:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v0}, Ljp/f4samurai/editbox/EditBox;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    invoke-static {v3}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfputmEditBox(Ljp/f4samurai/editbox/EditBox;)V

    .line 67
    iget v0, p0, Ljp/f4samurai/editbox/EditBoxHelper$1;->val$maxLength:I

    if-lez v0, :cond_3

    .line 68
    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    iget v3, p0, Ljp/f4samurai/editbox/EditBoxHelper$1;->val$maxLength:I

    invoke-direct {v0, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 69
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmEditBox()Ljp/f4samurai/editbox/EditBox;

    move-result-object v3

    new-array v2, v2, [Landroid/text/InputFilter;

    aput-object v0, v2, v1

    invoke-virtual {v3, v2}, Ljp/f4samurai/editbox/EditBox;->setFilters([Landroid/text/InputFilter;)V

    .line 71
    :cond_3
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    invoke-virtual {v0}, Ljp/f4samurai/AppActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41200000    # 10.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    .line 73
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmEditBox()Ljp/f4samurai/editbox/EditBox;

    move-result-object v1

    invoke-virtual {v1, v0, v0, v0, v0}, Ljp/f4samurai/editbox/EditBox;->setPadding(IIII)V

    .line 75
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 78
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmKeyboardLayout()Ljp/f4samurai/editbox/KeyboardLayout;

    move-result-object v1

    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmEditBox()Ljp/f4samurai/editbox/EditBox;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljp/f4samurai/editbox/KeyboardLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmFrameLayout()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmKeyboardLayout()Ljp/f4samurai/editbox/KeyboardLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 82
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmEditBox()Ljp/f4samurai/editbox/EditBox;

    move-result-object v0

    invoke-virtual {v0}, Ljp/f4samurai/editbox/EditBox;->requestFocus()Z

    .line 83
    invoke-static {}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$sfgetmEditBox()Ljp/f4samurai/editbox/EditBox;

    move-result-object v0

    invoke-static {v0}, Ljp/f4samurai/editbox/EditBoxHelper;->-$$Nest$smshowKeyboard(Landroid/view/View;)V

    return-void
.end method
