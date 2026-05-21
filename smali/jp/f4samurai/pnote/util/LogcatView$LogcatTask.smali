.class Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;
.super Landroid/os/AsyncTask;
.source "LogcatView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/f4samurai/pnote/util/LogcatView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LogcatTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Ljp/f4samurai/pnote/util/LogcatView;


# direct methods
.method constructor <init>(Ljp/f4samurai/pnote/util/LogcatView;)V
    .locals 0

    .line 88
    iput-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->this$0:Ljp/f4samurai/pnote/util/LogcatView;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 88
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 3

    :try_start_0
    const-string p1, "logcat -v tag -s AndroidRuntime:E Logcat:E Pnote:V GCMBaseIntentService:V GCMBroadcastReceiver:V"

    .line 104
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object p1

    .line 105
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    .line 106
    invoke-virtual {p1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 p1, 0x800

    invoke-direct {v0, v1, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 108
    :goto_0
    invoke-virtual {p0}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 109
    invoke-virtual {p0, v1}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->publishProgress([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 88
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 0

    .line 127
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .line 91
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 93
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const-string v1, "logcat -c"

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :catch_0
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->this$0:Ljp/f4samurai/pnote/util/LogcatView;

    invoke-static {v0}, Ljp/f4samurai/pnote/util/LogcatView;->-$$Nest$fgetmTextView(Ljp/f4samurai/pnote/util/LogcatView;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .line 88
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->onProgressUpdate([Ljava/lang/String;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/String;)V
    .locals 3

    .line 119
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 120
    iget-object v0, p0, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->this$0:Ljp/f4samurai/pnote/util/LogcatView;

    invoke-static {v0}, Ljp/f4samurai/pnote/util/LogcatView;->-$$Nest$fgetmTextView(Ljp/f4samurai/pnote/util/LogcatView;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    aget-object p1, p1, v2

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 122
    iget-object p1, p0, Ljp/f4samurai/pnote/util/LogcatView$LogcatTask;->this$0:Ljp/f4samurai/pnote/util/LogcatView;

    invoke-static {p1}, Ljp/f4samurai/pnote/util/LogcatView;->-$$Nest$fgetmScrollView(Ljp/f4samurai/pnote/util/LogcatView;)Landroid/widget/ScrollView;

    move-result-object p1

    const/16 v0, 0x82

    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->fullScroll(I)Z

    return-void
.end method
