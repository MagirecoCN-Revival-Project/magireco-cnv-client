.class public Lcn/thinkingdata/analytics/g/c;
.super Lcn/thinkingdata/analytics/g/a;
.source ""


# instance fields
.field private c:Lcn/thinkingdata/analytics/g/o;

.field private d:Lcn/thinkingdata/analytics/g/m;

.field private e:Lcn/thinkingdata/analytics/g/j;

.field private f:Lcn/thinkingdata/analytics/g/p;

.field private g:Lcn/thinkingdata/analytics/g/q;

.field private h:Lcn/thinkingdata/analytics/g/u;

.field private i:Lcn/thinkingdata/analytics/g/t;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "com.thinkingdata.analyse_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/g/a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 2

    new-instance v0, Lcn/thinkingdata/analytics/g/o;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/o;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/c;->c:Lcn/thinkingdata/analytics/g/o;

    new-instance v0, Lcn/thinkingdata/analytics/g/m;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/m;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/c;->d:Lcn/thinkingdata/analytics/g/m;

    new-instance v0, Lcn/thinkingdata/analytics/g/u;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/u;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/c;->h:Lcn/thinkingdata/analytics/g/u;

    new-instance v0, Lcn/thinkingdata/analytics/g/p;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/p;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/c;->f:Lcn/thinkingdata/analytics/g/p;

    new-instance v0, Lcn/thinkingdata/analytics/g/j;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/j;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/c;->e:Lcn/thinkingdata/analytics/g/j;

    new-instance v0, Lcn/thinkingdata/analytics/g/q;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/q;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/c;->g:Lcn/thinkingdata/analytics/g/q;

    new-instance v0, Lcn/thinkingdata/analytics/g/t;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/a;->b:Ljava/util/concurrent/Future;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/g/t;-><init>(Ljava/util/concurrent/Future;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/g/c;->i:Lcn/thinkingdata/analytics/g/t;

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

    sget-object v0, Lcn/thinkingdata/analytics/g/c$a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/c;->i:Lcn/thinkingdata/analytics/g/t;

    return-object p1

    :pswitch_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/c;->g:Lcn/thinkingdata/analytics/g/q;

    return-object p1

    :pswitch_2
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/c;->e:Lcn/thinkingdata/analytics/g/j;

    return-object p1

    :pswitch_3
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/c;->f:Lcn/thinkingdata/analytics/g/p;

    return-object p1

    :pswitch_4
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/c;->h:Lcn/thinkingdata/analytics/g/u;

    return-object p1

    :pswitch_5
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/c;->d:Lcn/thinkingdata/analytics/g/m;

    return-object p1

    :pswitch_6
    iget-object p1, p0, Lcn/thinkingdata/analytics/g/c;->c:Lcn/thinkingdata/analytics/g/o;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
