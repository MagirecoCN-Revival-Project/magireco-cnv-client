.class public final enum Lbacktraceio/library/enums/WifiStatus;
.super Ljava/lang/Enum;
.source "WifiStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/enums/WifiStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/enums/WifiStatus;

.field public static final enum DISABLED:Lbacktraceio/library/enums/WifiStatus;

.field public static final enum ENABLED:Lbacktraceio/library/enums/WifiStatus;

.field public static final enum NOT_PERMITTED:Lbacktraceio/library/enums/WifiStatus;


# instance fields
.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 7
    new-instance v0, Lbacktraceio/library/enums/WifiStatus;

    const-string v1, "NOT_PERMITTED"

    const/4 v2, 0x0

    const-string v3, "NotPermitted"

    invoke-direct {v0, v1, v2, v3}, Lbacktraceio/library/enums/WifiStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lbacktraceio/library/enums/WifiStatus;->NOT_PERMITTED:Lbacktraceio/library/enums/WifiStatus;

    .line 8
    new-instance v1, Lbacktraceio/library/enums/WifiStatus;

    const-string v3, "DISABLED"

    const/4 v4, 0x1

    const-string v5, "Disabled"

    invoke-direct {v1, v3, v4, v5}, Lbacktraceio/library/enums/WifiStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lbacktraceio/library/enums/WifiStatus;->DISABLED:Lbacktraceio/library/enums/WifiStatus;

    .line 9
    new-instance v3, Lbacktraceio/library/enums/WifiStatus;

    const-string v5, "ENABLED"

    const/4 v6, 0x2

    const-string v7, "Enabled"

    invoke-direct {v3, v5, v6, v7}, Lbacktraceio/library/enums/WifiStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lbacktraceio/library/enums/WifiStatus;->ENABLED:Lbacktraceio/library/enums/WifiStatus;

    const/4 v5, 0x3

    new-array v5, v5, [Lbacktraceio/library/enums/WifiStatus;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 6
    sput-object v5, Lbacktraceio/library/enums/WifiStatus;->$VALUES:[Lbacktraceio/library/enums/WifiStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x10
        }
        names = {
            "$enum$name",
            "$enum$ordinal",
            "text"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 17
    iput-object p3, p0, Lbacktraceio/library/enums/WifiStatus;->text:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/enums/WifiStatus;
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
    const-class v0, Lbacktraceio/library/enums/WifiStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/enums/WifiStatus;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/enums/WifiStatus;
    .locals 1

    .line 6
    sget-object v0, Lbacktraceio/library/enums/WifiStatus;->$VALUES:[Lbacktraceio/library/enums/WifiStatus;

    invoke-virtual {v0}, [Lbacktraceio/library/enums/WifiStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/enums/WifiStatus;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lbacktraceio/library/enums/WifiStatus;->text:Ljava/lang/String;

    return-object v0
.end method
