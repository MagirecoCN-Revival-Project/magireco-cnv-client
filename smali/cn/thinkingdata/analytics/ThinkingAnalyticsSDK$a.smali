.class Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

.field final synthetic b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$b;->a:[I

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-string v1, "ThinkingAnalyticsSDK"

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v2, :cond_3

    const/4 v4, 0x2

    if-eq v0, v4, :cond_2

    const/4 v4, 0x3

    if-eq v0, v4, :cond_1

    const/4 v4, 0x4

    if-eq v0, v4, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcn/thinkingdata/analytics/g/b;->a(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcn/thinkingdata/analytics/g/b;->b(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcn/thinkingdata/analytics/g/b;->c(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v3}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    const-string v0, "[ThinkingData] Info: Change Status to Normal"

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcn/thinkingdata/analytics/g/b;->a(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcn/thinkingdata/analytics/g/b;->b(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcn/thinkingdata/analytics/g/b;->c(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v3, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v2}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    const-string v0, "[ThinkingData] Info: Change Status to SaveOnly"

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcn/thinkingdata/analytics/g/b;->a(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcn/thinkingdata/analytics/g/b;->c(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v3}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->optOutTracking()V

    const-string v0, "[ThinkingData] Info: Change Status to Stop"

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcn/thinkingdata/analytics/g/b;->b(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-static {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcn/thinkingdata/analytics/g/b;->c(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v3}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;->b:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v0, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableTracking(Z)V

    const-string v0, "[ThinkingData] Info: Change Status to Pause"

    :goto_0
    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method
