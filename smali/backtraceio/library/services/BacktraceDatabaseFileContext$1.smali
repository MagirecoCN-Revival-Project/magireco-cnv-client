.class Lbacktraceio/library/services/BacktraceDatabaseFileContext$1;
.super Ljava/lang/Object;
.source "BacktraceDatabaseFileContext.java"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbacktraceio/library/services/BacktraceDatabaseFileContext;->getRecords()Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbacktraceio/library/services/BacktraceDatabaseFileContext;

.field final synthetic val$p:Ljava/util/regex/Pattern;


# direct methods
.method constructor <init>(Lbacktraceio/library/services/BacktraceDatabaseFileContext;Ljava/util/regex/Pattern;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$p"
        }
    .end annotation

    .line 55
    iput-object p1, p0, Lbacktraceio/library/services/BacktraceDatabaseFileContext$1;->this$0:Lbacktraceio/library/services/BacktraceDatabaseFileContext;

    iput-object p2, p0, Lbacktraceio/library/services/BacktraceDatabaseFileContext$1;->val$p:Ljava/util/regex/Pattern;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "f"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lbacktraceio/library/services/BacktraceDatabaseFileContext$1;->val$p:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    return p1
.end method
