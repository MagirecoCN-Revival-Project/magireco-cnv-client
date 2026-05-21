.class public Lcz/msebera/android/httpclient/conn/routing/BasicRouteDirector;
.super Ljava/lang/Object;
.source "BasicRouteDirector.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/routing/HttpRouteDirector;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected directStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I
    .locals 3

    .line 96
    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-le v0, v2, :cond_0

    return v1

    .line 99
    :cond_0
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 110
    :cond_1
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isSecure()Z

    move-result v0

    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isSecure()Z

    move-result v2

    if-eq v0, v2, :cond_2

    return v1

    .line 115
    :cond_2
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 116
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object p1

    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v1

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method protected firstStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I
    .locals 1

    .line 80
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result p1

    const/4 v0, 0x1

    if-le p1, v0, :cond_0

    const/4 v0, 0x2

    :cond_0
    return v0
.end method

.method public nextStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I
    .locals 2

    const-string v0, "Planned route"

    .line 54
    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    if-eqz p2, :cond_2

    .line 58
    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 60
    :cond_0
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v0

    if-le v0, v1, :cond_1

    .line 61
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/conn/routing/BasicRouteDirector;->proxiedStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I

    move-result p1

    goto :goto_1

    .line 63
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/conn/routing/BasicRouteDirector;->directStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I

    move-result p1

    goto :goto_1

    .line 59
    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/conn/routing/BasicRouteDirector;->firstStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I

    move-result p1

    :goto_1
    return p1
.end method

.method protected proxiedStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I
    .locals 7

    .line 136
    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-gt v0, v1, :cond_0

    return v2

    .line 139
    :cond_0
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return v2

    .line 142
    :cond_1
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v0

    .line 143
    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    return v2

    :cond_2
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    add-int/lit8 v5, v1, -0x1

    if-ge v4, v5, :cond_4

    .line 149
    invoke-interface {p1, v4}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopTarget(I)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v5

    invoke-interface {p2, v4}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getHopTarget(I)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    return v2

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    if-le v0, v1, :cond_5

    const/4 p1, 0x4

    return p1

    .line 160
    :cond_5
    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 161
    :cond_6
    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isLayered()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isLayered()Z

    move-result v0

    if-nez v0, :cond_8

    :cond_7
    return v2

    .line 165
    :cond_8
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v0

    if-nez v0, :cond_9

    const/4 p1, 0x3

    return p1

    .line 168
    :cond_9
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isLayered()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isLayered()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 p1, 0x5

    return p1

    .line 175
    :cond_a
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isSecure()Z

    move-result p1

    invoke-interface {p2}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isSecure()Z

    move-result p2

    if-eq p1, p2, :cond_b

    return v2

    :cond_b
    return v3
.end method
