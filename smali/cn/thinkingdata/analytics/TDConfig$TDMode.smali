.class public final enum Lcn/thinkingdata/analytics/TDConfig$TDMode;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/TDConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TDMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/thinkingdata/analytics/TDConfig$TDMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/thinkingdata/analytics/TDConfig$TDMode;

.field public static final enum DEBUG:Lcn/thinkingdata/analytics/TDConfig$TDMode;

.field public static final enum DEBUG_ONLY:Lcn/thinkingdata/analytics/TDConfig$TDMode;

.field public static final enum NORMAL:Lcn/thinkingdata/analytics/TDConfig$TDMode;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcn/thinkingdata/analytics/TDConfig$TDMode;

    const-string v1, "NORMAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcn/thinkingdata/analytics/TDConfig$TDMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcn/thinkingdata/analytics/TDConfig$TDMode;->NORMAL:Lcn/thinkingdata/analytics/TDConfig$TDMode;

    new-instance v1, Lcn/thinkingdata/analytics/TDConfig$TDMode;

    const-string v3, "DEBUG"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcn/thinkingdata/analytics/TDConfig$TDMode;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcn/thinkingdata/analytics/TDConfig$TDMode;->DEBUG:Lcn/thinkingdata/analytics/TDConfig$TDMode;

    new-instance v3, Lcn/thinkingdata/analytics/TDConfig$TDMode;

    const-string v5, "DEBUG_ONLY"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcn/thinkingdata/analytics/TDConfig$TDMode;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcn/thinkingdata/analytics/TDConfig$TDMode;->DEBUG_ONLY:Lcn/thinkingdata/analytics/TDConfig$TDMode;

    const/4 v5, 0x3

    new-array v5, v5, [Lcn/thinkingdata/analytics/TDConfig$TDMode;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcn/thinkingdata/analytics/TDConfig$TDMode;->$VALUES:[Lcn/thinkingdata/analytics/TDConfig$TDMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig$TDMode;
    .locals 1

    const-class v0, Lcn/thinkingdata/analytics/TDConfig$TDMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/TDConfig$TDMode;

    return-object p0
.end method

.method public static values()[Lcn/thinkingdata/analytics/TDConfig$TDMode;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDConfig$TDMode;->$VALUES:[Lcn/thinkingdata/analytics/TDConfig$TDMode;

    invoke-virtual {v0}, [Lcn/thinkingdata/analytics/TDConfig$TDMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/thinkingdata/analytics/TDConfig$TDMode;

    return-object v0
.end method
