// MagiaClient.cpp — cnv-bootstrap 的 native 运行时 hook 伴侣
//
// 在引擎 .so 加载完之后挂上去，拦截 libmadomagi_native.so 内部那条
// 「读 asset.json → 决定是否拉 15GB 资源 → 弹下载场景」的流水线。
// 只要 cnv-bootstrap 已经把汉化资源装好（落地 cn_resources_ready.flag），
// 我们就让引擎以为下载已完成、把控制权交给主菜单。
//
// 触发点：
//   - 加载时机：smali_classes2/org/cocos2dx/lib/Cocos2dxActivity.smali
//     在 loadLibrary("madomagi_native") 之后链式 loadLibrary("MagiaClient")。
//   - flag 来源：io.kamihama.cnv.ResourceFlow 在所有资源准备完成、
//     交还给 BootstrapActivity.launchGame() 之前 touch 这个文件。

#include <jni.h>
#include <android/log.h>
#include <shadowhook.h>
#include <string>
#include <mutex>
#include <functional>
#include <unordered_map>
#include <sys/stat.h>
#include <sys/types.h>

#undef LOGI
#undef LOGE
#define LOG_TAG "MagiaCN_LiveOps"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

JavaVM* gJvm = nullptr;

namespace cocos2d {
    struct Data { unsigned char* _bytes; ssize_t _size; };
}

// 路径与 cnv-bootstrap 那边写出的 flag 保持一致：
//   <filesDir>/cnv_inject/cn_resources_ready.flag
// 见 ResourceFlow.writeReadyFlag。
static const std::string FLAG_PATH =
    "/data/data/io.kamihama.totentanz/files/cnv_inject/cn_resources_ready.flag";

// ─── 函数指针 ────────────────────────────────────────────
bool (*checkParseJsonOld)(void*, const cocos2d::Data&) = nullptr;
void (*setURIOld)(void*, const std::string&) = nullptr;
void (*http2OnRespOld)(void*, void*) = nullptr;
void (*dlJsonOnRespOld)(void*, void*, void*) = nullptr;
void (*dlJsonOnErrOld)(void*, void*, int) = nullptr;
void (*dlJsonOnRespErrOld)(void*) = nullptr;
void (*selectURLOnRespOld)(void*, void*, void*) = nullptr;
void (*selectURLOnErrOld)(void*, void*, int) = nullptr;
void (*mainSceneOnRespOld)(void*, void*, void*) = nullptr;
void (*mainSceneOnErrOld)(void*, void*, int) = nullptr;
void (*qbSceneOnRespOld)(void*, void*, void*) = nullptr;
void (*questDataOnRespOld)(void*, void*, void*) = nullptr;
void (*assetLoadOnDownloadedOld)(void*) = nullptr;

void (*downloadSceneLayerCtorOld)(void*, void*) = nullptr;
bool (*downloadSceneLayerInitOld)(void*) = nullptr;
void (*downloadSceneLayerOnEnterOld)(void*) = nullptr;

// DownloadSceneLayerInfo 构造函数：C2(ESceneLayerType, std::function<void()>&, std::string&, DownloadRunningType)
void (*dslInfoCtorOld)(void*, int, const std::function<void()>&,
                       const std::string&, int) = nullptr;

const unsigned char* (*getDataOld)(void*) = nullptr;
size_t (*getDataSizeOld)(void*) = nullptr;

// ─── info → callback 映射 ────────────────────────────────
static std::unordered_map<void*, std::function<void()>> g_infoCallbackMap;
static std::mutex g_infoCallbackMutex;

// ─── layer → info 映射 ───────────────────────────────────
static std::unordered_map<void*, void*> g_layerInfoMap;
static std::mutex g_layerInfoMutex;

// ─── 辅助 ─────────────────────────────────────────────────
static bool fileExists(const std::string& p) {
    struct stat st;
    return stat(p.c_str(), &st) == 0;
}

static bool resourcesReady() {
    return fileExists(FLAG_PATH);
}

static JNIEnv* attachEnv(bool& attached) {
    JNIEnv* env = nullptr;
    attached = false;
    if (gJvm->GetEnv((void**)&env, JNI_VERSION_1_6) == JNI_EDETACHED) {
        gJvm->AttachCurrentThread(&env, nullptr);
        attached = true;
    }
    return env;
}


// ════════════════════════════════════════════════════════
// DownloadSceneLayerInfo::ctor — 截获 std::function<void()> 副本
// ════════════════════════════════════════════════════════
void dslInfoCtorNew(void* _this,
                    int sceneLayerType,
                    const std::function<void()>& callback,
                    const std::string& category,
                    int runningType)
{
    dslInfoCtorOld(_this, sceneLayerType, callback, category, runningType);
    {
        std::lock_guard<std::mutex> lk(g_infoCallbackMutex);
        g_infoCallbackMap[_this] = callback;
    }
    LOGI("[DSLInfo::ctor] _this=%p 已保存callback副本", _this);
}

// ════════════════════════════════════════════════════════
// DownloadSceneLayer::ctor — 记录 layer→info 映射
// ════════════════════════════════════════════════════════
void downloadSceneLayerCtorNew(void* _this, void* info) {
    downloadSceneLayerCtorOld(_this, info);
    {
        std::lock_guard<std::mutex> lk(g_layerInfoMutex);
        g_layerInfoMap[_this] = info;
    }
    LOGI("[DSL::ctor] _this=%p info=%p ready=%d", _this, info, (int)resourcesReady());
}

// ════════════════════════════════════════════════════════
// DownloadSceneLayer::init — 下载场景初始化
// ════════════════════════════════════════════════════════
bool downloadSceneLayerInitNew(void* _this) {
    bool result = downloadSceneLayerInitOld(_this);
    LOGI("[DSL::init] result=%d ready=%d", (int)result, (int)resourcesReady());
    return result;
}

// ════════════════════════════════════════════════════════
// DownloadSceneLayer::onEnter — GL主线程，安全调用回调
// ════════════════════════════════════════════════════════
void downloadSceneLayerOnEnterNew(void* _this) {

    if (!resourcesReady()) {
        LOGI("[DSL::onEnter] flag不存在，首次安装/异常路径，放行原版");
        downloadSceneLayerOnEnterOld(_this);
        return;
    }

    void* info = nullptr;
    {
        std::lock_guard<std::mutex> lk(g_layerInfoMutex);
        auto it = g_layerInfoMap.find(_this);
        if (it != g_layerInfoMap.end()) {
            info = it->second;
            g_layerInfoMap.erase(it);
        }
    }
    if (!info) {
        LOGE("[DSL::onEnter] ✗ 未找到info _this=%p，降级调用原始", _this);
        downloadSceneLayerOnEnterOld(_this);
        return;
    }

    std::function<void()> cb;
    {
        std::lock_guard<std::mutex> lk(g_infoCallbackMutex);
        auto it = g_infoCallbackMap.find(info);
        if (it != g_infoCallbackMap.end()) {
            cb = it->second;
            g_infoCallbackMap.erase(it);
        }
    }

    if (!cb) {
        LOGE("[DSL::onEnter] ✗ 未找到callback副本 info=%p，降级调用原始", info);
        downloadSceneLayerOnEnterOld(_this);
        return;
    }

    LOGI("[DSL::onEnter] ★ 跳过下载UI，直接调用完成回调 info=%p", info);
    cb();
    LOGI("[DSL::onEnter] ✓ 回调执行完毕");
}

// ════════════════════════════════════════════════════════
// AssetLoadState::onDownloaded — 透传
// ════════════════════════════════════════════════════════
void assetLoadOnDownloadedNew(void* _this) {
    LOGI("[AssetLoad::onDownloaded] _this=%p ready=%d", _this, (int)resourcesReady());
    assetLoadOnDownloadedOld(_this);
}

// ════════════════════════════════════════════════════════
// checkParseJson — 解析 asset.json 拦截点
// ════════════════════════════════════════════════════════
static cocos2d::Data g_emptyData{ (unsigned char*)"[]", 2 };

bool checkParseJsonNew(void* _this, const cocos2d::Data& data) {
    if (!resourcesReady()) {
        LOGE("[checkParseJson] flag 缺失，返回空列表");
        return checkParseJsonOld(_this, g_emptyData);
    }
    if (data._bytes && data._size > 0) {
        const char* p = (const char*)data._bytes;
        if (strstr(p, "asset_optimize")) {
            LOGI("[checkParseJson] 修正 asset_optimize");
            static std::string fixed;
            fixed.assign(p, data._size);
            size_t pos = 0;
            while ((pos = fixed.find(":1", pos)) != std::string::npos) {
                fixed.replace(pos, 2, ":0");
                pos += 2;
            }
            cocos2d::Data d;
            d._bytes = (unsigned char*)fixed.c_str();
            d._size = (ssize_t)fixed.size();
            return checkParseJsonOld(_this, d);
        }
    }
    return checkParseJsonOld(_this, data);
}

// ════════════════════════════════════════════════════════
// SelectURL 回调 — 资源 URL 选择
// ════════════════════════════════════════════════════════
void selectURLOnRespNew(void* _this, void* session, void* resp) {
    if (resourcesReady()) { LOGI("[SelectURL::onResp] 静默"); return; }
    selectURLOnRespOld(_this, session, resp);
}
void selectURLOnErrNew(void* _this, void* session, int code) {
    if (resourcesReady()) { LOGI("[SelectURL::onErr] 静默 code=%d", code); return; }
    selectURLOnErrOld(_this, session, code);
}

// ════════════════════════════════════════════════════════
// DLJson 回调 — JSON 资源列表下载
// ════════════════════════════════════════════════════════
void dlJsonOnRespNew(void* _this, void* session, void* resp) {
    if (resourcesReady()) { return; }
    dlJsonOnRespOld(_this, session, resp);
}
void dlJsonOnErrNew(void* _this, void* session, int code) {
    if (resourcesReady()) { LOGI("[DLJson::onErr] 静默 code=%d", code); return; }
    dlJsonOnErrOld(_this, session, code);
}
void dlJsonOnRespErrNew(void* _this) {
    if (resourcesReady()) { return; }
    dlJsonOnRespErrOld(_this);
}

// ════════════════════════════════════════════════════════
// MainScene 回调 — 主场景加载
// ════════════════════════════════════════════════════════
void mainSceneOnRespNew(void* _this, void* session, void* resp) {
    mainSceneOnRespOld(_this, session, resp);
}
void mainSceneOnErrNew(void* _this, void* session, int code) {
    LOGI("[MainScene::onErr] code=%d ready=%d", code, (int)resourcesReady());
    if (!resourcesReady()) {
        LOGE("[MainScene::onErr] flag 缺失，静默丢弃错误 code=%d", code);
        return;
    }
    mainSceneOnErrOld(_this, session, code);
}

// ════════════════════════════════════════════════════════
// QbScene / QuestData — 任务场景回调
// ════════════════════════════════════════════════════════
void qbSceneOnRespNew(void* _this, void* session, void* resp) {
    if (!resourcesReady()) { return; }
    qbSceneOnRespOld(_this, session, resp);
}
void questDataOnRespNew(void* _this, void* session, void* resp) {
    if (!resourcesReady()) { return; }
    questDataOnRespOld(_this, session, resp);
}

// ════════════════════════════════════════════════════════
// setURI / Http2::onResp — HTTP 请求拦截
// ════════════════════════════════════════════════════════
void setURINew(void* _this, const std::string& uri) {
    setURIOld(_this, uri);
}
void http2OnRespNew(void* _this, void* resp) {
    if (getDataOld && getDataSizeOld) {
        const unsigned char* d = getDataOld(resp);
        size_t s = getDataSizeOld(resp);
        if (d && s > 0 && s < 512 && d[0] >= 0x20)
            LOGI("[Http2::onResp] session=%p body=%.*s", _this, (int)s, (const char*)d);
    }
    http2OnRespOld(_this, resp);
}

// ════════════════════════════════════════════════════════
// JNI_OnLoad — .so 加载入口，注册所有 hook
// ════════════════════════════════════════════════════════
extern "C" jint JNI_OnLoad(JavaVM* vm, void* reserved) {
    gJvm = vm;
    LOGI("========== MagiaCN JNI_OnLoad ==========");
    LOGI("[VERSION] MagiaClient cnv-native v1");

    JNIEnv* env = nullptr;
    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) return JNI_ERR;

    const char* LIB = "libmadomagi_native.so";

    // shadowhook 初始化：UNIQUE 模式 = 每个地址只能被 hook 一次（我们
    // 用这个；如果将来要堆叠多层 hook 可以换 SHARED）。
    int sh_rc = shadowhook_init(SHADOWHOOK_MODE_UNIQUE, false);
    if (sh_rc != 0) {
        LOGE("[shadowhook] init 失败 rc=%d errno=%d", sh_rc, shadowhook_get_errno());
        // 不 return：让单点 hook 自己报错，方便定位
    } else {
        LOGI("[shadowhook] init OK");
    }

    auto H = [&](const char* sym, void* fn, void** old, const char* label) -> bool {
        // shadowhook_hook_sym_name = DobbySymbolResolver + DobbyHook 一站式：
        // 先在指定 .so 的符号表里查地址，然后装 inline hook。
        void* stub = shadowhook_hook_sym_name(LIB, sym, fn, old);
        if (stub) { LOGI("[Hook] ✓ %s", label); return true; }
        int e = shadowhook_get_errno();
        LOGE("[Hook] ✗ %s errno=%d %s", label, e, shadowhook_to_errmsg(e));
        return false;
    };

    H("_ZN22DownloadAssetJsonState14checkParseJsonERKN7cocos2d4DataE",
      (void*)checkParseJsonNew, (void**)&checkParseJsonOld, "checkParseJson");

    H("_ZN5http212Http2Session6setURIERKNSt6__ndk112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE",
      (void*)setURINew, (void**)&setURIOld, "setURI");

    H("_ZN5http212Http2Session10onResponseEPNS_13Http2ResponseE",
      (void*)http2OnRespNew, (void**)&http2OnRespOld, "Http2::onResp");

    H("_ZN22DownloadAssetJsonState10onResponseEPN5http212Http2SessionEPNS0_13Http2ResponseE",
      (void*)dlJsonOnRespNew, (void**)&dlJsonOnRespOld, "DLJson::onResp");

    H("_ZN22DownloadAssetJsonState7onErrorEPN5http212Http2SessionEi",
      (void*)dlJsonOnErrNew, (void**)&dlJsonOnErrOld, "DLJson::onErr");

    H("_ZN22DownloadAssetJsonState15onResponseErrorEv",
      (void*)dlJsonOnRespErrNew, (void**)&dlJsonOnRespErrOld, "DLJson::onRespErr");

    H("_ZN29SelectURLGetResourceListState10onResponseEPN5http212Http2SessionEPNS0_13Http2ResponseE",
      (void*)selectURLOnRespNew, (void**)&selectURLOnRespOld, "SelectURL::onResp");

    H("_ZN29SelectURLGetResourceListState7onErrorEPN5http212Http2SessionEi",
      (void*)selectURLOnErrNew, (void**)&selectURLOnErrOld, "SelectURL::onErr");

    H("_ZN9MainScene10onResponseEPN5http212Http2SessionEPNS0_13Http2ResponseE",
      (void*)mainSceneOnRespNew, (void**)&mainSceneOnRespOld, "MainScene::onResp");

    H("_ZN9MainScene7onErrorEPN5http212Http2SessionEi",
      (void*)mainSceneOnErrNew, (void**)&mainSceneOnErrOld, "MainScene::onErr");

    H("_ZN20QbSceneJsonGetServer10onResponseEPN5http212Http2SessionEPNS0_13Http2ResponseE",
      (void*)qbSceneOnRespNew, (void**)&qbSceneOnRespOld, "QbScene::onResp");

    H("_ZN25QuestStoredDataSceneLayer10onResponseEPN5http212Http2SessionEPNS0_13Http2ResponseE",
      (void*)questDataOnRespNew, (void**)&questDataOnRespOld, "QuestData::onResp");

    // ── DownloadSceneLayerInfo::ctor ──────────────────────
    H("_ZN22DownloadSceneLayerInfoC2E15ESceneLayerTypeRKNSt6__ndk18functionIFvvEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN19DownloadRunningType21DownloadRunningType__E",
      (void*)dslInfoCtorNew, (void**)&dslInfoCtorOld, "DownloadSceneLayerInfo::ctor");

    // ── DownloadSceneLayer ────────────────────────────────
    H("_ZN18DownloadSceneLayerC1EP22DownloadSceneLayerInfo",
      (void*)downloadSceneLayerCtorNew, (void**)&downloadSceneLayerCtorOld,
      "DownloadSceneLayer::ctor");

    H("_ZN18DownloadSceneLayer4initEv",
      (void*)downloadSceneLayerInitNew, (void**)&downloadSceneLayerInitOld,
      "DownloadSceneLayer::init");

    H("_ZN18DownloadSceneLayer7onEnterEv",
      (void*)downloadSceneLayerOnEnterNew, (void**)&downloadSceneLayerOnEnterOld,
      "DownloadSceneLayer::onEnter");

    H("_ZN14AssetLoadState12onDownloadedEv",
      (void*)assetLoadOnDownloadedNew, (void**)&assetLoadOnDownloadedOld,
      "AssetLoadState::onDownloaded");

    // ── Http2Response ─────────────────────────────────────
    // 这两个不装 hook，只是把原版函数指针拿到留着后面直接调。
    // shadowhook_dlopen/dlsym 跟 shadowhook_hook_sym_name 走同一套
    // 符号解析（含 .symtab 里非导出的 C++ 方法），能挖到 mangled
    // method symbol。
    {
        void* handle = shadowhook_dlopen(LIB);
        if (handle) {
            void* p1 = shadowhook_dlsym(handle, "_ZN5http213Http2Response15getResponseDataEv");
            void* p2 = shadowhook_dlsym(handle, "_ZN5http213Http2Response19getResponseDataSizeEv");
            if (p1) getDataOld     = reinterpret_cast<const unsigned char*(*)(void*)>(p1);
            if (p2) getDataSizeOld = reinterpret_cast<size_t(*)(void*)>(p2);
            shadowhook_dlclose(handle);
        }
    }

    LOGI("[JNI] hooks 安装完成，等待引擎调用");
    return JNI_VERSION_1_6;
}
