.class public Lio/kamihama/magianative/CNCNDownloadUI$HideRunnable;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/kamihama/magianative/CNCNDownloadUI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HideRunnable"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    sget-object v0, Lio/kamihama/magianative/CNCNDownloadUI;->decorView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    sget-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->overlayView:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v1, 0x0

    sput-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->overlayView:Landroid/widget/FrameLayout;

    sput-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->tvLog:Landroid/widget/TextView;

    sput-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->progressBarOverall:Landroid/widget/ProgressBar;

    sput-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->tvSpeed:Landroid/widget/TextView;

    sput-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->decorView:Landroid/view/ViewGroup;

    sput-object v1, Lio/kamihama/magianative/CNCNDownloadUI;->uiHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    return-void
.end method
