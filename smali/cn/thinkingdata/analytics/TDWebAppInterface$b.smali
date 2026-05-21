.class Lcn/thinkingdata/analytics/TDWebAppInterface$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/TDWebAppInterface;->trackFromH5(Ljava/lang/String;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

.field final synthetic b:Lcn/thinkingdata/analytics/utils/j;

.field final synthetic c:Lorg/json/JSONObject;

.field final synthetic d:Lcn/thinkingdata/analytics/utils/d;

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Ljava/lang/String;

.field final synthetic g:Z


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/TDWebAppInterface;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iput-object p2, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iput-object p3, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->b:Lcn/thinkingdata/analytics/utils/j;

    iput-object p4, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->c:Lorg/json/JSONObject;

    iput-object p5, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->d:Lcn/thinkingdata/analytics/utils/d;

    iput-object p6, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->e:Ljava/lang/String;

    iput-object p7, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->f:Ljava/lang/String;

    iput-boolean p8, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->g:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    new-instance v8, Lcn/thinkingdata/analytics/f/a;

    iget-object v1, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-object v2, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->b:Lcn/thinkingdata/analytics/utils/j;

    iget-object v3, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->c:Lorg/json/JSONObject;

    iget-object v4, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->d:Lcn/thinkingdata/analytics/utils/d;

    iget-object v5, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->e:Ljava/lang/String;

    iget-object v6, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->f:Ljava/lang/String;

    iget-boolean v7, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->g:Z

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Lcn/thinkingdata/analytics/f/a;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$b;->a:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-virtual {v0, v8}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackInternal(Lcn/thinkingdata/analytics/f/a;)V

    return-void
.end method
