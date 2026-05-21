.class public final Lcn/thinkingdata/analytics/TDConfig$NetworkType;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/thinkingdata/analytics/TDConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "NetworkType"
.end annotation


# static fields
.field public static final TYPE_2G:I = 0x1

.field public static final TYPE_3G:I = 0x2

.field public static final TYPE_4G:I = 0x4

.field public static final TYPE_5G:I = 0x10

.field public static final TYPE_ALL:I = 0xff

.field public static final TYPE_WIFI:I = 0x8


# instance fields
.field final synthetic this$0:Lcn/thinkingdata/analytics/TDConfig;


# direct methods
.method public constructor <init>(Lcn/thinkingdata/analytics/TDConfig;)V
    .locals 0

    iput-object p1, p0, Lcn/thinkingdata/analytics/TDConfig$NetworkType;->this$0:Lcn/thinkingdata/analytics/TDConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
