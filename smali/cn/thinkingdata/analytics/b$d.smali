.class Lcn/thinkingdata/analytics/b$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/b;->setTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

.field final synthetic b:Lcn/thinkingdata/analytics/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/b;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    iput-object p2, p0, Lcn/thinkingdata/analytics/b$d;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    sget-object v0, Lcn/thinkingdata/analytics/b$e;->a:[I

    iget-object v1, p0, Lcn/thinkingdata/analytics/b$d;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    const/4 v3, 0x3

    if-eq v0, v3, :cond_1

    const/4 v3, 0x4

    if-eq v0, v3, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    invoke-static {v0, v2}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;Z)Z

    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    iget-object v2, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v1}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    invoke-static {v0, v2}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;Z)Z

    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    iget-object v1, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0, v2}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    invoke-static {v0, v2}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;Z)Z

    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    iget-object v2, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v1}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/b;->optOutTracking()V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    iget-object v2, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v1}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/b$d;->b:Lcn/thinkingdata/analytics/b;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/b;->enableTracking(Z)V

    :goto_0
    return-void
.end method
