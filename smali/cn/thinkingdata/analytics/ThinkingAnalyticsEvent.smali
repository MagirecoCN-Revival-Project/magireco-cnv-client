.class public abstract Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final mEventName:Ljava/lang/String;

.field private mEventTime:Ljava/util/Date;

.field private final mProperties:Lorg/json/JSONObject;

.field private mTimeZone:Ljava/util/TimeZone;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mEventName:Ljava/lang/String;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mProperties:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method abstract getDataType()Lcn/thinkingdata/analytics/utils/j;
.end method

.method getEventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mEventName:Ljava/lang/String;

    return-object v0
.end method

.method getEventTime()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mEventTime:Ljava/util/Date;

    return-object v0
.end method

.method abstract getExtraField()Ljava/lang/String;
.end method

.method abstract getExtraValue()Ljava/lang/String;
.end method

.method getProperties()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mProperties:Lorg/json/JSONObject;

    return-object v0
.end method

.method getTimeZone()Ljava/util/TimeZone;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mTimeZone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public setEventTime(Ljava/util/Date;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mEventTime:Ljava/util/Date;

    return-void
.end method

.method public setEventTime(Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mEventTime:Ljava/util/Date;

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->mTimeZone:Ljava/util/TimeZone;

    return-void
.end method
