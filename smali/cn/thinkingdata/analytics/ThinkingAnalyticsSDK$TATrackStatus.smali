.class public final enum Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TATrackStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

.field public static final enum NORMAL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

.field public static final enum PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

.field public static final enum SAVE_ONLY:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

.field public static final enum STOP:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    const-string v1, "PAUSE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    const-string v3, "STOP"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->STOP:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    new-instance v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    const-string v5, "SAVE_ONLY"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->SAVE_ONLY:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    new-instance v5, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    const-string v7, "NORMAL"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->NORMAL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    const/4 v7, 0x4

    new-array v7, v7, [Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->$VALUES:[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

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

.method public static valueOf(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
    .locals 1

    const-class v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    return-object p0
.end method

.method public static values()[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->$VALUES:[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-virtual {v0}, [Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    return-object v0
.end method
