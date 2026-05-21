.class public final enum Lbacktraceio/library/models/types/BacktraceResultStatus;
.super Ljava/lang/Enum;
.source "BacktraceResultStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/models/types/BacktraceResultStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/models/types/BacktraceResultStatus;

.field public static final enum Ok:Lbacktraceio/library/models/types/BacktraceResultStatus;

.field public static final enum ServerError:Lbacktraceio/library/models/types/BacktraceResultStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 10
    new-instance v0, Lbacktraceio/library/models/types/BacktraceResultStatus;

    const-string v1, "ServerError"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbacktraceio/library/models/types/BacktraceResultStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbacktraceio/library/models/types/BacktraceResultStatus;->ServerError:Lbacktraceio/library/models/types/BacktraceResultStatus;

    .line 15
    new-instance v1, Lbacktraceio/library/models/types/BacktraceResultStatus;

    const-string v3, "Ok"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lbacktraceio/library/models/types/BacktraceResultStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbacktraceio/library/models/types/BacktraceResultStatus;->Ok:Lbacktraceio/library/models/types/BacktraceResultStatus;

    const/4 v3, 0x2

    new-array v3, v3, [Lbacktraceio/library/models/types/BacktraceResultStatus;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 6
    sput-object v3, Lbacktraceio/library/models/types/BacktraceResultStatus;->$VALUES:[Lbacktraceio/library/models/types/BacktraceResultStatus;

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

    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/models/types/BacktraceResultStatus;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 6
    const-class v0, Lbacktraceio/library/models/types/BacktraceResultStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/models/types/BacktraceResultStatus;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/models/types/BacktraceResultStatus;
    .locals 1

    .line 6
    sget-object v0, Lbacktraceio/library/models/types/BacktraceResultStatus;->$VALUES:[Lbacktraceio/library/models/types/BacktraceResultStatus;

    invoke-virtual {v0}, [Lbacktraceio/library/models/types/BacktraceResultStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/models/types/BacktraceResultStatus;

    return-object v0
.end method
