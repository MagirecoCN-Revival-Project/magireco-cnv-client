.class public final enum Lbacktraceio/library/enums/BatteryState;
.super Ljava/lang/Enum;
.source "BatteryState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/enums/BatteryState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/enums/BatteryState;

.field public static final enum CHARGING:Lbacktraceio/library/enums/BatteryState;

.field public static final enum FULL:Lbacktraceio/library/enums/BatteryState;

.field public static final enum UNKNOWN:Lbacktraceio/library/enums/BatteryState;

.field public static final enum UNPLUGGED:Lbacktraceio/library/enums/BatteryState;


# instance fields
.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 4
    new-instance v0, Lbacktraceio/library/enums/BatteryState;

    const-string v1, "CHARGING"

    const/4 v2, 0x0

    const-string v3, "Charging"

    invoke-direct {v0, v1, v2, v3}, Lbacktraceio/library/enums/BatteryState;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lbacktraceio/library/enums/BatteryState;->CHARGING:Lbacktraceio/library/enums/BatteryState;

    .line 5
    new-instance v1, Lbacktraceio/library/enums/BatteryState;

    const-string v3, "UNKNOWN"

    const/4 v4, 0x1

    const-string v5, "Unknown"

    invoke-direct {v1, v3, v4, v5}, Lbacktraceio/library/enums/BatteryState;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lbacktraceio/library/enums/BatteryState;->UNKNOWN:Lbacktraceio/library/enums/BatteryState;

    .line 6
    new-instance v3, Lbacktraceio/library/enums/BatteryState;

    const-string v5, "FULL"

    const/4 v6, 0x2

    const-string v7, "Full"

    invoke-direct {v3, v5, v6, v7}, Lbacktraceio/library/enums/BatteryState;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lbacktraceio/library/enums/BatteryState;->FULL:Lbacktraceio/library/enums/BatteryState;

    .line 7
    new-instance v5, Lbacktraceio/library/enums/BatteryState;

    const-string v7, "UNPLUGGED"

    const/4 v8, 0x3

    const-string v9, "Unplugged"

    invoke-direct {v5, v7, v8, v9}, Lbacktraceio/library/enums/BatteryState;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lbacktraceio/library/enums/BatteryState;->UNPLUGGED:Lbacktraceio/library/enums/BatteryState;

    const/4 v7, 0x4

    new-array v7, v7, [Lbacktraceio/library/enums/BatteryState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 3
    sput-object v7, Lbacktraceio/library/enums/BatteryState;->$VALUES:[Lbacktraceio/library/enums/BatteryState;

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

    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 15
    iput-object p3, p0, Lbacktraceio/library/enums/BatteryState;->text:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/enums/BatteryState;
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
    const-class v0, Lbacktraceio/library/enums/BatteryState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/enums/BatteryState;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/enums/BatteryState;
    .locals 1

    .line 3
    sget-object v0, Lbacktraceio/library/enums/BatteryState;->$VALUES:[Lbacktraceio/library/enums/BatteryState;

    invoke-virtual {v0}, [Lbacktraceio/library/enums/BatteryState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/enums/BatteryState;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lbacktraceio/library/enums/BatteryState;->text:Ljava/lang/String;

    return-object v0
.end method
