.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->login(Ljava/lang/String;)V
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

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;->a:Ljava/lang/String;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcn/thinkingdata/analytics/g/b;->a(Ljava/lang/String;Z)V

    return-void
.end method
