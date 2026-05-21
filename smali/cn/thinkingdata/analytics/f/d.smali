.class public Lcn/thinkingdata/analytics/f/d;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final a:Ljava/util/concurrent/TimeUnit;

.field private b:J

.field private c:J

.field private d:J


# direct methods
.method public constructor <init>(Ljava/util/concurrent/TimeUnit;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lcn/thinkingdata/analytics/f/d;->b:J

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/d;->a:Ljava/util/concurrent/TimeUnit;

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcn/thinkingdata/analytics/f/d;->c:J

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 2

    iget-wide v0, p0, Lcn/thinkingdata/analytics/f/d;->d:J

    invoke-virtual {p0, v0, v1}, Lcn/thinkingdata/analytics/f/d;->b(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public a(J)Ljava/lang/String;
    .locals 2

    iget-wide v0, p0, Lcn/thinkingdata/analytics/f/d;->b:J

    sub-long/2addr p1, v0

    iget-wide v0, p0, Lcn/thinkingdata/analytics/f/d;->c:J

    add-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcn/thinkingdata/analytics/f/d;->b(J)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public b()J
    .locals 2

    iget-wide v0, p0, Lcn/thinkingdata/analytics/f/d;->d:J

    return-wide v0
.end method

.method b(J)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-gez v3, :cond_0

    :try_start_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    goto :goto_4

    :cond_0
    const-wide/32 v1, 0x5265c00

    cmp-long v3, p1, v1

    if-lez v3, :cond_1

    invoke-virtual {p0, v1, v2}, Lcn/thinkingdata/analytics/f/d;->b(J)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/d;->a:Ljava/util/concurrent/TimeUnit;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    if-ne v1, v2, :cond_2

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/d;->a:Ljava/util/concurrent/TimeUnit;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/high16 v3, 0x447a0000    # 1000.0f

    if-ne v1, v2, :cond_3

    long-to-float p1, p1

    div-float/2addr p1, v3

    goto :goto_2

    :cond_3
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/d;->a:Ljava/util/concurrent/TimeUnit;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const/high16 v4, 0x42700000    # 60.0f

    if-ne v1, v2, :cond_4

    long-to-float p1, p1

    div-float/2addr p1, v3

    :goto_0
    div-float/2addr p1, v4

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/d;->a:Ljava/util/concurrent/TimeUnit;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    if-ne v1, v2, :cond_5

    long-to-float p1, p1

    div-float/2addr p1, v3

    div-float/2addr p1, v4

    goto :goto_0

    :cond_5
    :goto_1
    long-to-float p1, p1

    :goto_2
    const/4 p2, 0x0

    cmpg-float p2, p1, p2

    if-gez p2, :cond_6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_3

    :cond_6
    const/4 p2, 0x3

    invoke-static {p1, p2}, Lcn/thinkingdata/analytics/utils/p;->a(FI)F

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_3
    return-object p1

    :goto_4
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public c()J
    .locals 2

    iget-wide v0, p0, Lcn/thinkingdata/analytics/f/d;->c:J

    return-wide v0
.end method

.method public c(J)V
    .locals 0

    iput-wide p1, p0, Lcn/thinkingdata/analytics/f/d;->d:J

    return-void
.end method

.method public d()J
    .locals 2

    iget-wide v0, p0, Lcn/thinkingdata/analytics/f/d;->b:J

    return-wide v0
.end method

.method public d(J)V
    .locals 0

    iput-wide p1, p0, Lcn/thinkingdata/analytics/f/d;->c:J

    return-void
.end method

.method public e(J)V
    .locals 0

    iput-wide p1, p0, Lcn/thinkingdata/analytics/f/d;->b:J

    return-void
.end method
