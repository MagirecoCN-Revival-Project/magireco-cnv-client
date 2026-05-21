.class public Lcn/thinkingdata/analytics/g/f;
.super Lcn/thinkingdata/analytics/g/a;
.source ""


# instance fields
.field private c:Lcn/thinkingdata/analytics/g/o;

.field private d:Lcn/thinkingdata/analytics/g/s;

.field private e:Lcn/thinkingdata/analytics/g/n;

.field private f:Lcn/thinkingdata/analytics/g/r;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "com.thinkingdata.analyse"

    invoke-direct {p0, p1, v0}, Lcn/thinkingdata/analytics/g/a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 2

    new-instance v0, Lcn/thinkingdata/analytics/g/s;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/s;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/f;->d:Lcn/thinkingdata/analytics/g/s;

    new-instance v0, Lcn/thinkingdata/analytics/g/o;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/o;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/f;->c:Lcn/thinkingdata/analytics/g/o;

    new-instance v0, Lcn/thinkingdata/analytics/g/n;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/n;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/f;->e:Lcn/thinkingdata/analytics/g/n;

    new-instance v0, Lcn/thinkingdata/analytics/g/r;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/r;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/f;->f:Lcn/thinkingdata/analytics/g/r;

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

    sget-object v0, Lcn/thinkingdata/analytics/g/f$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/f;->f:Lcn/thinkingdata/analytics/g/r;

    return-object p1

    :cond_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/f;->e:Lcn/thinkingdata/analytics/g/n;

    return-object p1

    :cond_2
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/f;->d:Lcn/thinkingdata/analytics/g/s;

    return-object p1

    :cond_3
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/f;->c:Lcn/thinkingdata/analytics/g/o;

    return-object p1
.end method
