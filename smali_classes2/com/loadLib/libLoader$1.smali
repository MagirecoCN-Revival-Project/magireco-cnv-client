.class final Lcom/loadLib/libLoader$1;
.super Ljava/lang/Object;
.source "libLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/JvRuit/Ldr;->loadLib()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    # libuwasa (Totentanz legacy) 已停用：其 RestClient JNI 入口已移除，
    # 更新/资源渠道由 cnv-native + ClientInit + ResourceFlow 接管。
    return-void
.end method
