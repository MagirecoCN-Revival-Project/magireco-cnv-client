/**
 * cnv_shadow.js — 玩家操作状态的本地持久化与会话回放 + 战斗台词汉化 + UI 文字汉化
 *
 * 架构：
 *   Totentanz 无状态，每次会话都从空白状态开始。本脚本负责：
 *   1. 拦截 POST /magica/api/user/ 请求，同时捕获请求体和响应体；
 *   2. 通过 CnvBridge（Java SQLite）持久化，跨重装、跨账号保留；
 *   3. 下次会话在 DOMContentLoaded 时静默回放，重建玩家状态。
 *   4. 拦截 /magica/api/ 响应，将战斗结算台词（charaNo+messageId）
 *      替换为 charaMessageList.json 中的中文译文（B 类翻译）。
 *   5. 通过 DOM 文本节点替换 + MutationObserver，将商店/扭蛋等
 *      WebView 页面的日文 UI 字符串实时汉化（C 类翻译）。
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

    // ── WebView UI 文字汉化（C 类翻译，DOM 文本节点层）──────────────────────────
    //
    // 适用范围：所有 /magica/ 页面（商店、扭蛋、活动、编队、设置等）。
    // 实现方式：递归遍历文本节点，按词典做精确/子串替换；同时挂 MutationObserver
    // 监听动态插入的节点，保证 SPA 页面切换后新内容也能被汉化。
    // 安全边界：跳过 <script>/<style>/<textarea>/<input> 内的文本。

    var UI_DICT = [
        // ── 扭蛋 ──────────────────────────────────────────────
        ['ガチャTOP',           '扭蛋首页'],
        ['ガチャ',              '扭蛋'],
        ['10回召喚',            '十连召唤'],
        ['1回召喚',             '单次召唤'],
        ['10回引く',            '十连'],
        ['1回引く',             '单抽'],
        ['召喚する',            '召唤'],
        ['召喚',               '召唤'],
        ['ピックアップ率UP!',   '精选概率提升！'],
        ['ピックアップ',        '精选'],
        ['排出確率',            '召唤概率'],
        ['確率を見る',          '查看概率'],
        ['確率',               '概率'],
        ['期間限定',            '限时'],
        ['限定',               '限定'],
        ['復刻',               '复刻'],
        ['開催中',             '进行中'],
        ['実施中',             '实施中'],
        ['開催期間',            '活动期间'],
        ['☆4以上確定',         '四星以上保底'],
        ['☆3以上確定',         '三星以上保底'],
        ['☆確定',              '★保底'],
        ['フォーカス召喚',      '精选召唤'],

        // ── 商店 ──────────────────────────────────────────────
        ['ショップTOP',         '商店首页'],
        ['ショップ',            '商店'],
        ['購入する',            '购买'],
        ['購入',               '购买'],
        ['所持ジュエル',        '持有宝石'],
        ['課金ジュエル',        '付费宝石'],
        ['無償ジュエル',        '免费宝石'],
        ['ジュエル',            '宝石'],
        ['まほうの欠片',        '魔法碎片'],
        ['マギアクリスタル',    '魔宝石'],
        ['マギアストーン',      '魔宝石'],
        ['タイムセール',        '限时特卖'],
        ['スタミナ回復',        '体力恢复'],
        ['セール中',            '特卖中'],
        ['売り切れ',            '已售完'],
        ['セット',             '套装'],
        ['個セット',            '个套装'],

        // ── 资源/道具名 ────────────────────────────────────────
        ['アイテム',            '道具'],
        ['強化素材',            '强化素材'],
        ['進化素材',            '进化素材'],
        ['覚醒素材',            '觉醒素材'],
        ['クエストチケット',    '任务券'],
        ['AP回復',             'AP恢复'],
        ['APポーション',        'AP药水'],

        // ── 通用导航与按钮 ──────────────────────────────────────
        ['ホーム',             '首页'],
        ['もどる',             '返回'],
        ['閉じる',             '关闭'],
        ['確認する',           '确认'],
        ['確認',               '确认'],
        ['キャンセル',         '取消'],
        ['はい',               '是'],
        ['いいえ',             '否'],
        ['完了',               '完成'],
        ['次へ',               '下一步'],
        ['前へ',               '上一步'],
        ['詳細を見る',         '查看详情'],
        ['詳細',               '详情'],
        ['一覧',               '列表'],
        ['すべて',             '全部'],
        ['選択',               '选择'],
        ['受け取る',           '领取'],
        ['受け取り',           '领取'],
        ['使用する',           '使用'],
        ['強化する',           '强化'],
        ['売却する',           '出售'],
        ['設定',               '设置'],
        ['ログアウト',         '退出登录'],

        // ── 玩家状态 ────────────────────────────────────────────
        ['スタミナ',           '体力'],
        ['ランク',             '段位'],
        ['フレンドポイント',    '好友点数'],
        ['フレンド',           '好友'],
        ['プロフィール',        '个人信息'],
        ['レベル',             '等级'],
        ['経験値',             '经验值'],

        // ── 活动/任务 ────────────────────────────────────────────
        ['クエスト',           '任务'],
        ['イベント',           '活动'],
        ['ミッション',         '任务'],
        ['デイリー',           '每日'],
        ['ウィークリー',        '每周'],
        ['ランキング',         '排行榜'],
        ['お知らせ',           '通知'],
        ['プレゼント',         '礼物'],
        ['ギルド',             '公会'],
        ['ストーリー',         '剧情'],

        // ── 状态提示 ────────────────────────────────────────────
        ['読み込み中',         '加载中…'],
        ['通信中',             '通信中…'],
        ['接続中',             '连接中…'],
        ['しばらくお待ちください', '请稍候…'],
        ['エラーが発生しました', '发生错误'],
        ['通信エラー',         '通信错误'],
        ['もう一度お試しください', '请重试'],
        ['サーバーメンテナンス', '服务器维护中'],
        ['メンテナンス中',     '维护中'],
    ];

    // 将词典编译为有序替换列表（长词优先，避免子串覆盖）
    UI_DICT.sort(function(a, b) { return b[0].length - a[0].length; });

    var UI_SKIP_TAGS = { SCRIPT: 1, STYLE: 1, TEXTAREA: 1, INPUT: 1 };

    function uiTranslate(text) {
        var out = text;
        for (var i = 0; i < UI_DICT.length; i++) {
            var jp = UI_DICT[i][0];
            if (out.indexOf(jp) === -1) continue;
            out = out.split(jp).join(UI_DICT[i][1]);
        }
        return out;
    }

    function uiProcessNode(node) {
        if (node.nodeType === 3) {
            var v = node.nodeValue;
            if (!v || !v.trim()) return;
            var t = uiTranslate(v);
            if (t !== v) node.nodeValue = t;
        } else if (node.nodeType === 1) {
            if (UI_SKIP_TAGS[node.tagName]) return;
            var c = node.childNodes;
            for (var i = 0; i < c.length; i++) uiProcessNode(c[i]);
        }
    }

    function uiTranslatePage() {
        if (document.body) uiProcessNode(document.body);
    }

    var _uiObserver = new MutationObserver(function(mutations) {
        for (var i = 0; i < mutations.length; i++) {
            var m = mutations[i];
            if (m.type === 'childList') {
                for (var j = 0; j < m.addedNodes.length; j++) uiProcessNode(m.addedNodes[j]);
            } else if (m.type === 'characterData') {
                var n = m.target;
                var v = n.nodeValue;
                if (!v || !v.trim()) continue;
                var t = uiTranslate(v);
                if (t !== v) n.nodeValue = t;
            }
        }
    });

    function uiStartObserver() {
        if (!document.body) return;
        uiTranslatePage();
        _uiObserver.observe(document.body, {
            subtree:       true,
            childList:     true,
            characterData: true,
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', uiStartObserver);
    } else {
        uiStartObserver();
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
