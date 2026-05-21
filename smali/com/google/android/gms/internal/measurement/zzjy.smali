.class public final Lcom/google/android/gms/internal/measurement/zzjy;
.super Lcom/google/android/gms/internal/measurement/zzjr;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/measurement/zzjs;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/measurement/zzjr;-><init>(Lcom/google/android/gms/internal/measurement/zzjs;)V

    return-void
.end method

.method public static zza(Lcom/google/android/gms/internal/measurement/zzkp;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzkq;
    .locals 4

    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/zzkp;->zzatm:[Lcom/google/android/gms/internal/measurement/zzkq;

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    iget-object v3, v2, Lcom/google/android/gms/internal/measurement/zzkq;->name:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static zza(Ljava/lang/StringBuilder;I)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    const-string v1, "  "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/measurement/zzkh;)V
    .locals 7

    if-nez p3, :cond_0

    return-void

    :cond_0
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v0, "filter {\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p3, Lcom/google/android/gms/internal/measurement/zzkh;->zzasj:Ljava/lang/Boolean;

    const-string v1, "complement"

    invoke-static {p1, p2, v1, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgb()Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v0

    iget-object v1, p3, Lcom/google/android/gms/internal/measurement/zzkh;->zzask:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/measurement/zzff;->zzbj(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "param_name"

    invoke-static {p1, p2, v1, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 v0, p2, 0x1

    iget-object v1, p3, Lcom/google/android/gms/internal/measurement/zzkh;->zzash:Lcom/google/android/gms/internal/measurement/zzkk;

    const-string v2, "}\n"

    if-eqz v1, :cond_4

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v3, "string_filter"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " {\n"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/google/android/gms/internal/measurement/zzkk;->zzast:Ljava/lang/Integer;

    if-eqz v3, :cond_1

    iget-object v3, v1, Lcom/google/android/gms/internal/measurement/zzkk;->zzast:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    const-string v3, "UNKNOWN_MATCH_TYPE"

    goto :goto_0

    :pswitch_0
    const-string v3, "IN_LIST"

    goto :goto_0

    :pswitch_1
    const-string v3, "EXACT"

    goto :goto_0

    :pswitch_2
    const-string v3, "PARTIAL"

    goto :goto_0

    :pswitch_3
    const-string v3, "ENDS_WITH"

    goto :goto_0

    :pswitch_4
    const-string v3, "BEGINS_WITH"

    goto :goto_0

    :pswitch_5
    const-string v3, "REGEXP"

    :goto_0
    const-string v4, "match_type"

    invoke-static {p1, v0, v4, v3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    :cond_1
    iget-object v3, v1, Lcom/google/android/gms/internal/measurement/zzkk;->zzasu:Ljava/lang/String;

    const-string v4, "expression"

    invoke-static {p1, v0, v4, v3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v3, v1, Lcom/google/android/gms/internal/measurement/zzkk;->zzasv:Ljava/lang/Boolean;

    const-string v4, "case_sensitive"

    invoke-static {p1, v0, v4, v3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v3, v1, Lcom/google/android/gms/internal/measurement/zzkk;->zzasw:[Ljava/lang/String;

    array-length v3, v3

    if-lez v3, :cond_3

    add-int/lit8 v3, v0, 0x1

    invoke-static {p1, v3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v3, "expression_list {\n"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/google/android/gms/internal/measurement/zzkk;->zzasw:[Ljava/lang/String;

    array-length v3, v1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_2

    aget-object v5, v1, v4

    add-int/lit8 v6, v0, 0x2

    invoke-static {p1, v6}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    iget-object p3, p3, Lcom/google/android/gms/internal/measurement/zzkh;->zzasi:Lcom/google/android/gms/internal/measurement/zzki;

    const-string v1, "number_filter"

    invoke-direct {p0, p1, v0, v1, p3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/measurement/zzki;)V

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/measurement/zzki;)V
    .locals 1

    if-nez p4, :cond_0

    return-void

    :cond_0
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " {\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p4, Lcom/google/android/gms/internal/measurement/zzki;->zzasl:Ljava/lang/Integer;

    if-eqz p3, :cond_5

    iget-object p3, p4, Lcom/google/android/gms/internal/measurement/zzki;->zzasl:Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const/4 v0, 0x1

    if-eq p3, v0, :cond_4

    const/4 v0, 0x2

    if-eq p3, v0, :cond_3

    const/4 v0, 0x3

    if-eq p3, v0, :cond_2

    const/4 v0, 0x4

    if-eq p3, v0, :cond_1

    const-string p3, "UNKNOWN_COMPARISON_TYPE"

    goto :goto_0

    :cond_1
    const-string p3, "BETWEEN"

    goto :goto_0

    :cond_2
    const-string p3, "EQUAL"

    goto :goto_0

    :cond_3
    const-string p3, "GREATER_THAN"

    goto :goto_0

    :cond_4
    const-string p3, "LESS_THAN"

    :goto_0
    const-string v0, "comparison_type"

    invoke-static {p1, p2, v0, p3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    :cond_5
    iget-object p3, p4, Lcom/google/android/gms/internal/measurement/zzki;->zzasm:Ljava/lang/Boolean;

    const-string v0, "match_as_float"

    invoke-static {p1, p2, v0, p3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object p3, p4, Lcom/google/android/gms/internal/measurement/zzki;->zzasn:Ljava/lang/String;

    const-string v0, "comparison_value"

    invoke-static {p1, p2, v0, p3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object p3, p4, Lcom/google/android/gms/internal/measurement/zzki;->zzaso:Ljava/lang/String;

    const-string v0, "min_comparison_value"

    invoke-static {p1, p2, v0, p3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object p3, p4, Lcom/google/android/gms/internal/measurement/zzki;->zzasp:Ljava/lang/String;

    const-string p4, "max_comparison_value"

    invoke-static {p1, p2, p4, p3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string p2, "}\n"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private static zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/measurement/zzkt;)V
    .locals 9

    if-nez p3, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x3

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " {\n"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p3, Lcom/google/android/gms/internal/measurement/zzkt;->zzaux:[J

    const-string v0, ", "

    const/16 v1, 0xa

    const/4 v2, 0x4

    const/4 v3, 0x0

    if-eqz p2, :cond_3

    invoke-static {p0, v2}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string p2, "results: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p3, Lcom/google/android/gms/internal/measurement/zzkt;->zzaux:[J

    array-length v4, p2

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v5, v4, :cond_2

    aget-wide v7, p2, v5

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    add-int/lit8 v8, v6, 0x1

    if-eqz v6, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v5, 0x1

    move v6, v8

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3
    iget-object p2, p3, Lcom/google/android/gms/internal/measurement/zzkt;->zzauw:[J

    if-eqz p2, :cond_6

    invoke-static {p0, v2}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string p2, "status: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p3, Lcom/google/android/gms/internal/measurement/zzkt;->zzauw:[J

    array-length p3, p2

    const/4 v2, 0x0

    :goto_1
    if-ge v3, p3, :cond_5

    aget-wide v4, p2, v3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    add-int/lit8 v5, v2, 0x1

    if-eqz v2, :cond_4

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    move v2, v5

    goto :goto_1

    :cond_5
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_6
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string p1, "}\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private static zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V
    .locals 0

    if-nez p3, :cond_0

    return-void

    :cond_0
    add-int/lit8 p1, p1, 0x1

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method static zza([Lcom/google/android/gms/internal/measurement/zzkq;Ljava/lang/String;Ljava/lang/Object;)[Lcom/google/android/gms/internal/measurement/zzkq;
    .locals 5

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_4

    aget-object v3, p0, v2

    iget-object v4, v3, Lcom/google/android/gms/internal/measurement/zzkq;->name:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 p1, 0x0

    iput-object p1, v3, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    iput-object p1, v3, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    iput-object p1, v3, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    instance-of p1, p2, Ljava/lang/Long;

    if-eqz p1, :cond_0

    check-cast p2, Ljava/lang/Long;

    iput-object p2, v3, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    goto :goto_1

    :cond_0
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_1

    check-cast p2, Ljava/lang/String;

    iput-object p2, v3, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    goto :goto_1

    :cond_1
    instance-of p1, p2, Ljava/lang/Double;

    if-eqz p1, :cond_2

    check-cast p2, Ljava/lang/Double;

    iput-object p2, v3, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    :cond_2
    :goto_1
    return-object p0

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/internal/measurement/zzkq;

    array-length v2, p0

    invoke-static {p0, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    new-instance v1, Lcom/google/android/gms/internal/measurement/zzkq;

    invoke-direct {v1}, Lcom/google/android/gms/internal/measurement/zzkq;-><init>()V

    iput-object p1, v1, Lcom/google/android/gms/internal/measurement/zzkq;->name:Ljava/lang/String;

    instance-of p1, p2, Ljava/lang/Long;

    if-eqz p1, :cond_5

    check-cast p2, Ljava/lang/Long;

    iput-object p2, v1, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    goto :goto_2

    :cond_5
    instance-of p1, p2, Ljava/lang/String;

    if-eqz p1, :cond_6

    check-cast p2, Ljava/lang/String;

    iput-object p2, v1, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    goto :goto_2

    :cond_6
    instance-of p1, p2, Ljava/lang/Double;

    if-eqz p1, :cond_7

    check-cast p2, Ljava/lang/Double;

    iput-object p2, v1, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    :cond_7
    :goto_2
    array-length p0, p0

    aput-object v1, v0, p0

    return-object v0
.end method

.method public static zzb(Lcom/google/android/gms/internal/measurement/zzkp;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Lcom/google/android/gms/internal/measurement/zzkp;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzkq;

    move-result-object p0

    if-eqz p0, :cond_2

    iget-object p1, p0, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    return-object p0

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    if-eqz p1, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    return-object p0

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    if-eqz p1, :cond_2

    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final bridge synthetic getContext()Landroid/content/Context;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method protected final zza(Lcom/google/android/gms/internal/measurement/zzkg;)Ljava/lang/String;
    .locals 6

    if-nez p1, :cond_0

    const-string p1, "null"

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nevent_filter {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/google/android/gms/internal/measurement/zzkg;->zzasb:Ljava/lang/Integer;

    const/4 v2, 0x0

    const-string v3, "filter_id"

    invoke-static {v0, v2, v3, v1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgb()Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v1

    iget-object v3, p1, Lcom/google/android/gms/internal/measurement/zzkg;->zzasc:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/measurement/zzff;->zzbi(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "event_name"

    invoke-static {v0, v2, v3, v1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p1, Lcom/google/android/gms/internal/measurement/zzkg;->zzasf:Lcom/google/android/gms/internal/measurement/zzki;

    const/4 v3, 0x1

    const-string v4, "event_count_filter"

    invoke-direct {p0, v0, v3, v4, v1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/measurement/zzki;)V

    const-string v1, "  filters {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/google/android/gms/internal/measurement/zzkg;->zzasd:[Lcom/google/android/gms/internal/measurement/zzkh;

    array-length v1, p1

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v4, p1, v2

    const/4 v5, 0x2

    invoke-direct {p0, v0, v5, v4}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/measurement/zzkh;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-static {v0, v3}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string p1, "}\n}\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final zza(Lcom/google/android/gms/internal/measurement/zzkj;)Ljava/lang/String;
    .locals 4

    if-nez p1, :cond_0

    const-string p1, "null"

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nproperty_filter {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/google/android/gms/internal/measurement/zzkj;->zzasb:Ljava/lang/Integer;

    const/4 v2, 0x0

    const-string v3, "filter_id"

    invoke-static {v0, v2, v3, v1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgb()Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v1

    iget-object v3, p1, Lcom/google/android/gms/internal/measurement/zzkj;->zzasr:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/measurement/zzff;->zzbk(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "property_name"

    invoke-static {v0, v2, v3, v1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    const/4 v1, 0x1

    iget-object p1, p1, Lcom/google/android/gms/internal/measurement/zzkj;->zzass:Lcom/google/android/gms/internal/measurement/zzkh;

    invoke-direct {p0, v0, v1, p1}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILcom/google/android/gms/internal/measurement/zzkh;)V

    const-string p1, "}\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final zza(Lcom/google/android/gms/internal/measurement/zzkq;Ljava/lang/Object;)V
    .locals 1

    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    iput-object v0, p1, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    iput-object v0, p1, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/lang/String;

    iput-object p2, p1, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    return-void

    :cond_0
    instance-of v0, p2, Ljava/lang/Long;

    if-eqz v0, :cond_1

    check-cast p2, Ljava/lang/Long;

    iput-object p2, p1, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    return-void

    :cond_1
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_2

    check-cast p2, Ljava/lang/Double;

    iput-object p2, p1, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgf()Lcom/google/android/gms/internal/measurement/zzfh;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfh;->zzis()Lcom/google/android/gms/internal/measurement/zzfj;

    move-result-object p1

    const-string v0, "Ignoring invalid (type) event param value"

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/measurement/zzfj;->zzg(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/measurement/zzku;Ljava/lang/Object;)V
    .locals 1

    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/google/android/gms/internal/measurement/zzku;->zzajo:Ljava/lang/String;

    iput-object v0, p1, Lcom/google/android/gms/internal/measurement/zzku;->zzatq:Ljava/lang/Long;

    iput-object v0, p1, Lcom/google/android/gms/internal/measurement/zzku;->zzaro:Ljava/lang/Double;

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    check-cast p2, Ljava/lang/String;

    iput-object p2, p1, Lcom/google/android/gms/internal/measurement/zzku;->zzajo:Ljava/lang/String;

    return-void

    :cond_0
    instance-of v0, p2, Ljava/lang/Long;

    if-eqz v0, :cond_1

    check-cast p2, Ljava/lang/Long;

    iput-object p2, p1, Lcom/google/android/gms/internal/measurement/zzku;->zzatq:Ljava/lang/Long;

    return-void

    :cond_1
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_2

    check-cast p2, Ljava/lang/Double;

    iput-object p2, p1, Lcom/google/android/gms/internal/measurement/zzku;->zzaro:Ljava/lang/Double;

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgf()Lcom/google/android/gms/internal/measurement/zzfh;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzfh;->zzis()Lcom/google/android/gms/internal/measurement/zzfj;

    move-result-object p1

    const-string v0, "Ignoring invalid (type) user attribute value"

    invoke-virtual {p1, v0, p2}, Lcom/google/android/gms/internal/measurement/zzfj;->zzg(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/measurement/zzkr;)[B
    .locals 3

    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzacg;->zzvv()I

    move-result v0

    new-array v1, v0, [B

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/measurement/zzaby;->zzb([BII)Lcom/google/android/gms/internal/measurement/zzaby;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/measurement/zzacg;->zza(Lcom/google/android/gms/internal/measurement/zzaby;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzaby;->zzvn()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgf()Lcom/google/android/gms/internal/measurement/zzfh;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzfh;->zzis()Lcom/google/android/gms/internal/measurement/zzfj;

    move-result-object v0

    const-string v1, "Data loss. Failed to serialize batch"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/measurement/zzfj;->zzg(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public final bridge synthetic zzab()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzab()V

    return-void
.end method

.method protected final zzb(Lcom/google/android/gms/internal/measurement/zzkr;)Ljava/lang/String;
    .locals 18

    move-object/from16 v0, p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\nbatch {\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lcom/google/android/gms/internal/measurement/zzkr;->zzatr:[Lcom/google/android/gms/internal/measurement/zzks;

    const-string v3, "}\n"

    if-eqz v2, :cond_b

    iget-object v0, v0, Lcom/google/android/gms/internal/measurement/zzkr;->zzatr:[Lcom/google/android/gms/internal/measurement/zzks;

    array-length v2, v0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v2, :cond_b

    aget-object v6, v0, v5

    if-eqz v6, :cond_a

    if-eqz v6, :cond_a

    const/4 v7, 0x1

    invoke-static {v1, v7}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v8, "bundle {\n"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzatt:Ljava/lang/Integer;

    const-string v9, "protocol_version"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaub:Ljava/lang/String;

    const-string v9, "platform"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauf:Ljava/lang/Long;

    const-string v9, "gmp_version"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaug:Ljava/lang/Long;

    const-string v9, "uploading_gmp_version"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaur:Ljava/lang/Long;

    const-string v9, "config_version"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzadm:Ljava/lang/String;

    const-string v9, "gmp_app_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzti:Ljava/lang/String;

    const-string v9, "app_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzth:Ljava/lang/String;

    const-string v9, "app_version"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaun:Ljava/lang/Integer;

    const-string v9, "app_version_major"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzado:Ljava/lang/String;

    const-string v9, "firebase_instance_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauj:Ljava/lang/Long;

    const-string v9, "dev_cert_hash"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzadt:Ljava/lang/String;

    const-string v9, "app_store"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzatw:Ljava/lang/Long;

    const-string v9, "upload_timestamp_millis"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzatx:Ljava/lang/Long;

    const-string v9, "start_timestamp_millis"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaty:Ljava/lang/Long;

    const-string v9, "end_timestamp_millis"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzatz:Ljava/lang/Long;

    const-string v9, "previous_bundle_start_timestamp_millis"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaua:Ljava/lang/Long;

    const-string v9, "previous_bundle_end_timestamp_millis"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzadl:Ljava/lang/String;

    const-string v9, "app_instance_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauh:Ljava/lang/String;

    const-string v9, "resettable_device_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauq:Ljava/lang/String;

    const-string v9, "device_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaut:Ljava/lang/String;

    const-string v9, "ds_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaui:Ljava/lang/Boolean;

    const-string v9, "limited_ad_tracking"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauc:Ljava/lang/String;

    const-string v9, "os_version"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaud:Ljava/lang/String;

    const-string v9, "device_model"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzafo:Ljava/lang/String;

    const-string v9, "user_default_language"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaue:Ljava/lang/Integer;

    const-string v9, "time_zone_offset_minutes"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauk:Ljava/lang/Integer;

    const-string v9, "bundle_sequential_index"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaul:Ljava/lang/Boolean;

    const-string v9, "service_upload"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaek:Ljava/lang/String;

    const-string v9, "health_monitor"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaus:Ljava/lang/Long;

    if-eqz v8, :cond_0

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaus:Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-eqz v12, :cond_0

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaus:Ljava/lang/Long;

    const-string v9, "android_id"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    :cond_0
    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauv:Ljava/lang/Integer;

    if-eqz v8, :cond_1

    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzauv:Ljava/lang/Integer;

    const-string v9, "retry_counter"

    invoke-static {v1, v7, v9, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    :cond_1
    iget-object v8, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzatv:[Lcom/google/android/gms/internal/measurement/zzku;

    const-string v9, "double_value"

    const-string v10, "int_value"

    const-string v11, "string_value"

    const-string v12, "name"

    const/4 v13, 0x2

    if-eqz v8, :cond_3

    array-length v14, v8

    const/4 v15, 0x0

    :goto_1
    if-ge v15, v14, :cond_3

    aget-object v4, v8, v15

    if-eqz v4, :cond_2

    invoke-static {v1, v13}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v7, "user_property {\n"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v4, Lcom/google/android/gms/internal/measurement/zzku;->zzauz:Ljava/lang/Long;

    move-object/from16 v16, v0

    const-string v0, "set_timestamp_millis"

    invoke-static {v1, v13, v0, v7}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgb()Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v0

    iget-object v7, v4, Lcom/google/android/gms/internal/measurement/zzku;->name:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lcom/google/android/gms/internal/measurement/zzff;->zzbk(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v13, v12, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, v4, Lcom/google/android/gms/internal/measurement/zzku;->zzajo:Ljava/lang/String;

    invoke-static {v1, v13, v11, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, v4, Lcom/google/android/gms/internal/measurement/zzku;->zzatq:Ljava/lang/Long;

    invoke-static {v1, v13, v10, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, v4, Lcom/google/android/gms/internal/measurement/zzku;->zzaro:Ljava/lang/Double;

    invoke-static {v1, v13, v9, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-static {v1, v13}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_2
    move-object/from16 v16, v0

    :goto_2
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, v16

    const/4 v7, 0x1

    goto :goto_1

    :cond_3
    move-object/from16 v16, v0

    iget-object v0, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzaum:[Lcom/google/android/gms/internal/measurement/zzko;

    if-eqz v0, :cond_5

    array-length v4, v0

    const/4 v7, 0x0

    :goto_3
    if-ge v7, v4, :cond_5

    aget-object v8, v0, v7

    if-eqz v8, :cond_4

    invoke-static {v1, v13}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v14, "audience_membership {\n"

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v8, Lcom/google/android/gms/internal/measurement/zzko;->zzarx:Ljava/lang/Integer;

    const-string v15, "audience_id"

    invoke-static {v1, v13, v15, v14}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v14, v8, Lcom/google/android/gms/internal/measurement/zzko;->zzatk:Ljava/lang/Boolean;

    const-string v15, "new_audience"

    invoke-static {v1, v13, v15, v14}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v14, v8, Lcom/google/android/gms/internal/measurement/zzko;->zzati:Lcom/google/android/gms/internal/measurement/zzkt;

    const-string v15, "current_data"

    invoke-static {v1, v13, v15, v14}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/measurement/zzkt;)V

    iget-object v8, v8, Lcom/google/android/gms/internal/measurement/zzko;->zzatj:Lcom/google/android/gms/internal/measurement/zzkt;

    const-string v14, "previous_data"

    invoke-static {v1, v13, v14, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Lcom/google/android/gms/internal/measurement/zzkt;)V

    invoke-static {v1, v13}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_5
    iget-object v0, v6, Lcom/google/android/gms/internal/measurement/zzks;->zzatu:[Lcom/google/android/gms/internal/measurement/zzkp;

    if-eqz v0, :cond_9

    array-length v4, v0

    const/4 v6, 0x0

    :goto_4
    if-ge v6, v4, :cond_9

    aget-object v7, v0, v6

    if-eqz v7, :cond_8

    invoke-static {v1, v13}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v8, "event {\n"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgb()Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v8

    iget-object v14, v7, Lcom/google/android/gms/internal/measurement/zzkp;->name:Ljava/lang/String;

    invoke-virtual {v8, v14}, Lcom/google/android/gms/internal/measurement/zzff;->zzbi(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v13, v12, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v7, Lcom/google/android/gms/internal/measurement/zzkp;->zzatn:Ljava/lang/Long;

    const-string v14, "timestamp_millis"

    invoke-static {v1, v13, v14, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v7, Lcom/google/android/gms/internal/measurement/zzkp;->zzato:Ljava/lang/Long;

    const-string v14, "previous_timestamp_millis"

    invoke-static {v1, v13, v14, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v8, v7, Lcom/google/android/gms/internal/measurement/zzkp;->count:Ljava/lang/Integer;

    const-string v14, "count"

    invoke-static {v1, v13, v14, v8}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v7, v7, Lcom/google/android/gms/internal/measurement/zzkp;->zzatm:[Lcom/google/android/gms/internal/measurement/zzkq;

    if-eqz v7, :cond_7

    array-length v8, v7

    const/4 v14, 0x0

    :goto_5
    if-ge v14, v8, :cond_7

    aget-object v15, v7, v14

    if-eqz v15, :cond_6

    const/4 v13, 0x3

    invoke-static {v1, v13}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    const-string v13, "param {\n"

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/gms/internal/measurement/zzhh;->zzgb()Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v13

    move-object/from16 v17, v0

    iget-object v0, v15, Lcom/google/android/gms/internal/measurement/zzkq;->name:Ljava/lang/String;

    invoke-virtual {v13, v0}, Lcom/google/android/gms/internal/measurement/zzff;->zzbj(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v13, 0x3

    invoke-static {v1, v13, v12, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, v15, Lcom/google/android/gms/internal/measurement/zzkq;->zzajo:Ljava/lang/String;

    invoke-static {v1, v13, v11, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, v15, Lcom/google/android/gms/internal/measurement/zzkq;->zzatq:Ljava/lang/Long;

    invoke-static {v1, v13, v10, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    iget-object v0, v15, Lcom/google/android/gms/internal/measurement/zzkq;->zzaro:Ljava/lang/Double;

    invoke-static {v1, v13, v9, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;ILjava/lang/String;Ljava/lang/Object;)V

    invoke-static {v1, v13}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    :cond_6
    move-object/from16 v17, v0

    :goto_6
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, v17

    const/4 v13, 0x2

    goto :goto_5

    :cond_7
    move-object/from16 v17, v0

    const/4 v0, 0x2

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7

    :cond_8
    move-object/from16 v17, v0

    const/4 v0, 0x2

    :goto_7
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v17

    const/4 v13, 0x2

    goto/16 :goto_4

    :cond_9
    const/4 v0, 0x1

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/measurement/zzjy;->zza(Ljava/lang/StringBuilder;I)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8

    :cond_a
    move-object/from16 v16, v0

    :goto_8
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, v16

    goto/16 :goto_0

    :cond_b
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzbt()Lcom/google/android/gms/common/util/Clock;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzbt()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzfr()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfr()V

    return-void
.end method

.method public final bridge synthetic zzfs()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfs()V

    return-void
.end method

.method public final bridge synthetic zzft()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzft()V

    return-void
.end method

.method public final bridge synthetic zzfu()Lcom/google/android/gms/internal/measurement/zzdu;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfu()Lcom/google/android/gms/internal/measurement/zzdu;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzfv()Lcom/google/android/gms/internal/measurement/zzhl;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfv()Lcom/google/android/gms/internal/measurement/zzhl;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzfw()Lcom/google/android/gms/internal/measurement/zzfc;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfw()Lcom/google/android/gms/internal/measurement/zzfc;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzfx()Lcom/google/android/gms/internal/measurement/zzeq;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfx()Lcom/google/android/gms/internal/measurement/zzeq;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzfy()Lcom/google/android/gms/internal/measurement/zzij;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfy()Lcom/google/android/gms/internal/measurement/zzij;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzfz()Lcom/google/android/gms/internal/measurement/zzig;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzfz()Lcom/google/android/gms/internal/measurement/zzig;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzga()Lcom/google/android/gms/internal/measurement/zzfd;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzga()Lcom/google/android/gms/internal/measurement/zzfd;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzgb()Lcom/google/android/gms/internal/measurement/zzff;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzgb()Lcom/google/android/gms/internal/measurement/zzff;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzgc()Lcom/google/android/gms/internal/measurement/zzkc;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzgc()Lcom/google/android/gms/internal/measurement/zzkc;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzgd()Lcom/google/android/gms/internal/measurement/zzji;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzgd()Lcom/google/android/gms/internal/measurement/zzji;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzge()Lcom/google/android/gms/internal/measurement/zzgh;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzge()Lcom/google/android/gms/internal/measurement/zzgh;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzgf()Lcom/google/android/gms/internal/measurement/zzfh;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzgf()Lcom/google/android/gms/internal/measurement/zzfh;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzgg()Lcom/google/android/gms/internal/measurement/zzfs;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzgg()Lcom/google/android/gms/internal/measurement/zzfs;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzgh()Lcom/google/android/gms/internal/measurement/zzeg;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzgh()Lcom/google/android/gms/internal/measurement/zzeg;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzgi()Lcom/google/android/gms/internal/measurement/zzec;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzgi()Lcom/google/android/gms/internal/measurement/zzec;

    move-result-object v0

    return-object v0
.end method

.method protected final zzhh()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final bridge synthetic zzjc()Lcom/google/android/gms/internal/measurement/zzjy;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzjc()Lcom/google/android/gms/internal/measurement/zzjy;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzjd()Lcom/google/android/gms/internal/measurement/zzeb;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzjd()Lcom/google/android/gms/internal/measurement/zzeb;

    move-result-object v0

    return-object v0
.end method

.method public final bridge synthetic zzje()Lcom/google/android/gms/internal/measurement/zzej;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/internal/measurement/zzjr;->zzje()Lcom/google/android/gms/internal/measurement/zzej;

    move-result-object v0

    return-object v0
.end method
