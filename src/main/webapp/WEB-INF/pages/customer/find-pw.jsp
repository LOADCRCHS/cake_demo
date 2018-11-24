<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 2018/11/9
  Time: 16:32
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
    <link href="<%=request.getContextPath()%>/static/css/nc.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/passport.css" rel="stylesheet"></head>
<body>
<article class="container main_find_pw main_passport max_width">
    <input type="hidden" id="pcustID" value="">
    <input type="hidden" id="currentStep" value="">
    <input type="hidden" id="customerKey" value="">
    <input type="hidden" id="aliApi" value="27">
    <%-- 迷你头部 --%>
    <header class="global_header mini_header">
        <div class="wrap">
            <section class="global_nav">
                <div class="main_width clear_fix">
                    <div class="f_left logo_wrap">
                        <a href="/">
                            <img src="<%=request.getContextPath()%>/static/picture/logo_new.png"/>
                        </a>
                    </div>
                    <h1 class="f_left">找回密码</h1>
                </div>
            </section>
        </div>
    </header>
    <div class="main">
    <section class="progress">
        <div class="progress_bar clear_fix">
            <dl class="first active">
                <dt>1</dt>
                <dd>填写账号</dd>
            </dl>
            <dl>
                <dt>2</dt>
                <dd>选择找回方式</dd>
            </dl>
            <dl>
                <dt>3</dt>
                <dd>验证身份</dd>
            </dl>
            <dl class="">
                <dt>4</dt>
                <dd>重置密码</dd>
            </dl>
            <dl class="last">
                <dt>5</dt>
                <dd>完成</dd>
            </dl>
        </div>
    </section>
    <section class="main_width">
        <div class="form_wrap" id="step1">
            <p class="desc_text">提示：忘记用户名？试试您的常用邮箱或手机号，如依然无法解决，请咨询客服：4001-578-578</p>
            <p class="input_wrap username_wrap">
                <input type="text" maxlength="50" id="userName" placeholder="用户名/手机号/邮箱" data-error="请输入用户名"/>
                <span class="error_message hide"></span>
            </p>
            <p class="input_wrap yzm_wrap hide" id="picVerify">
                <input type="text" maxlength="6" id="yzm" title="验证码" placeholder="请输入验证码" data-error="请输入验证码"/>
                <span class="error_message hide"></span>
                <a href="javascript:void(0)" class="captchaWrap">
                    <img src="<%=request.getContextPath()%>/static/picture/captcha.html"
                         alt="点击刷新">
                </a>
            </p>
            <!--滑动验证开始-->
            <div id="aliVerify" class="ali_verify_wrap">
                <div id="_umfp"
                     style="display:inline;width:1px;height:1px;overflow:hidden;position: absolute;"></div>
                <p id="aliVerifyDom"></p>
                <input type='hidden' id='csessionid' name='csessionid'/>
                <input type='hidden' id='sig' name='sig'/>
                <input type='hidden' id='token' name='token'/>
                <input type='hidden' id='scene' name='scene'/>
            </div>
            <!--滑动验证结束-->
            <p class="btn_wrap">
                <button class="btn" id="getUserInfo">下一步</button>
            </p>
        </div>
        <div class="form_wrap hide" id="step2">
            <h3>选择找回密码方式：</h3>
            <a href="javascript:void(0)" data-type="mobile" class="use_type type_mobile hide active">手机找回</a>
            <a href="javascript:void(0)" data-type="email" class="use_type type_email hide active">邮箱找回</a>
        </div>
        <div class="form_wrap hide" id="step3">
            <div class="find_type hide" data-type="mobile">
                <h3>我们已将找回密码短信发送至您的手机<span id="mobileText"></span>，请尽快完整验证。</h3>
                <p class="input_wrap yzm_wrap">
                    <input type="text" maxlength="6" id="smsCode" title="短信验证码" placeholder="短信验证码"/>
                    <span class="error_message hide"></span>
                </p>
                <p class="btn_wrap">
                    <button class="btn next_btn" id="checkCode">验证</button>
                    <a href="javascript:void (0)" class="prev_btn hide">返回上一步</a>
                </p>
                <div class="no_answer">
                    <h4>没有收到找回密码短信？</h4>
                    <h5>1.如果您没有及时收到验证码短信，请耐心等待，可能是网络繁忙造成的信息堵塞。</h5>
                    <h5>2.如果长时间收不到验证码短信，<a href="javascript:void(0)" id="sendSms">请点此重新发送</a> 找回密码短信。</h5>
                </div>
            </div>
            <div class="find_type" data-type="email">
                <h3 style="margin-bottom:64px;">我们已将找回密码邮件发送至您的邮箱<span id="emailText"></span>，<br/>请在30分钟内接收邮件重置密码。
                </h3>
                <div class="no_answer">
                    <h4>没有接收验证邮件？</h4>
                    <h5>请尝试到广告、垃圾邮件目录里找一找，或者 <a href="javascript:void(0)" id="sendEmail">重新发送</a> 找回密码邮件</h5>
                </div>
            </div>
        </div>
        <div class="form_wrap hide" id="step4">
            <p class="input_wrap password_wrap">
                <input type="password" maxlength="20" id="password1" title="6-20位字符,建议使用数字、字母组合" placeholder="请输入密码"
                       data-error="请输入密码"/>
                <span class="error_message hide"></span>
            </p>
            <p class="input_wrap confirm_wrap">
                <input type="password" maxlength="20" id="password2" title="6-20位字符,建议使用数字、字母组合"
                       placeholder="请再次输入密码"
                       data-error="请再次输入密码"/>
                <span class="error_message hide"></span>
            </p>
            <p class="btn_wrap">
                <button class="btn" id="resetPw">下一步</button>
            </p>
        </div>
        <div class="form_wrap hide" id="step5">
            <h3 class="text_center">恭喜，您已成功重置密码！</h3>
            <p class="btn_wrap">
                <a href="/customer/login.html">
                    <button class="btn">立即登录</button>
                </a>
            </p>
        </div>
    </section>
</div>
    <jsp:include page="../foot.jsp"/>
</article><script>
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
<script src="<%=request.getContextPath()%>/static/js/passport.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHg3h6y.Bnd"};</script>
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


