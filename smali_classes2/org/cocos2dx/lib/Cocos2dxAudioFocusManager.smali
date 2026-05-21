.class Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager;
.super Ljava/lang/Object;
.source "Cocos2dxAudioFocusManager.java"


# static fields
.field private static final AUDIOFOCUS_GAIN:I = 0x0

.field private static final AUDIOFOCUS_LOST:I = 0x1

.field private static final AUDIOFOCUS_LOST_TRANSIENT:I = 0x2

.field private static final AUDIOFOCUS_LOST_TRANSIENT_CAN_DUCK:I = 0x3

.field private static final TAG:Ljava/lang/String; = "AudioFocusManager"

.field private static sAfChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager$1;

    invoke-direct {v0}, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager$1;-><init>()V

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager;->sAfChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)V
    .locals 0

    .line 32
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager;->nativeOnAudioFocusChange(I)V

    return-void
.end method

.method private static native nativeOnAudioFocusChange(I)V
.end method

.method static registerAudioFocusListener(Landroid/content/Context;)Z
    .locals 3

    const-string v0, "audio"

    .line 91
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    .line 94
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager;->sAfChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    const/4 v1, 0x3

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result p0

    const-string v0, "AudioFocusManager"

    if-ne p0, v2, :cond_0

    const-string p0, "requestAudioFocus succeed"

    .line 101
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    const-string p0, "requestAudioFocus failed!"

    .line 105
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0
.end method

.method static unregisterAudioFocusListener(Landroid/content/Context;)V
    .locals 2

    const-string v0, "audio"

    .line 110
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    .line 111
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager;->sAfChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    move-result p0

    const-string v0, "AudioFocusManager"

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    const-string p0, "abandonAudioFocus succeed!"

    .line 113
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string p0, "abandonAudioFocus failed!"

    .line 115
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    :goto_0
    new-instance p0, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager$2;

    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxAudioFocusManager$2;-><init>()V

    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxHelper;->runOnGLThread(Ljava/lang/Runnable;)V

    return-void
.end method
