.class Ljp/f4samurai/backtrace/BacktraceHandler$2;
.super Ljava/util/HashMap;
.source "BacktraceHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/backtrace/BacktraceHandler;->setLogData(Ljava/lang/String;Ljava/lang/String;)V
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
.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 81
    iput-object p1, p0, Ljp/f4samurai/backtrace/BacktraceHandler$2;->val$key:Ljava/lang/String;

    iput-object p2, p0, Ljp/f4samurai/backtrace/BacktraceHandler$2;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 82
    invoke-virtual {p0, p1, p2}, Ljp/f4samurai/backtrace/BacktraceHandler$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
