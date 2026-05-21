.class public final enum Lcn/thinkingdata/analytics/f/c$c;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/f/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/thinkingdata/analytics/f/c$c;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum b:Lcn/thinkingdata/analytics/f/c$c;

.field private static final synthetic c:[Lcn/thinkingdata/analytics/f/c$c;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcn/thinkingdata/analytics/f/c$c;

    const-string v1, "EVENTS"

    const/4 v2, 0x0

    const-string v3, "events"

    invoke-direct {v0, v1, v2, v3}, Lcn/thinkingdata/analytics/f/c$c;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcn/thinkingdata/analytics/f/c$c;->b:Lcn/thinkingdata/analytics/f/c$c;

    const/4 v1, 0x1

    new-array v1, v1, [Lcn/thinkingdata/analytics/f/c$c;

    aput-object v0, v1, v2

    sput-object v1, Lcn/thinkingdata/analytics/f/c$c;->c:[Lcn/thinkingdata/analytics/f/c$c;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcn/thinkingdata/analytics/f/c$c;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcn/thinkingdata/analytics/f/c$c;
    .locals 1

    const-class v0, Lcn/thinkingdata/analytics/f/c$c;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/f/c$c;

    return-object p0
.end method

.method public static values()[Lcn/thinkingdata/analytics/f/c$c;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/f/c$c;->c:[Lcn/thinkingdata/analytics/f/c$c;

    invoke-virtual {v0}, [Lcn/thinkingdata/analytics/f/c$c;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/thinkingdata/analytics/f/c$c;

    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/f/c$c;->a:Ljava/lang/String;

    return-object v0
.end method
