.class public Lcn/thinkingdata/analytics/g/u;
.super Lcn/thinkingdata/analytics/g/i;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcn/thinkingdata/analytics/g/i<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Future;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "Landroid/content/SharedPreferences;",
            ">;)V"
        }
    .end annotation

    const-string v0, "superProperties"

    invoke-direct {p0, p1, v0}, Lcn/thinkingdata/analytics/g/i;-><init>(Ljava/util/concurrent/Future;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method bridge synthetic a()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/g/u;->a()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method a()Lorg/json/JSONObject;
    .locals 1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    return-object v0
.end method

.method bridge synthetic a(Landroid/content/SharedPreferences$Editor;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2}, Lcn/thinkingdata/analytics/g/u;->a(Landroid/content/SharedPreferences$Editor;Lorg/json/JSONObject;)V

    return-void
.end method

.method a(Landroid/content/SharedPreferences$Editor;Lorg/json/JSONObject;)V
    .locals 1

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->b:Ljava/lang/String;

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method a(Landroid/content/SharedPreferences;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->b:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/g/u;->a()Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/g/i;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/i;->a:Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method
