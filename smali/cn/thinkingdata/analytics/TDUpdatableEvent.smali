.class public Lcn/thinkingdata/analytics/TDUpdatableEvent;
.super Lcn/thinkingdata/analytics/d;
.source ""


# instance fields
.field private final mEventId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/d;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    iput-object p3, p0, Lcn/thinkingdata/analytics/TDUpdatableEvent;->mEventId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method getDataType()Lcn/thinkingdata/analytics/utils/j;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->c:Lcn/thinkingdata/analytics/utils/j;

    return-object v0
.end method

.method getExtraField()Ljava/lang/String;
    .locals 1

    const-string v0, "#event_id"

    return-object v0
.end method

.method getExtraValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDUpdatableEvent;->mEventId:Ljava/lang/String;

    return-object v0
.end method
