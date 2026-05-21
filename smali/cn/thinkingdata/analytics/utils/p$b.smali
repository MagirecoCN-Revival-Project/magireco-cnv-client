.class final Lcn/thinkingdata/analytics/utils/p$b;
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


# instance fields
.field final synthetic a:Landroid/view/Choreographer$FrameCallback;


# direct methods
.method constructor <init>(Landroid/view/Choreographer$FrameCallback;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/utils/p$b;->a:Landroid/view/Choreographer$FrameCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/utils/p;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sput-wide p1, Lcn/thinkingdata/analytics/utils/p;->a:J

    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    iget-object p2, p0, Lcn/thinkingdata/analytics/utils/p$b;->a:Landroid/view/Choreographer$FrameCallback;

    invoke-virtual {p1, p2}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
