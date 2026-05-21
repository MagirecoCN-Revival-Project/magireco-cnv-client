.class public final enum Lcn/thinkingdata/core/router/RouteType;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/thinkingdata/core/router/RouteType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/thinkingdata/core/router/RouteType;

.field public static final enum PLUGIN:Lcn/thinkingdata/core/router/RouteType;

.field public static final enum PROVIDER:Lcn/thinkingdata/core/router/RouteType;

.field public static final enum UNKNOWN:Lcn/thinkingdata/core/router/RouteType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcn/thinkingdata/core/router/RouteType;

    const-string v1, "PROVIDER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcn/thinkingdata/core/router/RouteType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcn/thinkingdata/core/router/RouteType;->PROVIDER:Lcn/thinkingdata/core/router/RouteType;

    new-instance v1, Lcn/thinkingdata/core/router/RouteType;

    const-string v3, "PLUGIN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcn/thinkingdata/core/router/RouteType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcn/thinkingdata/core/router/RouteType;->PLUGIN:Lcn/thinkingdata/core/router/RouteType;

    new-instance v3, Lcn/thinkingdata/core/router/RouteType;

    const-string v5, "UNKNOWN"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcn/thinkingdata/core/router/RouteType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcn/thinkingdata/core/router/RouteType;->UNKNOWN:Lcn/thinkingdata/core/router/RouteType;

    const/4 v5, 0x3

    new-array v5, v5, [Lcn/thinkingdata/core/router/RouteType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcn/thinkingdata/core/router/RouteType;->$VALUES:[Lcn/thinkingdata/core/router/RouteType;

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

.method public static parse(I)Lcn/thinkingdata/core/router/RouteType;
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    sget-object p0, Lcn/thinkingdata/core/router/RouteType;->UNKNOWN:Lcn/thinkingdata/core/router/RouteType;

    return-object p0

    :cond_0
    sget-object p0, Lcn/thinkingdata/core/router/RouteType;->PLUGIN:Lcn/thinkingdata/core/router/RouteType;

    return-object p0

    :cond_1
    sget-object p0, Lcn/thinkingdata/core/router/RouteType;->PROVIDER:Lcn/thinkingdata/core/router/RouteType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcn/thinkingdata/core/router/RouteType;
    .locals 1

    const-class v0, Lcn/thinkingdata/core/router/RouteType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/core/router/RouteType;

    return-object p0
.end method

.method public static values()[Lcn/thinkingdata/core/router/RouteType;
    .locals 1

    sget-object v0, Lcn/thinkingdata/core/router/RouteType;->$VALUES:[Lcn/thinkingdata/core/router/RouteType;

    invoke-virtual {v0}, [Lcn/thinkingdata/core/router/RouteType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/thinkingdata/core/router/RouteType;

    return-object v0
.end method
