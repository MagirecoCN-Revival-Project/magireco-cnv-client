.class public Lcn/thinkingdata/analytics/encrypt/b;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0x100

    new-array v1, v0, [B

    sput-object v1, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    sget-object v2, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    const/4 v3, -0x1

    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/16 v0, 0x41

    :goto_1
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_1

    sget-object v1, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    add-int/lit8 v2, v0, -0x41

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    const/16 v0, 0x61

    const/16 v1, 0x61

    :goto_2
    const/16 v2, 0x7a

    if-gt v1, v2, :cond_2

    sget-object v2, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    add-int/lit8 v3, v1, 0x1a

    sub-int/2addr v3, v0

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    const/16 v0, 0x30

    const/16 v1, 0x30

    :goto_3
    const/16 v2, 0x39

    if-gt v1, v2, :cond_3

    sget-object v2, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    add-int/lit8 v3, v1, 0x34

    sub-int/2addr v3, v0

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_3
    sget-object v0, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    const/16 v1, 0x2b

    const/16 v2, 0x3e

    aput-byte v2, v0, v1

    const/16 v1, 0x2f

    const/16 v2, 0x3f

    aput-byte v2, v0, v1

    return-void
.end method

.method public static a(Ljava/lang/String;)[B
    .locals 0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-static {p0}, Lcn/thinkingdata/analytics/encrypt/b;->a([C)[B

    move-result-object p0

    return-object p0
.end method

.method public static a([C)[B
    .locals 10

    array-length v0, p0

    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/16 v4, 0xff

    if-ge v3, v1, :cond_2

    aget-char v5, p0, v3

    if-gt v5, v4, :cond_0

    sget-object v4, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    aget-byte v4, v4, v5

    if-gez v4, :cond_1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    div-int/lit8 v1, v0, 0x4

    const/4 v3, 0x3

    mul-int/lit8 v1, v1, 0x3

    rem-int/lit8 v0, v0, 0x4

    if-ne v0, v3, :cond_3

    add-int/lit8 v1, v1, 0x2

    :cond_3
    const/4 v3, 0x2

    if-ne v0, v3, :cond_4

    add-int/lit8 v1, v1, 0x1

    :cond_4
    new-array v0, v1, [B

    array-length v3, p0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1
    if-ge v2, v3, :cond_7

    aget-char v8, p0, v2

    if-le v8, v4, :cond_5

    const/4 v8, -0x1

    goto :goto_2

    :cond_5
    sget-object v9, Lcn/thinkingdata/analytics/encrypt/b;->a:[B

    aget-byte v8, v9, v8

    :goto_2
    if-ltz v8, :cond_6

    shl-int/lit8 v6, v6, 0x6

    add-int/lit8 v7, v7, 0x6

    or-int/2addr v6, v8

    const/16 v8, 0x8

    if-lt v7, v8, :cond_6

    add-int/lit8 v7, v7, -0x8

    add-int/lit8 v8, v5, 0x1

    shr-int v9, v6, v7

    and-int/2addr v9, v4

    int-to-byte v9, v9

    aput-byte v9, v0, v5

    move v5, v8

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_7
    if-ne v5, v1, :cond_8

    return-object v0

    :cond_8
    new-instance p0, Ljava/lang/Error;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Miscalculated data length (wrote "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " instead of "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw p0
.end method
