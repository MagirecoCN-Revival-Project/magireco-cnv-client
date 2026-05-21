.class Lcn/thinkingdata/analytics/f/g$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/f/g;->a(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lorg/json/JSONObject;

.field final synthetic b:Lcn/thinkingdata/analytics/utils/j;

.field final synthetic c:Lcn/thinkingdata/analytics/utils/d;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Z

.field final synthetic g:Lcn/thinkingdata/analytics/f/g;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/f/g;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/j;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/g$a;->g:Lcn/thinkingdata/analytics/f/g;

    iput-object p2, p0, Lcn/thinkingdata/analytics/f/g$a;->a:Lorg/json/JSONObject;

    iput-object p3, p0, Lcn/thinkingdata/analytics/f/g$a;->b:Lcn/thinkingdata/analytics/utils/j;

    iput-object p4, p0, Lcn/thinkingdata/analytics/f/g$a;->c:Lcn/thinkingdata/analytics/utils/d;

    iput-object p5, p0, Lcn/thinkingdata/analytics/f/g$a;->d:Ljava/lang/String;

    iput-object p6, p0, Lcn/thinkingdata/analytics/f/g$a;->e:Ljava/lang/String;

    iput-boolean p7, p0, Lcn/thinkingdata/analytics/f/g$a;->f:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g$a;->a:Lorg/json/JSONObject;

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v0

    const-string v1, "ThinkingAnalytics.UserOperation"

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The data contains invalid key or value: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcn/thinkingdata/analytics/f/g$a;->a:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g$a;->g:Lcn/thinkingdata/analytics/f/g;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/g;->a(Lcn/thinkingdata/analytics/f/g;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcn/thinkingdata/analytics/utils/k;

    const-string v1, "Invalid properties. Please refer to SDK debug log for detail reasons."

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g$a;->a:Lorg/json/JSONObject;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcn/thinkingdata/analytics/f/g$a;->g:Lcn/thinkingdata/analytics/f/g;

    invoke-static {v2}, Lcn/thinkingdata/analytics/f/g;->a(Lcn/thinkingdata/analytics/f/g;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v0, v5, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/f/g$a;->g:Lcn/thinkingdata/analytics/f/g;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/g;->b(Lcn/thinkingdata/analytics/f/g;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    new-instance v10, Lcn/thinkingdata/analytics/f/a;

    iget-object v2, p0, Lcn/thinkingdata/analytics/f/g$a;->g:Lcn/thinkingdata/analytics/f/g;

    invoke-static {v2}, Lcn/thinkingdata/analytics/f/g;->b(Lcn/thinkingdata/analytics/f/g;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v3

    iget-object v4, p0, Lcn/thinkingdata/analytics/f/g$a;->b:Lcn/thinkingdata/analytics/utils/j;

    iget-object v6, p0, Lcn/thinkingdata/analytics/f/g$a;->c:Lcn/thinkingdata/analytics/utils/d;

    iget-object v7, p0, Lcn/thinkingdata/analytics/f/g$a;->d:Ljava/lang/String;

    iget-object v8, p0, Lcn/thinkingdata/analytics/f/g$a;->e:Ljava/lang/String;

    iget-boolean v9, p0, Lcn/thinkingdata/analytics/f/g$a;->f:Z

    move-object v2, v10

    invoke-direct/range {v2 .. v9}, Lcn/thinkingdata/analytics/f/a;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v10}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackInternal(Lcn/thinkingdata/analytics/f/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method
