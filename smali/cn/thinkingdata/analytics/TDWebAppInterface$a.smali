.class Lcn/thinkingdata/analytics/TDWebAppInterface$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/TDWebAppInterface;->thinkingdata_track(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcn/thinkingdata/analytics/TDWebAppInterface$c;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcn/thinkingdata/analytics/TDWebAppInterface;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/TDWebAppInterface;Ljava/lang/String;Lcn/thinkingdata/analytics/TDWebAppInterface$c;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->d:Lcn/thinkingdata/analytics/TDWebAppInterface;

    iput-object p2, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->a:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->b:Lcn/thinkingdata/analytics/TDWebAppInterface$c;

    iput-object p4, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 2

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->b:Lcn/thinkingdata/analytics/TDWebAppInterface$c;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDWebAppInterface$c;->b()V

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->d:Lcn/thinkingdata/analytics/TDWebAppInterface;

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$a;->c:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcn/thinkingdata/analytics/TDWebAppInterface;->access$100(Lcn/thinkingdata/analytics/TDWebAppInterface;Ljava/lang/String;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V

    :cond_0
    return-void
.end method
