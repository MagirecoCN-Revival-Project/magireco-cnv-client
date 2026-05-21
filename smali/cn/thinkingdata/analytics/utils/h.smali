.class public final Lcn/thinkingdata/analytics/utils/h;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/utils/c;


# instance fields
.field private final a:J

.field private final b:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcn/thinkingdata/analytics/utils/h;->a:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lcn/thinkingdata/analytics/utils/h;->b:J

    return-void
.end method


# virtual methods
.method public a(J)Ljava/util/Date;
    .locals 3

    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lcn/thinkingdata/analytics/utils/h;->b:J

    sub-long/2addr p1, v1

    iget-wide v1, p0, Lcn/thinkingdata/analytics/utils/h;->a:J

    add-long/2addr p1, v1

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method
