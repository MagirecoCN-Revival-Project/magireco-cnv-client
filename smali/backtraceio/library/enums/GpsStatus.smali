.class public final enum Lbacktraceio/library/enums/GpsStatus;
.super Ljava/lang/Enum;
.source "GpsStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/enums/GpsStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/enums/GpsStatus;

.field public static final enum DISABLED:Lbacktraceio/library/enums/GpsStatus;

.field public static final enum ENABLED:Lbacktraceio/library/enums/GpsStatus;


# instance fields
.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 7
    new-instance v0, Lbacktraceio/library/enums/GpsStatus;

    const-string v1, "DISABLED"

    const/4 v2, 0x0

    const-string v3, "Disabled"

    invoke-direct {v0, v1, v2, v3}, Lbacktraceio/library/enums/GpsStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lbacktraceio/library/enums/GpsStatus;->DISABLED:Lbacktraceio/library/enums/GpsStatus;

    .line 8
    new-instance v1, Lbacktraceio/library/enums/GpsStatus;

    const-string v3, "ENABLED"

    const/4 v4, 0x1

    const-string v5, "Enabled"

    invoke-direct {v1, v3, v4, v5}, Lbacktraceio/library/enums/GpsStatus;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lbacktraceio/library/enums/GpsStatus;->ENABLED:Lbacktraceio/library/enums/GpsStatus;

    const/4 v3, 0x2

    new-array v3, v3, [Lbacktraceio/library/enums/GpsStatus;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 6
    sput-object v3, Lbacktraceio/library/enums/GpsStatus;->$VALUES:[Lbacktraceio/library/enums/GpsStatus;

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

    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 16
    iput-object p3, p0, Lbacktraceio/library/enums/GpsStatus;->text:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/enums/GpsStatus;
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
    const-class v0, Lbacktraceio/library/enums/GpsStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/enums/GpsStatus;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/enums/GpsStatus;
    .locals 1

    .line 6
    sget-object v0, Lbacktraceio/library/enums/GpsStatus;->$VALUES:[Lbacktraceio/library/enums/GpsStatus;

    invoke-virtual {v0}, [Lbacktraceio/library/enums/GpsStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/enums/GpsStatus;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lbacktraceio/library/enums/GpsStatus;->text:Ljava/lang/String;

    return-object v0
.end method
