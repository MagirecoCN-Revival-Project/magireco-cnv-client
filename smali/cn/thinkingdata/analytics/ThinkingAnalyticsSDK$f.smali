.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->logout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$f;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$f;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$f;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$300(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Z

    move-result v1

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$f;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v2, v2, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcn/thinkingdata/analytics/g/b;->b(ZLandroid/content/Context;)V

    return-void
.end method
