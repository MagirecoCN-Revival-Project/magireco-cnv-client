.class public Lcn/thinkingdata/analytics/g/o;
.super Lcn/thinkingdata/analytics/g/i;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcn/thinkingdata/analytics/g/i<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Future;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "Landroid/content/SharedPreferences;",
            ">;)V"
        }
    .end annotation

    const-string v0, "loginID"

    invoke-direct {p0, p1, v0}, Lcn/thinkingdata/analytics/g/i;-><init>(Ljava/util/concurrent/Future;Ljava/lang/String;)V

    return-void
.end method
