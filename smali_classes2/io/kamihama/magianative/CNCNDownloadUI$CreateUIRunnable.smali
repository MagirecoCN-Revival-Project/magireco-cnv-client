.class public Lio/kamihama/magianative/CNCNDownloadUI$CreateUIRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/kamihama/magianative/CNCNDownloadUI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CreateUIRunnable"
.end annotation


# instance fields
.field private final context:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/kamihama/magianative/CNCNDownloadUI$CreateUIRunnable;->context:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    :try_start_0
    iget-object v0, p0, Lio/kamihama/magianative/CNCNDownloadUI$CreateUIRunnable;->context:Landroid/app/Activity;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    sput-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->decorView:Landroid/view/ViewGroup;

    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v3, -0x34000000    # -3.3554432E7f

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v4, 0x18

    invoke-virtual {v3, v4, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v4, -0x11f2f2e6

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v5, "=== MagiaCN Installer ===\n(waiting...)"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v5, -0x1f1f20

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v5, 0x2

    const v6, 0x41500000    # 13.0f

    invoke-virtual {v4, v5, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 v5, 0x0

    const/16 v6, 0x8

    invoke-virtual {v4, v5, v5, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    sput-object v4, Lio/kamihama/magianative/CNCNDownloadUI;->tvLog:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v5, "\u603b\u8fdb\u5ea6\uff1a"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v5, -0x3400

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v5, 0x2

    const v6, 0x41200000    # 10.0f

    invoke-virtual {v4, v5, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/ProgressBar;

    const v5, 0x1010078

    const/4 v6, 0x0

    invoke-direct {v4, v0, v6, v5}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 v5, 0x64

    invoke-virtual {v4, v5}, Landroid/widget/ProgressBar;->setMax(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/16 v7, 0x1c

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, 0x0

    const/16 v7, 0x6

    invoke-virtual {v4, v6, v7, v6, v6}, Landroid/widget/ProgressBar;->setPadding(IIII)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sput-object v4, Lio/kamihama/magianative/CNCNDownloadUI;->progressBarOverall:Landroid/widget/ProgressBar;

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v5, "--- waiting ---"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v5, -0xff0078

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v5, 0x2

    const v6, 0x41500000    # 13.0f

    invoke-virtual {v4, v5, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 v5, 0x0

    const/16 v6, 0x8

    invoke-virtual {v4, v5, v6, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    sput-object v4, Lio/kamihama/magianative/CNCNDownloadUI;->tvSpeed:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v3, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x1

    const/16 v8, 0x30

    invoke-direct {v5, v6, v7, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v6, 0x28

    invoke-virtual {v5, v6, v6, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v2, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sget-object v3, Lio/kamihama/magianative/CNCNDownloadUI;->decorView:Landroid/view/ViewGroup;

    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v4, "\u9b54\u6cd5\u7eaa\u5f55Totentanz\u4e2d\u6587\u5316\n\u3010\u6838\u5fc3\u9006\u5411\u5f00\u53d1\u3011MadeInMagius\u3010B\u7ad9ID\u3011\n(\u72ec\u7acb\u5b8c\u6210\u6c49\u5316\u5f15\u64ce\u4ee5\u53ca\u4e0b\u8f7d\u7cfb\u7edf\u548c\u65e5\u670d\u56fd\u670d\u8d44\u6e90\u5408\u5e76)\n\u5176\u4ed6\u4e2a\u4eba\u7f51\u7ad9\nmagireader.pages.dev\u3010\u9b54\u6cd5\u7eaa\u5f55\u5267\u60c5\u4e2d\u65e5\u53cc\u8bed\u9605\u8bfb\u7f51\u7ad9\u3011\nmagiaexedralive2dviewer.pages.dev\u3010MagiaExedra\u548c\u9b54\u6cd5\u7eaa\u5f55Live2D\u7f51\u7ad9\u3011\nmagireco-call-search-cn.pages.dev\u3010\u9b54\u6cd5\u5c11\u5973\u79f0\u547c\u5173\u7cfb\u641c\u7d22\u4e0e\u8eab\u9ad8\u5bf9\u6bd4\u7f51\u7ad9\u3011\n\u3010\u534f\u52a9\u4e0e\u9e23\u8c22\u3011\n\u56fd\u670d\u6587\u4ef6\u4e4b\u5916\u7684\u7ffb\u8bd1\u548c\u6821\u5bf9\uff1a\u6c34\u94f6h2oag\u3010\u9605\u8bfb\u5668\u7f51\u7ad9\u4e3a\u4e3b\uff0c\u8d44\u6e90\u5df2\u540c\u6b65\u81f3\u6e38\u620f\u3011\n\u4e0b\u8f7d\u52a0\u901f\u53ca\u8d44\u6e90\u81ea\u52a8\u5316\u63a8\u9001\uff1aCyberNova\n\u56fd\u670d\u6570\u636e\u7559\u5b58\uff1asegfault\n\u9879\u76ee\u5b98\u7f51\uff1awww.magireco.top\u3010\u901a\u5f80\u5176\u4ed6\u4e2a\u4eba\u7f51\u7ad9\u548c\u63d0\u4f9b\u8054\u7cfb\u65b9\u5f0f\u3011\nbilibili\u89c6\u9891\u6559\u7a0b\uff1aBV1faRiBBExk"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, -0x55000001

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v4, 0x2

    const v5, 0x41800000    # 16.0f

    invoke-virtual {v3, v4, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v4, 0x18

    const/16 v5, 0x10

    invoke-virtual {v3, v4, v5, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    const v4, 0x66000000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundColor(I)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x2

    const/16 v6, 0x15

    invoke-direct {v4, v5, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v5, 0x20

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v6, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sput-object v2, Lio/kamihama/magianative/CNCNDownloadUI;->overlayView:Landroid/widget/FrameLayout;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "MagiaClientJNI"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
