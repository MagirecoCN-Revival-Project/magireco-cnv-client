.class public Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;
.super Ljava/lang/Object;
.source "Cocos2dxTextInputWrapper.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/TextView$OnEditorActionListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "Cocos2dxTextInputWrapper"


# instance fields
.field private final mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

.field private mOriginText:Ljava/lang/String;

.field private mText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    return-void
.end method

.method private isFullScreenEdit()Z
    .locals 2

    .line 65
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getCocos2dxEditText()Lorg/cocos2dx/lib/Cocos2dxEditBox;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 67
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isFullscreenMode()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4

    .line 80
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->isFullScreenEdit()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 85
    :goto_0
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 86
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mText:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-interface {p1, v1}, Landroid/text/Editable;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    :cond_2
    :goto_1
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 94
    iget-object v2, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v2}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->deleteBackward()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 97
    :cond_3
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    sub-int/2addr v0, v1

    if-lez v0, :cond_4

    .line 99
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-interface {p1, v1, v0}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v1, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->insertText(Ljava/lang/String;)V

    .line 103
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mText:Ljava/lang/String;

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 108
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mText:Ljava/lang/String;

    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 118
    iget-object p3, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {p3}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getCocos2dxEditText()Lorg/cocos2dx/lib/Cocos2dxEditBox;

    move-result-object p3

    if-ne p3, p1, :cond_3

    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->isFullScreenEdit()Z

    move-result p3

    if-eqz p3, :cond_3

    .line 120
    iget-object p3, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mOriginText:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 121
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    :goto_0
    if-lez p3, :cond_0

    .line 122
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->deleteBackward()V

    add-int/lit8 p3, p3, -0x1

    goto :goto_0

    .line 126
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    const-string p3, ""

    .line 130
    invoke-virtual {p1, p3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p3

    if-nez p3, :cond_1

    const-string p1, "\n"

    .line 134
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    invoke-virtual {p1, p3}, Ljava/lang/String;->charAt(I)C

    move-result p3

    const/16 v0, 0xa

    if-eq v0, p3, :cond_2

    .line 135
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 140
    :cond_2
    iget-object p3, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {p3, p1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->insertText(Ljava/lang/String;)V

    :cond_3
    const/4 p1, 0x6

    if-ne p2, p1, :cond_4

    .line 145
    iget-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {p1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->requestFocus()Z

    :cond_4
    const/4 p1, 0x0

    return p1
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public setOriginText(Ljava/lang/String;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxTextInputWrapper;->mOriginText:Ljava/lang/String;

    return-void
.end method
