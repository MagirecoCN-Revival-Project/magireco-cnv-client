.class Ljp/f4samurai/thinkingdata/ThinkingDataHelper$3;
.super Ljava/lang/Object;
.source "ThinkingDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/thinkingdata/ThinkingDataHelper;->login(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$guid:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 46
    iput-object p1, p0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$3;->val$guid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 49
    iget-object v0, p0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$3;->val$guid:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Ljp/f4samurai/thinkingdata/ThinkingDataHelper$3;->val$guid:Ljava/lang/String;

    invoke-static {v0}, Lcn/thinkingdata/analytics/TDAnalytics;->login(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
