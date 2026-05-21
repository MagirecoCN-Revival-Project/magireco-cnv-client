.class Lcn/thinkingdata/analytics/f/e$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/utils/broadcast/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/f/e;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/thinkingdata/analytics/f/e;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/f/e;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/e$b;->a:Lcn/thinkingdata/analytics/f/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/e$b;->a:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/f/e;->f()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcn/thinkingdata/analytics/f/e;->a(Lcn/thinkingdata/analytics/f/e;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/e$b;->a:Lcn/thinkingdata/analytics/f/e;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcn/thinkingdata/analytics/f/e;->a(Lcn/thinkingdata/analytics/f/e;Z)Z

    return-void
.end method
