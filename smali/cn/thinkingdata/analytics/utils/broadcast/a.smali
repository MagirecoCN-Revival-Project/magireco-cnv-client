.class public Lcn/thinkingdata/analytics/utils/broadcast/a;
.super Landroid/content/BroadcastReceiver;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/analytics/utils/broadcast/a$a;
    }
.end annotation


# instance fields
.field private a:Lcn/thinkingdata/analytics/utils/broadcast/a$a;


# direct methods
.method public constructor <init>(Lcn/thinkingdata/analytics/utils/broadcast/a$a;)V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/utils/broadcast/a;->a(Lcn/thinkingdata/analytics/utils/broadcast/a$a;)V

    return-void
.end method


# virtual methods
.method public a(Lcn/thinkingdata/analytics/utils/broadcast/a$a;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/utils/broadcast/a;->a:Lcn/thinkingdata/analytics/utils/broadcast/a$a;

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcn/thinkingdata/analytics/utils/broadcast/a;->a:Lcn/thinkingdata/analytics/utils/broadcast/a$a;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcn/thinkingdata/analytics/utils/broadcast/a$a;->a()V

    :cond_0
    return-void
.end method
