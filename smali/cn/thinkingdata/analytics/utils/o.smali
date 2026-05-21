.class public Lcn/thinkingdata/analytics/utils/o;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcn/thinkingdata/analytics/utils/d;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/Double;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Double;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/utils/o;->a:Ljava/lang/String;

    iput-object p2, p0, Lcn/thinkingdata/analytics/utils/o;->b:Ljava/lang/Double;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Double;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/utils/o;->b:Ljava/lang/Double;

    return-object v0
.end method

.method public b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/utils/o;->a:Ljava/lang/String;

    return-object v0
.end method
