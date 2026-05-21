.class public final enum Lbacktraceio/library/enums/BacktraceBreadcrumbType;
.super Ljava/lang/Enum;
.source "BacktraceBreadcrumbType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbacktraceio/library/enums/BacktraceBreadcrumbType;

.field public static final ALL:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum CONFIGURATION:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

.field public static final enum HTTP:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

.field public static final enum LOG:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

.field public static final enum MANUAL:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

.field public static final enum NAVIGATION:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

.field public static final NONE:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet<",
            "Lbacktraceio/library/enums/BacktraceBreadcrumbType;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

.field public static final enum USER:Lbacktraceio/library/enums/BacktraceBreadcrumbType;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 9
    const-class v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    new-instance v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v2, "MANUAL"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->MANUAL:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    .line 10
    new-instance v2, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v4, "LOG"

    const/4 v5, 0x1

    invoke-direct {v2, v4, v5}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->LOG:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    .line 11
    new-instance v4, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v6, "NAVIGATION"

    const/4 v7, 0x2

    invoke-direct {v4, v6, v7}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->NAVIGATION:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    .line 12
    new-instance v6, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v8, "HTTP"

    const/4 v9, 0x3

    invoke-direct {v6, v8, v9}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->HTTP:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    .line 13
    new-instance v8, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v10, "SYSTEM"

    const/4 v11, 0x4

    invoke-direct {v8, v10, v11}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->SYSTEM:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    .line 14
    new-instance v10, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v12, "USER"

    const/4 v13, 0x5

    invoke-direct {v10, v12, v13}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->USER:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    .line 15
    new-instance v12, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const-string v14, "CONFIGURATION"

    const/4 v15, 0x6

    invoke-direct {v12, v14, v15}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->CONFIGURATION:Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    const/4 v14, 0x7

    new-array v14, v14, [Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    aput-object v1, v14, v3

    aput-object v2, v14, v5

    aput-object v4, v14, v7

    aput-object v6, v14, v9

    aput-object v8, v14, v11

    aput-object v10, v14, v13

    aput-object v12, v14, v15

    .line 8
    sput-object v14, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->$VALUES:[Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    .line 17
    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    sput-object v1, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->ALL:Ljava/util/EnumSet;

    .line 18
    invoke-static {v0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->NONE:Ljava/util/EnumSet;

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

.method public static valueOf(Ljava/lang/String;)Lbacktraceio/library/enums/BacktraceBreadcrumbType;
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
    const-class v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    return-object p0
.end method

.method public static values()[Lbacktraceio/library/enums/BacktraceBreadcrumbType;
    .locals 1

    .line 8
    sget-object v0, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->$VALUES:[Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    invoke-virtual {v0}, [Lbacktraceio/library/enums/BacktraceBreadcrumbType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbacktraceio/library/enums/BacktraceBreadcrumbType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 22
    invoke-virtual {p0}, Lbacktraceio/library/enums/BacktraceBreadcrumbType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
