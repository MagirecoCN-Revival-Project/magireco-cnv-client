.class public Lcn/thinkingdata/analytics/aop/FragmentTrackHelper;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final TAG:Ljava/lang/String; = "ThinkingAnalytics"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onFragmentViewCreated(Ljava/lang/Object;Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onFragmentCreateView(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method public static trackFragmentPause(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public static trackFragmentResume(Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onFragmentOnResume(Ljava/lang/Object;)V

    return-void
.end method

.method public static trackFragmentSetUserVisibleHint(Ljava/lang/Object;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onFragmentSetUserVisibleHint(Ljava/lang/Object;Z)V

    return-void
.end method

.method public static trackOnHiddenChanged(Ljava/lang/Object;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcn/thinkingdata/analytics/ThinkingDataRuntimeBridge;->onFragmentHiddenChanged(Ljava/lang/Object;Z)V

    return-void
.end method
