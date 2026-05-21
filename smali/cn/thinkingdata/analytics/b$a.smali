.class Lcn/thinkingdata/analytics/b$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/b;->setSuperProperties(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lorg/json/JSONObject;

.field final synthetic b:Lcn/thinkingdata/analytics/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/b;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/b$a;->b:Lcn/thinkingdata/analytics/b;

    iput-object p2, p0, Lcn/thinkingdata/analytics/b$a;->a:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$a;->a:Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$a;->a:Lorg/json/JSONObject;

    iget-object v1, p0, Lcn/thinkingdata/analytics/b$a;->b:Lcn/thinkingdata/analytics/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, p0, Lcn/thinkingdata/analytics/b$a;->b:Lcn/thinkingdata/analytics/b;

    iget-object v2, v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method
