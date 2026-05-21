.class public final enum Lbacktraceio/library/logger/LogLevel;
.super Ljava/lang/Enum;
.source "LogLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/logger/LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/logger/LogLevel;

.field public static final enum DEBUG:Lbacktraceio/library/logger/LogLevel;

.field public static final enum ERROR:Lbacktraceio/library/logger/LogLevel;

.field public static final enum OFF:Lbacktraceio/library/logger/LogLevel;

.field public static final enum WARN:Lbacktraceio/library/logger/LogLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 10
    new-instance v0, Lbacktraceio/library/logger/LogLevel;

    const-string v1, "DEBUG"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbacktraceio/library/logger/LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbacktraceio/library/logger/LogLevel;->DEBUG:Lbacktraceio/library/logger/LogLevel;

    .line 14
    new-instance v1, Lbacktraceio/library/logger/LogLevel;

    const-string v3, "WARN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lbacktraceio/library/logger/LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbacktraceio/library/logger/LogLevel;->WARN:Lbacktraceio/library/logger/LogLevel;

    .line 18
    new-instance v3, Lbacktraceio/library/logger/LogLevel;

    const-string v5, "ERROR"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lbacktraceio/library/logger/LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lbacktraceio/library/logger/LogLevel;->ERROR:Lbacktraceio/library/logger/LogLevel;

    .line 22
    new-instance v5, Lbacktraceio/library/logger/LogLevel;

    const-string v7, "OFF"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lbacktraceio/library/logger/LogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lbacktraceio/library/logger/LogLevel;->OFF:Lbacktraceio/library/logger/LogLevel;

    const/4 v7, 0x4

    new-array v7, v7, [Lbacktraceio/library/logger/LogLevel;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 6
    sput-object v7, Lbacktraceio/library/logger/LogLevel;->$VALUES:[Lbacktraceio/library/logger/LogLevel;

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

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/logger/LogLevel;
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
    const-class v0, Lbacktraceio/library/logger/LogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/logger/LogLevel;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/logger/LogLevel;
    .locals 1

    .line 6
    sget-object v0, Lbacktraceio/library/logger/LogLevel;->$VALUES:[Lbacktraceio/library/logger/LogLevel;

    invoke-virtual {v0}, [Lbacktraceio/library/logger/LogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/logger/LogLevel;

    return-object v0
.end method
