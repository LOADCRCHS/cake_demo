<%--
  Created by IntelliJ IDEA.
  User: rong
  Date: 2018/11/9
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="zh-cn">
<head>
    <meta charset="UTF-8"/>
    <title>诺心蛋糕官网|诺心LE CAKE—诺心蛋糕网上订购</title>
    <meta name="Keywords" content="诺心蛋糕官网,诺心, 生日蛋糕订购，芝士蛋糕,慕斯蛋糕,草莓蛋糕，蛋糕网上订购，订蛋糕，网上订蛋糕"/>
    <meta name="Description" content="诺心蛋糕官网提供生日蛋糕,巧克力蛋糕,芝士蛋糕,水果蛋糕,慕斯蛋糕,草莓蛋糕订购,蛋糕店已在上海,北京,广州,深圳,天津,杭州,苏州,成都,重庆,宁波,南京开通网上订蛋糕,免费配送到家。"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta property="wb:webmaster" content="ec5363986c1d9b8a"/>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico?01" type="image/x-icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/base_1.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/widget_1.css">
    <!--[if lt IE 9]>
    <script src="<%=request.getContextPath()%>/static/js/html5.min_1.js"></script>
    <![endif]-->
    <script>
        var GlobalConfig = {
            'baseUrl': 'https://www.lecake.com/',
            'staticUrl': '//newimgcdn.lapetit.cn/web/',
            'cookieDomain': '.lecake.com',
            'imageRoot': '//imagecdn.lapetit.cn/postsystem/docroot/images',
            'staticVersions': '2018110702',
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
    <script src="<%=request.getContextPath()%>/static/js/jquery-1.10.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/vue.min_1.js"></script>
    <link href="<%=request.getContextPath()%>/static/css/nc.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/passport.css" rel="stylesheet"></head>
<body>
<article class="container main_register main_passport max_width">
    <input type="hidden" id="aliApi" value="25">
    <header class="global_header mini_header">
        <div class="wrap">
            <section class="global_nav">
                <div class="main_width clear_fix">
                    <div class="f_left logo_wrap">
                        <a href="/">
                            <img src="<%=request.getContextPath()%>/static/picture/logo_new_1.png"/>
                        </a>
                    </div>
                    <h1 class="f_left">用户注册</h1>
                    <p class="f_right">
                        已有诺心账号？<a href=<%=request.getContextPath()%>/customer/login.jsp" class="login_link">请登录</a>
                    </p>
                </div>
            </section>
        </div>
    </header>    <div class="main">
    <section class="main_width">
        <form action="<%=request.getContextPath()%>/register.html" method="post" id="form">
        <div class="form_wrap">
            <p class="input_wrap username_wrap">
                <input type="text" data-error="请输入手机号码" maxlength="11" id="phoneNum" title="手机号码"
                       name="phoneNum"
                       placeholder="手机号码"/>
                <span id="SmsCheckCodeTip"></span>
                <span class="error_message hide"></span>
            </p>
            <p class="input_wrap password_wrap">
                <input type="password" data-error="请输入密码" maxlength="20" id="password1" title="密码"
                       name="password"
                       placeholder="6-20位密码"/>
                <span class="error_message hide"></span>
            </p>
            <p class="input_wrap confirm_wrap">
                <input type="password" maxlength="20" id="password2" title="确认密码"
                       placeholder="确认密码"/>
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
           <%-- <!--滑动验证开始-->
            <div id="aliVerify" class="ali_verify_wrap">
                <div id="_umfp"
                     style="display:inline;width:1px;height:1px;overflow:hidden;position: absolute;"></div>
                <p id="aliVerifyDom"></p>
                <input type='hidden' id='csessionid' name='csessionid'/>
                <input type='hidden' id='sig' name='sig'/>
                <input type='hidden' id='token' name='token'/>
                <input type='hidden' id='scene' name='scene'/>
                <span class="error_message hide">*请拖动滑块完成验证</span>
            </div>--%>
            <!--滑动验证结束-->
            <p class="input_wrap yzm_wrap">
                <input type="text" data-error="请输入手机验证码" maxlength="6" id="code" title="短信验证码" placeholder="手机验证码" name="code"/>
                <button   class="code_btn" onclick="sendMessage()" type="button">发送验证码</button>

                <span id="error"></span>

            </p>
            <button  type="submit" class="btn" >立即注册</button>
        </form>
            <p class="clear_fix bottom_link">
                <input type="checkbox" id="rule" checked/>
                <label for="rule">我已阅读并同意<a href="<%=request.getContextPath()%>/shop/help-41.html" target="_blank">《诺心lecake用户服务协议》</a></label>
                <span class="error_message hide">*用户服务协议未勾选</span>
            </p>
        </div>

    </section>
</div>
    <footer class="global_footer">
        <div class="footer_online">
            <a href="javascript:void(0)" class="service_btn" id="footerServiceBtn"><i></i>在线客服</a>
            <a href="javascript:void (0)" class="wx_btn" id="footerWxBtn">
                <img src="<%=request.getContextPath()%>/static/picture/qr_code_bottom_1.png">
                <i></i>
                微信
            </a>
        </div>
        <div class="footer_tel">
            <p>
                <i></i>
                <span>客服电话：4001-578-578 服务时间（08:30-22:30）</span>
            </p>
        </div>
        <div class="footer_nav clear_fix">
            <p class="clear_fix">
                <a href="<%=request.getContextPath()%>/about/notice.html" target="_blank">诺心公告</a>
                <a href="<%=request.getContextPath()%>/shop/help-1.html" target="_blank">关于诺心</a>
                <a href="<%=request.getContextPath()%>/shop/help-80.html" target="_blank">联系我们</a>
                <a href="<%=request.getContextPath()%>/shop/help-106.html"
                   target="_blank">客服服务</a>
                <a href="//rescdn.lecake.com/shop/lecake/theme/xth2/images/index/business_certificate4.jpg"
                   target="_blank">食品经营许可证</a>
                <a href="//rescdn.lecake.com/postsystem/docroot/images/promotion/201805/S22C-2180516134800_0001_0101.jpg"
                   target="_blank">生产许可证</a>
                <a href="<%=request.getContextPath()%>/shop/help-668.html" target="_blank">预付费卡协议</a>
                <a href="https://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&entyId=1u2xwmwzpxrk6u2rvor2928au92degmyr8rxc2ylqre60wm"
                   class="last" target="_blank"><i></i>上海工商</a>
            </p>
        </div>
        <div class="footer_address">
            <p class="clear_fix">
                诺心食品（上海）有限公司                &nbsp;&nbsp;上海徐汇区田林路140号28号楼503室&nbsp;&nbsp;客服邮箱：services@lecake.com&nbsp;&nbsp;公司电话：4001-578-578
            </p>
        </div>
        <div class="footer_copy">
            <p>copyright©2010-2017诺心lecake.com版权所有 沪ICP备10211730</p>
        </div>
    </footer>
</article>
<script>
    var lastUrl = 'https://www.lecake.com/';
</script>
>
<div>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,113&spec=">冰淇淋蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,114&spec=">奶油蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,103&spec=">巧克力蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,101&spec=">慕斯蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,102&spec=">拿破仑蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,104&spec=">芝士蛋糕</a>
    <a href="http://www.lecake.com/SH/category-0-1.html?moment=&taste=,112&spec=">鲜果蛋糕</a>
</div>



<script type="text/javascript">

    function sendMessage() {

        var jbPhone =$("#phoneNum").val(); //手机号码

     //处理数据
        $.ajax({
            url : "/getCode.html",
            data : {phoneNum : jbPhone},
            type : "POST",
            dataType : "json",
            success : function(data) {
                data = parseInt(data, 10);
                if (data == 1) {
                    $("#SmsCheckCodeTip").html("该手机号已经注册");
                } else {
                    $("#SmsCheckCodeTip").html("");
                }
            }
        });


    }

    function register() {
        var code = $("#code").val(); //验证码
        var  password=$("#password1").val();
        var jbPhone =$("#phoneNum").val(); //手机号码
        $.ajax({
            url : "/register.html",
            data : {phoneNum : jbPhone,
                code:code,
                password:password},
            type : "POST",
            dataType : "json",
            success : function(data) {
                data = parseInt(data, 10);
                if(data==1){
                    $("#error").html("验证码错误");

                }else{
                    $("#SmsCheckCodeTip").html("该手机号已经注册");
                }

            }
        });
    }


</script>
<script>
    document.write('</div>');
</script><script src="<%=request.getContextPath()%>/static/js/sitelist_1.js"></script>
<script src="<%=request.getContextPath()%>/static/js/widget_1.js"></script>
<script src="<%=request.getContextPath()%>/static/js/base_1.js"></script>
<script src="<%=request.getContextPath()%>/static/js/nc.js"></script>
<script src="<%=request.getContextPath()%>/static/js/passport.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHegnyr1VZa"};</script>
<script type="text/javascript" src=<%=request.getContextPath()%>/static/js/mystat_1.js"></script><script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?0aab2028932298cda55c549351d0a22b";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<!--HPSTAT end-->
<script src="<%=request.getContextPath()%>/static/js/statistics_1.js"></script>
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
<script src="<%=request.getContextPath()%>/static/js/rt_1.js"></script>
</body>
</html>

