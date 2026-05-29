/**
 * cnv_shadow.js — 玩家操作状态的本地持久化与会话回放 + 战斗台词汉化
 *
 * 架构：
 *   Totentanz 无状态，每次会话都从空白状态开始。本脚本负责：
 *   1. 拦截 POST /magica/api/user/ 请求，同时捕获请求体和响应体；
 *   2. 通过 CnvBridge（Java SQLite）持久化，跨重装、跨账号保留；
 *   3. 下次会话在 DOMContentLoaded 时静默回放，重建玩家状态。
 *   4. 拦截 /magica/api/ 响应，将战斗结算台词（charaNo+messageId）
 *      替换为 charaMessageList.json 中的中文译文（B 类翻译）。
 *
 *   GET 请求不走这里——由 Java 层 WebViewInterceptor.interceptFull()
 *   直接从 SQLite 注入缓存响应，解决回放时序问题。
 *
 * 回退：CnvBridge 不可用时退化到 localStorage（行为与旧版一致）。
 */
(function () {
    'use strict';

    if (window.__cnvShadowLoaded) return;
    window.__cnvShadowLoaded = true;

    var LS_KEY      = 'cnv_shadow_v1';
    var SESSION_KEY = 'cnv_shadow_session';

    // 排除登录和幂等性有问题的端点
    var SKIP_PATTERNS = [
        /\/user\/login/,
        /\/(get|list|check|search|top|ranking|notice|announce|gift|gacha|draw)/,
    ];

    function shouldCapture(url) {
        if (url.indexOf('/magica/api/user/') === -1) return false;
        for (var i = 0; i < SKIP_PATTERNS.length; i++) {
            if (SKIP_PATTERNS[i].test(url)) return false;
        }
        return true;
    }

    function normalizeEndpoint(url) {
        var path = url.replace(/\?.*$/, '');
        var idx = path.indexOf('/magica/');
        return idx >= 0 ? path.substring(idx) : path;
    }

    // ── 持久化层（优先 CnvBridge，回退 localStorage）────────────────────────

    function persist(url, reqBody, respText) {
        var key = normalizeEndpoint(url);
        if (window.CnvBridge) {
            window.CnvBridge.saveState(key, reqBody || '', respText || '');
        }
        try {
            var map = lsLoad();
            map[key] = { req: reqBody, resp: respText, ts: Date.now() };
            localStorage.setItem(LS_KEY, JSON.stringify(map));
        } catch (e) {}
    }

    function evict(endpoint) {
        if (window.CnvBridge) {
            window.CnvBridge.deleteState(endpoint);
        }
        try {
            var map = lsLoad();
            delete map[endpoint];
            localStorage.setItem(LS_KEY, JSON.stringify(map));
        } catch (e) {}
    }

    function lsLoad() {
        try { return JSON.parse(localStorage.getItem(LS_KEY) || '{}'); }
        catch (e) { return {}; }
    }

    var _bridgeState = null;
    function loadAll() {
        if (window.CnvBridge && _bridgeState === null) {
            try {
                _bridgeState = JSON.parse(window.CnvBridge.loadAllState() || '{}');
            } catch (e) { _bridgeState = {}; }
        }
        return _bridgeState !== null ? _bridgeState : lsLoad();
    }

    // ── 战斗台词汉化（B 类翻译）─────────────────────────────────────────────
    //
    // charaMessageList.json 格式：[{charaNo, messageId, message}, ...]
    // 服务端 API 响应中出现 {charaNo, messageId, message} 时，将 message 替换为中文。
    //
    // 加载策略：脚本注入后立即开始异步 fetch（本地文件，通常毫秒级完成）。
    // 若加载完成前已收到 API 响应，该次响应不做替换（不影响后续请求）。

    var _msgMap = null; // null=未就绪, {}=就绪（含空 map）

    fetch('/magica/js/libs/charaMessageList.json')
        .then(function (r) { return r.ok ? r.json() : []; })
        .then(function (list) {
            var m = {};
            for (var i = 0; i < list.length; i++) {
                var e = list[i];
                m[e.charaNo + '_' + e.messageId] = e.message;
            }
            _msgMap = m;
        })
        .catch(function () { _msgMap = {}; });

    // 递归遍历 JSON 对象，将所有 {charaNo, messageId, message} 节点的 message 替换为中文。
    // 限制递归深度（MAX_DEPTH=12）避免超大响应阻塞主线程。
    var MAX_DEPTH = 12;
    function _applyMsgLocale(obj, depth) {
        if (!obj || typeof obj !== 'object' || depth > MAX_DEPTH) return;
        if (Array.isArray(obj)) {
            for (var i = 0; i < obj.length; i++) _applyMsgLocale(obj[i], depth + 1);
            return;
        }
        if ('charaNo' in obj && 'messageId' in obj && 'message' in obj) {
            var cn = _msgMap[obj.charaNo + '_' + obj.messageId];
            if (cn) obj.message = cn;
        }
        var keys = Object.keys(obj);
        for (var k = 0; k < keys.length; k++) {
            var v = obj[keys[k]];
            if (v && typeof v === 'object') _applyMsgLocale(v, depth + 1);
        }
    }

    // 对一段 API 响应 JSON 文本应用台词汉化，返回处理后的文本。
    // 若 map 未就绪或解析失败则原样返回。
    function localizeApiResponse(text, url) {
        if (!_msgMap || !text || url.indexOf('/magica/api/') === -1) return text;
        try {
            var obj = JSON.parse(text);
            _applyMsgLocale(obj, 0);
            return JSON.stringify(obj);
        } catch (e) { return text; }
    }

    // ── XHR 拦截（状态捕获 + 台词汉化）────────────────────────────────────────

    var _open = XMLHttpRequest.prototype.open;
    var _send = XMLHttpRequest.prototype.send;

    XMLHttpRequest.prototype.open = function (method, url) {
        this._cnvMethod = method;
        this._cnvUrl    = url;
        return _open.apply(this, arguments);
    };

    XMLHttpRequest.prototype.send = function (body) {
        var self    = this;
        var url     = this._cnvUrl || '';
        var method  = this._cnvMethod || '';
        var capture = method === 'POST' && shouldCapture(url);
        var localize = url.indexOf('/magica/api/') !== -1;

        if (localize || capture) {
            var reqBody = typeof body === 'string' ? body : null;

            // useCapture=true：在游戏自有 load 监听器之前执行，
            // 替换 responseText 后游戏读到的已是中文。
            this.addEventListener('load', function () {
                if (self.status < 200 || self.status >= 300) return;
                var text = self.responseText;

                if (localize && _msgMap) {
                    var localized = localizeApiResponse(text, url);
                    if (localized !== text) {
                        try {
                            // responseText 在部分 WebKit 版本中为 configurable
                            Object.defineProperty(self, 'responseText', {
                                get: function () { return localized; },
                                configurable: true,
                            });
                            Object.defineProperty(self, 'response', {
                                get: function () { return localized; },
                                configurable: true,
                            });
                            text = localized;
                        } catch (e) { /* 不可 override 则忽略 */ }
                    }
                }

                if (capture) persist(url, reqBody, text);
            }, true /* capturing */);
        }

        return _send.apply(this, arguments);
    };

    // ── fetch 拦截（状态捕获 + 台词汉化）────────────────────────────────────────

    if (window.fetch) {
        var _fetch = window.fetch.bind(window);
        window.fetch = function (input, init) {
            var url    = typeof input === 'string' ? input : (input && input.url) || '';
            var method = (init && init.method) || 'GET';
            var capture  = method === 'POST' && shouldCapture(url);
            var localize = url.indexOf('/magica/api/') !== -1;

            if (!capture && !localize) return _fetch(input, init);

            var reqBody = capture && typeof (init && init.body) === 'string'
                ? init.body : null;

            return _fetch(input, init).then(function (response) {
                if (!response.ok) return response;

                // 需要读取响应体（汉化 or 捕获），消费一次后构造新 Response 返还
                return response.text().then(function (text) {
                    var out = localize ? localizeApiResponse(text, url) : text;
                    if (capture) persist(url, reqBody, out);

                    // 用处理后的文本构造新 Response，headers/status 保持不变
                    return new Response(out, {
                        status:     response.status,
                        statusText: response.statusText,
                        headers:    response.headers,
                    });
                });
            });
        };
    }

    // ── 会话回放 ───────────────────────────────────────────────────────────────

    function replayAll() {
        if (sessionStorage.getItem(SESSION_KEY)) return;
        sessionStorage.setItem(SESSION_KEY, '1');

        var map  = loadAll();
        var keys = Object.keys(map);
        if (keys.length === 0) return;

        var chain = Promise.resolve();
        keys.forEach(function (endpoint) {
            chain = chain.then(function () {
                var entry   = map[endpoint];
                var reqBody = entry && (entry.req || entry.body);
                if (!reqBody) return;
                return fetch(endpoint, {
                    method:  'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body:    reqBody,
                }).then(function (r) {
                    if (!r.ok) evict(endpoint);
                }).catch(function () {});
            });
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', replayAll);
    } else {
        replayAll();
    }

})();
