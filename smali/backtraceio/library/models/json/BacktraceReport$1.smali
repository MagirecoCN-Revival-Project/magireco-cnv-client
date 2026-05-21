.class Lbacktraceio/library/models/json/BacktraceReport$1;
.super Ljava/util/HashMap;
.source "BacktraceReport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V
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
.field final synthetic this$0:Lbacktraceio/library/models/json/BacktraceReport;


# direct methods
.method constructor <init>(Lbacktraceio/library/models/json/BacktraceReport;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 177
    iput-object p1, p0, Lbacktraceio/library/models/json/BacktraceReport$1;->this$0:Lbacktraceio/library/models/json/BacktraceReport;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method
