.class Lcn/thinkingdata/analytics/f/b$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/f/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/analytics/f/b$a$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/os/Handler;

.field final synthetic b:Lcn/thinkingdata/analytics/f/b;


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/f/b;)V
    .locals 2

    iput-object p1, p0, Lcn/thinkingdata/analytics/f/b$a;->b:Lcn/thinkingdata/analytics/f/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "thinkingData.sdk.saveMessageWorker"

    const/4 v1, 0x1

    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcn/thinkingdata/analytics/f/b$a$a;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcn/thinkingdata/analytics/f/b$a$a;-><init>(Lcn/thinkingdata/analytics/f/b$a;Landroid/os/Looper;)V

    iput-object v0, p0, Lcn/thinkingdata/analytics/f/b$a;->a:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/f/b$a;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/f/b$a;->a:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic a(Lcn/thinkingdata/analytics/f/b$a;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/f/b$a;->a(Ljava/lang/String;I)V

    return-void
.end method

.method private a(Ljava/lang/String;I)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$a;->b:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->e(Ljava/lang/String;)I

    move-result v0

    if-lt p2, v0, :cond_0

    iget-object p2, p0, Lcn/thinkingdata/analytics/f/b$a;->b:Lcn/thinkingdata/analytics/f/b;

    invoke-static {p2}, Lcn/thinkingdata/analytics/f/b;->a(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/b$b;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcn/thinkingdata/analytics/f/b$b;->c(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcn/thinkingdata/analytics/f/b$a;->b:Lcn/thinkingdata/analytics/f/b;

    invoke-static {p2}, Lcn/thinkingdata/analytics/f/b;->a(Lcn/thinkingdata/analytics/f/b;)Lcn/thinkingdata/analytics/f/b$b;

    move-result-object p2

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/b$a;->b:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->f(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p2, p1, v0, v1}, Lcn/thinkingdata/analytics/f/b$b;->a(Ljava/lang/String;J)V

    :goto_0
    return-void
.end method


# virtual methods
.method a(Lcn/thinkingdata/analytics/f/a;)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$a;->a:Landroid/os/Handler;

    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method a(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcn/thinkingdata/analytics/f/b$a;->a:Landroid/os/Handler;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$a;->a:Landroid/os/Handler;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method b(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcn/thinkingdata/analytics/f/b$a;->a:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
