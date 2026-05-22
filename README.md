# 魔法纪录 CNV 客户端

魔法纪录国服复刻计划的 Android 客户端。以日服原版 APK 为基础，通过 apktool 反编译 + 三层 patch 将其改造为能接入复刻云端的中文版本，无需修改源码即可在标准 Android 设备上运行。

---

## 架构概览

```
原版日服 APK
    │  apktool 反编译
    ▼
smali 字节码 + assets + lib/
    │
    ├─ Layer 1: Smali Patch（字节码注入）
    │     WebView 请求拦截 · NativeBridge 版本伪造 · 原生库加载顺序调整
    │
    ├─ Layer 2: Java Patch（新增业务逻辑）
    │     BootstrapActivity · ResourceFlow · 心跳 · 账号 · 存档同步
    │
    └─ Layer 3: Native Hook（C++ 运行时拦截）
          MagiaClient.so via shadowhook
          绕过引擎的资源下载场景，直接进入主菜单
    │
    ▼  apktool 重新打包 + d8 dex + zipalign + apksigner
修改后的 APK
```

---

## 核心模块

### Smali 补丁层

位于 `smali/` 和 `smali_classes2/`，直接修改引擎 Java 字节码：

- **`WebViewImpl$WebViewClientImpl`** — 在 `shouldInterceptRequest` 钩子处调用 `WebViewInterceptor`，将 `/magica/` 下的静态资源请求重定向到本地文件系统（`filesDir/magica/`）或 APK assets，API 请求放行走网络
- **`NativeBridge`** — 在 `getAppVersion` 方法头部插入对 `Spoof.getFakeVersion()` 的调用，非 null 时直接返回伪造版本号，让游戏 native 层上报服务端指定的版本
- **`Cocos2dxActivity`** — 在加载 `madomagi_native` 之后追加加载 `MagiaClient`，完成运行时 hook 挂载
- **`WebViewImpl`** — 在 `initWebView` 末尾注入 `CnvBridge` JavascriptInterface，供游戏前端 JS 调用 Java 存档接口

### Java 补丁层

源码位于 `patch/src/main/java/`，编译后以新的 dex 文件注入 APK：

| 包 / 类 | 职责 |
|---|---|
| `BootstrapActivity` | LAUNCHER 入口；完成资源准备后启动游戏；包含下载进度 UI、BGM、贡献者页、账号登录弹窗 |
| `ResourceFlow` | 在线多线程分片下载（`Net.downloadChunked`）或离线 zip 两阶段解压；写 `cnv_inject/cn_resources_ready.flag` |
| `ClientInit` | `/client/init`・`/client/online-download`・`/client/hot-update` 等握手接口的请求/解析逻辑 |
| `SaveOverlayService` | Foreground Service；悬浮存档按钮（10 分钟自动存档）；游戏阶段每 5 秒向服务端发心跳，实时处理封禁/维护指令 |
| `Net` | 基于 `HttpURLConnection` 的 HTTP 工具；支持单线程断点续传（Range）和多线程分片并行下载，含 `.cnvprog` 断点元数据 |
| `SaveSyncHelper` | 本地 SQLite 与云端存档的比对和双向同步 |
| `WebViewInterceptor` | 静态文件拦截 + GET API 缓存注入（从 `PlayerStateCache` 返回上次确认的玩家状态） |
| `CnvJsBridge` | JS ↔ Java 桥；前端通过 `window.CnvBridge` 读写编队/昵称等状态到 SQLite |
| `PlayerStateCache` | SQLite 持久化层；存储各 `/magica/api/` 端点的请求体和响应体快照 |
| `CapWorkerSolver` | 在隐藏 WebView 中完成 cap-worker PoW 验证，将最终 token 回传 Java |
| `BuildChannel` | 读 `assets/cnv_build_channel.txt`，区分 `normal`（本地构建）和 `internal-test`（CI 构建），决定更新包来源 |

### Native Hook 层

源码位于 `cnv-native/src/MagiaClient.cpp`，通过 [ShadowHook](https://github.com/bytedance/android-inline-hook) 在运行时 hook `libmadomagi_native.so` 内的若干函数：

- 拦截 `asset.json` 解析流程，检测 `cnv_inject/cn_resources_ready.flag` 是否存在
- flag 存在时，直接让所有资源下载检查返回"已完成"，引擎跳过下载场景进入主菜单
- flag 不存在时，引擎走原有下载逻辑（此时 `BootstrapActivity` 尚未完成资源准备）
- 额外拦截 `selectURL`・`http2OnResp` 等函数，确保引擎连接到正确的服务端端点

---

## 构建系统

### 自动构建（CI）

GitHub Actions 在每次推送时触发，完整流程：

1. 检出仓库，准备 JDK 17 + Android SDK + apktool + baksmali
2. 编译 `patch/src/main/java/` 下所有 Java 源文件（`javac -source 8 -target 8`）
3. d8 将 `.class` 转为 dex，baksmali 反汇编为 smali 注入 `smali_classes3/`
4. 覆写 `assets/cnv_build_channel.txt` 为 `internal-test`
5. apktool 重新打包为 APK
6. zipalign 对齐 + apksigner 签名（keystore 存于 GitHub Secrets）
7. 发布 GitHub Release，产物按渠道区分下载地址

### 本地构建

```bash
python3 tools/build.py
```

本地构建产物的 `cnv_build_channel.txt` 保持默认值 `normal`，走"正常渠道"更新。

---

## 目录结构

```
magireco-cnv-client/
├── patch/                  # Java 补丁源码（业务逻辑层）
│   └── src/main/java/
│       ├── io/kamihama/cnv/          # 客户端主逻辑
│       └── io/kamihama/magianative/  # WebView 拦截 & JS 桥
├── cnv-native/             # C++ 运行时 hook（MagiaClient.so）
│   └── src/MagiaClient.cpp
├── smali/                  # 原版 + 修改后的 smali 字节码（dex1）
├── smali_classes2/         # dex2 smali
├── assets/                 # APK assets（含 cnv_build_channel.txt）
├── lib/                    # 原版 .so（arm64-v8a / armeabi-v7a）
├── tools/                  # 构建脚本
└── apktool.yml             # apktool 配置（minSdk 21，targetSdk 33）
```

---

## 运行时依赖

| 依赖 | 说明 |
|---|---|
| Android 5.0+（minSdk 21） | 客户端最低系统要求 |
| `SYSTEM_ALERT_WINDOW` 权限 | 悬浮存档按钮（`SaveOverlayService`）所需 |
| 云端 API（`api.magi-reco.top`） | 握手、资源清单、热更新、存档同步 |
| cap-worker（`captcha.magireco.top`） | 账号登录的 PoW 验证码服务 |
| CDN / S3 镜像 | 游戏资源文件分发（支持 HTTP Range 断点续传） |

---

## 版权声明

本项目仅作学习研究使用，不会用做任何商业用途。本项目的补丁部分按照 [GPLv3](LICENSE) 协议开源，原版代码部分仅供参考，版权归属原版权方。本项目与魔法少女小圆、魔法纪录游戏的版权方和著作权方没有任何联系，如有侵权请联系我们删除。
