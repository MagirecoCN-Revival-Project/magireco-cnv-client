.class Lcn/thinkingdata/analytics/f/b$b$a;
.super Landroid/os/Handler;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/f/b$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/f/b$b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/f/b$b;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    const/4 v2, 0x2

    if-eq v0, v2, :cond_9

    const/4 v2, 0x3

    if-eq v0, v2, :cond_7

    const/4 v1, 0x4

    if-eq v0, v1, :cond_5

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    const/4 p1, 0x6

    if-eq v0, p1, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object p1, p1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {p1}, Lcn/thinkingdata/analytics/f/b;->c(Lcn/thinkingdata/analytics/f/b;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcn/thinkingdata/analytics/f/f;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/f;

    move-result-object p1

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object v0, v0, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object v1, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-static {v1}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/c;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/f/f;->a()J

    move-result-wide v4

    sub-long/2addr v2, v4

    sget-object p1, Lcn/thinkingdata/analytics/f/c$c;->b:Lcn/thinkingdata/analytics/f/c$c;

    invoke-virtual {v1, v2, v3, p1}, Lcn/thinkingdata/analytics/f/c;->a(JLcn/thinkingdata/analytics/f/c$c;)V

    monitor-exit v0

    goto/16 :goto_4

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    :try_start_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcn/thinkingdata/analytics/f/a;

    if-nez p1, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object v0, v0, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    iget-object v1, p1, Lcn/thinkingdata/analytics/f/a;->j:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/f/b;->d(Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->isNormal()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    :goto_0
    iget-object v0, v0, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :cond_3
    :try_start_2
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/f/a;->a()Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    invoke-static {v2, v0, v1}, Lcn/thinkingdata/analytics/f/b$b;->b(Lcn/thinkingdata/analytics/f/b$b;Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_4

    :catch_0
    move-exception v1

    const-string v2, "ThinkingAnalytics.DataHandle"

    :try_start_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception occurred while sending message to Server: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->isDebugOnly()Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    goto :goto_0

    :goto_1
    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->c(Lcn/thinkingdata/analytics/f/a;)V

    goto/16 :goto_4

    :cond_4
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    invoke-direct {p1, v1}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/Throwable;)V

    throw p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_4

    :cond_5
    :try_start_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcn/thinkingdata/analytics/f/a;

    if-nez p1, :cond_6

    return-void

    :cond_6
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/f/a;->a()Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object v2, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    iget-object p1, p1, Lcn/thinkingdata/analytics/f/a;->j:Ljava/lang/String;

    invoke-virtual {v2, p1}, Lcn/thinkingdata/analytics/f/b;->d(Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object p1

    invoke-static {v1, p1, v0}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/f/b$b;Lcn/thinkingdata/analytics/TDConfig;Lorg/json/JSONObject;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_4

    :catch_2
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Exception occurred while sending message to Server: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ThinkingAnalytics.DataHandle"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/f/b$b;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_5
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {p0, v1, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    monitor-exit v0

    goto/16 :goto_4

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p1

    :cond_9
    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object v0, v0, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->d(Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object p1

    if-nez p1, :cond_a

    :goto_2
    const-string p1, "ThinkingAnalytics.DataHandle"

    const-string v0, "Could found config object for token. Canceling..."

    invoke-static {p1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_a
    :try_start_6
    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    const-string v1, ""

    invoke-static {v0, v1, p1}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/f/b$b;Ljava/lang/String;Lcn/thinkingdata/analytics/TDConfig;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_3

    goto/16 :goto_4

    :catch_3
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Sending old data failed due to unexpected exception: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ThinkingAnalytics.DataHandle"

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/RuntimeException;->printStackTrace()V

    goto :goto_4

    :cond_b
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object v0, v0, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->d(Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object v0

    if-nez v0, :cond_c

    goto :goto_2

    :cond_c
    iget-object v2, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    invoke-static {v2}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/f/b$b;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_7
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v3

    const/4 v4, 0x1

    iput v4, v3, Landroid/os/Message;->what:I

    iput-object p1, v3, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v5, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    invoke-static {v5}, Lcn/thinkingdata/analytics/f/b$b;->b(Lcn/thinkingdata/analytics/f/b$b;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    invoke-virtual {p0, v1, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    :try_start_8
    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    invoke-static {v1, v0}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/f/b$b;Lcn/thinkingdata/analytics/TDConfig;)V
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_4

    goto :goto_3

    :catch_4
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sending data to server failed due to unexpected exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ThinkingAnalytics.DataHandle"

    invoke-static {v2, v1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V

    :goto_3
    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    invoke-static {v0}, Lcn/thinkingdata/analytics/f/b$b;->a(Lcn/thinkingdata/analytics/f/b$b;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_9
    invoke-virtual {p0, v4, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$b$a;->a:Lcn/thinkingdata/analytics/f/b$b;

    iget-object v2, v1, Lcn/thinkingdata/analytics/f/b$b;->e:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v2, p1}, Lcn/thinkingdata/analytics/f/b;->f(Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, p1, v2, v3}, Lcn/thinkingdata/analytics/f/b$b;->a(Ljava/lang/String;J)V

    monitor-exit v0

    :cond_d
    :goto_4
    return-void

    :catchall_2
    move-exception p1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    throw p1

    :catchall_3
    move-exception p1

    :try_start_a
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    throw p1
.end method
