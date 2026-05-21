.class public Lcn/thinkingdata/analytics/TDFirstEvent;
.super Lcn/thinkingdata/analytics/d;
.source ""


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics.TDUniqueEvent"


# instance fields
.field private mExtraValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/thinkingdata/analytics/d;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method


# virtual methods
.method getDataType()Lcn/thinkingdata/analytics/utils/j;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->b:Lcn/thinkingdata/analytics/utils/j;

    return-object v0
.end method

.method getExtraField()Ljava/lang/String;
    .locals 1

    const-string v0, "#first_check_id"

    return-object v0
.end method

.method getExtraValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/TDFirstEvent;->mExtraValue:Ljava/lang/String;

    return-object v0
.end method

.method public setFirstCheckId(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "ThinkingAnalytics.TDUniqueEvent"

    const-string v0, "Invalid firstCheckId. Use device Id"

    invoke-static {p1, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/TDFirstEvent;->mExtraValue:Ljava/lang/String;

    return-void
.end method
