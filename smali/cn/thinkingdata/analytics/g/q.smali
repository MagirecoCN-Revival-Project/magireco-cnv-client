.class public Lcn/thinkingdata/analytics/g/q;
.super Lcn/thinkingdata/analytics/g/i;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcn/thinkingdata/analytics/g/i<",
        "Ljava/lang/Boolean;",
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

    const-string v0, "pausePostFlag"

    invoke-direct {p0, p1, v0}, Lcn/thinkingdata/analytics/g/i;-><init>(Ljava/util/concurrent/Future;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected a(Landroid/content/SharedPreferences$Editor;Ljava/lang/Boolean;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->b:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method protected bridge synthetic a(Landroid/content/SharedPreferences$Editor;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lcn/thinkingdata/analytics/g/q;->a(Landroid/content/SharedPreferences$Editor;Ljava/lang/Boolean;)V

    return-void
.end method

.method protected a(Landroid/content/SharedPreferences;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/i;->b:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcn/thinkingdata/analytics/g/i;->a:Ljava/lang/Object;

    return-void
.end method
