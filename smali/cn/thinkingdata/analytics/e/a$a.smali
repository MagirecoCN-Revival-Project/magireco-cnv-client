.class Lcn/thinkingdata/analytics/e/a$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/crash/CrashLogListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/thinkingdata/analytics/e/a;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Lcn/thinkingdata/analytics/e/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFile(Ljava/io/File;)V
    .locals 2

    invoke-static {p1}, Lcn/thinkingdata/analytics/e/a;->a(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcn/thinkingdata/analytics/e/a$a$a;

    invoke-direct {v1, p0, v0, p1}, Lcn/thinkingdata/analytics/e/a$a$a;-><init>(Lcn/thinkingdata/analytics/e/a$a;Ljava/lang/String;Ljava/io/File;)V

    invoke-static {v1}, Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK;->allInstances(Lcn/thinkingdata/analytics/ThinkingAnalyticsSDK$l;)V

    return-void
.end method
