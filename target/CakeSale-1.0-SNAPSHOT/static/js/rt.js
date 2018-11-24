/**
 *  * Lecake JavaScript Code
 *   * http://www.lecake.com/
 *    * Copyright(C) 2017 - 2017, Lecake All rights reserved
 *     * @version v1.0.0
 *      */
!function (win) {
    var doc = win.document,
        location = doc.location,
        glb = glb || {};
    glb.cfg = {
        domain: location.hostname.split(".").slice(-2).join(".") || "lecake.com",
        cpath: "/",
        server_url: location.protocol + ("//wrcdn.lecake.com/img/")
    };
    glb.now = Date.now() || function () {
        return (new Date).getTime();
    };
    glb.random = function () {
        return ("" + Math.random()).slice(-8);
    };
    glb.$class = function (className) {
        var eles = doc.getElementsByClassName(className);
        return eles && eles.length > 0 && eles[0];
    };
    glb.encode = function (value) {
        return encodeURIComponent(value);
    };
    glb.decode = function (value) {
        return decodeURIComponent(value);
    };
    glb.getCookie = function (cookieName, defaultValue, uriDecode) {
        var i = new RegExp("(^| )" + cookieName + "=([^;]*)(;|$)"),
            r = doc.cookie.match(i);
        return r ? uriDecode ? glb.decode(r[2]) : r[2] : defaultValue || "";
    };
    glb.setCookie = function (key, value, expire) {
        var domain = glb.cfg.domain ? ";domain=" + glb.cfg.domain : "",
            exp = "";
        if (expire >= 0) {
            exp = ";expires=" + new Date(glb.now + expire).toUTCString()
        }
        doc.cookie = key + "=" + glb.encode(value) + domain + ";path=/" + exp
    };
    glb.on = function () {
        return doc.addEventListener ? function (c, type, listener) {
                c.addEventListener(type, listener);
            }
            : doc.attachEvent ? function (c, type, listener) {
                    c.attachEvent("on" + type, listener);
                }
                : function () {

                };
    }();
    glb.off = function () {
        return doc.addEventListener ? function (win, type, listener, useCapture) {
                win.removeEventListener(type, listener, useCapture || !1);
            }
            : doc.attachEvent ? function (win, type, listener) {
                    t.detachEvent("on" + type, listener);
                }
                : function () {

                };
    }();
    glb.trace = function (w) {
        function Session() {
            this._queue = [];
            this.init();
        }

        if ("undefined" != typeof JSON && "function" == typeof JSON.stringify && win.top == win.self) {
            Session.prototype = {
                constructor: Session,
                init: function () {
                    if (!glb.getCookie("tid")) {//new visitor
                        glb.setCookie("tid", glb.random(), 7 * 24 * 60 * 60 * 1000);
                    }
                    if (!glb.getCookie("u_sid")) {//new visitor
                        glb.setCookie("u_sid", "s_" + glb.random());
                    }
                    var n = this;
                    glb.on(document, "click", function (ele) {
                        n.cclick(ele)
                    }, !0);
                },
                cclick: function (ele) {
                    var e = ele.target || ele.srcElement,
                        data = [];
                    if (e && e.getAttribute("data-statistics")) {
                        data = e.getAttribute("data-statistics").split('|');
                        this._push("click", data);
                    }
                },
                _push: function (t, data, n) {
                    var i = {
                        action: t,
                        data: data,
                        ts: n || +new Date
                    };
                    this._queue.push(i);
                    this._checkSend(false, t);
                },
                _sendData: function (data) {
                    var e = glb.cfg.server_url + "bf.gif?d=";
                    e += data + "&jv=1.0.0";
                    var n = new Image;
                    n.onload = function () {
                        n = n.onload = null
                    };
                    n.src = e;
                },
                _checkSend: function (force, t) {
                    t = t || 'unload';
                    if (force || this._queue.length > 0) {
                        var data = [[t, (new Date).getTime(), _.enterTime, _.tid(), glb.encode(_.href), glb.encode(_.referrer), _.ua, _.oid(), _.uname(), _.sid()], this._queue];
                        this._sendData(JSON.stringify(data));
                        this._queue = [];
                    }
                }
            };
            var sess = new Session();
            glb.on(w, "load", function () {
                sess._checkSend(!0, 'load');
            });
            glb.on(w, "beforeunload", function () {
                sess._checkSend(!0, 'unload');
            });
        }
    };
    var app = function (t) {
        this.enterTime = glb.now;
        this.referrer = win.document.referrer;
        this.href = win.location.href;
        this.commonData = [];
        this.ua = win.navigator.userAgent;
    };
    app.prototype = {
        get: function (key) {
            return glb.getCookie(key);
        },
        href: function () {
            return win.location.href;
        },
        tid: function () {
            return glb.getCookie('tid');
        },
        sid: function () {
            return glb.getCookie('u_sid');
        },
        oid: function () {
            var no = glb.$class('order-num');
            return no && no.innerHTML ? no.innerHTML : null;
        },
        uname: function () {
            return glb.getCookie('WANSONSHOP_IDENTIFIER');
        }
    };

    var _ = new app;
    var x = null;
    var ini = function () {
        x = setTimeout(ini, 50);
        null !== x && clearTimeout(x);
        glb.trace(win);
    }();
}(window);
