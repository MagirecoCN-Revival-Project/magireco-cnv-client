.class public final enum Lcom/google/android/gms/internal/gtm/zzao;
.super Ljava/lang/Enum;
.source "com.google.android.gms:play-services-analytics-impl@@17.0.1"

# interfaces
.implements Lcom/google/android/gms/internal/gtm/zzvb;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/internal/gtm/zzao;",
        ">;",
        "Lcom/google/android/gms/internal/gtm/zzvb;"
    }
.end annotation


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzb:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzc:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzd:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zze:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzf:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzg:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzh:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzi:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzj:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzk:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzl:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzm:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzn:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzo:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzp:Lcom/google/android/gms/internal/gtm/zzao;

.field public static final enum zzq:Lcom/google/android/gms/internal/gtm/zzao;

.field private static final zzr:Lcom/google/android/gms/internal/gtm/zzvc;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/gtm/zzvc<",
            "Lcom/google/android/gms/internal/gtm/zzao;",
            ">;"
        }
    .end annotation
.end field

.field private static final synthetic zzs:[Lcom/google/android/gms/internal/gtm/zzao;


# instance fields
.field private final zzt:I


# direct methods
.method static constructor <clinit>()V
    .locals 20

    new-instance v0, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v1, "ESCAPE_HTML"

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1
    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/android/gms/internal/gtm/zzao;->zza:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v1, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v4, "ESCAPE_HTML_RCDATA"

    const/4 v5, 0x2

    .line 2
    invoke-direct {v1, v4, v3, v5}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/android/gms/internal/gtm/zzao;->zzb:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v4, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v6, "ESCAPE_HTML_ATTRIBUTE"

    const/4 v7, 0x3

    .line 3
    invoke-direct {v4, v6, v5, v7}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/android/gms/internal/gtm/zzao;->zzc:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v6, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v8, "ESCAPE_HTML_ATTRIBUTE_NOSPACE"

    const/4 v9, 0x4

    .line 4
    invoke-direct {v6, v8, v7, v9}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/android/gms/internal/gtm/zzao;->zzd:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v8, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v10, "FILTER_HTML_ELEMENT_NAME"

    const/4 v11, 0x5

    .line 5
    invoke-direct {v8, v10, v9, v11}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/google/android/gms/internal/gtm/zzao;->zze:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v10, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v12, "FILTER_HTML_ATTRIBUTES"

    const/4 v13, 0x6

    .line 6
    invoke-direct {v10, v12, v11, v13}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/google/android/gms/internal/gtm/zzao;->zzf:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v12, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v14, "ESCAPE_JS_STRING"

    const/4 v15, 0x7

    .line 7
    invoke-direct {v12, v14, v13, v15}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/google/android/gms/internal/gtm/zzao;->zzg:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v14, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v13, "ESCAPE_JS_VALUE"

    const/16 v11, 0x8

    .line 8
    invoke-direct {v14, v13, v15, v11}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lcom/google/android/gms/internal/gtm/zzao;->zzh:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v13, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v15, "ESCAPE_JS_REGEX"

    const/16 v9, 0x9

    .line 9
    invoke-direct {v13, v15, v11, v9}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lcom/google/android/gms/internal/gtm/zzao;->zzi:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v15, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v11, "ESCAPE_CSS_STRING"

    const/16 v7, 0xa

    .line 10
    invoke-direct {v15, v11, v9, v7}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lcom/google/android/gms/internal/gtm/zzao;->zzj:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v11, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v9, "FILTER_CSS_VALUE"

    const/16 v5, 0xb

    .line 11
    invoke-direct {v11, v9, v7, v5}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/google/android/gms/internal/gtm/zzao;->zzk:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v9, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v7, "ESCAPE_URI"

    const/16 v3, 0xc

    .line 12
    invoke-direct {v9, v7, v5, v3}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/google/android/gms/internal/gtm/zzao;->zzl:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v7, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v5, "NORMALIZE_URI"

    const/16 v2, 0xd

    .line 13
    invoke-direct {v7, v5, v3, v2}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/google/android/gms/internal/gtm/zzao;->zzm:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v5, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v3, "FILTER_NORMALIZE_URI"

    move-object/from16 v17, v7

    const/16 v7, 0xe

    .line 14
    invoke-direct {v5, v3, v2, v7}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/google/android/gms/internal/gtm/zzao;->zzn:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v3, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v2, "NO_AUTOESCAPE"

    move-object/from16 v18, v5

    const/16 v5, 0xf

    .line 15
    invoke-direct {v3, v2, v7, v5}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/android/gms/internal/gtm/zzao;->zzo:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v2, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v7, "TEXT"

    move-object/from16 v19, v3

    const/16 v3, 0x11

    .line 16
    invoke-direct {v2, v7, v5, v3}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/google/android/gms/internal/gtm/zzao;->zzp:Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v7, Lcom/google/android/gms/internal/gtm/zzao;

    const-string v5, "CONVERT_JS_VALUE_TO_EXPRESSION"

    const/16 v3, 0x10

    .line 17
    invoke-direct {v7, v5, v3, v3}, Lcom/google/android/gms/internal/gtm/zzao;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/google/android/gms/internal/gtm/zzao;->zzq:Lcom/google/android/gms/internal/gtm/zzao;

    const/16 v5, 0x11

    new-array v5, v5, [Lcom/google/android/gms/internal/gtm/zzao;

    const/16 v16, 0x0

    aput-object v0, v5, v16

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v4, v5, v0

    const/4 v0, 0x3

    aput-object v6, v5, v0

    const/4 v0, 0x4

    aput-object v8, v5, v0

    const/4 v0, 0x5

    aput-object v10, v5, v0

    const/4 v0, 0x6

    aput-object v12, v5, v0

    const/4 v0, 0x7

    aput-object v14, v5, v0

    const/16 v0, 0x8

    aput-object v13, v5, v0

    const/16 v0, 0x9

    aput-object v15, v5, v0

    const/16 v0, 0xa

    aput-object v11, v5, v0

    const/16 v0, 0xb

    aput-object v9, v5, v0

    const/16 v0, 0xc

    aput-object v17, v5, v0

    const/16 v0, 0xd

    aput-object v18, v5, v0

    const/16 v0, 0xe

    aput-object v19, v5, v0

    const/16 v0, 0xf

    aput-object v2, v5, v0

    aput-object v7, v5, v3

    sput-object v5, Lcom/google/android/gms/internal/gtm/zzao;->zzs:[Lcom/google/android/gms/internal/gtm/zzao;

    new-instance v0, Lcom/google/android/gms/internal/gtm/zzam;

    invoke-direct {v0}, Lcom/google/android/gms/internal/gtm/zzam;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/gtm/zzao;->zzr:Lcom/google/android/gms/internal/gtm/zzvc;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/android/gms/internal/gtm/zzao;->zzt:I

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/gtm/zzao;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzao;->zzs:[Lcom/google/android/gms/internal/gtm/zzao;

    .line 1
    invoke-virtual {v0}, [Lcom/google/android/gms/internal/gtm/zzao;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/gtm/zzao;

    return-object v0
.end method

.method public static zzb(I)Lcom/google/android/gms/internal/gtm/zzao;
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    :pswitch_0
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzp:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_1
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzq:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_2
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzo:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_3
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzn:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_4
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzm:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_5
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzl:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_6
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzk:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_7
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzj:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_8
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzi:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_9
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzh:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_a
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzg:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_b
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzf:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_c
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zze:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_d
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzd:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_e
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzc:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_f
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zzb:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_10
    sget-object p0, Lcom/google/android/gms/internal/gtm/zzao;->zza:Lcom/google/android/gms/internal/gtm/zzao;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static zzc()Lcom/google/android/gms/internal/gtm/zzvd;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/gtm/zzan;->zza:Lcom/google/android/gms/internal/gtm/zzvd;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzao;->zzt:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zza()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/gtm/zzao;->zzt:I

    return v0
.end method
