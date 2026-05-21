.class Lcn/thinkingdata/analytics/aop/push/TAPushProcess$1;
.super Landroid/os/Handler;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/aop/push/TAPushProcess;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/aop/push/TAPushProcess;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess$1;->this$0:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    :try_start_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess$1;->this$0:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    invoke-static {v0}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->access$000(Lcn/thinkingdata/analytics/aop/push/TAPushProcess;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess$1;->this$0:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    invoke-static {v0}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->access$000(Lcn/thinkingdata/analytics/aop/push/TAPushProcess;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/thinkingdata/analytics/aop/push/TANotificationInfo;

    iget-object v0, p0, Lcn/thinkingdata/analytics/aop/push/TAPushProcess$1;->this$0:Lcn/thinkingdata/analytics/aop/push/TAPushProcess;

    invoke-static {v0}, Lcn/thinkingdata/analytics/aop/push/TAPushProcess;->access$000(Lcn/thinkingdata/analytics/aop/push/TAPushProcess;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ThinkingAnalytics.process"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method
