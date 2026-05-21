.class Lbacktraceio/library/models/BacktraceExceptionHandler$1;
.super Ljava/lang/Object;
.source "BacktraceExceptionHandler.java"

# interfaces
.implements Lbacktraceio/library/events/OnServerResponseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/models/BacktraceExceptionHandler;->getCallbackToDefaultHandler(Ljava/lang/Thread;Ljava/lang/Throwable;)Lbacktraceio/library/events/OnServerResponseEventListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbacktraceio/library/models/BacktraceExceptionHandler;

.field final synthetic val$thread:Ljava/lang/Thread;

.field final synthetic val$throwable:Ljava/lang/Throwable;


# direct methods
.method constructor <init>(Lbacktraceio/library/models/BacktraceExceptionHandler;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$thread",
            "val$throwable"
        }
    .end annotation

    .line 70
    iput-object p1, p0, Lbacktraceio/library/models/BacktraceExceptionHandler$1;->this$0:Lbacktraceio/library/models/BacktraceExceptionHandler;

    iput-object p2, p0, Lbacktraceio/library/models/BacktraceExceptionHandler$1;->val$thread:Ljava/lang/Thread;

    iput-object p3, p0, Lbacktraceio/library/models/BacktraceExceptionHandler$1;->val$throwable:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEvent(Lbacktraceio/library/models/BacktraceResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceResult"
        }
    .end annotation

    .line 73
    invoke-static {}, Lbacktraceio/library/models/BacktraceExceptionHandler;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Root handler event callback"

    invoke-static {p1, v0}, Lbacktraceio/library/logger/BacktraceLogger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    iget-object p1, p0, Lbacktraceio/library/models/BacktraceExceptionHandler$1;->this$0:Lbacktraceio/library/models/BacktraceExceptionHandler;

    invoke-static {p1}, Lbacktraceio/library/models/BacktraceExceptionHandler;->access$100(Lbacktraceio/library/models/BacktraceExceptionHandler;)Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p1

    iget-object v0, p0, Lbacktraceio/library/models/BacktraceExceptionHandler$1;->val$thread:Ljava/lang/Thread;

    iget-object v1, p0, Lbacktraceio/library/models/BacktraceExceptionHandler$1;->val$throwable:Ljava/lang/Throwable;

    invoke-interface {p1, v0, v1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 75
    iget-object p1, p0, Lbacktraceio/library/models/BacktraceExceptionHandler$1;->this$0:Lbacktraceio/library/models/BacktraceExceptionHandler;

    invoke-static {p1}, Lbacktraceio/library/models/BacktraceExceptionHandler;->access$200(Lbacktraceio/library/models/BacktraceExceptionHandler;)Ljava/util/concurrent/CountDownLatch;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
