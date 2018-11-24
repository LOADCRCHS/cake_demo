<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 2018/11/9
  Time: 17:44
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
        var customerId = '7527158';
        //用户信息
        var customerInfo = {"rankID":"1","rankName":"LEV1","pcustID":"7527158","custID":"13931603951","mobile":"13931603951","email":"","guest":1,"isNew":0,"privilege":{"has_discount88":false,"has_pass_card":false,"has_visa_discount83":false,"bit_map":0},"balance":{"cashback":0},"order":{"finish_count":0}};
        //某些商品特殊餐具数量
        var globalSpecialDinnerware = {"105819":"\u542b2\u628a\u9910\u53c9","105822":"\u542b2\u628a\u9910\u53c9","105909":"\u542b2\u628a\u9910\u53c9","105978":"\u542b2\u628a\u9910\u53c9","106041":"\u5404\u542b2\u628a\u9910\u52fa","106032":"\u542b2\u628a\u9910\u52fa","106038":"\u542b2\u628a\u9910\u52fa","106031":"\u542b2\u628a\u9910\u52fa","106035":"\u542b2\u628a\u9910\u52fa","106071":"\u542b2\u628a\u9910\u52fa","106068":"\u542b2\u628a\u9910\u52fa","107135":"\u542b1\u628a\u9910\u53c9"};
    </script>
    <script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/vue.min.js"></script>
    <link href="<%=request.getContextPath()%>/static/css/customer.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/coupon.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/cakecoupon.css" rel="stylesheet"></head>
<body>
<article class="container main_customer_common main_coupon main_cakeCoupon max_width">
    <jsp:include page="../head-nav.jsp"/>
    <div class="main main_width clear_fix">
    <nav class="main_customer_sidebar f_left">
        <div class="nav_list">
            <h2>我的诺心</h2>
            <%--<p><a href="/customer/index.html" class=""--%>
                  <%--target="_blank">个人中心</a></p>--%>
            <p><a href="/shop/member_consignee.html" class=""
                  target="_blank">地址管理</a></p>
            <p><a href="/shop/member_account.html" class=""
                  target="_blank">我的积分</a>
            </p>
            <%--<p class="hide"><a href="/shop/member_editUser.html" class=""--%>
                               <%--target="_blank">我的心享值</a></p>--%>
            <%--<p><a href="/shop/member_user_profile.html" class=""--%>
                  <%--target="_blank">我的LE家族</a>--%>
            <%--</p>--%>
            <p><a href="/shop/member_editUser.html?userId=${num==1?user1.id:user2.id}" class=""
                  target="_blank">个人资料</a></p>
            <p><a href="/customer/edit-password.html?userId=${num==1?user1.id:user2.id}" class=""
                  target="_blank">
                修改密码
            </a></p>
            <%--<p><a href="/customer/invoice.html" class=""--%>
                  <%--target="_blank">发票管理</a></p>--%>
        </div>
        <div class="nav_list">
            <h2>交易管理</h2>
            <p><a href="/customer/order-list.html?userId=${num==1?user1.id:user2.id}" class=""
                  target="_blank">订单管理</a></p>
            <%--<p><a href="/customer/coupon.html" class=""--%>
                  <%--target="_blank">优惠券--%>
            <%--</a>--%>
            <%--</p>--%>
            <%--<p><a href="/customer/cake-coupon.html" class="active"--%>
                  <%--target="_blank">蛋糕卡--%>
            <%--</a>--%>
            <%--</p>--%>
            <%--<p><a href="/customer/stored-card.html" class=""--%>
                  <%--target="_blank">储值卡--%>
            <%--</a>--%>
            <%--</p>--%>
        </div>
        <div class="nav_list">
            <h2>客户服务</h2>
            <p><a href="/shop/help-55.html" target="_blank">帮助中心</a></p>
        </div>
    </nav>        <div class="content" id="cakeCoupon">
    <section class="top top_tab clear_fix">
        <!-- 优惠券tab -->
        <div class="public_tab">
            <ul>
                <li class="active"><span>可使用</span></li>
                <li><span>不可使用</span></li>
            </ul>
        </div>
        <div class="bind_coupon_from">
            <input type="button" value="绑定" class="bind_btn" @click="bindCoupon()">
        </div>
    </section>
    <section class="middle">
        <template v-if="couponList.length">
            <div class="coupon_wrap"
                 :class="{coupon_no_used:queryParams.useFlag===2}"
                 v-for="item of couponList">
                <div class="coupon_header">
                    <img v-if="queryParams.useFlag===1" class="coupon_bg_top"
                         src="<%=request.getContextPath()%>/static/picture/coupon_bg_top.png"/>
                    <img v-else class="coupon_bg_top"
                         src="<%=request.getContextPath()%>/static/picture/coupon_bg_top1.png" />
                    <div class="inner_info">
                        <div class="top">
                            <p class="price">
                                <small>¥</small>
                                <span>{{item.cardTypeName}}</span>
                            </p>
                            <p class="price_desc">
                                <span>{{item.cardTypeName}}型蛋糕卡</span>
                            </p>
                        </div>
                        <div class="bot">
                            <span class="desc_title">卡号：</span>
                            <span>{{item.cardNo}}</span>
                        </div>
                        <p class="city">可使用城市：{{item.siteName}}</p>
                    </div>
                    <img v-if="queryParams.useFlag===1" class="coupon_bg_bottom"
                         src="<%=request.getContextPath()%>/static/picture/coupon_bg_bottom.png"/>
                    <img v-else class="coupon_bg_bottom"
                         src="<%=request.getContextPath()%>/static/picture/coupon_bg_bottom1.png"/>
                </div>
                <div class="coupon_detail">详细说明 ></div>
                <div class="coupon_desc_popup hide">
                    <p class="title">详细说明</p>
                    <p class="coupon_desc_detail" v-html="item.useRule"></p>
                </div>
            </div>
        </template>
        <template v-else>
            <div class="no_content">
                <img src="<%=request.getContextPath()%>/static/picture/no_content.png">
                <p>您的列表还是空的</p>
            </div>
        </template>
    </section>
    <section class="paging clear_fix" :class="{hide:Math.ceil(pageCount)<2}">
        <div class="paging_wrap"></div>
    </section>
</div>
</div>
    <jsp:include page="../foot.jsp"/>
</article>
<script>
    var userInfo = {"rankID":"1","rankName":"LEV1","pcustID":"7527158","custID":"13931603951","mobile":"13931603951","email":"","guest":1,"isNew":0,"privilege":{"has_discount88":false,"has_pass_card":false,"has_visa_discount83":false,"bit_map":0},"balance":{"cashback":0},"order":{"finish_count":0}};
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
<script src="<%=request.getContextPath()%>/static/js/page.js"></script>
<script src="<%=request.getContextPath()%>/static/js/cakecoupon.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyJKw4XRNjgf"};</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/mystat.js"></script><script type="text/javascript" src="<%=request.getContextPath()%>/static/js/45234.js"></script><script>
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
                "customer":{"nonce":"2soGCd8r2dUrrGUv","timestamp":1541756656412,"web_token":"7527158","signature":"B7589B28D7D4CA9F36948D776AE749E3229AF0FA","c_cn_pcustID":"7527158","c_cn_clickID":"KyJKw4XRNjgf","c_cn_zzuID":"KyHRa3ClJ3wO"}                            });
        }
    }

    $(window).load(udeskLoad);
    setTimeout(udeskLoad, 5000);
</script>
<script src="<%=request.getContextPath()%>/static/js/rt.js"></script>
</body>
</html>


