.class public Lcom/squareup/tape/TaskQueue;
.super Ljava/lang/Object;
.source "TaskQueue.java"

# interfaces
.implements Lcom/squareup/tape/ObjectQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/squareup/tape/Task;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/squareup/tape/ObjectQueue<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final delegate:Lcom/squareup/tape/ObjectQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/tape/ObjectQueue<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final taskInjector:Lcom/squareup/tape/TaskInjector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/tape/TaskInjector<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/squareup/tape/ObjectQueue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/tape/ObjectQueue<",
            "TT;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/squareup/tape/TaskQueue;-><init>(Lcom/squareup/tape/ObjectQueue;Lcom/squareup/tape/TaskInjector;)V

    return-void
.end method

.method public constructor <init>(Lcom/squareup/tape/ObjectQueue;Lcom/squareup/tape/TaskInjector;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/tape/ObjectQueue<",
            "TT;>;",
            "Lcom/squareup/tape/TaskInjector<",
            "TT;>;)V"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/squareup/tape/TaskQueue;->delegate:Lcom/squareup/tape/ObjectQueue;

    .line 20
    iput-object p2, p0, Lcom/squareup/tape/TaskQueue;->taskInjector:Lcom/squareup/tape/TaskInjector;

    return-void
.end method


# virtual methods
.method public add(Lcom/squareup/tape/Task;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/squareup/tape/TaskQueue;->delegate:Lcom/squareup/tape/ObjectQueue;

    invoke-interface {v0, p1}, Lcom/squareup/tape/ObjectQueue;->add(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .line 9
    check-cast p1, Lcom/squareup/tape/Task;

    invoke-virtual {p0, p1}, Lcom/squareup/tape/TaskQueue;->add(Lcom/squareup/tape/Task;)V

    return-void
.end method

.method public peek()Lcom/squareup/tape/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 29
    iget-object v0, p0, Lcom/squareup/tape/TaskQueue;->delegate:Lcom/squareup/tape/ObjectQueue;

    invoke-interface {v0}, Lcom/squareup/tape/ObjectQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/tape/Task;

    if-eqz v0, :cond_0

    .line 30
    iget-object v1, p0, Lcom/squareup/tape/TaskQueue;->taskInjector:Lcom/squareup/tape/TaskInjector;

    if-eqz v1, :cond_0

    .line 31
    invoke-interface {v1, v0}, Lcom/squareup/tape/TaskInjector;->injectMembers(Lcom/squareup/tape/Task;)V

    :cond_0
    return-object v0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/squareup/tape/TaskQueue;->peek()Lcom/squareup/tape/Task;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/squareup/tape/TaskQueue;->delegate:Lcom/squareup/tape/ObjectQueue;

    invoke-interface {v0}, Lcom/squareup/tape/ObjectQueue;->remove()V

    return-void
.end method

.method public setListener(Lcom/squareup/tape/ObjectQueue$Listener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/tape/ObjectQueue$Listener<",
            "TT;>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 51
    iget-object v0, p0, Lcom/squareup/tape/TaskQueue;->delegate:Lcom/squareup/tape/ObjectQueue;

    new-instance v1, Lcom/squareup/tape/TaskQueue$1;

    invoke-direct {v1, p0, p1}, Lcom/squareup/tape/TaskQueue$1;-><init>(Lcom/squareup/tape/TaskQueue;Lcom/squareup/tape/ObjectQueue$Listener;)V

    invoke-interface {v0, v1}, Lcom/squareup/tape/ObjectQueue;->setListener(Lcom/squareup/tape/ObjectQueue$Listener;)V

    goto :goto_0

    .line 63
    :cond_0
    iget-object p1, p0, Lcom/squareup/tape/TaskQueue;->delegate:Lcom/squareup/tape/ObjectQueue;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/squareup/tape/ObjectQueue;->setListener(Lcom/squareup/tape/ObjectQueue$Listener;)V

    :goto_0
    return-void
.end method

.method public size()I
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/squareup/tape/TaskQueue;->delegate:Lcom/squareup/tape/ObjectQueue;

    invoke-interface {v0}, Lcom/squareup/tape/ObjectQueue;->size()I

    move-result v0

    return v0
.end method
