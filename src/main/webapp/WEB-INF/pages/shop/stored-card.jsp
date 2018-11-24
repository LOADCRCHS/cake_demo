<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 2018/11/9
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8"/>
    <title>诺心蛋糕官网|诺心LE CAKE—诺心蛋糕网上订购</title>
    <meta name="Keywords" content="诺心蛋糕官网,诺心, 生日蛋糕订购，芝士蛋糕,慕斯蛋糕,草莓蛋糕，蛋糕网上订购，订蛋糕，网上订蛋糕"/>
    <meta name="Description" content="诺心蛋糕官网提供生日蛋糕,巧克力蛋糕,芝士蛋糕,水果蛋糕,慕斯蛋糕,草莓蛋糕订购,蛋糕店已在上海,北京,广州,深圳,天津,杭州,苏州,成都,重庆,宁波,南京开通网上订蛋糕,免费配送到家。"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta property="wb:webmaster" content="ec5363986c1d9b8a"/>
    <link rel="shortcut icon" href="/favicon.ico?01" type="image/x-icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/base.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/widget.css">
    <!--[if lt IE 9]>
    <script src="<%=request.getContextPath()%>/static/js/html5.min.js"></script>
    <![endif]-->
    <script>
        var GlobalConfig = {
            'baseUrl': 'https://www.lecake.com/',
            '<%=request.getContextPath()%>/staticUrl': '//newimgcdn.lapetit.cn/web/',
            'cookieDomain': '.lecake.com',
            'imageRoot': '//imagecdn.lapetit.cn/postsystem/docroot/images',
            '<%=request.getContextPath()%>/staticVersions': '2018110702',
            'site_env': 'prod'
        };
        var isLecakeCNDomain = false;
        //用户id
        var customerId = '';
        //用户信息
        var customerInfo = [];
        //某些商品特殊餐具数量
        var globalSpecialDinnerware = {"105819":"\u542b2\u628a\u9910\u53c9","105822":"\u542b2\u628a\u9910\u53c9","105909":"\u542b2\u628a\u9910\u53c9","105978":"\u542b2\u628a\u9910\u53c9","106041":"\u5404\u542b2\u628a\u9910\u52fa","106032":"\u542b2\u628a\u9910\u52fa","106038":"\u542b2\u628a\u9910\u52fa","106031":"\u542b2\u628a\u9910\u52fa","106035":"\u542b2\u628a\u9910\u52fa","106071":"\u542b2\u628a\u9910\u52fa","106068":"\u542b2\u628a\u9910\u52fa","107135":"\u542b1\u628a\u9910\u53c9"};
    </script>
    <script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/vue.min.js"></script>
    <link href="<%=request.getContextPath()%>/static/css/passport.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/nc.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/loginapp.css" rel="stylesheet"></head>
<body>
<article class="container main_login main_passport max_width">
    <header class="global_header mini_header">
        <div class="wrap">
            <section class="global_nav">
                <div class="main_width clear_fix">
                    <div class="f_left logo_wrap">
                        <a href="/">
                            <img src="<%=request.getContextPath()%>/static/picture/logo_new.png"/>
                        </a>
                    </div>
                </div>
            </section>
        </div>
    </header>    <div class="main" style="background:url(<%=request.getContextPath()%>/static/images/ac198f1e37025872d33159b4cfc2ae88.jpg) no-repeat center;">
    <section class="main_width">
        <a href="" class="banner_link"></a>

        <article class="login_app" id="loginApp">
            <template>
                <div class="login_wrap" v-if="currentForm==='login'">

                    <h2 class="clear_fix tab_title" v-if="login.yzmLogin===1">
                        <a href="javascript:void(0)"
                           class="tab_btn f_left text_left"
                           :class="{active:login.loginType==='mobile'}"
                           @click="login.loginType='mobile'">手机验证登录</a>
                        <a href="javascript:void(0)"
                           class="tab_btn f_right text_right"
                           :class="{active:login.loginType==='username'}"
                           @click="login.loginType='username'">账户密码登录</a>
                    </h2>
                    <h2 class="bind_title" v-else>
                        <a href="javascript:void(0)" class="active text_center">绑定手机号</a>
                    </h2>

                    <div class="tab tab_mobile" v-show="login.loginType==='mobile'">
                        <p class="input_wrap username_wrap">
                            <input type="text"
                                   maxlength="11"
                                   title="手机号码"
                                   placeholder="手机号码"
                                   v-model.trim="login.mobile"
                                   @input="login.mobileError=''"
                            />
                            <span class="error_message">{{login.mobileError}}</span>
                        </p>
                        <p class="input_wrap yzm_wrap">
                            <input type="text"
                                   maxlength="6"
                                   title="验证码"
                                   placeholder="请输入验证码"
                                   v-model.trim="login.yzm"
                                   @input="login.yzmError=''"
                            />
                            <a href="javascript:void(0)" class="captchaWrap" @click="getCaptcha">
                                <img :src="<%=request.getContextPath()%>/static/picture/login.captchaimg" alt="点击刷新">
                                <span class="refresh_btn">换一个</span>
                            </a>
                            <span class="error_message" v-show="login.yzmError">{{login.yzmError}}</span>
                        </p>
                        <p class="input_wrap yzm_wrap">
                            <input type="text"
                                   maxlength="6"
                                   title="短信验证码"
                                   placeholder="短信验证码"
                                   v-model.trim="login.code"
                                   @input="login.codeError=''"
                            />
                            <button class="code_btn" @click="sendSMS" v-show=" !login.isCodeGetting && login.time == 0 ">发送验证码
                            </button>
                            <button class="code_btn" v-show=" login.isCodeGetting " disabled>正在发送</button>
                            <button class="code_btn" disabled v-show=" login.time > 0 ">{{login.time}}秒后重试</button>
                            <span class="error_message">{{login.codeError}}</span>
                        </p>
                    </div>

                    <div class="tab tab_account" v-show="login.loginType==='username'">
                        <p class="input_wrap username_wrap">
                            <input type="text"
                                   maxlength="50"
                                   title="email/手机号"
                                   placeholder="请输入账号"
                                   autocomplete="off"
                                   v-model.trim="login.username"
                                   @input="login.usernameError=''"
                            />
                            <span class="error_message">{{login.usernameError}}</span>
                        </p>
                        <p class="input_wrap password_wrap">
                            <input type="password"
                                   maxlength="50"
                                   title="密码"
                                   placeholder="请输入密码"
                                   v-model.trim="login.password"
                                   @input="login.passwordError=''"
                            />
                            <span class="error_message auto_wrap">{{login.passwordError}}</span>
                        </p>
                        <p class="input_wrap yzm_wrap" :class="{hide:!login.isNeedCheckYzm}">
                            <input type="text"
                                   maxlength="6"
                                   title="验证码"
                                   placeholder="请输入验证码"
                                   v-model.trim="login.yzm"
                                   @click="login.yzmError=''"
                            />
                            <a href="javascript:void(0)" class="captchaWrap" @click="getCaptcha">
                                <img :src="<%=request.getContextPath()%>/static/picture/login.captchaimg" alt="点击刷新">
                                <span class="refresh_btn">换一个</span>
                            </a>
                            <span class="error_message">{{login.yzmError}}</span>
                        </p>
                    </div>

                    <button @click="submitLogin" class="btn" :disabled="login.isFetching">{{login.yzmLogin===1?'立即登录':'立即绑定'}}
                    </button>

                    <p class="clear_fix bottom_link" :style="{visibility:login.yzmLogin===1?'show':'hidden'}">
                        <a href="/customer/find-pw.html" class="link_1"
                           data-statistics="login_password|忘记密码">忘记密码</a>
                        <a href="javascript:void(0)" class="f_right link_2"
                           data-statistics="login_register|注册新用户" @click="currentForm='register'">立即注册</a>
                        <span class="f_right">还没有账号？</span>
                    </p>

                    <div class="more_login_type" v-show="login.yzmLogin===1">
                        <h3></h3>
                        <div class="type_list">
                            <a href="javascript:void(0)"
                               class="wx"
                               @click="loginByWx('/customer/union-login.html?return_url=%252Fcustomer%252Fstored-card.html&t=wx')"></a>
                            <a href="/customer/union-login.html?return_url=%2Fcustomer%2Fstored-card.html&t=qq"
                               class="qq"></a>
                        </div>
                    </div>
                </div>

                <div class="register_wrap" v-if="currentForm==='register'">

                    <h2 class="clear_fix tab_title">
                        <a href="javascript:void(0)" class="tab_btn f_left text_left">手机快捷注册</a>
                        <a href="javascript:void(0)" class="tab_btn f_right text_right">已有账号？<strong
                                class="orange" @click="currentForm='login'">请登录</strong></a>
                    </h2>

                    <div class="tab">
                        <p class="input_wrap username_wrap">
                            <input type="text"
                                   maxlength="11"
                                   title="手机号码"
                                   placeholder="手机号码"
                                   v-model.trim="register.mobile"
                                   @input="register.mobileError=''"
                            />
                            <span class="error_message">{{register.mobileError}}</span>
                        </p>

                        <!--滑动验证开始-->
                        <div class="ali_verify_wrap" v-if="register.isAliVerify">
                            <div id="_umfp"
                                 style="display:inline;width:1px;height:1px;overflow:hidden;position: absolute;"></div>
                            <p id="aliVerifyDom"></p>
                            <input type='hidden' id='csessionid' name='csessionid'/>
                            <input type='hidden' id='sig' name='sig'/>
                            <input type='hidden' id='token' name='token'/>
                            <input type='hidden' id='scene' name='scene'/>
                            <span class="error_message">{{register.aliVerifyError}}</span>
                        </div>
                        <!--滑动验证结束-->
                        <p class="input_wrap yzm_wrap" v-else>
                            <input type="text"
                                   maxlength="6"
                                   title="验证码"
                                   placeholder="请输入验证码"
                                   v-model.trim="register.yzm"
                                   @input="register.yzmError=''"
                            />
                            <a href="javascript:void(0)" class="captchaWrap" @click="getCaptcha">
                                <img :src="<%=request.getContextPath()%>/static/picture/register.captchaimg" alt="点击刷新">
                                <span class="refresh_btn">换一个</span>
                            </a>
                            <span class="error_message">{{register.yzmError}}</span>
                        </p>

                        <p class="input_wrap yzm_wrap">
                            <input type="text"
                                   maxlength="6"
                                   title="短信验证码"
                                   placeholder="短信验证码"
                                   v-model.trim="register.code"
                                   @input="register.codeError=''"
                            />
                            <button class="code_btn" @click="sendSMS" v-show=" !register.isCodeGetting && register.time == 0 ">
                                发送验证码
                            </button>
                            <button class="code_btn" v-show=" register.isCodeGetting " disabled>正在发送</button>
                            <button class="code_btn" disabled v-show=" register.time > 0 ">{{register.time}}秒后重试</button>
                            <span class="error_message" v-show="register.codeError">{{register.codeError}}</span>
                        </p>
                    </div>

                    <button @click="submitLogin" class="btn" :disabled="register.isFetching">立即注册</button>

                    <p class="clear_fix bottom_link">
                        <input type="checkbox" id="rule" v-model="register.isCheckedRule"/>
                        <label for="rule">我已阅读并同意<a href="/shop/help-41.html"
                                                    target="_blank">《诺心lecake用户服务协议》</a></label>
                        <span class="error_message" v-show="!register.isCheckedRule">用户服务协议未勾选</span>
                    </p>
                </div>

                <div class="bind_wrap" v-if="isShowBind">
                    <div class="cover"></div>
                    <div class="inner">
                        <h2 class="orange">为了您的账号安全，请绑定手机号码</h2>
                        <a href="javascript:void(0)" class="close_btn" @click="isShowBind=false">关闭</a>
                        <p class="input_wrap username_wrap">
                            <input type="text"
                                   maxlength="11"
                                   title="手机号码"
                                   placeholder="手机号码"
                                   v-model.trim="bind.mobile"
                                   @input="bind.mobileError=''"
                            />
                            <span class="error_message">{{bind.mobileError}}</span>
                        </p>
                        <p class="input_wrap yzm_wrap">
                            <input type="text"
                                   maxlength="6"
                                   title="验证码"
                                   placeholder="请输入验证码"
                                   v-model.trim="bind.yzm"
                                   @input="bind.yzmError=''"
                            />
                            <a href="javascript:void(0)" class="captchaWrap" @click="getCaptcha">
                                <img :src="<%=request.getContextPath()%>/static/picture/bind.captchaimg" alt="点击刷新">
                                <span class="refresh_btn">换一个</span>
                            </a>
                            <span class="error_message">{{bind.yzmError}}</span>
                        </p>
                        <p class="input_wrap yzm_wrap">
                            <input type="text"
                                   maxlength="6"
                                   title="短信验证码"
                                   placeholder="短信验证码"
                                   v-model.trim="bind.code"
                                   @input="bind.codeError=''"
                            />
                            <button class="code_btn" @click="sendSMS" v-show=" !bind.isCodeGetting && bind.time == 0 ">发送验证码
                            </button>
                            <button class="code_btn" v-show=" bind.isCodeGetting " disabled>正在发送</button>
                            <button class="code_btn" disabled v-show=" bind.time > 0 ">{{bind.time}}秒后重试</button>
                            <span class="error_message">{{bind.codeError}}</span>
                        </p>
                        <button @click="submitLogin" class="btn" :disabled="bind.isFetching">验证</button>
                    </div>
                </div>

                <div class="ui_pop active" v-show="showConfirm">
                    <div class="ui_confirm inner">
                        <div class="text">
                            <h3>当前手机号{{currentMobile}}已绑定以下账号，为了您的账户安全请选择一个诺心账户登录,此手机号将与其他账号解绑。</h3>
                            <h4>若有疑问可联系在线客服4001-578-578。</h4>
                            <div class="mobile_list">
                                <a href="javascript:void(0)"
                                   v-for="item in mobileList"
                                   :class="{active:custID===item.custID}"
                                   @click="custID=item.custID;selectedMobile=item.mobile;">{{item.custID}}</a>
                            </div>
                        </div>
                        <div class="btn_wrap clear_fix">
                            <button class="f_left cancel_btn" @click="showConfirm=false">取消</button>
                            <button class="f_right ok_btn" @click="unbindMobile">确定</button>
                        </div>
                    </div>
                </div>
            </template>
        </article>

    </section>
</div>
    <jsp:include page="../foot.jsp"/>
</article>
<script>
    var lastUrl = '/customer/stored-card.html';
    lastUrl = decodeURIComponent(lastUrl);
    //账号密码登录错误次数，大于三次后显示图形验证码
    var loginErrorCount = 0;
    //阿里验证码已使用次数，超出800后切换图形验证码
    var aliApiCount = '';
    //是否是第三方登录绑定
    var isBind = '';
</script><script>
    document.write('<div style="display:none;">');
</script>
<div>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,113&spec=">冰淇淋蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,114&spec=">奶油蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,103&spec=">巧克力蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,101&spec=">慕斯蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,102&spec=">拿破仑蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,104&spec=">芝士蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,112&spec=">鲜果蛋糕</a>
</div>
<script>
    document.write('</div>');
</script><script src="<%=request.getContextPath()%>/static/js/sitelist.js"></script>
<script src="<%=request.getContextPath()%>/static/js/widget.js"></script>
<script src="<%=request.getContextPath()%>/static/js/base.js"></script>
<script src="<%=request.getContextPath()%>/static/js/nc.js"></script>
<script src="<%=request.getContextPath()%>/static/js/loginapp.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHf7LmiSyc1"};</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/mystat.js"></script><script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?0aab2028932298cda55c549351d0a22b";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<!--HPSTAT end-->
<script src="<%=request.getContextPath()%>/static/js/statistics.js"></script>
<script>
    var udeskReady = false;

    function udeskLoad() {
        if (!udeskReady) {
            udeskReady = true;
            (function (a, h, c, b, f, g) {
                a["UdeskApiObject"] = f;
                a[f] = a[f] || function () {
                    (a[f].d = a[f].d || []).push(arguments)
                };
                g = h.createElement(c);
                g.async = 1;
                g.src = b;
                c = h.getElementsByTagName(c)[0];
                c.parentNode.insertBefore(g, c)
            })(window, document, "script", "//lecake.udesk.cn/im_client/js/udeskApi.js?1480995487253", "ud");
            ud({
                "code": "193g370d",
                "link": "//lecake.udesk.cn/im_client?web_plugin_id=23216",
                "isInvite": true,
                "mode": "inner",
                "pos_flag": "srb",
                "onlineText": "联系客服，在线咨询",
                "offlineText": "客服下班，请留言",
                "targetSelector": "#serviceBtn,#footerServiceBtn",
                "pop": {
                    "direction": "top",
                    "arrow": {
                        "top": 0,
                        "left": "80%"
                    }
                },
            });
        }
    }

    $(window).load(udeskLoad);
    setTimeout(udeskLoad, 5000);
</script>
<script src="<%=request.getContextPath()%>/static/js/rt.js"></script>
</body>
</html>


