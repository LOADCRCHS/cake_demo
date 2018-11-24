<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8"/>
        <title>北京在线甜点订购尽在北京诺心lecake礼品馆</title>
    <meta name="Keywords" content="北京在线甜点订购,甜点订购,订购甜点"/>
    <meta name="Description" content="北京诺心lecake礼品馆汇集了诺心le cake所有甜点包括:蝴蝶酥、曲奇、巧克力等高档甜点。让你轻轻指间，享受在线甜点订购，免费在线甜点订购送货上门的购物体验。"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta property="wb:webmaster" content="ec5363986c1d9b8a"/>
    <link rel="shortcut icon" href="/favicon.ico?01" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/widget.css">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/js/html5.min.js"></script>
    <![endif]-->
    <script>
        var GlobalConfig = {
            'baseUrl': '${pageContext.request.contextPath}/',
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
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/static/js/vue.min.js"></script>
        <link href="${pageContext.request.contextPath}/static/css/goods_list.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/commonlist.css" rel="stylesheet"></head>
<body>
<article class="container main_goods_list">
    <jsp:include page="head-nav.jsp"/>
    <div class="main gift_main">

        <section class="p_list_wrap main_width">
            
            <ul class="p_list_new clear_fix ">
                <c:forEach items="${gifts}" var="gift">
                    <li class="p_item_new "
                    data-id="${gift.id}"
                    data-hideSpec=""
                    data-items='${gift.name}||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201808/17633/list_17633.jpg|http://www.lecake.com/shop/goods-107571.html|5|107571|17634|1|1|0||100006|规格|五款主题 随机一款|68|68|0|0|0|0|0||0|1|38'
                    data-goodsSweet=""
                    data-goodsTasteTxt="${gift.taste}"
                >
                    <a href="/shop/goods-${gift.id}.html" target="_blank"
                        >
                        <div class="img_wrap">
                            <div class="div_img">
                                <img class="lazy"
                                         src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                         data-original="<%=request.getContextPath()%>/static/picture/${gift.imgUrl}"
                                    />
                            </div>
                        </div>
                    </a>
                    <div class="p_info">
                        <a href="/shop/goods-${gift.id}.html" target="_blank"
                                               >
                            <h3 class="no_wrap p_name">${gift.name}</h3>
                        </a>
                        <div class="p_tag">
                              <p>
                                <c:if test="${!empty product.tage}">
                                  <span class="tag">${gift.tage}</span>
                               </p>
                                </c:if>
                        </div>
                        <div class="price_wrap">
                            <p class="new_price">
                                <small>¥</small>${gift.price}</p>
                        </div>
                        <a href="javascript:void(0)"
                           class="buy_btn "
                           data-statistics="_button_1|加入购物车_个性字母透明挎包"
                        >
                            <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </a>
                    </div>
                </li>
                </c:forEach>
            </ul>

        </section>
    </div>
    <jsp:include page="foot.jsp"/>
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
</script><script src="${pageContext.request.contextPath}/static/js/sitelist.js"></script>
<script src="${pageContext.request.contextPath}/static/js/widget.js"></script>
<script src="${pageContext.request.contextPath}/static/js/base.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.marquee.js"></script>
<script src="${pageContext.request.contextPath}/static/js/goodslist.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/commonlistnew.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHhpY9yMrAz"};</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/mystat.js"></script><script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?0aab2028932298cda55c549351d0a22b";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<!--HPSTAT end-->
<script src="${pageContext.request.contextPath}/static/js/statistics.js"></script>
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
    <script src="${pageContext.request.contextPath}/static/js/rt.js"></script>
</body>
</html>

