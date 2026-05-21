.class public Lbacktraceio/library/BacktraceCredentials;
.super Ljava/lang/Object;
.source "BacktraceCredentials.java"


# instance fields
.field private backtraceHostUri:Landroid/net/Uri;

.field private endpointUrl:Ljava/lang/String;

.field private final format:Ljava/lang/String;

.field private submissionToken:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceHostUri"
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "json"

    .line 12
    iput-object v0, p0, Lbacktraceio/library/BacktraceCredentials;->format:Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lbacktraceio/library/BacktraceCredentials;->backtraceHostUri:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backtraceHostUri"
        }
    .end annotation

    .line 31
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lbacktraceio/library/BacktraceCredentials;-><init>(Landroid/net/Uri;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "endpointUrl",
            "submissionToken"
        }
    .end annotation

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "json"

    .line 12
    iput-object v0, p0, Lbacktraceio/library/BacktraceCredentials;->format:Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lbacktraceio/library/BacktraceCredentials;->endpointUrl:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lbacktraceio/library/BacktraceCredentials;->submissionToken:Ljava/lang/String;

    return-void
.end method

.method private getBacktraceHostUri()Landroid/net/Uri;
    .locals 1

    .line 48
    iget-object v0, p0, Lbacktraceio/library/BacktraceCredentials;->backtraceHostUri:Landroid/net/Uri;

    return-object v0
.end method

.method private getEndpointUrl()Ljava/lang/String;
    .locals 1

    .line 44
    iget-object v0, p0, Lbacktraceio/library/BacktraceCredentials;->endpointUrl:Ljava/lang/String;

    return-object v0
.end method

.method private getServerUrl()Landroid/net/Uri;
    .locals 4

    .line 52
    invoke-direct {p0}, Lbacktraceio/library/BacktraceCredentials;->getEndpointUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v1, ""

    :cond_0
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "json"

    aput-object v1, v2, v0

    const/4 v0, 0x3

    .line 55
    invoke-virtual {p0}, Lbacktraceio/library/BacktraceCredentials;->getSubmissionToken()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    const-string v0, "%s%spost?format=%s&token=%s"

    .line 54
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 56
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getMinidumpSubmissionUrl()Landroid/net/Uri;
    .locals 3

    .line 73
    invoke-virtual {p0}, Lbacktraceio/library/BacktraceCredentials;->getSubmissionUrl()Landroid/net/Uri;

    move-result-object v0

    .line 74
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "format=json"

    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "format=minidump"

    .line 76
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v1, "/json"

    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "/minidump"

    .line 78
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 82
    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSubmissionToken()Ljava/lang/String;
    .locals 3

    .line 120
    iget-object v0, p0, Lbacktraceio/library/BacktraceCredentials;->submissionToken:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 125
    :cond_0
    invoke-virtual {p0}, Lbacktraceio/library/BacktraceCredentials;->getSubmissionUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "submit.backtrace.io"

    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "/"

    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, -0x40

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v1, "token="

    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x6

    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x6

    add-int/lit8 v1, v1, 0x40

    add-int/lit8 v1, v1, -0x1

    .line 128
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSubmissionUrl()Landroid/net/Uri;
    .locals 1

    .line 65
    invoke-direct {p0}, Lbacktraceio/library/BacktraceCredentials;->getBacktraceHostUri()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 69
    :cond_0
    invoke-direct {p0}, Lbacktraceio/library/BacktraceCredentials;->getServerUrl()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getUniverseName()Ljava/lang/String;
    .locals 5

    .line 88
    invoke-virtual {p0}, Lbacktraceio/library/BacktraceCredentials;->getSubmissionUrl()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https://submit.backtrace.io/"

    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "Invalid Backtrace URL"

    const/4 v3, -0x1

    if-eqz v1, :cond_1

    const/16 v1, 0x1c

    const/16 v4, 0x2f

    .line 93
    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    if-eq v4, v3, :cond_0

    .line 98
    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 96
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-string v1, "backtrace.io"

    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-eq v1, v3, :cond_2

    .line 108
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 109
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v3, "."

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 105
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
