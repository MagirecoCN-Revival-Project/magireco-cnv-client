.class Ljp/f4samurai/thinkingdata/ThinkingDataHelper$1;
.super Ljava/lang/Object;
.source "ThinkingDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 26
    invoke-static {}, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->-$$Nest$sfgetsAppActivity()Ljp/f4samurai/AppActivity;

    move-result-object v0

    invoke-static {}, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->-$$Nest$sfgetTE_APP_KEY()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->-$$Nest$sfgetTE_URL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcn/thinkingdata/analytics/TDAnalytics;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x23

    .line 27
    invoke-static {v0}, Lcn/thinkingdata/analytics/TDAnalytics;->enableAutoTrack(I)V

    return-void
.end method
