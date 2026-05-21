.class Lcom/squareup/tape/FileObjectQueue$1;
.super Ljava/lang/Object;
.source "FileObjectQueue.java"

# interfaces
.implements Lcom/squareup/tape/QueueFile$ElementReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/tape/FileObjectQueue;->setListener(Lcom/squareup/tape/ObjectQueue$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/tape/FileObjectQueue;

.field final synthetic val$listener:Lcom/squareup/tape/ObjectQueue$Listener;


# direct methods
.method constructor <init>(Lcom/squareup/tape/FileObjectQueue;Lcom/squareup/tape/ObjectQueue$Listener;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/squareup/tape/FileObjectQueue$1;->this$0:Lcom/squareup/tape/FileObjectQueue;

    iput-object p2, p0, Lcom/squareup/tape/FileObjectQueue$1;->val$listener:Lcom/squareup/tape/ObjectQueue$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Ljava/io/InputStream;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    new-array v0, p2, [B

    const/4 v1, 0x0

    .line 87
    invoke-virtual {p1, v0, v1, p2}, Ljava/io/InputStream;->read([BII)I

    .line 89
    iget-object p1, p0, Lcom/squareup/tape/FileObjectQueue$1;->val$listener:Lcom/squareup/tape/ObjectQueue$Listener;

    iget-object p2, p0, Lcom/squareup/tape/FileObjectQueue$1;->this$0:Lcom/squareup/tape/FileObjectQueue;

    invoke-static {p2}, Lcom/squareup/tape/FileObjectQueue;->access$000(Lcom/squareup/tape/FileObjectQueue;)Lcom/squareup/tape/FileObjectQueue$Converter;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/squareup/tape/FileObjectQueue$Converter;->from([B)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Lcom/squareup/tape/ObjectQueue$Listener;->onAdd(Lcom/squareup/tape/ObjectQueue;Ljava/lang/Object;)V

    return-void
.end method
