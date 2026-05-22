/**
 * cnv_shadow.js — 设置影子（本地备份 + 会话起始回放）
 *
 * 原理：
 *   Totentanz 是无状态后端，每次会话需重新设置编队/昵称/偏好。
 *   本脚本拦截 WebView JS 层发出的 POST /magica/api/user/ 请求，
 *   将请求体存入 localStorage，在下次会话初始化时静默回放。
 *
 * 部署：
 *   通过 WebViewInterceptor 从 APK assets 提供（路径 /magica/cnv/cnv_shadow.js）。
 *   由 onPageFinished smali patch 注入到所有 /magica/ 页面。
 */
(function () {
    'use strict';

    if (window.__cnvShadowLoaded) return;
    window.__cnvShadowLoaded = true;

    var STORAGE_KEY  = 'cnv_shadow_v1';
    var SESSION_KEY  = 'cnv_shadow_session';

    // 只拦截 /magica/api/user/ 前缀，排除登录和只读接口
    var SKIP_PATTERNS = [
        /\/user\/login/,
        /\/(get|list|check|search|top|ranking|notice|announce|gift)/,
    ];

    function shouldCapture(url) {
        if (url.indexOf('/magica/api/user/') === -1) return false;
        for (var i = 0; i < SKIP_PATTERNS.length; i++) {
            if (SKIP_PATTERNS[i].test(url)) return false;
        }
        return true;
    }

    function load() {
        try { return JSON.parse(localStorage.getItem(STORAGE_KEY) || '{}'); }
        catch (e) { return {}; }
    }

    function save(url, body) {
        try {
            // 只保留路径部分作为 key，去掉 query string
            var key = url.replace(/\?.*$/, '').replace(/^https?:\/\/[^/]+/, '');
            var map = load();
            map[key] = { body: body, ts: Date.now() };
            localStorage.setItem(STORAGE_KEY, JSON.stringify(map));
        } catch (e) {}
    }

    // ── XHR 拦截 ─────────────────────────────────────────────────────────────

    var _open = XMLHttpRequest.prototype.open;
    var _send = XMLHttpRequest.prototype.send;

    XMLHttpRequest.prototype.open = function (method, url) {
        this._cnvMethod = method;
        this._cnvUrl    = url;
        return _open.apply(this, arguments);
    };

    XMLHttpRequest.prototype.send = function (body) {
        if (this._cnvMethod === 'POST' && shouldCapture(this._cnvUrl)) {
            save(this._cnvUrl, typeof body === 'string' ? body : null);
        }
        return _send.apply(this, arguments);
    };

    // ── fetch 拦截 ───────────────────────────────────────────────────────────

    if (window.fetch) {
        var _fetch = window.fetch.bind(window);
        window.fetch = function (input, init) {
            var url    = typeof input === 'string' ? input : (input && input.url) || '';
            var method = (init && init.method) || 'GET';
            if (method === 'POST' && shouldCapture(url)) {
                var body = init && init.body;
                save(url, typeof body === 'string' ? body : null);
            }
            return _fetch(input, init);
        };
    }

    // ── 回放 ─────────────────────────────────────────────────────────────────

    function replayAll() {
        var sessionId = Date.now().toString(36);
        if (sessionStorage.getItem(SESSION_KEY)) return;  // 本 session 已回放过
        sessionStorage.setItem(SESSION_KEY, sessionId);

        var map = load();
        var keys = Object.keys(map);
        if (keys.length === 0) return;

        // 顺序回放（await 模拟：串联 Promise 链）
        var chain = Promise.resolve();
        keys.forEach(function (endpoint) {
            chain = chain.then(function () {
                var entry = map[endpoint];
                if (!entry || !entry.body) return;
                return fetch(endpoint, {
                    method:  'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body:    entry.body,
                }).then(function (r) {
                    if (!r.ok) {
                        // 服务端拒绝（角色/卡片数据已不存在），清除该条目
                        delete map[endpoint];
                        localStorage.setItem(STORAGE_KEY, JSON.stringify(map));
                    }
                }).catch(function () {});
            });
        });
    }

    // DOMContentLoaded 时回放（native login 在 WebView 加载前已完成，cookie 已就绪）
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', replayAll);
    } else {
        replayAll();
    }

})();
