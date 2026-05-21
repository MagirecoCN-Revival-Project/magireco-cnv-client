.class public Lcn/thinkingdata/analytics/utils/a;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static b:Lcn/thinkingdata/analytics/utils/c;

.field private static final c:Ljava/util/concurrent/locks/ReentrantReadWriteLock;


# instance fields
.field private final a:Lcn/thinkingdata/analytics/TDConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/utils/a;->c:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    return-void
.end method

.method public constructor <init>(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/thinkingdata/analytics/utils/a;->a:Lcn/thinkingdata/analytics/TDConfig;

    return-void
.end method

.method public static a(J)V
    .locals 1

    new-instance v0, Lcn/thinkingdata/analytics/utils/h;

    invoke-direct {v0, p0, p1}, Lcn/thinkingdata/analytics/utils/h;-><init>(J)V

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/a;->a(Lcn/thinkingdata/analytics/utils/c;)V

    return-void
.end method

.method private static a(Lcn/thinkingdata/analytics/utils/c;)V
    .locals 2

    sget-object v0, Lcn/thinkingdata/analytics/utils/a;->c:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    sget-object v1, Lcn/thinkingdata/analytics/utils/a;->b:Lcn/thinkingdata/analytics/utils/c;

    if-nez v1, :cond_0

    sput-object p0, Lcn/thinkingdata/analytics/utils/a;->b:Lcn/thinkingdata/analytics/utils/c;

    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    return-void
.end method

.method public static varargs a([Ljava/lang/String;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcn/thinkingdata/analytics/utils/i;

    invoke-direct {v0, p0}, Lcn/thinkingdata/analytics/utils/i;-><init>([Ljava/lang/String;)V

    invoke-static {v0}, Lcn/thinkingdata/analytics/utils/a;->a(Lcn/thinkingdata/analytics/utils/c;)V

    return-void
.end method

.method public static b()Lcn/thinkingdata/analytics/utils/c;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/utils/a;->b:Lcn/thinkingdata/analytics/utils/c;

    return-object v0
.end method


# virtual methods
.method public a()Lcn/thinkingdata/analytics/utils/d;
    .locals 4

    sget-object v0, Lcn/thinkingdata/analytics/utils/a;->c:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    sget-object v1, Lcn/thinkingdata/analytics/utils/a;->b:Lcn/thinkingdata/analytics/utils/c;

    if-eqz v1, :cond_0

    new-instance v2, Lcn/thinkingdata/analytics/utils/n;

    iget-object v3, p0, Lcn/thinkingdata/analytics/utils/a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcn/thinkingdata/analytics/utils/n;-><init>(Lcn/thinkingdata/analytics/utils/c;Ljava/util/TimeZone;)V

    goto :goto_0

    :cond_0
    new-instance v2, Lcn/thinkingdata/analytics/utils/m;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    iget-object v3, p0, Lcn/thinkingdata/analytics/utils/a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcn/thinkingdata/analytics/utils/m;-><init>(Ljava/util/Date;Ljava/util/TimeZone;)V

    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    return-object v2
.end method

.method public a(Ljava/util/Date;Ljava/util/TimeZone;)Lcn/thinkingdata/analytics/utils/d;
    .locals 1

    if-nez p2, :cond_0

    new-instance p2, Lcn/thinkingdata/analytics/utils/m;

    iget-object v0, p0, Lcn/thinkingdata/analytics/utils/a;->a:Lcn/thinkingdata/analytics/TDConfig;

    invoke-virtual {v0}, Lcn/thinkingdata/analytics/TDConfig;->getDefaultTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    invoke-direct {p2, p1, v0}, Lcn/thinkingdata/analytics/utils/m;-><init>(Ljava/util/Date;Ljava/util/TimeZone;)V

    invoke-virtual {p2}, Lcn/thinkingdata/analytics/utils/m;->c()V

    return-object p2

    :cond_0
    new-instance v0, Lcn/thinkingdata/analytics/utils/m;

    invoke-direct {v0, p1, p2}, Lcn/thinkingdata/analytics/utils/m;-><init>(Ljava/util/Date;Ljava/util/TimeZone;)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lcn/thinkingdata/analytics/utils/m;->a(Z)V

    return-object v0
.end method
