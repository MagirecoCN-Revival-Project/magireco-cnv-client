.class public final enum Lbacktraceio/library/enums/UnwindingMode;
.super Ljava/lang/Enum;
.source "UnwindingMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/enums/UnwindingMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/enums/UnwindingMode;

.field public static final enum LOCAL:Lbacktraceio/library/enums/UnwindingMode;

.field public static final enum LOCAL_CONTEXT:Lbacktraceio/library/enums/UnwindingMode;

.field public static final enum LOCAL_DUMPWITHOUTCRASH:Lbacktraceio/library/enums/UnwindingMode;

.field public static final enum REMOTE:Lbacktraceio/library/enums/UnwindingMode;

.field public static final enum REMOTE_DUMPWITHOUTCRASH:Lbacktraceio/library/enums/UnwindingMode;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4
    new-instance v0, Lbacktraceio/library/enums/UnwindingMode;

    const-string v1, "LOCAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbacktraceio/library/enums/UnwindingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbacktraceio/library/enums/UnwindingMode;->LOCAL:Lbacktraceio/library/enums/UnwindingMode;

    .line 5
    new-instance v1, Lbacktraceio/library/enums/UnwindingMode;

    const-string v3, "REMOTE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lbacktraceio/library/enums/UnwindingMode;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbacktraceio/library/enums/UnwindingMode;->REMOTE:Lbacktraceio/library/enums/UnwindingMode;

    .line 6
    new-instance v3, Lbacktraceio/library/enums/UnwindingMode;

    const-string v5, "REMOTE_DUMPWITHOUTCRASH"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lbacktraceio/library/enums/UnwindingMode;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lbacktraceio/library/enums/UnwindingMode;->REMOTE_DUMPWITHOUTCRASH:Lbacktraceio/library/enums/UnwindingMode;

    .line 7
    new-instance v5, Lbacktraceio/library/enums/UnwindingMode;

    const-string v7, "LOCAL_DUMPWITHOUTCRASH"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lbacktraceio/library/enums/UnwindingMode;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lbacktraceio/library/enums/UnwindingMode;->LOCAL_DUMPWITHOUTCRASH:Lbacktraceio/library/enums/UnwindingMode;

    .line 8
    new-instance v7, Lbacktraceio/library/enums/UnwindingMode;

    const-string v9, "LOCAL_CONTEXT"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lbacktraceio/library/enums/UnwindingMode;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lbacktraceio/library/enums/UnwindingMode;->LOCAL_CONTEXT:Lbacktraceio/library/enums/UnwindingMode;

    const/4 v9, 0x5

    new-array v9, v9, [Lbacktraceio/library/enums/UnwindingMode;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    .line 3
    sput-object v9, Lbacktraceio/library/enums/UnwindingMode;->$VALUES:[Lbacktraceio/library/enums/UnwindingMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/enums/UnwindingMode;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 3
    const-class v0, Lbacktraceio/library/enums/UnwindingMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/enums/UnwindingMode;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/enums/UnwindingMode;
    .locals 1

    .line 3
    sget-object v0, Lbacktraceio/library/enums/UnwindingMode;->$VALUES:[Lbacktraceio/library/enums/UnwindingMode;

    invoke-virtual {v0}, [Lbacktraceio/library/enums/UnwindingMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/enums/UnwindingMode;

    return-object v0
.end method
