.class public abstract Lcn/thinkingdata/analytics/g/a;
.super Ljava/lang/Object;
.source ""


# instance fields
.field protected a:Lcn/thinkingdata/analytics/g/h;

.field protected b:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Landroid/content/SharedPreferences;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcn/thinkingdata/analytics/g/h;

    invoke-direct {v0}, Lcn/thinkingdata/analytics/g/h;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/a;->a:Lcn/thinkingdata/analytics/g/h;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/g/h;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object p1

    iput-object p1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/g/a;->a()V

    return-void
.end method


# virtual methods
.method public a(Lcn/thinkingdata/analytics/g/g;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcn/thinkingdata/analytics/g/g;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/g/a;->b(Lcn/thinkingdata/analytics/g/g;)Lcn/thinkingdata/analytics/g/i;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/g/i;->b()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected abstract a()V
.end method

.method public a(Lcn/thinkingdata/analytics/g/g;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcn/thinkingdata/analytics/g/g;",
            "TT;)V"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/g/a;->b(Lcn/thinkingdata/analytics/g/g;)Lcn/thinkingdata/analytics/g/i;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Lcn/thinkingdata/analytics/g/i;->a(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method protected abstract b(Lcn/thinkingdata/analytics/g/g;)Lcn/thinkingdata/analytics/g/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcn/thinkingdata/analytics/g/g;",
            ")",
            "Lcn/thinkingdata/analytics/g/i<",
            "TT;>;"
        }
    .end annotation
.end method
