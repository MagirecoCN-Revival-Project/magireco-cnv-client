.class Lcn/thinkingdata/core/utils/TimeUtil$1;
.super Ljava/lang/ThreadLocal;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/core/utils/TimeUtil;->getDateFormat(Ljava/lang/String;Ljava/util/TimeZone;)Ljava/text/SimpleDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Ljava/text/SimpleDateFormat;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$patten:Ljava/lang/String;

.field final synthetic val$timeZone:Ljava/util/TimeZone;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/core/utils/TimeUtil$1;->val$patten:Ljava/lang/String;

    iput-object p2, p0, Lcn/thinkingdata/core/utils/TimeUtil$1;->val$timeZone:Ljava/util/TimeZone;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/core/utils/TimeUtil$1;->initialValue()Ljava/text/SimpleDateFormat;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Ljava/text/SimpleDateFormat;
    .locals 3

    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v1, p0, Lcn/thinkingdata/core/utils/TimeUtil$1;->val$patten:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v1, p0, Lcn/thinkingdata/core/utils/TimeUtil$1;->val$timeZone:Ljava/util/TimeZone;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v1, v0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_1
    return-object v0
.end method
