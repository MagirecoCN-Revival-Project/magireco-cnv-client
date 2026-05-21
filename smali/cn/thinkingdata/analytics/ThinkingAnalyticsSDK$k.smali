.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$k;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V
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

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$k;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$k;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v1, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcn/thinkingdata/analytics/f/b;->b(Ljava/lang/String;)V

    return-void
.end method
