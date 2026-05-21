.class Lcn/thinkingdata/analytics/b$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/b;->unsetSuperProperty(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcn/thinkingdata/analytics/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/b;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/b$b;->b:Lcn/thinkingdata/analytics/b;

    iput-object p2, p0, Lcn/thinkingdata/analytics/b$b;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$b;->a:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/b$b;->b:Lcn/thinkingdata/analytics/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;)Lorg/json/JSONObject;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v1, p0, Lcn/thinkingdata/analytics/b$b;->b:Lcn/thinkingdata/analytics/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/b;->a(Lcn/thinkingdata/analytics/b;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, p0, Lcn/thinkingdata/analytics/b$b;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method
