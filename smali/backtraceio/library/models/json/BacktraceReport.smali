.class public Lbacktraceio/library/models/json/BacktraceReport;
.super Ljava/lang/Object;
.source "BacktraceReport.java"


# instance fields
.field public attachmentPaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public classifier:Ljava/lang/String;

.field public diagnosticStack:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lbacktraceio/library/models/BacktraceStackFrame;",
            ">;"
        }
    .end annotation
.end field

.field public exception:Ljava/lang/Exception;

.field public exceptionTypeReport:Ljava/lang/Boolean;

.field public message:Ljava/lang/String;

.field public timestamp:J

.field public uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "exception"
        }
    .end annotation

    const/4 v0, 0x0

    .line 135
    invoke-direct {p0, p1, v0, v0}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "exception",
            "attachmentPaths"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 161
    invoke-direct {p0, p1, v0, p2}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "exception",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 148
    invoke-direct {p0, p1, p2, v0}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "exception",
            "attributes",
            "attachmentPaths"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lbacktraceio/library/models/json/BacktraceReport;->uuid:Ljava/util/UUID;

    .line 31
    invoke-static {}, Lbacktraceio/library/common/BacktraceTimeHelper;->getTimestampSeconds()J

    move-result-wide v0

    iput-wide v0, p0, Lbacktraceio/library/models/json/BacktraceReport;->timestamp:J

    const/4 v0, 0x0

    .line 36
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lbacktraceio/library/models/json/BacktraceReport;->exceptionTypeReport:Ljava/lang/Boolean;

    const-string v1, ""

    .line 41
    iput-object v1, p0, Lbacktraceio/library/models/json/BacktraceReport;->classifier:Ljava/lang/String;

    if-nez p2, :cond_0

    .line 177
    new-instance p2, Lbacktraceio/library/models/json/BacktraceReport$1;

    invoke-direct {p2, p0}, Lbacktraceio/library/models/json/BacktraceReport$1;-><init>(Lbacktraceio/library/models/json/BacktraceReport;)V

    .line 178
    :cond_0
    iput-object p2, p0, Lbacktraceio/library/models/json/BacktraceReport;->attributes:Ljava/util/Map;

    if-nez p3, :cond_1

    .line 179
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    :cond_1
    iput-object p3, p0, Lbacktraceio/library/models/json/BacktraceReport;->attachmentPaths:Ljava/util/List;

    .line 180
    iput-object p1, p0, Lbacktraceio/library/models/json/BacktraceReport;->exception:Ljava/lang/Exception;

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    .line 181
    :cond_2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p0, Lbacktraceio/library/models/json/BacktraceReport;->exceptionTypeReport:Ljava/lang/Boolean;

    .line 182
    new-instance p2, Lbacktraceio/library/models/BacktraceStackTrace;

    invoke-direct {p2, p1}, Lbacktraceio/library/models/BacktraceStackTrace;-><init>(Ljava/lang/Exception;)V

    invoke-virtual {p2}, Lbacktraceio/library/models/BacktraceStackTrace;->getStackFrames()Ljava/util/ArrayList;

    move-result-object p2

    iput-object p2, p0, Lbacktraceio/library/models/json/BacktraceReport;->diagnosticStack:Ljava/util/ArrayList;

    .line 184
    iget-object p2, p0, Lbacktraceio/library/models/json/BacktraceReport;->exceptionTypeReport:Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_3

    if-eqz p1, :cond_3

    .line 185
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lbacktraceio/library/models/json/BacktraceReport;->classifier:Ljava/lang/String;

    .line 187
    :cond_3
    invoke-direct {p0}, Lbacktraceio/library/models/json/BacktraceReport;->setDefaultErrorTypeAttribute()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    const/4 v0, 0x0

    .line 76
    move-object v1, v0

    check-cast v1, Ljava/lang/Exception;

    invoke-direct {p0, v0, v0, v0}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V

    .line 77
    iput-object p1, p0, Lbacktraceio/library/models/json/BacktraceReport;->message:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "attachmentPaths"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 106
    invoke-direct {p0, p1, v0, p2}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 91
    move-object v1, v0

    check-cast v1, Ljava/lang/Exception;

    invoke-direct {p0, v0, p2, v0}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V

    .line 92
    iput-object p1, p0, Lbacktraceio/library/models/json/BacktraceReport;->message:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "message",
            "attributes",
            "attachmentPaths"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 123
    move-object v1, v0

    check-cast v1, Ljava/lang/Exception;

    invoke-direct {p0, v0, p2, p3}, Lbacktraceio/library/models/json/BacktraceReport;-><init>(Ljava/lang/Exception;Ljava/util/Map;Ljava/util/List;)V

    .line 124
    iput-object p1, p0, Lbacktraceio/library/models/json/BacktraceReport;->message:Ljava/lang/String;

    return-void
.end method

.method public static concatAttributes(Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "report",
            "attributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbacktraceio/library/models/json/BacktraceReport;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 215
    iget-object p0, p0, Lbacktraceio/library/models/json/BacktraceReport;->attributes:Ljava/util/Map;

    if-eqz p0, :cond_0

    goto :goto_0

    .line 216
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :goto_0
    if-nez p1, :cond_1

    return-object p0

    .line 220
    :cond_1
    invoke-interface {p0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object p0
.end method

.method private setDefaultErrorTypeAttribute()V
    .locals 3

    .line 194
    iget-object v0, p0, Lbacktraceio/library/models/json/BacktraceReport;->attributes:Ljava/util/Map;

    const-string v1, "error.type"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 199
    :cond_0
    iget-object v0, p0, Lbacktraceio/library/models/json/BacktraceReport;->attributes:Ljava/util/Map;

    .line 201
    iget-object v2, p0, Lbacktraceio/library/models/json/BacktraceReport;->exceptionTypeReport:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "Exception"

    goto :goto_0

    :cond_1
    const-string v2, "Message"

    .line 199
    :goto_0
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public toBacktraceData(Landroid/content/Context;Ljava/util/Map;)Lbacktraceio/library/models/BacktraceData;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "clientAttributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lbacktraceio/library/models/BacktraceData;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 225
    invoke-virtual {p0, p1, p2, v0}, Lbacktraceio/library/models/json/BacktraceReport;->toBacktraceData(Landroid/content/Context;Ljava/util/Map;Z)Lbacktraceio/library/models/BacktraceData;

    move-result-object p1

    return-object p1
.end method

.method public toBacktraceData(Landroid/content/Context;Ljava/util/Map;Z)Lbacktraceio/library/models/BacktraceData;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "clientAttributes",
            "isProguardEnabled"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)",
            "Lbacktraceio/library/models/BacktraceData;"
        }
    .end annotation

    .line 229
    new-instance v0, Lbacktraceio/library/models/BacktraceData;

    invoke-direct {v0, p1, p0, p2}, Lbacktraceio/library/models/BacktraceData;-><init>(Landroid/content/Context;Lbacktraceio/library/models/json/BacktraceReport;Ljava/util/Map;)V

    if-eqz p3, :cond_0

    const-string p1, "proguard"

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 230
    :goto_0
    iput-object p1, v0, Lbacktraceio/library/models/BacktraceData;->symbolication:Ljava/lang/String;

    return-object v0
.end method
