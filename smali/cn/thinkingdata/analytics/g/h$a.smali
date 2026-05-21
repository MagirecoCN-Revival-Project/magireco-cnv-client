.class Lcn/thinkingdata/analytics/g/h$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/g/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Landroid/content/SharedPreferences;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/g/h$a;->a:Landroid/content/Context;

    iput-object p2, p0, Lcn/thinkingdata/analytics/g/h$a;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public call()Landroid/content/SharedPreferences;
    .locals 3

    iget-object v0, p0, Lcn/thinkingdata/analytics/g/h$a;->a:Landroid/content/Context;

    iget-object v1, p0, Lcn/thinkingdata/analytics/g/h$a;->b:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcn/thinkingdata/analytics/g/h$a;->call()Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method
