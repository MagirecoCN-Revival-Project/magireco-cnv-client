.class public final enum Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AutoTrackEventType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

.field public static final enum APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

.field public static final enum APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

.field public static final enum APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

.field public static final enum APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

.field public static final enum APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

.field public static final enum APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;


# instance fields
.field private final eventName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    new-instance v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    const-string v1, "APP_START"

    const/4 v2, 0x0

    const-string v3, "ta_app_start"

    invoke-direct {v0, v1, v2, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    const-string v3, "APP_END"

    const/4 v4, 0x1

    const-string v5, "ta_app_end"

    invoke-direct {v1, v3, v4, v5}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    new-instance v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    const-string v5, "APP_CLICK"

    const/4 v6, 0x2

    const-string v7, "ta_app_click"

    invoke-direct {v3, v5, v6, v7}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    new-instance v5, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    const-string v7, "APP_VIEW_SCREEN"

    const/4 v8, 0x3

    const-string v9, "ta_app_view"

    invoke-direct {v5, v7, v8, v9}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    new-instance v7, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    const-string v9, "APP_CRASH"

    const/4 v10, 0x4

    const-string v11, "ta_app_crash"

    invoke-direct {v7, v9, v10, v11}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    new-instance v9, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    const-string v11, "APP_INSTALL"

    const/4 v12, 0x5

    const-string v13, "ta_app_install"

    invoke-direct {v9, v11, v12, v13}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v9, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    const/4 v11, 0x6

    new-array v11, v11, [Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    sput-object v11, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->$VALUES:[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->eventName:Ljava/lang/String;

    return-void
.end method

.method public static autoTrackEventTypeFromEventName(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;
    .locals 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "ta_app_view"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x5

    goto :goto_0

    :sswitch_1
    const-string v2, "ta_app_end"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x4

    goto :goto_0

    :sswitch_2
    const-string v2, "ta_app_start"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x3

    goto :goto_0

    :sswitch_3
    const-string v2, "ta_app_crash"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v0, 0x2

    goto :goto_0

    :sswitch_4
    const-string v2, "ta_app_click"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto :goto_0

    :cond_5
    const/4 v0, 0x1

    goto :goto_0

    :sswitch_5
    const-string v2, "ta_app_install"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto :goto_0

    :cond_6
    const/4 v0, 0x0

    :goto_0
    packed-switch v0, :pswitch_data_0

    return-object v1

    :pswitch_0
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_VIEW_SCREEN:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object p0

    :pswitch_1
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object p0

    :pswitch_2
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object p0

    :pswitch_3
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object p0

    :pswitch_4
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CLICK:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object p0

    :pswitch_5
    sget-object p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x42f73955 -> :sswitch_5
        -0x4aa9568 -> :sswitch_4
        -0x4a7f749 -> :sswitch_3
        -0x3c5968e -> :sswitch_2
        0x3c7731eb -> :sswitch_1
        0x5276b395 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;
    .locals 1

    const-class v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object p0
.end method

.method public static values()[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->$VALUES:[Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-virtual {v0}, [Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    return-object v0
.end method


# virtual methods
.method getEventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->eventName:Ljava/lang/String;

    return-object v0
.end method
