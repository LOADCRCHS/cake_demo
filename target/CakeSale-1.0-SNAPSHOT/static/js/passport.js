/**
 * Created by luzd on 17/7/17.
 */
var pop = {
    iAlert: function (msg, fn) {
        var self = this;
        var content = '<div class="ui_alert inner" id="iAlert">' +
            '<i id="closePop"></i>' +
            '<div class="text"><p>' + msg + '</p></div>' +
            '<div class="btn_wrap"><button>确定</button></div>' +
            '</div>';
        self.showPop(content);
        $('#closePop,#iAlert button').click(function () {
            self.hidePop(fn);
        });
    },
    //确认框
    iConfirm: function (html, okFn, cancelFn, obj) {
        obj = obj || {};
        var self = this,
            bottom = '<div class="btn_wrap clear_fix">' +
                '<button class="f_left cancel_btn">取消</button>' +
                '<button class="f_right ok_btn">确定</button>' +
                '</div>';
        if (obj.hideBottom) {
            bottom = '';
        }
        var content = '<div class="ui_confirm inner" id="iConfirm">' +
            '<div class="text">' + html + '</div>' +
            bottom +
            '</div>';
        self.showPop(content);
        $('#iConfirm .ok_btn').click(function () {
            okFn && okFn();
        });
        $('#iConfirm .cancel_btn').click(function () {
            self.hidePop();
            cancelFn && cancelFn();
        });
    },
    //弹出对话框
    showPop: function (content) {
        $('<div id="uiPop" class="ui_pop">' + content + '</div>').appendTo($('.container'));
        setTimeout(function () {
            $('#uiPop').addClass('active');
        }, 0);
    },
    //删除对话框
    hidePop: function (fn) {
        $('#uiPop').removeClass('active');
        setTimeout(function () {
            $('#uiPop').remove();
            fn && fn();
        }, 500);
    }
};
$(function () {
    //获取短信倒计时
    var countDownTimer = null;
    //滑动解锁全局对象
    var aliVerify = null;
    //更新图形验证码
    $('.captchaWrap').click(function () {
        var img = $(this).find('img'),
            url = img.attr('src');
        var pos = url.indexOf('&v=');
        url = pos === -1 ? url : url.substring(0, pos);
        $.get(url + '&refresh=true', function () {
            img.attr('src', url + '&v=' + Math.random());
        });
    });

    //错误提示
    function createError(dom, msg) {
        dom.siblings('.error_message').html('*' + msg).removeClass('hide');
    }

    //通用错误处理
    $('.input_wrap input').on('input propertychange', function () {
        $(this).siblings('.error_message').html('').addClass('hide');
    }).on('blur', function () {
        var me = $(this),
            msg;
        if (!$.trim(me.val())) {
            if (msg = me.attr('data-error')) {
                createError(me, msg);
            }
        }
    });

    //检查手机号
    function checkMobile(val, dom) {
        if (!val) {
            createError(dom, '手机号码不能为空');
            return false;
        }
        if (!utils.checkMobile(val)) {
            createError(dom, '手机号码格式不正确');
            return false;
        }
        return true;
    }

    //短信验证码
    function getCode(button, data, fn) {
        button.prop('disabled', true);
        fn = fn || {};
        $.ajax({
            method: 'get',
            url: '/customer/get-code.html',
            data: data
        }).done(function (data) {
            if (data.error === 0) {
                countDown(button);
                fn.success && fn.success();
            } else if (data.error === 101) {
                button.prop('disabled', false);
                aliVerify = null;
                $('#aliVerify').addClass('hide');
                $('#picVerify').removeClass('hide');
            } else {
                button.prop('disabled', false);
                $.alert(data.msg);
                fn.fail && fn.fail();
            }
        }).fail(function () {
            button.prop('disabled', false);
            fn.fail && fn.fail();
        }).always(function () {
            fn.always && fn.always();
        });
    }

    //获取验证码倒计时
    function countDown(button, seconds, text) {
        seconds = seconds || 120;
        text = text || '发送验证码';
        var fn = function () {
            button.text(seconds-- + 's');
            if (seconds >= 0) {
                countDownTimer = setTimeout(fn, 1000);
            } else {
                clearTimeout(countDownTimer);
                button.text(text).prop('disabled', false);
                resetAliVerify();
            }
        };
        fn();
    }

    //生成滑动验证码
    function createAliVerify() {
        var nc = new noCaptcha();
        var nc_appkey = 'FFFF000000000173456C';  //应用标识,不可更改
        var nc_scene = 'register';  //场景,不可更改
        var nc_token = [nc_appkey, (new Date()).getTime(), Math.random()].join(':');
        var nc_option = {
            renderTo: '#aliVerifyDom',//渲染到该DOM ID指定的Div位置
            appkey: nc_appkey,
            scene: nc_scene,
            token: nc_token,
            trans: '{"name1":"code100"}',//测试用，特殊nc_appkey时才生效，正式上线时请务必要删除；code0:通过;code100:点击验证码;code200:图形验证码;code300:恶意请求拦截处理
            callback: function (data) {//校验成功回调
                $('#csessionid').val(data.csessionid);
                $('#sig').val(data.sig);
                $('#token').val(data.token);
                $('#scene').val(data.scene);
                hideAliVerifyNotice();
            }
        };
        nc.init(nc_option);
        aliVerify = nc;
    }

    //重置滑动解锁
    function resetAliVerify() {
        if (!aliVerify) {
            return;
        }
        aliVerify.reset();
        $('#csessionid').val('');
        $('#sig').val('');
        $('#token').val('');
        hideAliVerifyNotice();
    }

    //隐藏提示
    function hideAliVerifyNotice() {
        $('#aliVerify .error_message').addClass('hide');
    }

    //登录
    var login = {
        needCheck: !$('#needCheck').hasClass('hide'),            //账号密码登录，失败3次后开始显示图片验证码
        userName: '',               //账户登录未绑定手机时的账户名，用作手机绑定的username值,
        yzmLogin: 1,                //1是手机验证登录，2是绑定手机
        isUnbinding: false,
        //登录
        doLogin: function (button) {
            var self = this,
                data,
                isLoginByMobile = $('.tab_btn.active').attr('data-tab') === 'mobile',
                username = $('#username'),
                password = $('#password'),
                yzm1 = $('#yzm1'),
                mobile = $('#mobile'),
                yzm2 = $('#yzm2'),
                sms = $('#sms'),
                _username = $.trim(username.val()),
                _password = $.trim(password.val()),
                _yzm1 = $.trim(yzm1.val()),
                _mobile = $.trim(mobile.val()),
                _yzm2 = $.trim(yzm2.val()),
                _sms = $.trim(sms.val());
            if (isLoginByMobile) {
                if (!checkMobile(_mobile, mobile)) {
                    return;
                }
                if (!_sms) {
                    createError(sms, '请输入短信验证码');
                    return;
                }
                data = {
                    userName: self.yzmLogin === 1 ? _mobile : self.userName,
                    yzmLogin: self.yzmLogin,
                    mobile: _mobile,
                    code: _sms,
                    yzm: _yzm2
                }
            } else {
                if (!_username) {
                    createError(username, '用户名不能为空');
                    return;
                }
                if (!(utils.checkEmail(_username) || utils.checkMobile(_username))) {
                    createError(username, '用户名格式不正确');
                    return;
                }
                if (!_password) {
                    createError(password, '密码不能为空');
                    return;
                }
                data = {
                    userName: _username,
                    passWord: _password
                };
                if (self.needCheck) {
                    if (!_yzm1) {
                        createError(yzm1, '验证码不能为空');
                        return;
                    }
                    data.yzm = _yzm1;
                }
            }
            button.prop('disabled', true);
            $.ajax({
                method: 'get',
                url: '/customer/check-login.html',
                data: data
            }).done(function (data) {
                var list = [], str = '', html = '';
                if (data.errorCount >= 3) {
                    self.needCheck = true;
                    $('#needCheck').removeClass('hide');
                }
                if (data.error === 0) {
                    window.location = lastUrl;
                } else if (data.error === 10) {
                    //没有绑定手机号，跳转绑定手机
                    self.bindMobile(_username);
                } else if (data.error === 11 || data.error === 12) {
                    //error为11时，手机号已绑定多个账号，选择一个账号登录，未选择的账号，清空mobile、isCheck字段信息（等于将此手机号与其他账号解绑并清空mobile）调用unbindMobile
                    //error为12时，手机号未与账号绑定，并且手机号不等于custID，如果有账号的mobile为此手机号，则绑定手机号并登录,如果有多个账号的mobile=手机号，则选择一个绑定并登录
                    var bind = data.error === 12 ? 'bind' : '';
                    list = data.data;
                    str = '';
                    $.each(list, function (i, v) {
                        var classStr = i === 0 ? 'active' : '';
                        str += '<br>' +
                            '<a href="javascript:void(0)"' +
                            ' data-mobile="' + v.mobile + '" ' +
                            'class="' + classStr + '" ' +
                            'data-username="' + v.custID + '">' +
                            v.custID +
                            '</a>';
                    });
                    html = '<h3>手机号' + _mobile + '已绑定以下账号，为了您的账户安全请选择一个诺心账户登录,此手机号将与其他账号解绑。</h3>' +
                        '<h4>若有疑问可联系在线客服4001-578-578。<br/>' + str + '</h4>';
                    pop.iConfirm(html, function () {
                        var activeItem = $('#uiPop .text .active');
                        var custID = activeItem.attr('data-username'),
                            mobile = activeItem.attr('data-mobile');
                        self.unbindMobile(custID, mobile, bind);
                    });
                    $('#uiPop .text a').click(function () {
                        $(this).addClass('active').siblings().removeClass('active');
                    });
                } else {
                    //更新验证码
                    if (isLoginByMobile) {
                        $('.tab_mobile img').click();
                    } else {
                        $('.tab_account img').click();
                    }
                    yzm1.val('');
                    yzm2.val('');
                    $.alert(data.msg);
                }
            }).always(function () {
                button.prop('disabled', false);
            });
        },
        //跳转绑定手机号
        bindMobile: function (userName) {
            var self = this;
            self.yzmLogin = 2;
            self.userName = userName;
            $('#mobile').val('');
            $('#yzm2').val('');
            $('#sms').val('');
            $('[data-tab="mobile"]').click();
            $('#tabTitle,#bindTitle').toggleClass('hide');
            $('.bottom_link').css('visibility', 'hidden');
            $('#submitLogin').text('立即绑定');
            //去除找回密码倒计时
            clearTimeout(countDownTimer);
            $('#getCode').text('发送验证码').prop('disabled', false);
        },
        //解绑其他账号
        unbindMobile: function (custID, mobile, bind) {
            bind = bind || 'unbind';
            var self = this;
            if (self.isUnbinding) {
                return;
            }
            self.isUnbinding = true;
            $.ajax({
                method: 'get',
                url: '/customer/' + bind + '.html',
                data: {custID: custID, mobile: mobile}
            }).done(function (data) {
                if (data.error === 0) {
                    window.location = lastUrl;
                } else {
                    $.alert(data.msg);
                }
            }).always(function () {
                pop.hidePop();
                self.isUnbinding = false;
            });
        },
        //绑定dom事件
        bindEvent: function () {
            var self = this;
            //切换账户/手机登录
            $('.tab_btn').click(function () {
                var me = $(this),
                    tab = me.attr('data-tab');
                if (me.hasClass('active')) {
                    return;
                }
                me.addClass('active').siblings().removeClass('active');
                $('.tab').addClass('hide');
                $('.tab_' + tab).removeClass('hide').find('.captchaWrap').click();
            });
            //点击获取短信验证码
            $('#getCode').click(function () {
                var button = $(this),
                    mobile = $('#mobile'),
                    yzm2 = $('#yzm2'),
                    _mobile = $.trim(mobile.val()),
                    _yzm2 = $.trim(yzm2.val());
                if (!checkMobile(_mobile, mobile)) {
                    return;
                }
                if (!_yzm2) {
                    createError(yzm2, '验证码不能为空');
                    return;
                }
                getCode(button, {mobile: _mobile, yzm: _yzm2}, {
                    fail: function () {
                        yzm2.val('');
                        $('.tab_mobile .captchaWrap').click();
                    }
                });
            });
            //点击登录
            $('#submitLogin').click(function () {
                self.doLogin($(this));
            });

            //其他登录方式
            //微信登录
            $('#moreLoginType .wx').click(function () {
                var href = $(this).attr('data-link'),
                    width = 560,
                    height = 540,
                    left = ($(window).width() - width) / 2,
                    top = ($(window).height() - height) / 2;
                window.open(href, '_blank', 'toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=' + width + ', height=' + height + ',left=' + left + ',top=' + top);
            });

            //回车提交
            document.onkeydown = function (event) {
                //当存在绑定手机的弹出框时不执行下列代码
                if ($('#loginBind').length) {
                    return;
                }
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode === 13) {
                    $('#submitLogin').click();
                }
            };
        },
        //初始化
        init: function () {
            if (!$('.main_login').length) {
                return;
            }
            this.bindEvent();
        }
    };
    //注册
    var register = {
        bindEvent: function () {
            //手机号判断
            $('#mobile').blur(function () {
                var me = $(this),
                    val = $.trim(me.val());
                if (val && !utils.checkMobile(val)) {
                    createError(me, '手机号码格式不正确');
                }
            });
            //密码格式
            $('#password1').blur(function () {
                var me = $(this),
                    val = $.trim(me.val());
                if (val && !utils.checkPassword(val)) {
                    createError(me, '密码长度只能在6-20个字符之间');
                }
            });
            //新老密码判断
            $('#password2').blur(function () {
                var me = $(this),
                    val = $.trim(me.val()),
                    password1 = $.trim($('#password1').val());
                if (val && password1 && val !== password1) {
                    createError(me, '两次密码输入不一致');
                }
            });
            //点击规则
            $('#rule').change(function () {
                var me = $(this);
                if (me.is(':checked')) {
                    me.siblings('.error_message').addClass('hide');
                } else {
                    me.siblings('.error_message').removeClass('hide');
                }
            });
            //点击获取短信验证码
            $('#getCode').click(function () {
                var button = $(this),
                    data = {},
                    mobile = $('#mobile'),
                    yzm = $('#yzm'),
                    _mobile = $.trim(mobile.val()),
                    _yzm = $.trim(yzm.val()),

                    csessionid = $('#csessionid').val(),
                    sig = $('#sig').val(),
                    token = $('#token').val(),
                    isAliVerify = $('#picVerify').hasClass('hide');
                if (!checkMobile(_mobile, mobile)) {
                    return;
                }
                data.mobile = _mobile;
                if (isAliVerify) {
                    if (!csessionid) {
                        $('#aliVerify .error_message').removeClass('hide');
                        return;
                    }
                    data.csessionid = csessionid;
                    data.sig = sig;
                    data.token = token;
                } else {
                    if (!_yzm) {
                        createError(yzm, '请输入验证码');
                        return;
                    }
                    data.yzm = _yzm;
                }
                getCode(button, data, {
                    fail: function () {
                        resetAliVerify();
                        yzm.val('');
                        $('.captchaWrap').click();
                    }
                });
            });
            //点击提交
            $('#submitRegister').click(function () {
                var button = $(this),
                    data = {},
                    mobile = $('#mobile'),
                    password1 = $('#password1'),
                    password2 = $('#password2'),
                    yzm = $('#yzm'),
                    code = $('#code'),
                    _mobile = $.trim(mobile.val()),
                    _password1 = $.trim(password1.val()),
                    _password2 = $.trim(password2.val()),
                    _code = $.trim(code.val()),

                    csessionid = $('#csessionid'),
                    sig = $('#sig'),
                    token = $('#token'),
                    isAliVerify = $('#picVerify').hasClass('hide');
                if (!checkMobile(_mobile, mobile)) {
                    return;
                }
                if (!_password1) {
                    createError(password1, '请输入密码');
                    return;
                }
                if (!utils.checkPassword(_password1)) {
                    createError(password1, '密码长度只能在6-20个字符之间');
                    return;
                }
                if (!_password2) {
                    createError(password2, '请再次输入密码');
                    return;
                }
                if (_password1 !== _password2) {
                    createError(password2, '两次密码输入不一致');
                    return;
                }
                if (!_code) {
                    createError(code, '手机验证码不能为空');
                    return;
                }
                data.code = _code;
                if (!$('#rule').is(':checked')) {
                    $(this).siblings('.error_message').removeClass('hide');
                    return;
                }
                button.prop('disabled', true);
                $.ajax({
                    method: 'get',
                    url: '/customer/check-register.html',
                    data: {
                        userName: _mobile,
                        passWord: _password1,
                        passWord2: _password2,
                        code: _code
                    }
                }).done(function (data) {
                    if (data.error === 0) {
                        window.location = lastUrl;
                    } else {
                        $.alert(data.msg);
                    }
                }).always(function () {
                    button.prop('disabled', false);
                    if (!isAliVerify) {
                        //更新验证码
                        $('.captchaWrap').click();
                        yzm.val('');
                    } else {
                        resetAliVerify();
                    }
                });
            });
        },
        //初始化
        init: function () {
            if (!$('.main_register').length) {
                return;
            }
            this.bindEvent();
            createAliVerify();
        }
    };
    //找回密码
    var findPw = {
        userName: '',               //用户名/手机号/邮箱
        mobile: '',                 //用户已注册手机号
        email: '',                  //用户已注册邮箱
        pcustID: '',                //用户id
        useType: '',                //获取验证时使用的方式
        key: '',                    //验证key
        ismobile: 0,                //是否绑定多个账号，1是0否
        //发送短信/邮件验证码
        getCode: function (success, fail, always) {
            var self = this,
                type = self.useType,
                url = '/customer/get-find-code.html';
            if (type === 'email') {
                url = '/customer/send-mail.html';
            }
            $.ajax({
                method: 'get',
                url: url,
                data: {
                    pcustID: self.pcustID
                }
            }).done(function (res) {
                if (res.error === 0) {
                    success && success();
                } else {
                    $.alert(res.msg, {
                        confirmFn: function () {
                            $.removeDialog();
                            fail && fail();
                        }
                    });
                }
            }).always(function () {
                always && always();
            });
        },
        //阶段跳转
        changePage: function (index) {
            var self = this;
            if (index !== 1 && !self.pcustID) {
                $.alert('请先获取用户信息');
                return;
            }
            if (index === 2) {
                $('.use_type').addClass('hide');
                if (self.mobile) {
                    $('.type_mobile').removeClass('hide');
                }
                if (self.email) {
                    $('.type_email').removeClass('hide');
                }
            }
            if (index === 3) {
                $('.find_type').addClass('hide');
                var type = self.useType,
                    text = self[type];
                $('#' + type + 'Text').text(text).parents('.find_type').removeClass('hide');
            }
            $('.progress_bar dl:eq(' + (index - 1) + ')').addClass('active').siblings().removeClass('active');
            $('.form_wrap:eq(' + (index - 1) + ')').removeClass('hide').siblings().addClass('hide');
        },
        //绑定dom事件
        bindEvent: function () {
            var self = this;
            //根据用户名获取用户信息
            $('#getUserInfo').click(function () {
                var button = $(this),
                    data = {},
                    userName = $('#userName'),
                    yzm = $('#yzm'),
                    _userName = $.trim(userName.val()),
                    _yzm = $.trim(yzm.val()),
                    csessionid = $('#csessionid').val(),
                    sig = $('#sig').val(),
                    token = $('#token').val(),
                    isAliVerify = $('#picVerify').hasClass('hide');
                if (!_userName) {
                    createError(userName, '请输入用户名');
                    return;
                }
                data.userName = _userName;
                if (isAliVerify) {
                    if (!csessionid) {
                        createError(userName, '请拖动滑块完成验证');
                        return;
                    }
                    data.csessionid = csessionid;
                    data.sig = sig;
                    data.token = token;
                } else {
                    if (!_yzm) {
                        createError(yzm, '请输入验证码');
                        return;
                    }
                    data.yzm = _yzm;
                }
                self.userName = _userName;
                button.prop('disabled', true);
                $.ajax({
                    method: 'get',
                    url: '/customer/find-user.html',
                    data: data
                }).done(function (res) {
                    var data = res.data;
                    if (res.error === 0) {
                        self.email = data.email;
                        self.mobile = data.mobile;
                        self.pcustID = data.pcustID;
                        self.changePage(2);
                    } else if (res.error === 101) {
                        $('#aliVerify').addClass('hide');
                        $('#picVerify').removeClass('hide');
                    } else {
                        $.alert(res.msg);
                    }
                }).always(function () {
                    button.prop('disabled', false);
                    resetAliVerify();
                });
            });
            //选择找回密码方式
            $('.use_type').click(function () {
                var me = $(this),
                    type = me.attr('data-type');
                if (!me.hasClass('active')) {
                    return;
                }
                self.useType = type;
                self.getCode(function () {
                    self.changePage(3);
                });
            });
            //验证短信验证码
            $('#checkCode').click(function () {
                var button = $(this),
                    code = $.trim($('#smsCode').val());
                if (!code) {
                    $.alert('请输入验证码');
                    return;
                }
                button.prop('disabled', true);
                $.ajax({
                    method: 'get',
                    url: '/customer/check-find-code.html',
                    data: {
                        pcustID: self.pcustID,
                        code: code
                    }
                }).done(function (res) {
                    var data = res.data;
                    if (res.error === 0) {
                        self.changePage(4);
                        self.key = data.key;
                    } else if (res.error === 2) {
                        var list = res.data, str = '';
                        $.each(list, function (i, v) {
                            str += '<br>' + v.custID;
                        });
                        var html = '<h3>当前手机号' + self.mobile + '绑定了多个诺心账号，为了您的账户安全，<br>' +
                            '继续找回密码该手机号将与其他账号解绑！</h3>' +
                            '<h4>已绑定的其他账号：<br/>' + str + '</h4>';
                        pop.iConfirm(html, function () {
                            pop.hidePop();
                            self.changePage(4);
                        });
                        self.ismobile = 1;
                    } else {
                        $.alert(res.msg);
                    }
                }).always(function () {
                    button.prop('disabled', false);
                });
            });
            //重新发送短信/邮件验证码
            $('#sendSms,#sendEmail').click(function () {
                self.getCode(function () {
                    pop.iAlert('发送成功');
                });
            });
            //重置密码
            $('#resetPw').click(function () {
                var button = $(this),
                    password1 = $('#password1'),
                    password2 = $('#password2'),
                    _password1 = $.trim(password1.val()),
                    _password2 = $.trim(password2.val());
                if (!_password1) {
                    createError(password1, '请输入密码');
                    return;
                }
                if (!utils.checkPassword(_password1)) {
                    createError(password1, '密码长度只能在6-20个字符之间');
                    return;
                }
                if (!_password2) {
                    createError(password2, '请再次输入密码');
                    return;
                }
                if (_password1 !== _password2) {
                    createError(password2, '两次密码输入不一致');
                    return;
                }
                button.prop('disabled', true);
                $.ajax({
                    method: 'get',
                    url: '/customer/reset-pwd.html',
                    data: {
                        pcustID: self.pcustID,
                        ismobile: self.isMobile,
                        key: self.key,
                        passWord: _password1
                    }
                }).done(function (res) {
                    if (res.error === 0) {
                        self.changePage(5);
                    } else {
                        $.alert(res.msg);
                    }
                }).always(function () {
                    button.prop('disabled', false);
                });
            });
        },
        //初始化
        init: function () {
            if (!$('.main_find_pw').length) {
                return;
            }
            this.key = $('#customerKey').val();
            this.pcustID = $('#pcustID').val();
            this.bindEvent();
            createAliVerify();
        }
    };
    //微信登录绑定手机号
    var loginBind = {
        needCheck: !$('#needCheck').hasClass('hide'),            //账号密码登录，失败3次后开始显示图片验证码
        userName: '',               //账户登录未绑定手机时的账户名，用作手机绑定的username值,
        yzmLogin: 1,                //1是手机验证登录，2是绑定手机
        isUnbinding: false,
        //登录
        doLogin: function (button) {
            var self = this,
                data,
                mobile = $.trim($('#bindMobile').val()),
                yzm = $.trim($('#bindYzm').val()),
                sms = $.trim($('#bindSms').val());
            if (!mobile) {
                self.showError('手机号码不能为空');
                return;
            }
            if (!utils.checkMobile(mobile)) {
                self.showError('手机号码格式不正确');
                return;
            }
            if (!sms) {
                self.showError('请输入短信验证码');
                return;
            }
            data = {
                userName: self.yzmLogin === 1 ? mobile : self.userName,
                yzmLogin: self.yzmLogin,
                mobile: mobile,
                code: sms,
                yzm: yzm
            };
            button.prop('disabled', true);
            $.ajax({
                method: 'get',
                url: '/customer/check-login.html',
                data: data
            }).done(function (data) {
                var list = [], str = '', html = '';
                if (data.error === 0) {
                    window.location = lastUrl;
                } else if (data.error === 11 || data.error === 12) {
                    //error为11时，手机号已绑定多个账号，选择一个账号登录，未选择的账号，清空mobile、isCheck字段信息（等于将此手机号与其他账号解绑并清空mobile）调用unbindMobile
                    //error为12时，手机号未与账号绑定，并且手机号不等于custID，如果有账号的mobile为此手机号，则绑定手机号并登录,如果有多个账号的mobile=手机号，则选择一个绑定并登录
                    var bind = data.error === 12 ? 'bind' : '';
                    list = data.data;
                    str = '';
                    $.each(list, function (i, v) {
                        var classStr = i === 0 ? 'active' : '';
                        str += '<br>' +
                            '<a href="javascript:void(0)"' +
                            ' data-mobile="' + v.mobile + '" ' +
                            'class="' + classStr + '" ' +
                            'data-username="' + v.custID + '">' +
                            v.custID +
                            '</a>';
                    });
                    html = '<h3>手机号' + mobile + '已绑定以下账号，为了您的账户安全请选择一个诺心账户登录,此手机号将与其他账号解绑。</h3>' +
                        '<h4>若有疑问可联系在线客服4001-578-578。<br/>' + str + '</h4>';
                    pop.iConfirm(html, function () {
                        var activeItem = $('#uiPop .text .active');
                        var custID = activeItem.attr('data-username'),
                            mobile = activeItem.attr('data-mobile');
                        self.unbindMobile(custID, mobile, bind);
                    });
                    $('#uiPop .text a').click(function () {
                        $(this).addClass('active').siblings().removeClass('active');
                    });
                } else {
                    $.alert(data.msg);
                }
            }).always(function () {
                button.prop('disabled', false);
            });
        },
        //解绑其他账号
        unbindMobile: function (custID, mobile, bind) {
            bind = bind || 'unbind';
            var self = this;
            if (self.isUnbinding) {
                return;
            }
            self.isUnbinding = true;
            $.ajax({
                method: 'get',
                url: '/customer/' + bind + '.html',
                data: {custID: custID, mobile: mobile}
            }).done(function (data) {
                if (data.error === 0) {
                    window.location = lastUrl;
                } else {
                    $.alert(data.msg);
                }
            }).always(function () {
                pop.hidePop();
                self.isUnbinding = false;
            });
        },
        //显示错误信息
        showError: function (msg) {
            $('#bindErrorMessage').text('*' + msg);
        },
        //隐藏错误信息
        hideError: function () {
            $('#bindErrorMessage').text('');
        },
        //刷新图片验证码
        refreshCaptcha: function () {
            $('#loginBind').find('.captchaWrap').click();
        },
        //绑定dom事件
        bindEvent: function () {
            var self = this;
            //点击获取短信验证码
            $('#bindGetCode').click(function () {
                var button = $(this),
                    mobile = $.trim($('#bindMobile').val()),
                    yzm = $.trim($('#bindYzm').val());
                self.hideError();
                if (!mobile) {
                    self.showError('手机号码不能为空');
                    return;
                }
                if (!utils.checkMobile(mobile)) {
                    self.showError('手机号码格式不正确');
                    return;
                }
                if (!yzm) {
                    self.showError('验证码不能为空');
                    return;
                }
                getCode(button, {mobile: mobile, yzm: yzm}, {
                    fail: function () {
                        $('#bindYzm').val('');
                        $('#loginBind .captchaWrap').click();
                    }
                });
            });
            //点击登录
            $('#bindSubmit').click(function () {
                self.doLogin($(this));
            });
            //删除弹窗
            $('#bindCloseBtn').click(function () {
                $('#loginBind').remove();
            });
            //回车提交
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode === 13) {
                    $('#bindSubmit').click();
                }
            };
        },
        //初始化
        init: function () {
            if (!$('#loginBind').length) {
                return;
            }
            this.bindEvent();
            this.refreshCaptcha();
        }
    };
    login.init();
    loginBind.init();
    findPw.init();
    register.init();
});