.class Ljp/f4samurai/pnote/util/PnoteUtil$1;
.super Ljava/lang/Object;
.source "PnoteUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljp/f4samurai/pnote/util/PnoteUtil;->registDevice(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$guid:Ljava/lang/String;

.field final synthetic val$registrationId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 91
    iput-object p1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$context:Landroid/content/Context;

    iput-object p2, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$registrationId:Ljava/lang/String;

    iput-object p3, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$guid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 94
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 96
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$context:Landroid/content/Context;

    invoke-static {v1}, Ljp/f4samurai/pnote/util/PnoteUtil;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    const-string v2, "device_id"

    .line 101
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$registrationId:Ljava/lang/String;

    const-string v2, "device_token"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$context:Landroid/content/Context;

    const-string v2, "Pnote"

    const/4 v3, 0x0

    .line 106
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    sget-object v4, Ljp/f4samurai/pnote/util/PnoteUtil;->NOAH_ID:Ljava/lang/String;

    const-string v5, "noah_id"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 105
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$context:Landroid/content/Context;

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iget-object v2, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$guid:Ljava/lang/String;

    const-string v4, "sender"

    invoke-interface {v1, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "guid"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->APP_ID:Ljava/lang/String;

    const-string v2, "app_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    iget-object v1, p0, Ljp/f4samurai/pnote/util/PnoteUtil$1;->val$context:Landroid/content/Context;

    invoke-static {v1}, Ljp/f4samurai/pnote/util/PnoteUtil;->-$$Nest$smgetApplicationVersionName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "app_version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "os"

    const-string v2, "2"

    .line 114
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v2, "os_version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    new-instance v1, Ljava/text/SimpleDateFormat;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Z"

    invoke-direct {v1, v4, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 119
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 120
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "timezone"

    .line 121
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    invoke-static {}, Ljp/f4samurai/pnote/util/PnoteUtil;->-$$Nest$smgetLanguage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "language"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v1, Ljp/f4samurai/pnote/util/PnoteUtil;->API_VERSION:Ljava/lang/String;

    const-string v2, "api_version"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    const-string v1, "device/regist"

    .line 129
    invoke-static {v1, v0}, Ljp/f4samurai/pnote/util/PnoteUtil;->post(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 130
    invoke-static {}, Ljp/f4samurai/pnote/util/PnoteUtil;->-$$Nest$sfgetregistDeviceCallback()Ljp/f4samurai/pnote/util/PnoteUtil$RegistDeviceCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 131
    invoke-static {}, Ljp/f4samurai/pnote/util/PnoteUtil;->-$$Nest$sfgetregistDeviceCallback()Ljp/f4samurai/pnote/util/PnoteUtil$RegistDeviceCallback;

    move-result-object v0

    invoke-interface {v0}, Ljp/f4samurai/pnote/util/PnoteUtil$RegistDeviceCallback;->registDeviceCallback()V

    const/4 v0, 0x0

    .line 132
    invoke-static {v0}, Ljp/f4samurai/pnote/util/PnoteUtil;->-$$Nest$sfputregistDeviceCallback(Ljp/f4samurai/pnote/util/PnoteUtil$RegistDeviceCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    :catch_0
    :cond_1
    invoke-static {v3}, Ljp/f4samurai/pnote/util/PnoteUtil;->-$$Nest$sfputisRegisting(Z)V

    return-void
.end method
