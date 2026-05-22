/**
 * cnv_shadow.js — 玩家操作状态的本地持久化与会话回放
 *
 * 架构：
 *   Totentanz 无状态，每次会话都从空白状态开始。本脚本负责：
 *   1. 拦截 POST /magica/api/user/ 请求，同时捕获请求体和响应体；
 *   2. 通过 CnvBridge（Java SQLite）持久化，跨重装、跨账号保留；
 *   3. 下次会话在 DOMContentLoaded 时静默回放，重建玩家状态。
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
        // 同步写 localStorage 作为本地副本（同步读取快）
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

    // 启动时一次性从 CnvBridge 加载（桥存在时比 localStorage 权威）
    var _bridgeState = null;
    function loadAll() {
        if (window.CnvBridge && _bridgeState === null) {
            try {
                _bridgeState = JSON.parse(window.CnvBridge.loadAllState() || '{}');
            } catch (e) { _bridgeState = {}; }
        }
        return _bridgeState !== null ? _bridgeState : lsLoad();
    }

    // ── XHR 拦截（捕获请求体 + 响应体）────────────────────────────────────────

    var _open = XMLHttpRequest.prototype.open;
    var _send = XMLHttpRequest.prototype.send;

    XMLHttpRequest.prototype.open = function (method, url) {
        this._cnvMethod = method;
        this._cnvUrl    = url;
        return _open.apply(this, arguments);
    };

    XMLHttpRequest.prototype.send = function (body) {
        if (this._cnvMethod === 'POST' && shouldCapture(this._cnvUrl)) {
            var self     = this;
            var reqBody  = typeof body === 'string' ? body : null;
            this.addEventListener('load', function () {
                if (self.status >= 200 && self.status < 300) {
                    persist(self._cnvUrl, reqBody, self.responseText);
                }
            });
        }
        return _send.apply(this, arguments);
    };

    // ── fetch 拦截（捕获请求体 + 响应体）────────────────────────────────────────

    if (window.fetch) {
        var _fetch = window.fetch.bind(window);
        window.fetch = function (input, init) {
            var url    = typeof input === 'string' ? input : (input && input.url) || '';
            var method = (init && init.method) || 'GET';
            if (method === 'POST' && shouldCapture(url)) {
                var reqBody = (init && typeof init.body === 'string') ? init.body : null;
                return _fetch(input, init).then(function (response) {
                    if (response.ok) {
                        response.clone().text().then(function (text) {
                            persist(url, reqBody, text);
                        });
                    }
                    return response;
                });
            }
            return _fetch(input, init);
        };
    }

    // ── 会话回放 ───────────────────────────────────────────────────────────────

    function replayAll() {
        if (sessionStorage.getItem(SESSION_KEY)) return;
        sessionStorage.setItem(SESSION_KEY, '1');

        var map  = loadAll();
        var keys = Object.keys(map);
        if (keys.length === 0) return;

        // 串行回放，顺序与首次操作顺序一致（updated_at 升序由 Java 保证）
        var chain = Promise.resolve();
        keys.forEach(function (endpoint) {
            chain = chain.then(function () {
                var entry   = map[endpoint];
                // 兼容旧格式 {body: ...} 和新格式 {req: ...}
                var reqBody = entry && (entry.req || entry.body);
                if (!reqBody) return;
                return fetch(endpoint, {
                    method:  'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body:    reqBody,
                }).then(function (r) {
                    if (!r.ok) {
                        // 服务端拒绝（角色/卡片不存在等），清除该条目
                        evict(endpoint);
                    }
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
