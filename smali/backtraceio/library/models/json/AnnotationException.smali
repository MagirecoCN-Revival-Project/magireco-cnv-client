.class Lbacktraceio/library/models/json/AnnotationException;
.super Ljava/lang/Object;
.source "Annotations.java"


# instance fields
.field private message:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0, p1}, Lbacktraceio/library/models/json/AnnotationException;->setMessage(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method setMessage(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .line 31
    iput-object p1, p0, Lbacktraceio/library/models/json/AnnotationException;->message:Ljava/lang/Object;

    return-void
.end method
