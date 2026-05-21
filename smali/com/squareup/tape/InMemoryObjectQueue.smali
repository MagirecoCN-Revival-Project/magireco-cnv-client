.class public Lcom/squareup/tape/InMemoryObjectQueue;
.super Ljava/lang/Object;
.source "InMemoryObjectQueue.java"

# interfaces
.implements Lcom/squareup/tape/ObjectQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/squareup/tape/ObjectQueue<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private listener:Lcom/squareup/tape/ObjectQueue$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/tape/ObjectQueue$Listener<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final tasks:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->tasks:Ljava/util/Queue;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 23
    iget-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->tasks:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 24
    iget-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->listener:Lcom/squareup/tape/ObjectQueue$Listener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0, p1}, Lcom/squareup/tape/ObjectQueue$Listener;->onAdd(Lcom/squareup/tape/ObjectQueue;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public peek()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 28
    iget-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->tasks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->tasks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 37
    iget-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->listener:Lcom/squareup/tape/ObjectQueue$Listener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p0}, Lcom/squareup/tape/ObjectQueue$Listener;->onRemove(Lcom/squareup/tape/ObjectQueue;)V

    :cond_0
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

    .line 42
    iget-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->tasks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 43
    invoke-interface {p1, p0, v1}, Lcom/squareup/tape/ObjectQueue$Listener;->onAdd(Lcom/squareup/tape/ObjectQueue;Ljava/lang/Object;)V

    goto :goto_0

    .line 46
    :cond_0
    iput-object p1, p0, Lcom/squareup/tape/InMemoryObjectQueue;->listener:Lcom/squareup/tape/ObjectQueue$Listener;

    return-void
.end method

.method public size()I
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/squareup/tape/InMemoryObjectQueue;->tasks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    return v0
.end method
