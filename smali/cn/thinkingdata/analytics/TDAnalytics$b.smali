.class final Lcn/thinkingdata/analytics/TDAnalytics$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/TDAnalytics;->setDynamicSuperProperties(Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDAnalytics$b;->a:Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDynamicSuperProperties()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDAnalytics$b;->a:Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;

    invoke-interface {v0}, Lcn/thinkingdata/analytics/TDAnalytics$TDDynamicSuperPropertiesHandler;->getDynamicSuperProperties()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method
