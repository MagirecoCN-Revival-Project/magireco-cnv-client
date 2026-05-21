.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$h;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->unsetSuperProperty(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$h;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$h;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$h;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$h;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/b;->a(Ljava/lang/String;)V

    return-void
.end method
