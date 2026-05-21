.class public Lcn/thinkingdata/analytics/f/a;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public a:Ljava/lang/String;

.field private final b:Lcn/thinkingdata/analytics/utils/d;

.field final c:Lcn/thinkingdata/analytics/utils/j;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private final f:Lorg/json/JSONObject;

.field private g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z

.field i:Z

.field final j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/f/a;->h:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/f/a;->i:Z

    iput-object p2, p0, Lcn/thinkingdata/analytics/f/a;->c:Lcn/thinkingdata/analytics/utils/j;

    iput-object p3, p0, Lcn/thinkingdata/analytics/f/a;->f:Lorg/json/JSONObject;

    iput-object p4, p0, Lcn/thinkingdata/analytics/f/a;->b:Lcn/thinkingdata/analytics/utils/d;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/a;->j:Ljava/lang/String;

    iput-object p5, p0, Lcn/thinkingdata/analytics/f/a;->d:Ljava/lang/String;

    iput-object p6, p0, Lcn/thinkingdata/analytics/f/a;->e:Ljava/lang/String;

    iput-boolean p7, p0, Lcn/thinkingdata/analytics/f/a;->i:Z

    return-void
.end method


# virtual methods
.method public a()Lorg/json/JSONObject;
    .locals 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "#type"

    :try_start_0
    iget-object v2, p0, Lcn/thinkingdata/analytics/f/a;->c:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/utils/j;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "#time"

    :try_start_1
    iget-object v2, p0, Lcn/thinkingdata/analytics/f/a;->b:Lcn/thinkingdata/analytics/utils/d;

    invoke-interface {v2}, Lcn/thinkingdata/analytics/utils/d;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const-string v1, "#distinct_id"

    :try_start_2
    iget-object v2, p0, Lcn/thinkingdata/analytics/f/a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcn/thinkingdata/analytics/f/a;->e:Ljava/lang/String;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v1, :cond_0

    const-string v2, "#account_id"

    :try_start_3
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/a;->g:Ljava/util/Map;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/a;->c:Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/utils/j;->b()Z

    move-result v1
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    if-eqz v1, :cond_2

    const-string v1, "#event_name"

    :try_start_4
    iget-object v2, p0, Lcn/thinkingdata/analytics/f/a;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcn/thinkingdata/analytics/f/a;->b:Lcn/thinkingdata/analytics/utils/d;

    invoke-interface {v1}, Lcn/thinkingdata/analytics/utils/d;->a()Ljava/lang/Double;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v2, p0, Lcn/thinkingdata/analytics/f/a;->f:Lorg/json/JSONObject;

    const-string v3, "#zone_offset"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    :cond_2
    const-string v1, "properties"

    :try_start_5
    iget-object v2, p0, Lcn/thinkingdata/analytics/f/a;->f:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_1
    return-object v0
.end method

.method public a(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/a;->g:Ljava/util/Map;

    return-void
.end method

.method public b()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/f/a;->h:Z

    return-void
.end method
