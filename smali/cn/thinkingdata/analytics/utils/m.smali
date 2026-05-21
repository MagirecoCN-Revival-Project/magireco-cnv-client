.class public Lcn/thinkingdata/analytics/utils/m;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/utils/d;


# instance fields
.field private final a:Ljava/util/TimeZone;

.field private final b:Ljava/util/Date;

.field private c:Z


# direct methods
.method public constructor <init>(Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/utils/m;->c:Z

    if-nez p1, :cond_0

    new-instance p1, Ljava/util/Date;

    invoke-direct {p1}, Ljava/util/Date;-><init>()V

    :cond_0
    iput-object p1, p0, Lcn/thinkingdata/analytics/utils/m;->b:Ljava/util/Date;

    iput-object p2, p0, Lcn/thinkingdata/analytics/utils/m;->a:Ljava/util/TimeZone;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Double;
    .locals 3

    iget-boolean v0, p0, Lcn/thinkingdata/analytics/utils/m;->c:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/utils/m;->a:Ljava/util/TimeZone;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/thinkingdata/analytics/utils/m;->b:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iget-object v2, p0, Lcn/thinkingdata/analytics/utils/m;->a:Ljava/util/TimeZone;

    invoke-static {v0, v1, v2}, Lcn/thinkingdata/analytics/utils/p;->a(JLjava/util/TimeZone;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public a(Z)V
    .locals 0

    return-void
.end method

.method public b()Ljava/lang/String;
    .locals 3

    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "yyyy-MM-dd HH:mm:ss.SSS"

    :try_start_1
    sget-object v2, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iget-object v1, p0, Lcn/thinkingdata/analytics/utils/m;->a:Ljava/util/TimeZone;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    :cond_0
    iget-object v1, p0, Lcn/thinkingdata/analytics/utils/m;->b:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}\\.\\d{3}"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v0, p0, Lcn/thinkingdata/analytics/utils/m;->b:Ljava/util/Date;

    iget-object v1, p0, Lcn/thinkingdata/analytics/utils/m;->a:Ljava/util/TimeZone;

    invoke-static {v0, v1}, Lcn/thinkingdata/analytics/utils/p;->a(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_1
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public c()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/utils/m;->c:Z

    return-void
.end method
