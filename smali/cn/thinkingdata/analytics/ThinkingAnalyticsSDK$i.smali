.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$i;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->clearSuperProperties()V
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

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$i;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$i;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->c()V

    return-void
.end method
