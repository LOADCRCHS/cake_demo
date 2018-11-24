<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8"/>
    <title>诺心蛋糕官网_数字蛋糕|芝士慕斯|草莓水果|巧克力生日蛋糕_LE CAKE诺心蛋糕网上订购</title>
    <meta name="Keywords" content="诺心蛋糕官网,诺心, 生日蛋糕订购，芝士蛋糕,慕斯蛋糕,草莓蛋糕，蛋糕网上订购，订蛋糕，网上订蛋糕"/>
    <meta name="Description"
          content="诺心蛋糕官网提供生日蛋糕,巧克力蛋糕,芝士蛋糕,水果蛋糕,慕斯蛋糕,草莓蛋糕订购,蛋糕店已在上海,北京,广州,深圳,天津,杭州,苏州,成都,重庆,宁波,南京开通网上订蛋糕,免费配送到家。"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta property="wb:webmaster" content="ec5363986c1d9b8a"/>
    <link rel="shortcut icon" href="/favicon.ico?01" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.css?v=2018111002">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/widget.css?v=2018111002">
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
        var globalSpecialDinnerware = {
            "105819": "\u542b2\u628a\u9910\u53c9",
            "105822": "\u542b2\u628a\u9910\u53c9",
            "105909": "\u542b2\u628a\u9910\u53c9",
            "105978": "\u542b2\u628a\u9910\u53c9",
            "106041": "\u5404\u542b2\u628a\u9910\u52fa",
            "106032": "\u542b2\u628a\u9910\u52fa",
            "106038": "\u542b2\u628a\u9910\u52fa",
            "106031": "\u542b2\u628a\u9910\u52fa",
            "106035": "\u542b2\u628a\u9910\u52fa",
            "106071": "\u542b2\u628a\u9910\u52fa",
            "106068": "\u542b2\u628a\u9910\u52fa",
            "107135": "\u542b1\u628a\u9910\u53c9"
        };
    </script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/vue.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/swiper.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/home.css?v=2018111002" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/commonlist.css" rel="stylesheet">
</head>
<body>

<article class="container main_home max_width">
    <jsp:include page="head-nav.jsp"/>
    <div class="main">
        <section class="banner swiper-container" id="banner">
            <div class="nav_wrap">
                <a href="javascript:void(0)" class="nav prev prev_btn"
                   data-statistics="home_banner_prev|首页顶部banner_上一个"></a>
                <a href="javascript:void(0)" class="nav next next_btn"
                   data-statistics="home_banner_next|首页顶部banner_下一个"></a>
            </div>
            <ul class="swiper-wrapper">
                <li class="slider_item swiper-slide">
                    <a href="/shop/help-770.html"
                       data-statistics="home_banner_1|首页顶部banner_/shop/help-770.html">
                        <img src="${pageContext.request.contextPath}/static/picture/348da70e82f1c1ebc773c0c735503320.jpg">
                    </a>
                </li>
                <li class="slider_item swiper-slide">
                    <a href="/shop/help-771.html"
                       data-statistics="home_banner_2|首页顶部banner_/shop/help-771.html">
                        <img src="${pageContext.request.contextPath}/static/picture/b87a47e8447ada5b3d0e31f11f96d3d8.jpg">
                    </a>
                </li>
                <li class="slider_item swiper-slide">
                    <a href="${pageContext.request.contextPath}/shop/help-791.html"
                       data-statistics="home_banner_3|首页顶部banner_${pageContext.request.contextPath}/shop/help-791.html">
                        <img src="${pageContext.request.contextPath}/static/picture/37376ff746c5c3fb207501596296ee1d.jpg">
                    </a>
                </li>
                <li class="slider_item swiper-slide">
                    <a href="${pageContext.request.contextPath}/shop/help-766.html"
                       data-statistics="home_banner_4|首页顶部banner_${pageContext.request.contextPath}/shop/help-766.html">
                        <img src="${pageContext.request.contextPath}/static/picture/e2e0ed8ba6eeab6c9459b18574be31c2.jpg">
                    </a>
                </li>
                <li class="slider_item swiper-slide">
                    <a href="${pageContext.request.contextPath}/shop/help-788.html"
                       data-statistics="home_banner_5|首页顶部banner_${pageContext.request.contextPath}/shop/help-788.html">
                        <img src="${pageContext.request.contextPath}/static/picture/0e923cc0fb01672bcfacfdce6e831cf2.jpg">
                    </a>
                </li>
            </ul>
        </section>
        <section class="cake_section main_width">
            <div class="wrap main_width">
                <div class="slider clear_fix">
                    <a href="${pageContext.request.contextPath}/shop/help-780.html"
                       data-statistics="home_slide_resource_1|首页推荐资源位_${pageContext.request.contextPath}/shop/help-780.html">
                        <img src="${pageContext.request.contextPath}/static/picture/42ba38c4df2b59cc7380fd493971562a.jpg">
                    </a>
                    <a href="${pageContext.request.contextPath}/category-10-1.html"
                       data-statistics="home_slide_resource_2|首页推荐资源位_${pageContext.request.contextPath}/category-10-1.html">
                        <img src="${pageContext.request.contextPath}/static/picture/a6853dad64addd53c4427344b8425630.jpg">
                    </a>
                </div>

                <ul class="p_list_new clear_fix ">
                    <c:forEach items="${products}" var="product">
                    <li class="p_item_new "
                        data-id="${product.id}"
                        data-hideSpec=""
                        data-items='${product.name}||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100801.html|1|100801|10801|1|1|0||100086|建议食用人数|2-4人食|198|198|13|13|4|450|5||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100802.html|2|100802|10802|1|1|0||100036|建议食用人数|5-8人食|298|298|17|17|4|820|10||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100803.html|3|100803|10803|1|1|0||100006|建议食用人数|10-12人食|458|458|22|22|4|1300|15||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100804.html|4|100804|10804|1|1|0||100036|建议食用人数|15-20人食|756|756|31|31|4|2600|20||0|0|'
                        data-goodsSweet="${product.sweet}"
                        data-goodsTasteTxt="${product.taste}"
                    >
                        <a href="/shop/goods-${product.id}.html" target="_blank"
                           data-statistics="home_goods_list_cake_img_1|点击商品图片跳转商品详情页_雪域牛乳芝士蛋糕"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img class="lazy"
                                         src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                         data-original="<%=request.getContextPath()%>/static/picture/${product.imgUrl}"
                                    />
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-100801.html" target="_blank"
                               data-statistics="home_goods_list_cake_title_1|点击商品名称跳转商品详情页_雪域牛乳芝士蛋糕"
                            >
                                <h3 class="no_wrap p_name">${product.name}</h3>
                            </a>
                            <div class="p_tag">
                                <p>
                                    <c:if test="${!empty product.tage}">
                                    <span class="tag">
                                            ${product.tage}
                                    </span>
                                    </c:if>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>
                                    ${product.price}
                                </p>
                            </div>
                            <a href="javascript:void(0)"
                               class="buy_btn "
                               data-statistics="home_goods_list_cake_button_1|加入购物车_雪域牛乳芝士蛋糕"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                            </c:forEach>
                        </div>
                    </li>
                </ul>
                <div class="link_wrap">
                    <a href="<%=request.getContextPath()%>/category-0-1.html"
                       data-statistics="home_cake_more|更多蛋糕">更多蛋糕&nbsp;&gt;</a>
                </div>
            </div>
        </section>


        <section class="pub_image max_width">
            <a href="<%=request.getContextPath()%>/category-1000-1.html" data-statistics="home_banner_gift|礼品馆banner">
                <img src="${pageContext.request.contextPath}/static/picture/gift.jpg">
            </a>
        </section>
        <section class="gift_section">
            <div class="wrap main_width">

                <ul class="p_list_new clear_fix ">
                    <c:forEach items="${gifts}" var="gift">
                    <li class="p_item_new "
                        data-id="${gift.id}"
                        data-hideSpec=""
                        data-items='${gift.name}||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/18263/list_18263.jpg|http://www.lecake.com/shop/goods-108201.html|5|108201|18264|1|1|0||100008|规格|1盒/8枚入|128|128|23.6|10.6|5|144|0||0|0|'
                        data-goodsSweet=""
                        data-goodsTasteTxt="${gift.taste}"
                    >
                        <a href="<%=request.getContextPath()%>/shop/goods-${gift.id}.html" target="_blank"
                           data-statistics="home_goods_list_gift_img_1|点击商品图片跳转商品详情页_费南雪金砖形礼盒（8枚入）"
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
                            <a href="<%=request.getContextPath()%>/shop/goods-${gift.id}.html" target="_blank"
                               data-statistics="home_goods_list_gift_title_1|点击商品名称跳转商品详情页_费南雪金砖形礼盒（8枚入）"
                            >
                                <h3 class="no_wrap p_name">${gift.name}</h3>
                            </a>
                            <div class="p_tag">
                                <p>
                                    <c:if test="${!empty gift.tage}">
                                        <span class="tag">${gift.tage}</span>
                                    </c:if>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>
                                    ${gift.price}
                                </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn "
                               data-statistics="home_goods_list_gift_button_1|加入购物车_费南雪金砖形礼盒（8枚入）"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div class="link_wrap">
                    <a href="<%=request.getContextPath()%>/category-1000-1.html"
                       data-statistics="home_gift_more|更多礼品">更多礼品&nbsp;&gt;</a>
                </div>
            </div>
        </section>
        <section class="comment_section">
            <h2>用户评论</h2>
            <a href="javascript:void(0)" class="nav prev swiper-button-prev"
               data-statistics="home_comment_prev|上一个评论"></a>
            <a href="javascript:void(0)" class="nav next swiper-button-next"
               data-statistics="home_comment_prev|下一个评论"></a>
            <div class="comment_list swiper-container" id="comments">
                <ul class="swiper-wrapper">
                            <c:forEach items="${list}" var="pageInfo">
                        <li class="swiper-slide">
                            <c:forEach items="${pageInfo.list}" var="comment">
                            <div class="comment_item">
                                <figure>
                                    <div class="img_wrap">
                                        <img src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                             data-original="//imagecdn.lapetit.cn/postsystem/docroot/images/commentshead/07008CF5A0021E2347CE66A1.png"
                                             class="slideLazy"/>
                                    </div>
                                    <figcaption>${comment.phone_num}</figcaption>
                                </figure>
                                <div class="comment_content">
                                    <p class="text">${comment.comment}</p>
                                    <p class="content_time">${comment.comment_date}</p>
                                    <div class="cake_info">
                                        <a href="/shop/goods-102714.html"
                                           target="_blank"
                                           data-statistics="home_comment_link_1|首页评论banner_1">
                                            <img src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                                 data-original="<%=request.getContextPath()%>/static/images/commentsgoods/${comment.product_com_img_url}"
                                                 class="slideLazy">
                                            <p>立即购买</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </li>
                    </c:forEach>
                </ul>
                <div class="swiper-pagination"></div>
            </div>
        </section>
    </div>
    <!--领券-->
    <div class="activity_181106 hide">
        <div class="div_img">
            <img src="${pageContext.request.contextPath}/static/picture/newcoupon.png" class="auto_pos">
            <a href="/shop/help-780.html" class="link"></a>
            <a href="javascript:void(0)" class="close_btn"></a>
        </div>
    </div>

    <jsp:include page="foot.jsp"/>
</article>

<script>
    var statisticsFlag = true;
</script>
<script>
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
</script>
<script src="${pageContext.request.contextPath}/static/js/sitelist.js"></script>
<script src="${pageContext.request.contextPath}/static/js/widget.js"></script>
<script src="${pageContext.request.contextPath}/static/js/base.js"></script>
<script src="${pageContext.request.contextPath}/static/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.marquee.js"></script>
<script src="${pageContext.request.contextPath}/static/js/home.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/commonlistnew.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig = {stat_host: "www.lecake.com", click_id: "KyHhpPmSyUnV"};</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/mystat.js"></script>
<script>
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

