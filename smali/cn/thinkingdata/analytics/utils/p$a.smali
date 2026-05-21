.class final Lcn/thinkingdata/analytics/utils/p$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/utils/p;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 6

    sget-object v0, Lcn/thinkingdata/analytics/utils/p;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sput-wide p1, Lcn/thinkingdata/analytics/utils/p;->b:J

    sget-wide v1, Lcn/thinkingdata/analytics/utils/p;->a:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v3, 0x3c

    cmp-long v4, p1, v1

    if-gtz v4, :cond_0

    goto :goto_0

    :cond_0
    const-wide/32 p1, 0x3b9aca00

    :try_start_1
    sget-wide v1, Lcn/thinkingdata/analytics/utils/p;->b:J

    sget-wide v4, Lcn/thinkingdata/analytics/utils/p;->a:J

    sub-long/2addr v1, v4

    div-long/2addr p1, v1

    const-wide/16 v1, 0x46

    cmp-long v4, p1, v1

    if-lez v4, :cond_1

    sput v3, Lcn/thinkingdata/analytics/utils/p;->c:I

    goto :goto_1

    :cond_1
    long-to-int p2, p1

    sput p2, Lcn/thinkingdata/analytics/utils/p;->c:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    :goto_0
    :try_start_2
    sput v3, Lcn/thinkingdata/analytics/utils/p;->c:I

    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
