.class Lcn/thinkingdata/analytics/b$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/b;->clearSuperProperties()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/b;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/b$c;->a:Lcn/thinkingdata/analytics/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/b$c;->a:Lcn/thinkingdata/analytics/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;)Lorg/json/JSONObject;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/b$c;->a:Lcn/thinkingdata/analytics/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
