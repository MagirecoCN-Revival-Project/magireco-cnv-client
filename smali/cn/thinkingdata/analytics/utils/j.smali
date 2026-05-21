.class public final enum Lcn/thinkingdata/analytics/utils/j;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/thinkingdata/analytics/utils/j;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum b:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum c:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum d:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum e:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum f:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum g:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum h:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum i:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum j:Lcn/thinkingdata/analytics/utils/j;

.field public static final enum k:Lcn/thinkingdata/analytics/utils/j;

.field private static final l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcn/thinkingdata/analytics/utils/j;",
            ">;"
        }
    .end annotation
.end field

.field private static final synthetic m:[Lcn/thinkingdata/analytics/utils/j;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lcn/thinkingdata/analytics/utils/j;

    const-string v1, "TRACK"

    const/4 v2, 0x0

    const-string v3, "track"

    invoke-direct {v0, v1, v2, v3}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcn/thinkingdata/analytics/utils/j;->b:Lcn/thinkingdata/analytics/utils/j;

    new-instance v1, Lcn/thinkingdata/analytics/utils/j;

    const-string v3, "TRACK_UPDATE"

    const/4 v4, 0x1

    const-string v5, "track_update"

    invoke-direct {v1, v3, v4, v5}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcn/thinkingdata/analytics/utils/j;->c:Lcn/thinkingdata/analytics/utils/j;

    new-instance v3, Lcn/thinkingdata/analytics/utils/j;

    const-string v5, "TRACK_OVERWRITE"

    const/4 v6, 0x2

    const-string v7, "track_overwrite"

    invoke-direct {v3, v5, v6, v7}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcn/thinkingdata/analytics/utils/j;->d:Lcn/thinkingdata/analytics/utils/j;

    new-instance v5, Lcn/thinkingdata/analytics/utils/j;

    const-string v7, "USER_ADD"

    const/4 v8, 0x3

    const-string v9, "user_add"

    invoke-direct {v5, v7, v8, v9}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcn/thinkingdata/analytics/utils/j;->e:Lcn/thinkingdata/analytics/utils/j;

    new-instance v7, Lcn/thinkingdata/analytics/utils/j;

    const-string v9, "USER_SET"

    const/4 v10, 0x4

    const-string v11, "user_set"

    invoke-direct {v7, v9, v10, v11}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcn/thinkingdata/analytics/utils/j;->f:Lcn/thinkingdata/analytics/utils/j;

    new-instance v9, Lcn/thinkingdata/analytics/utils/j;

    const-string v11, "USER_SET_ONCE"

    const/4 v12, 0x5

    const-string v13, "user_setOnce"

    invoke-direct {v9, v11, v12, v13}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v9, Lcn/thinkingdata/analytics/utils/j;->g:Lcn/thinkingdata/analytics/utils/j;

    new-instance v11, Lcn/thinkingdata/analytics/utils/j;

    const-string v13, "USER_UNSET"

    const/4 v14, 0x6

    const-string v15, "user_unset"

    invoke-direct {v11, v13, v14, v15}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v11, Lcn/thinkingdata/analytics/utils/j;->h:Lcn/thinkingdata/analytics/utils/j;

    new-instance v13, Lcn/thinkingdata/analytics/utils/j;

    const-string v15, "USER_APPEND"

    const/4 v14, 0x7

    const-string v12, "user_append"

    invoke-direct {v13, v15, v14, v12}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v13, Lcn/thinkingdata/analytics/utils/j;->i:Lcn/thinkingdata/analytics/utils/j;

    new-instance v12, Lcn/thinkingdata/analytics/utils/j;

    const-string v15, "USER_DEL"

    const/16 v14, 0x8

    const-string v10, "user_del"

    invoke-direct {v12, v15, v14, v10}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v12, Lcn/thinkingdata/analytics/utils/j;->j:Lcn/thinkingdata/analytics/utils/j;

    new-instance v10, Lcn/thinkingdata/analytics/utils/j;

    const-string v15, "USER_UNIQ_APPEND"

    const/16 v14, 0x9

    const-string v8, "user_uniq_append"

    invoke-direct {v10, v15, v14, v8}, Lcn/thinkingdata/analytics/utils/j;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v10, Lcn/thinkingdata/analytics/utils/j;->k:Lcn/thinkingdata/analytics/utils/j;

    const/16 v8, 0xa

    new-array v8, v8, [Lcn/thinkingdata/analytics/utils/j;

    aput-object v0, v8, v2

    aput-object v1, v8, v4

    aput-object v3, v8, v6

    const/4 v0, 0x3

    aput-object v5, v8, v0

    const/4 v0, 0x4

    aput-object v7, v8, v0

    const/4 v0, 0x5

    aput-object v9, v8, v0

    const/4 v0, 0x6

    aput-object v11, v8, v0

    const/4 v0, 0x7

    aput-object v13, v8, v0

    const/16 v0, 0x8

    aput-object v12, v8, v0

    aput-object v10, v8, v14

    sput-object v8, Lcn/thinkingdata/analytics/utils/j;->m:[Lcn/thinkingdata/analytics/utils/j;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcn/thinkingdata/analytics/utils/j;->l:Ljava/util/Map;

    invoke-static {}, Lcn/thinkingdata/analytics/utils/j;->values()[Lcn/thinkingdata/analytics/utils/j;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    sget-object v4, Lcn/thinkingdata/analytics/utils/j;->l:Ljava/util/Map;

    invoke-virtual {v3}, Lcn/thinkingdata/analytics/utils/j;->a()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
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

    iput-object p3, p0, Lcn/thinkingdata/analytics/utils/j;->a:Ljava/lang/String;

    return-void
.end method

.method public static a(Ljava/lang/String;)Lcn/thinkingdata/analytics/utils/j;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->l:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/utils/j;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcn/thinkingdata/analytics/utils/j;
    .locals 1

    const-class v0, Lcn/thinkingdata/analytics/utils/j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcn/thinkingdata/analytics/utils/j;

    return-object p0
.end method

.method public static values()[Lcn/thinkingdata/analytics/utils/j;
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->m:[Lcn/thinkingdata/analytics/utils/j;

    invoke-virtual {v0}, [Lcn/thinkingdata/analytics/utils/j;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/thinkingdata/analytics/utils/j;

    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/thinkingdata/analytics/utils/j;->a:Ljava/lang/String;

    return-object v0
.end method

.method public b()Z
    .locals 1

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->b:Lcn/thinkingdata/analytics/utils/j;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->d:Lcn/thinkingdata/analytics/utils/j;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcn/thinkingdata/analytics/utils/j;->c:Lcn/thinkingdata/analytics/utils/j;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
