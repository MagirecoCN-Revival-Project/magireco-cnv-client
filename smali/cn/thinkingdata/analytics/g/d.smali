.class public Lcn/thinkingdata/analytics/g/d;
.super Lcn/thinkingdata/analytics/g/a;
.source ""


# instance fields
.field private c:Lcn/thinkingdata/analytics/g/l;

.field private d:Lcn/thinkingdata/analytics/g/k;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cn.thinkingdata.android.config_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/g/a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 3

    new-instance v0, Lcn/thinkingdata/analytics/g/l;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    const/16 v2, 0x3a98

    invoke-direct {v0, v1, v2}, Lcn/thinkingdata/analytics/g/l;-><init>(Ljava/util/concurrent/Future;I)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/d;->c:Lcn/thinkingdata/analytics/g/l;

    new-instance v0, Lcn/thinkingdata/analytics/g/k;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2}, Lcn/thinkingdata/analytics/g/k;-><init>(Ljava/util/concurrent/Future;I)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/d;->d:Lcn/thinkingdata/analytics/g/k;

    return-void
.end method

.method protected b(Lcn/thinkingdata/analytics/g/g;)Lcn/thinkingdata/analytics/g/i;
    .locals 1
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

    sget-object v0, Lcn/thinkingdata/analytics/g/d$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/d;->d:Lcn/thinkingdata/analytics/g/k;

    return-object p1

    :cond_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/d;->c:Lcn/thinkingdata/analytics/g/l;

    return-object p1
.end method
