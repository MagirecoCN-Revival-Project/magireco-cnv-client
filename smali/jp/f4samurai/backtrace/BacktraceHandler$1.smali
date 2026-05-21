.class Ljp/f4samurai/backtrace/BacktraceHandler$1;
.super Ljava/util/HashMap;
.source "BacktraceHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/backtrace/BacktraceHandler;->setUserId(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 68
    iput-object p1, p0, Ljp/f4samurai/backtrace/BacktraceHandler$1;->val$userId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "id"

    .line 69
    invoke-virtual {p0, v0, p1}, Ljp/f4samurai/backtrace/BacktraceHandler$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
