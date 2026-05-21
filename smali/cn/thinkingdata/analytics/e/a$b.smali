.class Lcn/thinkingdata/analytics/e/a$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/e/a;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/e/a;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/e/a;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/e/a$b;->a:Lcn/thinkingdata/analytics/e/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/e/a$b;->a:Lcn/thinkingdata/analytics/e/a;

    invoke-static {v0}, Lcn/thinkingdata/analytics/e/a;->a(Lcn/thinkingdata/analytics/e/a;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcn/thinkingdata/analytics/e/a;->a(Lcn/thinkingdata/analytics/e/a;Landroid/content/Context;)V

    return-void
.end method
