.class public final enum Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/TDAnalytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TDNetworkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

.field public static final enum ALL:Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

.field public static final enum WIFI:Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    const-string v1, "WIFI"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;->WIFI:Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    new-instance v1, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    const-string v3, "ALL"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;->ALL:Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    const/4 v3, 0x2

    new-array v3, v3, [Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;->$VALUES:[Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

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

.method public static valueOf(Ljava/lang/String;)Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;
    .locals 1

    const-class v0, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    return-object p0
.end method

.method public static values()[Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;->$VALUES:[Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    invoke-virtual {v0}, [Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/thinkingdata/analytics/TDAnalytics$TDNetworkType;

    return-object v0
.end method
