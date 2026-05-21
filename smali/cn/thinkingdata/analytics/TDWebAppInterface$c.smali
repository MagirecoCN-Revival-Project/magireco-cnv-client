.class Lcn/thinkingdata/analytics/TDWebAppInterface$c;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/TDWebAppInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field private a:Z


# direct methods
.method private constructor <init>(Lcn/thinkingdata/analytics/TDWebAppInterface;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcn/thinkingdata/analytics/TDWebAppInterface;Lcn/thinkingdata/analytics/TDWebAppInterface$a;)V
    .locals 0

    invoke-direct {p0, p1}, Lcn/thinkingdata/analytics/TDWebAppInterface$c;-><init>(Lcn/thinkingdata/analytics/TDWebAppInterface;)V

    return-void
.end method


# virtual methods
.method a()Z
    .locals 1

    iget-boolean v0, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$c;->a:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method b()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/thinkingdata/analytics/TDWebAppInterface$c;->a:Z

    return-void
.end method
