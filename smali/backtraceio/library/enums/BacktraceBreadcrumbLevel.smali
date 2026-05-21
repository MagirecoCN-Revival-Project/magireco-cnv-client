.class public final enum Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;
.super Ljava/lang/Enum;
.source "BacktraceBreadcrumbLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

.field public static final ALL:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum DEBUG:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

.field public static final enum ERROR:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

.field public static final enum FATAL:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

.field public static final enum INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

.field public static final NONE:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum WARNING:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 9
    const-class v0, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    new-instance v1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v2, "DEBUG"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->DEBUG:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    .line 10
    new-instance v2, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v4, "INFO"

    const/4 v5, 0x1

    invoke-direct {v2, v4, v5}, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->INFO:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    .line 11
    new-instance v4, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v6, "WARNING"

    const/4 v7, 0x2

    invoke-direct {v4, v6, v7}, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->WARNING:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    .line 12
    new-instance v6, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v8, "ERROR"

    const/4 v9, 0x3

    invoke-direct {v6, v8, v9}, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->ERROR:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    .line 13
    new-instance v8, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const-string v10, "FATAL"

    const/4 v11, 0x4

    invoke-direct {v8, v10, v11}, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->FATAL:Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    const/4 v10, 0x5

    new-array v10, v10, [Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    aput-object v1, v10, v3

    aput-object v2, v10, v5

    aput-object v4, v10, v7

    aput-object v6, v10, v9

    aput-object v8, v10, v11

    .line 8
    sput-object v10, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->$VALUES:[Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    .line 15
    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    sput-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->ALL:Ljava/util/EnumSet;

    .line 16
    invoke-static {v0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->NONE:Ljava/util/EnumSet;

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

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 8
    const-class v0, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;
    .locals 1

    .line 8
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->$VALUES:[Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    invoke-virtual {v0}, [Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 20
    invoke-virtual {p0}, Lbacktraceio/library/enums/BacktraceBreadcrumbLevel;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
