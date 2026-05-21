.class public Lcn/thinkingdata/analytics/aop/ThinkingDataAutoTrackHelper;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static final TAG:Ljava/lang/String; = "ThinkingAnalytics"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static track(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static trackDialog(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onDialogClick(Ljava/lang/Object;I)V

    return-void
.end method

.method public static trackExpandableListViewOnChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;II)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onExpandableListViewOnChildClick(Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method public static trackExpandableListViewOnGroupClick(Landroid/widget/ExpandableListView;Landroid/view/View;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onExpandableListViewOnGroupClick(Landroid/view/View;Landroid/view/View;I)V

    return-void
.end method

.method public static trackListView(Landroid/widget/AdapterView;Landroid/view/View;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "I)V"
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onAdapterViewItemClick(Landroid/view/View;Landroid/view/View;I)V

    return-void
.end method

.method public static trackMenuItem(Landroid/view/MenuItem;)V
    .locals 0

    return-void
.end method

.method public static trackMenuItem(Ljava/lang/Object;Landroid/view/MenuItem;)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onMenuItemSelected(Ljava/lang/Object;Landroid/view/MenuItem;)V

    return-void
.end method

.method public static trackRadioGroup(Landroid/widget/RadioGroup;I)V
    .locals 0

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onViewOnClick(Landroid/view/View;Ljava/lang/Object;)V

    return-void
.end method

.method public static trackRadioGroup(Landroid/widget/RadioGroup;ILjava/lang/String;)V
    .locals 0

    invoke-static {p0, p2}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onViewOnClick(Landroid/view/View;Ljava/lang/Object;)V

    return-void
.end method

.method public static trackTabHost(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onTabHostChanged(Ljava/lang/String;)V

    return-void
.end method

.method public static trackTabLayoutSelected(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v0, "getText"

    const/4 v1, 0x0

    :try_start_1
    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p0, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onTabHostChanged(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public static trackViewOnClick(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onViewOnClick(Landroid/view/View;Ljava/lang/Object;)V

    return-void
.end method

.method public static trackViewOnClick(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onViewOnClick(Landroid/view/View;Ljava/lang/Object;)V

    return-void
.end method
