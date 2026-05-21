.class public Ljp/f4samurai/notification/NotificationCommandHelper;
.super Ljava/lang/Object;
.source "NotificationCommandHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NotificationCommandHelper"

.field private static sAppActivity:Ljp/f4samurai/AppActivity; = null

.field private static sNotificationManager:Landroid/app/NotificationManager; = null

.field private static final sWeekTime:J = 0x240c8400L


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Ljp/f4samurai/AppActivity;

    sput-object v0, Ljp/f4samurai/notification/NotificationCommandHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    .line 32
    invoke-static {}, Ljp/f4samurai/AppActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    sput-object v0, Ljp/f4samurai/notification/NotificationCommandHelper;->sNotificationManager:Landroid/app/NotificationManager;

    const-string v0, "channel_once_alarm"

    const-string v1, "AP\u56de\u5fa9\u901a\u77e5"

    const-string v2, "AP\u306e\u5168\u56de\u5fa9\u3092\u901a\u77e5\u3057\u307e\u3059\u3002"

    .line 34
    invoke-direct {p0, v0, v1, v2}, Ljp/f4samurai/notification/NotificationCommandHelper;->createChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v0

    .line 35
    sget-object v1, Ljp/f4samurai/notification/NotificationCommandHelper;->sNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_0
    return-void
.end method

.method public static cancelAlarm(I)V
    .locals 3

    .line 52
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Ljp/f4samurai/notification/NotificationCommandHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const-class v2, Ljp/f4samurai/notification/NotificationCommandReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 53
    sget-object v1, Ljp/f4samurai/notification/NotificationCommandHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const/high16 v2, 0x14000000

    invoke-static {v1, p0, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 54
    sget-object v0, Ljp/f4samurai/notification/NotificationCommandHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 55
    invoke-virtual {v0, p0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 56
    invoke-virtual {p0}, Landroid/app/PendingIntent;->cancel()V

    return-void
.end method

.method private createChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/app/NotificationChannel;
    .locals 2

    .line 62
    new-instance v0, Landroid/app/NotificationChannel;

    const/4 v1, 0x4

    invoke-direct {v0, p1, p2, v1}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 63
    invoke-virtual {v0, p3}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 64
    invoke-virtual {v0, p1}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    .line 65
    invoke-virtual {v0, p1}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 66
    invoke-virtual {v0, p1}, Landroid/app/NotificationChannel;->enableLights(Z)V

    const p2, -0xff0100

    .line 67
    invoke-virtual {v0, p2}, Landroid/app/NotificationChannel;->setLightColor(I)V

    .line 68
    invoke-virtual {v0, p1}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    return-object v0
.end method

.method public static setOnceAlarm(IILjava/lang/String;)V
    .locals 4

    .line 41
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Ljp/f4samurai/notification/NotificationCommandHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const-class v2, Ljp/f4samurai/notification/NotificationCommandReceiver;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "ALARM_TYPE"

    .line 42
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "ALARM_MESSAGE"

    .line 43
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "ALARM_CHANNEL_ID"

    const-string v1, "channel_once_alarm"

    .line 44
    invoke-virtual {v0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    sget-object p2, Ljp/f4samurai/notification/NotificationCommandHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const/high16 v1, 0xc000000

    invoke-static {p2, p0, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 46
    sget-object p2, Ljp/f4samurai/notification/NotificationCommandHelper;->sAppActivity:Ljp/f4samurai/AppActivity;

    const-string v0, "alarm"

    invoke-virtual {p2, v0}, Ljp/f4samurai/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/AlarmManager;

    .line 47
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    mul-int/lit16 p1, p1, 0x3e8

    int-to-long v2, p1

    add-long/2addr v0, v2

    const/4 p1, 0x1

    .line 48
    invoke-virtual {p2, p1, v0, v1, p0}, Landroid/app/AlarmManager;->setExact(IJLandroid/app/PendingIntent;)V

    return-void
.end method
