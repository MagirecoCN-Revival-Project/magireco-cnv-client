.class Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin;->onMethodCall(Lcn/thinkingdata/core/router/plugin/MethodCall;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$a;->a:Ljava/lang/String;

    iput-object p3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$a;->b:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V
    .locals 2

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$a;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsPlugin$a;->b:Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->user_set(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method
