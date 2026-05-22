# 魔法纪录 CNV 客户端 · 服务端编写指南

> 本文档基于客户端源码逐条还原所有网络行为，以"客户端发什么、服务端该回什么"
> 为主线，辅以鉴权体系、数据结构和时序关键点，供编写配套服务端时参考。

---

## 目录

1. [基础约定](#1-基础约定)
2. [鉴权体系](#2-鉴权体系)
3. [启动序列与接口调用时序](#3-启动序列与接口调用时序)
4. [接口详解](#4-接口详解)
   - 4.1 [POST /client/init](#41-post-clientinit)
   - 4.2 [POST /client/method-select](#42-post-clientmethod-select)
   - 4.3 [POST /client/online-download](#43-post-clientonline-download)
   - 4.4 [POST /client/offline-package](#44-post-clientoffline-package)
   - 4.5 [POST /client/heartbeat](#45-post-clientheartbeat)
   - 4.6 [POST /client/hot-update](#46-post-clienthot-update)
   - 4.7 [POST /account/login](#47-post-accountlogin)
   - 4.8 [POST /account/save/put](#48-post-accountsaveput)
   - 4.9 [POST /account/save/get](#49-post-accountsaveget)
5. [cap-worker 验证码服务](#5-cap-worker-验证码服务)
6. [CDN / 资源镜像](#6-cdn--资源镜像)
7. [热更新包](#7-热更新包)
8. [封禁系统](#8-封禁系统)
9. [心跳换线机制](#9-心跳换线机制)
10. [游戏阶段心跳](#10-游戏阶段心跳)
11. [云端存档格式](#11-云端存档格式)
12. [版本管理与身份伪造](#12-版本管理与身份伪造)
13. [错误处理约定](#13-错误处理约定)
14. [安全注意事项](#14-安全注意事项)

---

## 1. 基础约定

### 域名

| 服务 | 地址（硬编码于客户端） |
|---|---|
| 主 API | `https://api.magi-reco.top` |
| cap-worker | `https://captcha.magireco.top` |

这两个地址**硬编码在 APK 内**（`CloudEndpoint.java`），不可通过运行时配置替换。如需变更必须重新构建 APK。

### 传输格式

- 所有 API 请求：**HTTP POST，body 为 UTF-8 JSON**
- `Content-Type: application/json; charset=utf-8`
- `Accept: application/json`
- `User-Agent: Magireco-CNV-Bootstrap/1.0`
- 所有响应：**JSON 对象**，HTTP 200
- HTTP ≥ 400 → 客户端把 error stream 内容并入异常消息显示给用户

### 超时配置

| 接口类型 | 连接超时 | 读超时 |
|---|---|---|
| init / online-download / offline-package / hot-update | 15 s | 60 s |
| heartbeat / login | 10 s | 60 s |
| S3 XML 清单拉取 | 20 s | 60 s |
| 热更新包下载 | 30 s | 60 s |

---

## 2. 鉴权体系

客户端在不同阶段使用两套独立的令牌：

### 2.1 鉴权三件套（auth triple）

几乎所有 `/client/*` 接口都携带这三个字段：

```json
{
  "device_id":    "<64字符十六进制 SHA-256>",
  "access_token": "<握手后由服务端签发>",
  "signature":    "<64字符十六进制 SHA-256>"
}
```

**device_id**
- 算法：`SHA-256( MANUFACTURER | BRAND | MODEL | DEVICE | BOARD | HARDWARE | ANDROID_ID )`
- 硬件绑定，出厂重置才变，卸载重装不变（Android 8+ ANDROID_ID 按签名密钥作用域）
- 不含 IMEI / MAC 等需要特权权限的信息

**signature**
- 算法：`SHA-256( APK 所有签名证书字节按顺序拼接后的摘要 )`
- APK 重签名后该值改变，可用于识别非官方包
- 服务端可以拒绝不认识的 signature（但也可以宽松处理，视运营策略）

**access_token**
- 由 `/client/init` 响应中的 `access_token` 字段签发
- 本地存储在 `SharedPreferences("cnv_account")` 的 `session_token` key
- **握手前没有此令牌**：`/client/init` 请求体中不含 access_token，仅凭 device_id + signature 验证

**握手前 vs. 握手后请求体对比**

```jsonc
// /client/init 请求体（握手，无 access_token）
{
  "version":   "4.0.0",
  "device_id": "abc123...",
  "signature": "def456...",
  "channel":   "normal"   // 或 "internal-test"
}

// 握手后所有 /client/* 请求体（含 access_token）
{
  "device_id":    "abc123...",
  "access_token": "eyJ...",
  "signature":    "def456..."
}
```

### 2.2 账号令牌（account_token）

存档系统使用独立令牌，与 access_token **完全分离**：

- 来源：`POST /account/login` 响应中的 `token` 字段
- 本地存储：`SharedPreferences("cnv_account")` 的 `account_token` key
- 用途：`/account/save/put` 和 `/account/save/get` 的请求体字段 `token`

### 2.3 resource_token（CDN 资源令牌）

- 来源：`POST /client/online-download` 响应中的 `resource_token` 字段
- 用途：拉取 S3 XML 文件清单时的 `Authorization: Bearer <resource_token>` 请求头
- **不用于文件本体下载**（文件下载 URL 本身已含签名，不额外带 Authorization 头）

---

## 3. 启动序列与接口调用时序

```
App 启动
  │
  ├─ 检查本地 ban.json：若封禁且未过期 → 展示封禁弹窗，阻止进入
  │
  ├─ POST /client/init ──────────────────────────────────────── 必须
  │    ├─ banned=true → 保存封禁信息，展示致命弹窗
  │    ├─ server.status=maintenance → 展示维护弹窗（含结束时间）
  │    ├─ server.status=error → 展示错误弹窗
  │    ├─ allowed_versions 非空且当前版本不在列表内 → 提示更新
  │    └─ 正常 → 保存 access_token，读取功能开关、版本伪造配置
  │
  ├─ 判断是否需要资源下载（cnv_inject/cn_resources_ready.flag 不存在）
  │    │
  │    ├─ 否 → 跳到热更新
  │    │
  │    └─ 是 → 弹"在线/离线"选择弹窗
  │           │
  │           ├─ 在线模式
  │           │    ├─ POST /client/method-select { method: "online" }
  │           │    ├─ POST /client/online-download → 获取镜像组 + resource_token
  │           │    ├─ 若镜像组 > 1 → 弹线路选择弹窗
  │           │    ├─ 拉取 S3 XML 清单（或使用服务端内联文件列表）
  │           │    ├─ 弹并发数选择弹窗（推荐值 = min(4, 镜像数)）
  │           │    ├─ 多线程下载（每 5s POST /client/heartbeat）
  │           │    └─ 写 ready flag
  │           │
  │           └─ 离线模式
  │                ├─ POST /client/method-select { method: "offline" }
  │                ├─ POST /client/offline-package → 获取云端包信息（失败不阻断）
  │                ├─ 弹"本地/云端下载"来源选择弹窗
  │                ├─ 弹文件选择器
  │                ├─ 校验 zip + 可选 SHA-256
  │                └─ 两阶段解压 → 写 ready flag
  │
  ├─ POST /client/hot-update ────────────────────────────────── 必须（非致命）
  │    ├─ js.version > 本地版本 → 下载 cn_js_update.zip → SHA-256 → 解压
  │    └─ scenario.version > 本地版本 → 下载 cn_scenario_update.zip → SHA-256 → 解压
  │
  └─ 启动游戏
       │
       └─ SaveOverlayService 启动
            ├─ 显示悬浮存档按钮（10 分钟自动存档）
            └─ 每 5s POST /client/heartbeat（files 为空数组）
                 ├─ action=ban → 弹致命覆盖层 → killProcess
                 └─ action=maintenance → 弹致命覆盖层 → killProcess
```

---

## 4. 接口详解

### 4.1 POST /client/init

**最先调用，也是最重要的接口。** 服务端在此签发 access_token 并传递所有控制参数。

#### 请求体

```json
{
  "version":   "4.0.0",
  "device_id": "abc123...（64字符hex）",
  "signature": "def456...（64字符hex）",
  "channel":   "normal"
}
```

- `channel` 值：`"normal"`（本地手工构建）或 `"internal-test"`（CI 自动构建）
- 握手时 **无** access_token 字段

#### 响应体（完整结构）

```jsonc
{
  // ── 封禁 ──────────────────────────────────────────────────────
  "banned":     false,           // true = 该设备已被封禁
  "ban_reason": "刷榜",          // 封禁原因文本（banned=true 时有效）

  // ── 会话令牌 ──────────────────────────────────────────────────
  "access_token": "eyJhbGci...", // 后续所有请求携带的会话令牌

  // ── 服务器状态 ────────────────────────────────────────────────
  "server": {
    "status":   "normal",        // "normal" | "maintenance" | "error"
    "message":  "系统升级中",    // 维护/错误说明文本（status≠normal 时填写）
    "end_time": 1700000000       // 预计维护结束 Unix 秒（0 = 未知）
  },

  // ── 客户端版本控制 ────────────────────────────────────────────
  "client": {
    "allowed_versions": ["4.0.0", "4.0.1"],  // 空数组 = 不限制版本
    "update_url_normal":       "https://...", // 正常渠道 APK 更新下载地址
    "update_url_internal_test": "https://..."  // 内测渠道 APK 更新下载地址
  },

  // ── 版本伪造（可选）──────────────────────────────────────────
  "spoof": {
    "fake_version": "2.0.0",    // 向游戏 native 层伪造的版本号
    "fake_name":    "magica"    // 向游戏 native 层伪造的应用名（预留）
  },

  // ── 功能开关（可选，缺省全部开放）────────────────────────────
  "features": {
    "online_download":  true,   // false = 不显示在线下载选项
    "offline_package":  true,   // false = 不显示离线包选项
    "disabled_message": "服务暂停，敬请期待" // 两者均 false 时展示
  }
}
```

#### 客户端行为逻辑

| 条件 | 客户端行为 |
|---|---|
| `banned = true` | 持久化 `reason`/`expire_time` 到 `ban.json`，展示致命弹窗 |
| `server.status = "maintenance"` | 展示维护弹窗（含 end_time 格式化时间），按确定后退出 |
| `server.status = "error"` | 展示错误弹窗 |
| 当前版本不在 `allowed_versions` | 弹更新提示，提供跳转到 `update_url_*` 的按钮 |
| `access_token` 非空 | 写入 SharedPreferences，后续请求携带 |
| `spoof.fake_version` 非空 | 写入 `Spoof` 静态缓存，游戏 native 层将上报该伪造版本 |
| `features.online_download=false` | 在线下载选项从 UI 中隐藏 |
| 两个 features 均 false | 只显示 `disabled_message` 或默认维护文案，无法继续 |

#### 最简响应（开发初期可用）

```json
{
  "banned": false,
  "access_token": "dev-token-01",
  "server": { "status": "normal" }
}
```

---

### 4.2 POST /client/method-select

**遥测接口，服务端可记录用户选择行为。客户端忽略响应体。**

#### 请求体

```json
{
  "device_id":    "abc123...",
  "access_token": "eyJ...",
  "signature":    "def456...",
  "method":       "online"
}
```

- `method`：`"online"` 或 `"offline"`
- 客户端对失败静默忽略（`try/catch` 吞掉异常）

#### 响应体

```json
{}
```

返回任意 200 即可，客户端不解析响应。

---

### 4.3 POST /client/online-download

**返回镜像组列表和 CDN 访问令牌。**

#### 请求体

```json
{
  "device_id":    "abc123...",
  "access_token": "eyJ...",
  "signature":    "def456..."
}
```

#### 响应体

```jsonc
{
  "resource_token": "s3-signed-token-xxx",  // CDN Bearer 令牌

  // 新格式：按线路分组
  "groups": [
    {
      "name": "华东线路",        // 展示给用户的线路名
      "mirrors": [
        // 写法 A：仅 URL（客户端去 S3 XML 自动发现文件列表）
        "https://cdn1.example.com/res/",
        "https://cdn2.example.com/res/",

        // 写法 B：URL + 内联文件列表（推荐；省去 S3 XML 请求）
        {
          "url": "https://cdn3.example.com/res/",
          "files": [
            { "key": "cn_res_001.zip", "size": 104857600 },
            { "key": "cn_res_002.zip", "size": 209715200 }
          ]
        }
      ]
    },
    {
      "name": "海外线路",
      "mirrors": [
        { "url": "https://intl.example.com/res/", "files": [ ... ] }
      ]
    }
  ]
}
```

**兼容旧格式（客户端会自动降级处理）：**

```json
{
  "resource_token": "xxx",
  "mirrors": [
    "https://cdn1.example.com/res/",
    "https://cdn2.example.com/res/"
  ]
}
```

旧格式会被包装成单个"默认线路"组，且没有内联文件列表（触发 S3 XML 发现）。

#### 关键约束

- `groups` 为空或缺失 + `mirrors` 也为空 → 客户端弹致命弹窗"资源配置缺失"，流程终止
- `resource_token` 为空 → 同上
- 一个 group 内只要有**任意一个** mirror 提供 `files` 字段，该组就进入"内联文件列表"模式，不会再发 S3 XML 请求
- `files` 中 `size` 为 -1 表示大小未知（影响进度条精度，不影响下载）

---

### 4.4 POST /client/offline-package

**返回云端离线包信息，仅供用户参考，不强制下载。接口失败不阻断离线流程。**

#### 请求体

```json
{
  "device_id":    "abc123...",
  "access_token": "eyJ...",
  "signature":    "def456..."
}
```

#### 响应体

```json
{
  "download_url":    "https://cdn.example.com/offline/cn_all_resources_v20.zip",
  "package_version": "v20",
  "sha256":          "a1b2c3...（64字符hex，可空）"
}
```

- `sha256` 为空时客户端跳过 SHA-256 校验（仍做 zip 格式验证）
- 任意字段缺失都不会阻断流程，客户端会降级处理

---

### 4.5 POST /client/heartbeat

**核心管控接口。下载阶段和游戏阶段均调用，每 5 秒一次。**

#### 请求体

```jsonc
{
  "device_id":    "abc123...",
  "access_token": "eyJ...",
  "signature":    "def456...",

  // 下载阶段：各文件实时状态
  "files": [
    {
      "name":      "cn_res_001.zip",
      "status":    "downloading",   // "pending" | "downloading" | "done" | "failed"
      "percent":   45.2,            // 0.0~100.0
      "speed_bps": 1048576          // 瞬时速率（字节/秒）
    },
    {
      "name":   "cn_res_002.zip",
      "status": "pending",
      "percent": 0.0,
      "speed_bps": 0
    }
  ]

  // 游戏阶段：空数组
  // "files": []
}
```

#### 响应体（三种情况）

**正常，无操作：**
```json
{ "action": "ok" }
```
或直接返回 `{}` 亦可（客户端默认 action 为 "ok"）。

**触发换线（仅在下载阶段有效）：**
```json
{
  "action": "switch_mirrors",
  "assignments": [
    {
      "mirror": "https://cdn2.example.com/res/",
      "files":  ["cn_res_001.zip", "cn_res_002.zip"]
    }
  ]
}
```
客户端收到后：
1. 找到 `files` 中列出的正在下载的文件
2. 更新其 `currentMirror` 为 `mirror` 值
3. 设置 `switchPending = true`
4. 下载线程检测到 `switchPending` 后抛 IOException，下载循环用新镜像重试

**封禁设备：**
```json
{
  "action":      "ban",
  "reason":      "违规行为：外挂使用",
  "expire_time": 1735689600
}
```
- `expire_time`：解封时间 Unix 秒；**0 = 永久封禁**
- 客户端立即持久化到 `ban.json`，展示致命弹窗（下载阶段中止，游戏阶段 killProcess）

**维护通知（仅游戏阶段心跳生效）：**
```json
{
  "action":   "maintenance",
  "message":  "服务器升级中，暂停服务",
  "end_time": 1700001000
}
```
- `end_time`：0 = 不显示预计时间
- 客户端展示全屏覆盖层，用户点确定后 killProcess

---

### 4.6 POST /client/hot-update

**每次进游戏前调用，检查 js 和 scenario 两个热更新包的版本。接口失败不阻断启动（跳过热更）。**

#### 请求体

```json
{
  "device_id":    "abc123...",
  "access_token": "eyJ...",
  "signature":    "def456..."
}
```

#### 响应体

```json
{
  "js": {
    "version":      5,
    "sha256":       "a1b2...（64字符hex）",
    "download_url": "https://cdn.example.com/hot/cn_js_update.zip",
    "size":         20971520
  },
  "scenario": {
    "version":      12,
    "sha256":       "c3d4...",
    "download_url": "https://cdn.example.com/hot/cn_scenario_update.zip",
    "size":         52428800
  }
}
```

- `version`：整数，递增。客户端在 SharedPreferences `cnv_hot_update` 中存储本地版本（`js_version` / `scenario_version`）。**服务端版本 > 本地版本 → 触发下载**
- `sha256`：可为空（跳过校验）
- `size`：文件总字节数。`> 0` 时客户端使用 4 线程分片下载（`Net.downloadChunked`）；`-1` 或 `0` 时退化为单线程续传（`Net.downloadResume`）
- 任一包缺失或 `download_url` 为空时，该包的热更被跳过
- 服务端版本 `≤` 本地版本 → 不下载，直接标记"done"

---

### 4.7 POST /account/login

**账号系统登录接口。登录成功后 account_id 和 account_token 用于存档同步。**

#### 请求体

```json
{
  "username":  "user@example.com",
  "password":  "hunter2",
  "cap_token": "pow-verified-token-xxx"
}
```

- `cap_token`：由 cap-worker PoW 验证后签发的令牌（见第 5 节）

#### 成功响应（HTTP 200）

```json
{
  "success":    true,
  "account_id": "uid-00001234",
  "token":      "account-long-lived-token"
}
```

客户端写入：
- `SharedPreferences("cnv_account").account_id` = `uid-00001234`
- `SharedPreferences("cnv_account").account_token` = `account-long-lived-token`

#### 失败响应（HTTP 401/403 等均可，客户端读 error stream）

```json
{
  "success": false,
  "error":   "密码错误"
}
```

客户端将 `error` 字段展示给用户。

---

### 4.8 POST /account/save/put

**上传存档。使用 account_token 鉴权，与 access_token 无关。**

#### 请求体

```json
{
  "token": "account-long-lived-token",
  "data": {
    "/magica/api/user/deck/list": {
      "req":  "{\"userId\":\"001\"}",
      "resp": "{\"code\":\"success\",\"data\":[...]}"
    },
    "/magica/api/user/basic": {
      "req":  null,
      "resp": "{\"code\":\"success\",\"data\":{...}}"
    }
  }
}
```

- `data` 格式：JSON 对象，key 为游戏 API 端点路径，value 为 `{ req, resp }` 对（均为字符串，内容是序列化的 JSON）
- `req` 可为 null

#### 响应体

```json
{ "success": true }
```

---

### 4.9 POST /account/save/get

**下载存档。**

#### 请求体

```json
{ "token": "account-long-lived-token" }
```

#### 有存档时响应

```json
{
  "success": true,
  "data": {
    "/magica/api/user/deck/list": {
      "req":  "{...}",
      "resp": "{...}"
    }
  }
}
```

#### 无存档时响应

```json
{ "success": true, "data": {} }
```

客户端根据 `data` 是否为 `{}` 判断云端存档是否为空，据此决定同步策略（见第 11 节）。

---

## 5. cap-worker 验证码服务

客户端在隐藏 WebView 中使用 [cap-worker](https://github.com/xyTom/cap-worker) 完成 PoW 验证。服务端部署 cap-worker 即可，无需修改协议。

### 流程

```
客户端 WebView
  │
  ├─ POST https://captcha.magireco.top/api/challenge
  │    响应：{ token, challenge: { c, s, d }, expires }
  │
  ├─ 本地计算：对 i ∈ [0,c) 求最小 nonce
  │   使 SHA-256(token + "." + i + "." + nonce) 前 d 个二进制位为 0
  │
  └─ POST https://captcha.magireco.top/api/redeem
       请求：{ token, solutions: [nonce0, nonce1, ...] }
       响应：{ success: true, token: "verified-token", expires }
```

最终 `verified-token` 作为 `cap_token` 字段附在 `/account/login` 请求中。

### 参数说明

- `c`：子挑战数量（sub-challenge count）
- `d`：难度（前 d 个比特需为 0）
- `s`：随机盐（客户端未直接使用，由服务端在 redeem 验证时使用）

---

## 6. CDN / 资源镜像

### 6.1 文件清单拉取

若 `/client/online-download` 响应中的 mirror 没有内联 `files` 字段，客户端向每个 mirror 根路径发 GET 请求拉取 S3 XML 清单：

```
GET https://cdn.example.com/res/
Authorization: Bearer <resource_token>
User-Agent: Magireco-CNV-Bootstrap/1.0
```

**响应必须是标准 S3 ListBucketResult XML：**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Contents>
    <Key>cn_res_001.zip</Key>
    <Size>104857600</Size>
  </Contents>
  <Contents>
    <Key>cn_res_002.zip</Key>
    <Size>209715200</Size>
  </Contents>
</ListBucketResult>
```

客户端用正则直接抓 `<Contents>` 块中的 `<Key>` 和 `<Size>`，不需要完整 XML 解析。

**推荐使用内联 `files` 列表代替 S3 XML：** 省去一次网络往返，格式更简洁，也无需暴露 S3 兼容端点。

### 6.2 文件下载

文件 URL 拼接规则：`mirror_url + "/" + key`（如果 mirror_url 不以 `/` 结尾会自动补）

```
GET https://cdn.example.com/res/cn_res_001.zip
Range: bytes=0-              ← 单线程续传时
Range: bytes=0-26214399      ← 多线程分片时（每个分片独立连接）
User-Agent: Magireco-CNV-Bootstrap/1.0
```

**服务端必须支持：**
- HTTP 206 Partial Content（Range 请求）
- `Accept-Ranges: bytes` 响应头（多线程下载前会 HEAD 探测）
- `Content-Length` 响应头（用于精确进度展示和完整性校验）

热更新包（`cn_js_update.zip` / `cn_scenario_update.zip`）下载时若 `size > 0`，客户端启动 4 线程分片下载并在同目录保存 `.cnvprog` 断点元数据；服务端无需任何特殊配合。

### 6.3 热更新文件与在线资源的关系

在线全量下载阶段，客户端会**主动过滤掉** `cn_js_update.zip` 和 `cn_scenario_update.zip`（即使 S3 清单中存在）。这两个文件专属于 `/client/hot-update` 流程，由 `runHotUpdate()` 单独处理。因此：

- S3 桶中可以包含这两个文件（供热更下载）
- 在线下载的 `files` 列表也可以包含它们（会被客户端自动忽略）

---

## 7. 热更新包

### 打包结构

热更新包是普通 zip 文件，由 `unzipHotPatch()` 直接解压到 `filesDir`（即 `/data/data/io.kamihama.totentanz/files/`）。

`WebViewInterceptor` 将 `/magica/*` 请求映射到 `filesDir/magica/*`，因此 zip 条目**必须带 `magica/` 前缀**（与离线全量包的两阶段解压逻辑一致）。

```
cn_js_update.zip
└── magica/
    └── js/
        └── libs/
            ├── charaList.json
            ├── cardList.json
            ├── doppelList.json
            ├── itemList.json
            ├── pieceList.json
            ├── sectionList.json
            ├── chapterList.json
            ├── eventList.json
            ├── eventStoryList.json
            ├── shopItemList.json
            ├── enemyList.json
            ├── giftList.json
            ├── live2dList.json
            ├── formationSheetList.json
            ├── arenaClassList.json
            ├── patrolAreaList.json
            ├── charaMessageList.json
            ├── cardSkillMap.json
            ├── cardMagiaMap.json
            ├── doppelCardMagiaMap.json
            ├── emotionSkillMap.json
            ├── pieceSkillMap.json
            ├── placeSkillMap.json
            └── jquery-3.7.1.min.js

cn_scenario_update.zip
└── magica/
    └── js/
        └── scenario/
            └── ...（剧情脚本文件）
```

解压后的路径示例：`filesDir/magica/js/libs/charaList.json` → WebView 请求 `/magica/js/libs/charaList.json` 时由 `WebViewInterceptor` 优先返回此本地文件。

### 版本号管理

客户端用 SharedPreferences `cnv_hot_update` 存储已应用版本：
- `js_version`（int，初始为 0）
- `scenario_version`（int，初始为 0）

服务端只需保证版本号单调递增即可。**降低版本号（回滚）对客户端无效**（`serverVer <= localVer` 时直接跳过）。

---

## 8. 封禁系统

### 封禁来源

1. `/client/init` 响应中 `banned: true`
2. `/client/heartbeat` 响应中 `action: "ban"`（下载阶段或游戏阶段均有效）

### 本地持久化

封禁信息写入 `{filesDir}/cnv_inject/ban.json`：

```json
{
  "reason":      "违规行为",
  "expire_time": 1735689600
}
```

- `expire_time = 0`：永久封禁
- 每次 App 启动，在 `/client/init` **之前**检查此文件
- `isActive()` 逻辑：`expire_time == 0 || 当前Unix秒 < expire_time`

### 解封

目前客户端没有主动清除 `ban.json` 的逻辑，只有 `BanInfo.clear()` 方法存在但未被调用。

**推荐方案：** 在 `/client/init` 响应中加入 `"banned": false` 时，或增加一个 `"ban_cleared": true` 字段，由客户端主动删除本地 `ban.json`。（当前版本需手动清除应用数据或等 expire_time 过期自动失效。）

---

## 9. 心跳换线机制

心跳换线仅在**下载阶段**有效，游戏阶段心跳不处理 `switch_mirrors`。

### 服务端换线判断参考

服务端可基于 heartbeat 中上报的以下数据决策换线：
- 各文件 `speed_bps` 持续低于阈值
- 文件长时间停留在 `"downloading"` 状态但进度不涨
- 特定 IP 段的 CDN 节点故障

### 换线响应构造示例

```json
{
  "action": "switch_mirrors",
  "assignments": [
    {
      "mirror": "https://backup-cdn.example.com/res/",
      "files":  ["cn_res_001.zip"]
    }
  ]
}
```

- 每条 assignment 可以包含多个文件
- 不在 `assignments` 中的文件继续使用原镜像
- 客户端只对 `status = DOWNLOADING` 的文件响应换线（已完成或待开始的文件不受影响）

---

## 10. 游戏阶段心跳

游戏启动后，`SaveOverlayService` 每 5 秒发一次空载心跳：

```json
{
  "device_id":    "abc123...",
  "access_token": "eyJ...",
  "signature":    "def456...",
  "files":        []
}
```

服务端可响应：
- `action: "ok"`（或空体）：无操作，继续
- `action: "ban"`：弹全屏封禁覆盖层，用户点确定后 killProcess
- `action: "maintenance"`：弹全屏维护覆盖层，用户点确定后 killProcess

**注意：`action: "switch_mirrors"` 在游戏阶段会被静默忽略**（`handleHeartbeatResponse` 仅处理 ban 和 maintenance）。

---

## 11. 云端存档格式

存档数据是游戏 API 缓存的快照，由 `PlayerStateCache`（SQLite）管理。

### 上传数据结构

```json
{
  "token": "account-token",
  "data": {
    "/magica/api/user/deck/list": {
      "req":  "{\"userId\":\"001\"}",
      "resp": "{\"code\":\"success\",\"data\":[...]}"
    },
    "/magica/api/user/basic": {
      "resp": "{\"code\":\"success\",\"data\":{...}}"
    }
  }
}
```

- Key：游戏 API 端点的 path（从 `/magica/` 开始）
- `req`：玩家最后一次 POST 到该端点的请求体（字符串化 JSON），可为 null
- `resp`：服务端最后一次确认的响应体（字符串化 JSON）

### 同步状态机

```
loadLocal() + fetchCloud()
  │
  ├─ 两端均空 → IN_SYNC，不操作
  ├─ 本地有，云端空 → LOCAL_ONLY → 自动静默上传
  ├─ 本地空，云端有 → CLOUD_ONLY → 提示用户下载存档
  ├─ 两端相同 → IN_SYNC，不操作
  └─ 两端均有且不同 → CONFLICT → 弹冲突对话框让用户选择
```

服务端只需原样存储 `data` 对象，不需要理解其内容。

---

## 12. 版本管理与身份伪造

### 版本闸门（allowed_versions）

`/client/init` 响应中的 `allowed_versions` 是客户端允许继续运行的版本列表。

```json
"client": {
  "allowed_versions": ["4.0.0", "4.0.1"],
  "update_url_normal":        "https://example.com/apk/cnv-normal.apk",
  "update_url_internal_test": "https://example.com/apk/cnv-internal.apk"
}
```

- 空数组 / 缺失 `client` 字段 → 不做版本检查
- 当前版本不在列表内 → 展示更新弹窗，引导用户下载新版
- 更新 URL 按 build channel 选择：`BuildChannel.get()` 返回 `"internal-test"` 则用 `update_url_internal_test`

### 版本伪造（spoof）

游戏 native 层通过 smali patch 的钩子调用 `Spoof.getFakeVersion()`：
- 非 null → native 层向游戏服务器上报 `fake_version`
- null → 走原 PackageManager 路径，上报真实 APK versionName

通过 `/client/init` 的 `spoof` 字段控制：

```json
"spoof": {
  "fake_version": "2.0.0",
  "fake_name":    "magica"
}
```

两者均为可选，空字符串视为未配置。

---

## 13. 错误处理约定

### HTTP 状态码语义

- **200**：成功（即使业务层失败，也通过响应体的 `success: false` 表达）
- **400~499**：客户端错误。响应体会被读入异常消息展示给用户
- **500~**：服务端错误。同上

### 网络失败行为

| 接口 | 失败行为 |
|---|---|
| `/client/init` | 弹致命弹窗，无法继续 |
| `/client/method-select` | 静默忽略，继续流程 |
| `/client/online-download` | 弹致命弹窗 |
| `/client/offline-package` | 静默忽略，仅本地文件来源 |
| `/client/heartbeat` | 记录 WARN 日志，下次重试 |
| `/client/hot-update` | 记录 WARN 日志，跳过热更 |
| `/account/login` | 展示错误消息给用户 |
| `/account/save/put` | Toast 提示"存档失败" |
| `/account/save/get` | 抛异常，调用方降级处理 |

---

## 14. 安全注意事项

### 服务端应校验的内容

1. **signature 白名单**：只接受己方签名证书的 SHA-256，拒绝其他值（防止重打包客户端接入）
2. **device_id 限速**：同一 device_id 短时间内大量请求 → 可能是模拟器刷量
3. **access_token 有效期**：建议设置过期时间，过期后要求重新握手
4. **cap_token 一次性**：登录时的 cap_token 验证后立即失效，防止重放

### 客户端侧的安全机制

- API 端点地址**硬编码**在 APK 内，不可通过服务端下发替换（防止中间人劫持整个客户端）
- TLS 由 Android 系统 CA 栈验证，与浏览器安全级别一致
- resource_token 只用于 S3 XML 清单拉取（`Authorization: Bearer`），不用于文件下载本身
- device_id **不含 IMEI/MAC** 等隐私敏感信息，出厂重置才变

### 存档安全

- account_token 为长期令牌，服务端应支持主动吊销（不在当前协议中，需扩展）
- 存档数据原样存储，服务端无需解析内容，但应做大小限制（防止超大 payload）

---

*文档生成自客户端源码 `patch/src/main/java/`，如客户端行为有更新请同步维护本文档。*
