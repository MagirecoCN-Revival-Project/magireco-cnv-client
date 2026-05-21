.class public Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;,
        Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;,
        Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;,
        Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;,
        Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;,
        Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "ThinkingAnalyticsSDK"

.field private static final sAppFirstInstallationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sInstanceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field protected _statusAccountId:Ljava/lang/String;

.field protected _statusIdentifyId:Ljava/lang/String;

.field protected _statusTrackStatus:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

.field private mAutoTrack:Z

.field private mAutoTrackEventListener:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;

.field private final mAutoTrackEventProperties:Lorg/json/JSONObject;

.field private mAutoTrackEventTypeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;"
        }
    .end annotation
.end field

.field private mAutoTrackIgnoredActivities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mAutoTrackStartProperties:Lorg/json/JSONObject;

.field private mAutoTrackStartTime:Lcn/thinkingdata/analytics/utils/d;

.field public mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

.field public mConfig:Lcn/thinkingdata/analytics/TDConfig;

.field private mDynamicSuperPropertiesTracker:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;

.field private final mEnableTrackOldData:Z

.field private mIgnoreAppViewInExtPackage:Z

.field private mIgnoredViewTypeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private mLastScreenUrl:Ljava/lang/String;

.field private mLifecycleCallbacks:Lcn/thinkingdata/analytics/e/b;

.field protected final mMessages:Lcn/thinkingdata/analytics/f/b;

.field public mSessionManager:Lcn/thinkingdata/analytics/h/a;

.field private mStorageManager:Lcn/thinkingdata/analytics/g/b;

.field private final mSystemInformation:Lcn/thinkingdata/analytics/f/e;

.field private mTrackCrash:Z

.field private mTrackFragmentAppViewScreen:Z

.field public mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

.field final mTrackTimer:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/f/d;",
            ">;"
        }
    .end annotation
.end field

.field private final mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sInstanceMap:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sAppFirstInstallationMap:Ljava/util/Map;

    return-void
.end method

.method varargs constructor <init>(Lcn/thinkingdata/analytics/TDConfig;[Z)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoreAppViewInExtPackage:Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventProperties:Lorg/json/JSONObject;

    invoke-static {}, Lcn/thinkingdata/analytics/i/a;->a()Lcn/thinkingdata/analytics/i/a;

    move-result-object v1

    iput-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    sget-object v1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string v2, "#fps"

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-static {}, Landroid/os/Looper;->prepare()V

    :cond_0
    invoke-static {}, Lcn/thinkingdata/analytics/utils/p;->e()V

    :cond_1
    new-instance v1, Lcn/thinkingdata/analytics/utils/a;

    invoke-direct {v1, p1}, Lcn/thinkingdata/analytics/utils/a;-><init>(Lcn/thinkingdata/analytics/TDConfig;)V

    iput-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    new-instance v1, Lcn/thinkingdata/analytics/f/g;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/f/g;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/TDConfig;)V

    iput-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    array-length v1, p2

    if-lez v1, :cond_2

    aget-boolean p2, p2, v0

    if-eqz p2, :cond_2

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mEnableTrackOldData:Z

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    iget-object p2, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {p2, v0}, Lcn/thinkingdata/analytics/f/e;->a(Landroid/content/Context;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/f/e;

    move-result-object p2

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    iget-object p1, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDataHandleInstance(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/b;

    move-result-object p1

    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    return-void

    :cond_2
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->trackOldData()Z

    move-result p2

    const/4 v1, 0x1

    if-eqz p2, :cond_3

    invoke-static {}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isOldDataTracked()Z

    move-result p2

    if-nez p2, :cond_3

    const/4 p2, 0x1

    goto :goto_0

    :cond_3
    const/4 p2, 0x0

    :goto_0
    iput-boolean p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mEnableTrackOldData:Z

    new-instance v2, Lcn/thinkingdata/analytics/g/b;

    iget-object v3, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcn/thinkingdata/analytics/g/b;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    new-instance v2, Lcn/thinkingdata/analytics/h/a;

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v3, v3, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-direct {v2, v3, v4}, Lcn/thinkingdata/analytics/h/a;-><init>(Ljava/lang/String;Lcn/thinkingdata/analytics/g/b;)V

    iput-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSessionManager:Lcn/thinkingdata/analytics/h/a;

    iget-object v2, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {v2, v3}, Lcn/thinkingdata/analytics/f/e;->a(Landroid/content/Context;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/f/e;

    move-result-object v2

    iput-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    iget-object v2, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDataHandleInstance(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/b;

    move-result-object v2

    iput-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v4}, Lcn/thinkingdata/analytics/g/b;->g()Z

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;Z)V

    invoke-direct {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getIdentifyID()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getRandomID()Ljava/lang/String;

    move-result-object v3

    :cond_4
    invoke-virtual {p0, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusIdentifyId(Ljava/lang/String;)V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v4, v4, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {v3, p2, v4}, Lcn/thinkingdata/analytics/g/b;->a(ZLandroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusAccountId(Ljava/lang/String;)V

    sget-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->NORMAL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v4}, Lcn/thinkingdata/analytics/g/b;->g()Z

    move-result v4

    if-eqz v4, :cond_5

    sget-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->SAVE_ONLY:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_1

    :cond_5
    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v4}, Lcn/thinkingdata/analytics/g/b;->d()Z

    move-result v4

    if-nez v4, :cond_6

    sget-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    goto :goto_1

    :cond_6
    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v4}, Lcn/thinkingdata/analytics/g/b;->f()Z

    move-result v4

    if-eqz v4, :cond_7

    sget-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->STOP:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    :cond_7
    :goto_1
    invoke-virtual {p0, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    iget-boolean v3, p1, Lcn/thinkingdata/analytics/TDConfig;->mEnableEncrypt:Z

    if-eqz v3, :cond_8

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Lcn/thinkingdata/analytics/encrypt/e;->a(Ljava/lang/String;Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/encrypt/e;

    :cond_8
    if-eqz p2, :cond_9

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Lcn/thinkingdata/analytics/f/b;->c(Ljava/lang/String;)V

    :cond_9
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventTypeList:Ljava/util/List;

    new-instance p2, Lcn/thinkingdata/analytics/e/b;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getMainProcessName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, p0, v2}, Lcn/thinkingdata/analytics/e/b;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;)V

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLifecycleCallbacks:Lcn/thinkingdata/analytics/e/b;

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt p2, v2, :cond_a

    iget-object p2, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Landroid/app/Application;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLifecycleCallbacks:Lcn/thinkingdata/analytics/e/b;

    invoke-virtual {p2, v2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_a
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->isNormal()Z

    move-result p2

    if-eqz p2, :cond_b

    invoke-static {}, Lcn/thinkingdata/analytics/utils/p;->d()Z

    move-result p2

    if-eqz p2, :cond_c

    :cond_b
    invoke-static {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableTrackLog(Z)V

    :cond_c
    iget-object p2, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcn/thinkingdata/core/router/TRouter;->init(Landroid/content/Context;)V

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->isEnableMutiprocess()Z

    move-result p2

    if-eqz p2, :cond_d

    iget-object p2, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcn/thinkingdata/analytics/utils/p;->f(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_d

    iget-object p2, p1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcn/thinkingdata/analytics/utils/broadcast/TDReceiver;->a(Landroid/content/Context;)V

    :cond_d
    invoke-static {p0}, Lcn/thinkingdata/analytics/aop/push/TAPushUtils;->clearPushEvent(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V

    const/4 p2, 0x5

    new-array p2, p2, [Ljava/lang/Object;

    const-string v2, "3.0.0-beta.1"

    aput-object v2, p2, v0

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getMode()Lcn/thinkingdata/analytics/TDConfig$ModeEnum;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p2, v1

    iget-object v0, p1, Lcn/thinkingdata/analytics/TDConfig;->mToken:Ljava/lang/String;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, p2, v2

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getServerUrl()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x3

    aput-object p1, p2, v0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDeviceId()Ljava/lang/String;

    move-result-object p1

    aput-object p1, p2, v1

    const-string p1, "[ThinkingData] Info: ThinkingData SDK %s initialize success with mode: %s, APP ID ends with: %s, server url: %s, device ID: %s"

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "ThinkingAnalyticsSDK"

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;JZ)Lorg/json/JSONObject;
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->obtainDefaultEventProperties(Ljava/lang/String;JZ)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventListener:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;

    return-object p0
.end method

.method static synthetic access$200(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Lcn/thinkingdata/analytics/g/b;
    .locals 0

    iget-object p0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    return-object p0
.end method

.method static synthetic access$300(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)Z
    .locals 0

    iget-boolean p0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mEnableTrackOldData:Z

    return p0
.end method

.method static addInstance(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sInstanceMap:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-interface {v1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static allInstances(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;)V
    .locals 4

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sInstanceMap:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    invoke-interface {p0, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;->process(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static calibrateTime(J)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[ThinkingData] Info: Time Calibration with timestamp("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ThinkingAnalyticsSDK"

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/utils/a;->a(J)V

    return-void
.end method

.method public static varargs calibrateTimeWithNtp([Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/utils/a;->a([Ljava/lang/String;)V

    return-void
.end method

.method public static enableTrackLog(Z)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/core/utils/TDLog;->setEnableLog(Z)V

    return-void
.end method

.method public static getCalibratedTime()Lcn/thinkingdata/analytics/utils/c;
    .locals 1

    invoke-static {}, Lcn/thinkingdata/analytics/utils/a;->b()Lcn/thinkingdata/analytics/utils/c;

    move-result-object v0

    return-object v0
.end method

.method private getIdentifyID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->e()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getInstanceMap(Landroid/content/Context;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sInstanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method public static getLocalRegion()Ljava/lang/String;
    .locals 1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static isOldDataTracked()Z
    .locals 4

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sInstanceMap:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    iget-boolean v3, v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mEnableTrackOldData:Z

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    monitor-exit v0

    return v1

    :cond_2
    const/4 v1, 0x0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private obtainDefaultEventProperties(Ljava/lang/String;JZ)Lorg/json/JSONObject;
    .locals 5

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/f/e;->d()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/f/e;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-nez v1, :cond_0

    const-string v1, "#app_version"

    :try_start_1
    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/f/e;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    sget-object v1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string v2, "#fps"

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    if-nez v1, :cond_1

    const-string v1, "#fps"

    :try_start_2
    invoke-static {}, Lcn/thinkingdata/analytics/utils/p;->a()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_1
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getSuperProperties()Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    if-nez p4, :cond_2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getAutoTrackProperties()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :cond_2
    :try_start_3
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mDynamicSuperPropertiesTracker:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;

    if-eqz v1, :cond_3

    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;->getDynamicSuperProperties()Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-static {v1}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3
    :goto_0
    if-nez p4, :cond_5

    iget-object p4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    monitor-enter p4
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :try_start_5
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/f/d;

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v1, :cond_5

    :try_start_6
    invoke-virtual {v1, p2, p3}, Lcn/thinkingdata/analytics/f/d;->a(J)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p3

    const-wide/16 v2, 0x0

    cmpl-double v4, p3, v2

    if-lez v4, :cond_4

    sget-object p3, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string p4, "#duration"

    invoke-interface {p3, p4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_4

    const-string p3, "#duration"

    invoke-virtual {v0, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4
    invoke-virtual {v1}, Lcn/thinkingdata/analytics/f/d;->a()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p3

    cmpl-double v1, p3, v2

    if-lez v1, :cond_5

    const-string p3, "ta_app_end"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    sget-object p1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string p3, "#background_duration"

    invoke-interface {p1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    const-string p1, "#background_duration"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_1

    :catch_1
    move-exception p1

    :try_start_7
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_1

    :catchall_0
    move-exception p1

    :try_start_8
    monitor-exit p4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :try_start_9
    throw p1

    :cond_5
    :goto_1
    sget-object p1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string p2, "#network_type"

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    if-nez p1, :cond_6

    const-string p1, "#network_type"

    :try_start_a
    iget-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {p2}, Lcn/thinkingdata/analytics/f/e;->c()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_6
    sget-object p1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string p2, "#ram"

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2

    if-nez p1, :cond_7

    const-string p1, "#ram"

    :try_start_b
    iget-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    iget-object p3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object p3, p3, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p2, p3}, Lcn/thinkingdata/analytics/f/e;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    sget-object p1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string p2, "#disk"

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    if-nez p1, :cond_8

    const-string p1, "#disk"

    :try_start_c
    iget-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    iget-object p3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object p3, p3, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    const/4 p4, 0x0

    invoke-virtual {p2, p3, p4}, Lcn/thinkingdata/analytics/f/e;->a(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_8
    sget-object p1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    const-string p2, "#device_type"

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2

    if-nez p1, :cond_9

    const-string p1, "#device_type"

    :try_start_d
    iget-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object p2, p2, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcn/thinkingdata/analytics/utils/p;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2

    :catch_2
    :cond_9
    return-object v0
.end method

.method public static setCustomerLibInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/f/e;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static sharedInstance(Landroid/content/Context;Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sharedInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    return-object p0
.end method

.method public static sharedInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sharedInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    return-object p0
.end method

.method public static sharedInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 3

    const/4 v0, 0x0

    const-string v1, "ThinkingAnalyticsSDK"

    if-nez p0, :cond_0

    const-string p0, "App context is required to get SDK instance."

    :goto_0
    invoke-static {v1, p0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string p0, "APP ID is required to get SDK instance."

    goto :goto_0

    :cond_1
    :try_start_0
    invoke-static {p0, p1, p2}, Lcn/thinkingdata/analytics/TDConfig;->getInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/analytics/TDConfig;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0, p3}, Lcn/thinkingdata/analytics/TDConfig;->setTrackOldData(Z)Lcn/thinkingdata/analytics/TDConfig;

    invoke-static {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sharedInstance(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object p0

    return-object p0

    :catch_0
    const-string p0, "Cannot get valid TDConfig instance. Returning null"

    goto :goto_0
.end method

.method public static sharedInstance(Lcn/thinkingdata/analytics/TDConfig;)Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 11

    if-nez p0, :cond_0

    const-string p0, "ThinkingAnalyticsSDK"

    const-string v0, "Cannot initial SDK instance with null config instance."

    invoke-static {p0, v0}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sInstanceMap:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const/4 v2, 0x0

    if-nez v1, :cond_4

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v4

    invoke-static {v3, v4}, Lcn/thinkingdata/analytics/f/e;->a(Landroid/content/Context;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/f/e;

    move-result-object v3

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/f/e;->e()J

    move-result-wide v4

    iget-object v6, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcn/thinkingdata/analytics/g/e;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;

    move-result-object v6

    invoke-virtual {v6}, Lcn/thinkingdata/analytics/g/e;->b()Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-gtz v10, :cond_1

    goto :goto_0

    :cond_1
    cmp-long v8, v4, v6

    if-gtz v8, :cond_2

    const/4 v6, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v6, 0x0

    :goto_1
    if-nez v6, :cond_3

    iget-object v7, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcn/thinkingdata/analytics/g/e;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;

    move-result-object v7

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v7, v4}, Lcn/thinkingdata/analytics/g/e;->a(Ljava/lang/Long;)V

    :cond_3
    invoke-virtual {v3}, Lcn/thinkingdata/analytics/f/e;->g()Z

    move-result v3

    if-nez v6, :cond_4

    if-eqz v3, :cond_4

    sget-object v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sAppFirstInstallationMap:Ljava/util/Map;

    iget-object v4, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    if-nez v3, :cond_7

    iget-object v3, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcn/thinkingdata/analytics/utils/p;->f(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_5

    new-instance v2, Lcn/thinkingdata/analytics/c;

    invoke-direct {v2, p0}, Lcn/thinkingdata/analytics/c;-><init>(Lcn/thinkingdata/analytics/TDConfig;)V

    move-object v3, v2

    goto :goto_2

    :cond_5
    new-instance v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    new-array v2, v2, [Z

    invoke-direct {v3, p0, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;-><init>(Lcn/thinkingdata/analytics/TDConfig;[Z)V

    sget-object v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sAppFirstInstallationMap:Ljava/util/Map;

    iget-object v4, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v4, p0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcn/thinkingdata/core/router/TRouter;->getInstance()Lcn/thinkingdata/core/router/TRouter;

    move-result-object v1

    const-string v2, "/thinkingdata/tpush"

    invoke-virtual {v1, v2}, Lcn/thinkingdata/core/router/TRouter;->build(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object v1

    const-string v2, "init"

    invoke-virtual {v1, v2}, Lcn/thinkingdata/core/router/Postcard;->withAction(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v2, "appId"

    :try_start_1
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v2, p0}, Lcn/thinkingdata/core/router/Postcard;->withString(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p0

    invoke-virtual {p0}, Lcn/thinkingdata/core/router/Postcard;->navigation()Ljava/lang/Object;

    :cond_7
    monitor-exit v0

    return-object v3

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Z)V

    return-void
.end method

.method private track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Z)V
    .locals 7

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;ZLjava/util/Map;Lcn/thinkingdata/analytics/utils/j;)V

    return-void
.end method


# virtual methods
.method public appBecomeActive()V
    .locals 7

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/thinkingdata/analytics/f/d;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/f/d;->b()J

    move-result-wide v3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/f/d;->d()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lcn/thinkingdata/analytics/f/d;->e(J)V

    invoke-virtual {v2, v3, v4}, Lcn/thinkingdata/analytics/f/d;->c(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_1
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception v1

    goto :goto_3

    :catch_0
    move-exception v1

    const-string v2, "ThinkingAnalyticsSDK"

    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "appBecomeActive error:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :goto_2
    :try_start_3
    monitor-exit v0

    return-void

    :goto_3
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    throw v1

    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method

.method public appEnterBackground()V
    .locals 7

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    const-string v3, "ta_app_end"

    :try_start_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/thinkingdata/analytics/f/d;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/f/d;->c()J

    move-result-wide v3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/f/d;->d()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Lcn/thinkingdata/analytics/f/d;->d(J)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcn/thinkingdata/analytics/f/d;->e(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    const-string v2, "ThinkingAnalyticsSDK"

    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "appEnterBackground error:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Z)V

    return-void
.end method

.method public autoTrack(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Z)V

    return-void
.end method

.method public clearSuperProperties()V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$i;

    invoke-direct {v1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$i;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public createLightInstance()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;
    .locals 2

    new-instance v0, Lcn/thinkingdata/analytics/b;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-direct {v0, v1}, Lcn/thinkingdata/analytics/b;-><init>(Lcn/thinkingdata/analytics/TDConfig;)V

    return-object v0
.end method

.method public bridge synthetic createLightInstance()Lcn/thinkingdata/analytics/a;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->createLightInstance()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;

    move-result-object v0

    return-object v0
.end method

.method public enableAutoTrack(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrack:Z

    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_1

    :cond_1
    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sInstanceMap:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->sAppFirstInstallationMap:Ljava/util/Map;

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v3, v3, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v3, v3, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSessionManager:Lcn/thinkingdata/analytics/h/a;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/h/a;->a()V

    :cond_2
    const-string v3, "ta_app_install"

    invoke-virtual {p0, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v3, v3, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_3
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_4
    :goto_0
    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_CRASH:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackCrash:Z

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v1, v1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcn/thinkingdata/analytics/e/a;->b(Landroid/content/Context;)Lcn/thinkingdata/analytics/e/a;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/e/a;->a()V

    :cond_5
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventTypeList:Ljava/util/List;

    sget-object v2, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_END:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "ta_app_end"

    invoke-virtual {p0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->timeEvent(Ljava/lang/String;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLifecycleCallbacks:Lcn/thinkingdata/analytics/e/b;

    invoke-virtual {v1, v0}, Lcn/thinkingdata/analytics/e/b;->a(Z)V

    :cond_6
    monitor-enter p0

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v2

    iput-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackStartTime:Lcn/thinkingdata/analytics/utils/d;

    const-string v2, "ta_app_start"

    const/4 v3, 0x0

    invoke-direct {p0, v2, v0, v1, v3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->obtainDefaultEventProperties(Ljava/lang/String;JZ)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackStartProperties:Lorg/json/JSONObject;

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventTypeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventTypeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventTypeList:Ljava/util/List;

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_START:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLifecycleCallbacks:Lcn/thinkingdata/analytics/e/b;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/e/b;->b()V

    :cond_7
    return-void

    :catchall_1
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    :cond_8
    :goto_1
    return-void
.end method

.method public enableAutoTrack(Ljava/util/List;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;",
            ")V"
        }
    .end annotation

    iput-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventListener:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventListener;

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableAutoTrack(Ljava/util/List;)V

    return-void
.end method

.method public enableAutoTrack(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setAutoTrackProperties(Ljava/util/List;Lorg/json/JSONObject;)V

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableAutoTrack(Ljava/util/List;)V

    return-void
.end method

.method public enableThirdPartySharing(I)V
    .locals 2

    invoke-static {}, Lcn/thinkingdata/core/router/TRouter;->getInstance()Lcn/thinkingdata/core/router/TRouter;

    move-result-object v0

    const-string v1, "/thingkingdata/third/party"

    invoke-virtual {v0, v1}, Lcn/thinkingdata/core/router/TRouter;->build(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object v0

    const-string v1, "enableThirdPartySharing"

    invoke-virtual {v0, v1}, Lcn/thinkingdata/core/router/Postcard;->withAction(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/core/router/Postcard;->withInt(Ljava/lang/String;I)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    const-string v0, "instance"

    invoke-virtual {p1, v0, p0}, Lcn/thinkingdata/core/router/Postcard;->withObject(Ljava/lang/String;Ljava/lang/Object;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getLoginId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "loginId"

    invoke-virtual {p1, v1, v0}, Lcn/thinkingdata/core/router/Postcard;->withString(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    invoke-virtual {p1}, Lcn/thinkingdata/core/router/Postcard;->navigation()Ljava/lang/Object;

    return-void
.end method

.method public enableThirdPartySharing(ILjava/lang/Object;)V
    .locals 2

    invoke-static {}, Lcn/thinkingdata/core/router/TRouter;->getInstance()Lcn/thinkingdata/core/router/TRouter;

    move-result-object v0

    const-string v1, "/thingkingdata/third/party"

    invoke-virtual {v0, v1}, Lcn/thinkingdata/core/router/TRouter;->build(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object v0

    const-string v1, "enableThirdPartySharingWithParams"

    invoke-virtual {v0, v1}, Lcn/thinkingdata/core/router/Postcard;->withAction(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1, p1}, Lcn/thinkingdata/core/router/Postcard;->withInt(Ljava/lang/String;I)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    const-string v0, "instance"

    invoke-virtual {p1, v0, p0}, Lcn/thinkingdata/core/router/Postcard;->withObject(Ljava/lang/String;Ljava/lang/Object;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getLoginId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "loginId"

    invoke-virtual {p1, v1, v0}, Lcn/thinkingdata/core/router/Postcard;->withString(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    const-string v0, "params"

    invoke-virtual {p1, v0, p2}, Lcn/thinkingdata/core/router/Postcard;->withObject(Ljava/lang/String;Ljava/lang/Object;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    invoke-virtual {p1}, Lcn/thinkingdata/core/router/Postcard;->navigation()Ljava/lang/Object;

    return-void
.end method

.method public enableTracking(Z)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->flush()V

    :cond_0
    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/g/b;->a(Z)V

    return-void
.end method

.method public flush()V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isStatusTrackSaveOnly()Z

    move-result v1

    if-nez v0, :cond_1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$k;

    invoke-direct {v1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$k;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public getAutoTrackEventTypeList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventTypeList:Ljava/util/List;

    return-object v0
.end method

.method public getAutoTrackProperties()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventProperties:Lorg/json/JSONObject;

    return-object v0
.end method

.method public declared-synchronized getAutoTrackStartProperties()Lorg/json/JSONObject;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackStartProperties:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAutoTrackStartTime()Lcn/thinkingdata/analytics/utils/d;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackStartTime:Lcn/thinkingdata/analytics/utils/d;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getDataHandleInstance(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/b;
    .locals 0

    invoke-static {p1}, Lcn/thinkingdata/analytics/f/b;->b(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/b;

    move-result-object p1

    return-object p1
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/f/e;->d()Ljava/util/Map;

    move-result-object v0

    const-string v1, "#device_id"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/f/e;->d()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDistinctId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusIdentifyId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getRandomID()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method getDynamicSuperPropertiesTracker()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mDynamicSuperPropertiesTracker:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;

    return-object v0
.end method

.method getIgnoredViewTypeList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    return-object v0
.end method

.method getLoginId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusAccountId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPresetProperties()Lcn/thinkingdata/analytics/TDPresetProperties;
    .locals 10

    const-string v0, "#device_type"

    const-string v1, "#fps"

    const-string v2, "#disk"

    const-string v3, "#ram"

    const-string v4, "#network_type"

    iget-object v5, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v5, v5, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcn/thinkingdata/analytics/f/e;->e(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/e;

    move-result-object v5

    invoke-virtual {v5}, Lcn/thinkingdata/analytics/f/e;->a()Lorg/json/JSONObject;

    move-result-object v5

    iget-object v6, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v6, v6, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcn/thinkingdata/analytics/f/e;->e(Landroid/content/Context;)Lcn/thinkingdata/analytics/f/e;

    move-result-object v6

    invoke-virtual {v6}, Lcn/thinkingdata/analytics/f/e;->c()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v7}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v7

    invoke-interface {v7}, Lcn/thinkingdata/analytics/utils/d;->a()Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    :try_start_0
    sget-object v9, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v9, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v5, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string v4, "#zone_offset"

    invoke-virtual {v5, v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    sget-object v4, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    iget-object v6, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v6, v6, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v6}, Lcn/thinkingdata/analytics/f/e;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    sget-object v3, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v4, v4, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v6}, Lcn/thinkingdata/analytics/f/e;->a(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    sget-object v2, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcn/thinkingdata/analytics/utils/p;->a()I

    move-result v2

    invoke-virtual {v5, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_3
    sget-object v1, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v1, v1, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcn/thinkingdata/analytics/utils/p;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_4
    :goto_0
    new-instance v0, Lcn/thinkingdata/analytics/TDPresetProperties;

    invoke-direct {v0, v5}, Lcn/thinkingdata/analytics/TDPresetProperties;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method getRandomID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    iget-object v0, v0, Lcn/thinkingdata/analytics/TDConfig;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcn/thinkingdata/analytics/g/e;->a(Landroid/content/Context;)Lcn/thinkingdata/analytics/g/e;

    move-result-object v0

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/e;->e()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getStatusAccountId()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->_statusAccountId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getStatusHasDisabled()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusTrackStatus()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->STOP:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :cond_1
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getStatusIdentifyId()Ljava/lang/String;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->_statusIdentifyId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized getStatusTrackStatus()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->_statusTrackStatus:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSuperProperties()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->h()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public getTimeString(Ljava/util/Date;)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcn/thinkingdata/analytics/utils/a;->a(Ljava/util/Date;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/utils/d;

    move-result-object p1

    invoke-interface {p1}, Lcn/thinkingdata/analytics/utils/d;->b()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method hasDisabled()Z
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->hasOptOut()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public hasOptOut()Z
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->f()Z

    move-result v0

    return v0
.end method

.method public identify(Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "ThinkingAnalyticsSDK"

    if-eqz v0, :cond_2

    const-string p1, "The identity cannot be empty."

    invoke-static {v1, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string v0, "distinct id cannot be empty"

    invoke-direct {p1, v0}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ThinkingData] Info: Setting distinct ID, DistinctId = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusIdentifyId(Ljava/lang/String;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$d;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$d;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public ignoreAppViewEventInExtPackage()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoreAppViewInExtPackage:Z

    return-void
.end method

.method public ignoreAutoTrackActivities(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_4

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    :cond_2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    :goto_1
    return-void
.end method

.method public ignoreAutoTrackActivity(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    :cond_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method

.method public ignoreView(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    sget v1, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_ignored:I

    const-string v2, "1"

    invoke-static {v0, p1, v1, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;ILjava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public ignoreViewType(Ljava/lang/Class;)V
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    :cond_2
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoredViewTypeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method

.method isActivityAutoTrackAppClickIgnored(Ljava/lang/Class;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v2

    :cond_1
    const-class v1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;

    if-eqz v1, :cond_3

    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;->appId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;->appId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    return v2

    :cond_3
    const-class v1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppClick;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p1

    check-cast p1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppClick;

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppClick;->appId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppClick;->appId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    :cond_4
    const/4 v0, 0x1

    :cond_5
    return v0
.end method

.method public isActivityAutoTrackAppViewScreenIgnored(Ljava/lang/Class;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackIgnoredActivities:Ljava/util/List;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return v2

    :cond_1
    const-class v1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;

    if-eqz v1, :cond_3

    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;->appId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreenAndAppClick;->appId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    return v2

    :cond_3
    const-class v1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreen;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p1

    check-cast p1, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreen;

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreen;->appId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ThinkingDataIgnoreTrackAppViewScreen;->appId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    :cond_4
    return v2

    :cond_5
    return v0
.end method

.method public isAutoTrackEnabled()Z
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrack:Z

    return v0
.end method

.method public isAutoTrackEventTypeIgnored(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;)Z
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventTypeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isEnabled()Z
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->d()Z

    move-result v0

    return v0
.end method

.method public isIgnoreAppViewInExtPackage()Z
    .locals 1

    iget-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mIgnoreAppViewInExtPackage:Z

    return v0
.end method

.method public declared-synchronized isStatusTrackSaveOnly()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusTrackStatus()Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    move-result-object v0

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->SAVE_ONLY:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method isTrackFragmentAppViewScreenEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackFragmentAppViewScreen:Z

    return v0
.end method

.method public login(Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "ThinkingAnalyticsSDK"

    if-eqz v0, :cond_2

    const-string p1, "The account id cannot be empty."

    invoke-static {v1, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string v0, "account id cannot be empty"

    invoke-direct {p1, v0}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[ThinkingData] Info: Login SDK, AccountId = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusAccountId(Ljava/lang/String;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$e;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    invoke-static {}, Lcn/thinkingdata/core/router/TRouter;->getInstance()Lcn/thinkingdata/core/router/TRouter;

    move-result-object p1

    const-string v0, "/thinkingdata/tpush"

    invoke-virtual {p1, v0}, Lcn/thinkingdata/core/router/TRouter;->build(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    const-string v0, "login"

    invoke-virtual {p1, v0}, Lcn/thinkingdata/core/router/Postcard;->withAction(Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    const-string v1, "appId"

    invoke-virtual {p1, v1, v0}, Lcn/thinkingdata/core/router/Postcard;->withString(Ljava/lang/String;Ljava/lang/String;)Lcn/thinkingdata/core/router/Postcard;

    move-result-object p1

    invoke-virtual {p1}, Lcn/thinkingdata/core/router/Postcard;->navigation()Ljava/lang/Object;

    return-void
.end method

.method public logout()V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "ThinkingAnalyticsSDK"

    const-string v1, "[ThinkingData] Info: Logout SDK"

    invoke-static {v0, v1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusAccountId(Ljava/lang/String;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$f;

    invoke-direct {v1, p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$f;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public optInTracking()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->NORMAL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/b;->b(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/f/b;->b(Ljava/lang/String;)V

    return-void
.end method

.method public optOutTracking()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->PAUSE:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/g/b;->b(Z)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/f/b;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTimer:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusAccountId(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getRandomID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusIdentifyId(Ljava/lang/String;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->a()V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->b()V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mStorageManager:Lcn/thinkingdata/analytics/g/b;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/g/b;->c()V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public optOutTrackingAndDeleteUser()V
    .locals 9
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;->STOP:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v5

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusIdentifyId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusAccountId()Ljava/lang/String;

    move-result-object v7

    new-instance v0, Lcn/thinkingdata/analytics/f/a;

    sget-object v3, Lcn/thinkingdata/analytics/utils/j;->j:Lcn/thinkingdata/analytics/utils/j;

    const/4 v4, 0x0

    const/4 v8, 0x0

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v8}, Lcn/thinkingdata/analytics/f/a;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/f/a;->b()V

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackInternal(Lcn/thinkingdata/analytics/f/a;)V

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->optOutTracking()V

    return-void
.end method

.method public setAutoTrackProperties(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_3

    :try_start_0
    invoke-static {p2}, Lcn/thinkingdata/analytics/utils/f;->a(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-static {p2, v2, v3}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->getEventName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventProperties:Lorg/json/JSONObject;

    monitor-enter p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object p2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mAutoTrackEventProperties:Lorg/json/JSONObject;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v0, p2, v1}, Lcn/thinkingdata/analytics/utils/p;->b(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    monitor-exit p1

    goto :goto_2

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p2

    :cond_3
    :goto_1
    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-nez p1, :cond_4

    return-void

    :cond_4
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string p2, "Set autoTrackEvent properties failed. Please refer to the SDK debug log for details."

    invoke-direct {p1, p2}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    return-void
.end method

.method public setDynamicSuperPropertiesTracker(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;)V
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mDynamicSuperPropertiesTracker:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$DynamicSuperPropertiesTracker;

    return-void
.end method

.method public setJsBridge(Landroid/webkit/WebView;)V
    .locals 2

    if-nez p1, :cond_1

    const-string p1, "ThinkingAnalyticsSDK"

    const-string v0, "SetJsBridge failed due to parameter webView is null"

    invoke-static {p1, v0}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->shouldThrowException()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Lcn/thinkingdata/analytics/utils/k;

    const-string v0, "webView cannot be null for setJsBridge"

    invoke-direct {p1, v0}, Lcn/thinkingdata/analytics/utils/k;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    new-instance v0, Lcn/thinkingdata/analytics/TDWebAppInterface;

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/f/e;->d()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcn/thinkingdata/analytics/TDWebAppInterface;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/util/Map;)V

    const-string v1, "ThinkingData_APP_JS_Bridge"

    invoke-virtual {p1, v0, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public setJsBridgeForX5WebView(Ljava/lang/Object;)V
    .locals 8

    const-string v0, "ThinkingAnalyticsSDK"

    if-nez p1, :cond_0

    const-string p1, "SetJsBridge failed due to parameter webView is null"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "addJavascriptInterface"

    const/4 v3, 0x2

    :try_start_1
    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    new-instance v3, Lcn/thinkingdata/analytics/TDWebAppInterface;

    iget-object v4, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mSystemInformation:Lcn/thinkingdata/analytics/f/e;

    invoke-virtual {v4}, Lcn/thinkingdata/analytics/f/e;->d()Ljava/util/Map;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcn/thinkingdata/analytics/TDWebAppInterface;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/util/Map;)V

    aput-object v3, v2, v6

    const-string v3, "ThinkingData_APP_JS_Bridge"

    aput-object v3, v2, v7

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setJsBridgeForX5WebView failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public setNetworkType(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;)V
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/TDConfig;->setNetworkType(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$ThinkingdataNetworkType;)V

    return-void
.end method

.method protected declared-synchronized setStatusAccountId(Ljava/lang/String;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->_statusAccountId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized setStatusIdentifyId(Ljava/lang/String;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->_statusIdentifyId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->_statusTrackStatus:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setSuperProperties(Lorg/json/JSONObject;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$g;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V
    .locals 2

    invoke-virtual {p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->setStatusTrackStatus(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$a;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$TATrackStatus;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setViewID(Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    sget v1, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_id:I

    invoke-static {v0, p1, v1, p2}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method public setViewID(Landroid/view/View;Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    sget v1, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_id:I

    invoke-static {v0, p1, v1, p2}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;ILjava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public setViewProperties(Landroid/view/View;Lorg/json/JSONObject;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v0

    sget v1, Lcn/thinkingdata/analytics/R$id;->thinking_analytics_tag_view_properties:I

    invoke-static {v0, p1, v1, p2}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/String;Landroid/view/View;ILjava/lang/Object;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public shouldTrackCrash()Z
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackCrash:Z

    return v0
.end method

.method public timeEvent(Ljava/lang/String;)V
    .locals 4

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v3, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;

    invoke-direct {v3, p0, p1, v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$j;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;J)V

    invoke-virtual {v2, v3}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public track(Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;)V
    .locals 9

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "ThinkingAnalyticsSDK"

    if-nez p1, :cond_1

    const-string p1, "Ignoring empty event..."

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getEventTime()Ljava/util/Date;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getEventTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcn/thinkingdata/analytics/utils/a;->a(Ljava/util/Date;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/utils/d;

    move-result-object v1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v1

    :goto_0
    move-object v5, v1

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getExtraField()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "Invalid ExtraFields. Ignoring..."

    invoke-static {v0, v1}, Lcn/thinkingdata/core/utils/TDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    instance-of v0, p1, Lcn/thinkingdata/analytics/TDFirstEvent;

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getExtraValue()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getExtraValue()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getExtraField()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v7, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getEventName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getProperties()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsEvent;->getDataType()Lcn/thinkingdata/analytics/utils/j;

    move-result-object v8

    const/4 v6, 0x1

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;ZLjava/util/Map;Lcn/thinkingdata/analytics/utils/j;)V

    return-void
.end method

.method public track(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V

    return-void
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/utils/a;->a()Lcn/thinkingdata/analytics/utils/d;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V

    return-void
.end method

.method track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;ZLjava/util/Map;Lcn/thinkingdata/analytics/utils/j;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            "Lcn/thinkingdata/analytics/utils/d;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcn/thinkingdata/analytics/utils/j;",
            ")V"
        }
    .end annotation

    invoke-virtual/range {p0 .. p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    invoke-virtual/range {p0 .. p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusAccountId()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusIdentifyId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {p0 .. p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->isStatusTrackSaveOnly()Z

    move-result v13

    move-object/from16 v0, p0

    iget-object v15, v0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v14, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;

    move-object v1, v14

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move/from16 v5, p4

    move-object/from16 v8, p6

    move-object/from16 v9, p0

    move-object/from16 v10, p3

    move-object v0, v14

    move-object/from16 v14, p5

    invoke-direct/range {v1 .. v14}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$c;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;Lorg/json/JSONObject;ZJLcn/thinkingdata/analytics/utils/j;Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Lcn/thinkingdata/analytics/utils/d;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;)V

    invoke-virtual {v15, v0}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    const/4 v1, 0x0

    invoke-virtual {v0, p3, v1}, Lcn/thinkingdata/analytics/utils/a;->a(Ljava/util/Date;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/utils/d;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V

    return-void
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mCalibratedTimeManager:Lcn/thinkingdata/analytics/utils/a;

    invoke-virtual {v0, p3, p4}, Lcn/thinkingdata/analytics/utils/a;->a(Ljava/util/Date;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/utils/d;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->track(Ljava/lang/String;Lorg/json/JSONObject;Lcn/thinkingdata/analytics/utils/d;)V

    return-void
.end method

.method public trackAppCrashAndEndEvent(Lorg/json/JSONObject;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLifecycleCallbacks:Lcn/thinkingdata/analytics/e/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/e/b;->a(Lorg/json/JSONObject;)V

    return-void
.end method

.method public trackAppInstall()V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;->APP_INSTALL:Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$AutoTrackEventType;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->enableAutoTrack(Ljava/util/List;)V

    return-void
.end method

.method public trackFragmentAppViewScreen()V
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackFragmentAppViewScreen:Z

    return-void
.end method

.method public trackInternal(Lcn/thinkingdata/analytics/f/a;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->isDebugOnly()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p1, Lcn/thinkingdata/analytics/f/a;->h:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->c(Lcn/thinkingdata/analytics/f/a;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->a(Lcn/thinkingdata/analytics/f/a;)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mMessages:Lcn/thinkingdata/analytics/f/b;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/b;->b(Lcn/thinkingdata/analytics/f/a;)V

    :goto_1
    return-void
.end method

.method public trackViewScreen(Landroid/app/Activity;)V
    .locals 3

    const-string v0, "#screen_name"

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    sget-object v2, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    invoke-static {v1, p1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Landroid/app/Activity;)V

    instance-of v0, p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    if-eqz v0, :cond_4

    check-cast p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getScreenUrl()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getTrackProperties()Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object v2, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v2}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_3
    invoke-virtual {p0, v0, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreenInternal(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_0

    :cond_4
    const-string p1, "ta_app_view"

    invoke-virtual {p0, p1, v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "trackViewScreen:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ThinkingAnalyticsSDK"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public trackViewScreen(Landroid/app/Fragment;)V
    .locals 10

    const-string v0, "#title"

    const-string v1, "#screen_name"

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v5}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v4

    :cond_2
    sget-object v6, Ljava/util/Locale;->CHINA:Ljava/util/Locale;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v7, "%s|%s"

    const/4 v8, 0x2

    :try_start_1
    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v8, v9

    const/4 v5, 0x1

    aput-object v3, v8, v5

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    :cond_3
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    sget-object v5, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4
    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_5
    instance-of v0, p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    if-eqz v0, :cond_7

    check-cast p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getScreenUrl()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getTrackProperties()Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {p1, v2, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_6
    invoke-virtual {p0, v0, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreenInternal(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_0

    :cond_7
    const-string p1, "ta_app_view"

    invoke-virtual {p0, p1, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "trackViewScreen:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ThinkingAnalyticsSDK"

    invoke-static {v0, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public trackViewScreen(Ljava/lang/Object;)V
    .locals 10

    const-string v0, "#title"

    const-string v1, "#screen_name"

    const-string v2, "androidx.fragment.app.Fragment"

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v3

    if-eqz v3, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    const/4 v3, 0x0

    :try_start_0
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v4, v3

    :goto_0
    :try_start_1
    const-string v5, "android.app.Fragment"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-object v5, v3

    :goto_1
    :try_start_2
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-object v2, v3

    :goto_2
    if-eqz v4, :cond_2

    invoke-virtual {v4, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    :cond_2
    if-eqz v5, :cond_3

    invoke-virtual {v5, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    :cond_3
    if-eqz v2, :cond_b

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    goto/16 :goto_4

    :cond_4
    :try_start_3
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    const/4 v6, 0x0

    :try_start_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    const-string v8, "getActivity"

    :try_start_5
    new-array v9, v6, [Ljava/lang/Class;

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    new-array v8, v6, [Ljava/lang/Object;

    invoke-virtual {v7, p1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/Activity;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    move-object v3, v7

    goto :goto_3

    :catch_3
    nop

    :goto_3
    if-eqz v3, :cond_6

    :try_start_6
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-static {v3}, Lcn/thinkingdata/analytics/utils/p;->a(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v5

    :cond_5
    sget-object v7, Ljava/util/Locale;->CHINA:Ljava/util/Locale;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    const-string v8, "%s|%s"

    const/4 v9, 0x2

    :try_start_7
    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v9, v6

    const/4 v3, 0x1

    aput-object v4, v9, v3

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :cond_6
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7

    sget-object v3, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    invoke-virtual {v2, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {v2, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_8
    instance-of v0, p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    if-eqz v0, :cond_a

    check-cast p1, Lcn/thinkingdata/analytics/ScreenAutoTracker;

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getScreenUrl()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcn/thinkingdata/analytics/ScreenAutoTracker;->getTrackProperties()Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_9

    iget-object v1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {p1, v2, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_9
    invoke-virtual {p0, v0, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->trackViewScreenInternal(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_4

    :cond_a
    const-string p1, "ta_app_view"

    invoke-virtual {p0, p1, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_4

    :catch_4
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_b
    :goto_4
    return-void
.end method

.method public trackViewScreenInternal(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "#referrer"

    const-string v1, "#url"

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-eqz p2, :cond_5

    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLastScreenUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-object v3, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLastScreenUrl:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    sget-object v0, Lcn/thinkingdata/analytics/TDPresetProperties;->disableList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {v2, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_3
    iput-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mLastScreenUrl:Ljava/lang/String;

    if-eqz p2, :cond_4

    iget-object p1, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mConfig:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {p1}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object p1

    invoke-static {p2, v2, p1}, Lcn/thinkingdata/analytics/utils/p;->a(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/TimeZone;)V

    :cond_4
    const-string p1, "ta_app_view"

    invoke-virtual {p0, p1, v2}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->autoTrack(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "trackViewScreen:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ThinkingAnalyticsSDK"

    invoke-static {p2, p1}, Lcn/thinkingdata/core/utils/TDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_0
    return-void
.end method

.method public unsetSuperProperty(Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->getStatusHasDisabled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mTrackTaskManager:Lcn/thinkingdata/analytics/i/a;

    new-instance v1, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$h;

    invoke-direct {v1, p0, p1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$h;-><init>(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/i/a;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public user_add(Ljava/lang/String;Ljava/lang/Number;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/f/g;->a(Ljava/lang/String;Ljava/lang/Number;)V

    return-void
.end method

.method public user_add(Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcn/thinkingdata/analytics/f/g;->a(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_add(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/f/g;->a(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_append(Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcn/thinkingdata/analytics/f/g;->b(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_append(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/f/g;->b(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_delete()V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcn/thinkingdata/analytics/f/g;->a(Ljava/util/Date;)V

    return-void
.end method

.method public user_delete(Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/g;->a(Ljava/util/Date;)V

    return-void
.end method

.method public user_operations(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2, p3}, Lcn/thinkingdata/analytics/f/g;->a(Lcn/thinkingdata/analytics/utils/j;Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_set(Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcn/thinkingdata/analytics/f/g;->c(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_set(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/f/g;->c(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_setOnce(Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcn/thinkingdata/analytics/f/g;->d(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_setOnce(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/f/g;->d(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_uniqAppend(Lorg/json/JSONObject;)V
    .locals 2

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcn/thinkingdata/analytics/f/g;->e(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_uniqAppend(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/f/g;->e(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public user_unset(Lorg/json/JSONObject;Ljava/util/Date;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1, p2}, Lcn/thinkingdata/analytics/f/g;->f(Lorg/json/JSONObject;Ljava/util/Date;)V

    return-void
.end method

.method public varargs user_unset([Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->mUserOperationHandler:Lcn/thinkingdata/analytics/f/g;

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/f/g;->a([Ljava/lang/String;)V

    return-void
.end method
