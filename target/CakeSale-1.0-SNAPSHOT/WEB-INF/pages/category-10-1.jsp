<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8"/>
        <title>诺心蛋糕列表</title>
    <meta name="Keywords" content=""/>
    <meta name="Description" content=""/>
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
            'baseUrl': '${pageContext.request.contextPath}',
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
    <div class="main markup_main">
        <section class="filter_wrap main_width">
            <div class="wrap">
                <dl class="clear_fix classify">
                    <dt>分类：</dt>
                    <dd data-id="" class="all active">全部分类</dd>
                                    <dd data-id="880"
                            class=""
                            data-statistics="type_series_880|生活家">生活家</dd>
                                    <dd data-id="881"
                            class=""
                            data-statistics="type_series_881|商礼">商礼</dd>
                                    <dd data-id="882"
                            class=""
                            data-statistics="type_series_882|庆生">庆生</dd>
                                    <dd data-id="883"
                            class=""
                            data-statistics="type_series_883|致爱">致爱</dd>
                                    <dd data-id="884"
                            class=""
                            data-statistics="type_series_884|童趣">童趣</dd>
                                    <dd data-id="885"
                            class=""
                            data-statistics="type_series_885|轻食主义">轻食主义</dd>
                            </dl>
                <dl class="clear_fix sort">
                    <dt>排序：</dt>
                    <dd data-id=""
                        class="sort_flag sale_flag active">
                        综合
                    </dd>
                    <dd data-id="hot_desc" class="sort_flag sale_flag ">销量</dd>
                    <dd data-id="default"
                        class="sort_flag price_flag ">
                        价格<i class="up"></i>
                    </dd>
                </dl>
            </div>
        </section>
        <section class="p_list_wrap main_width" style="padding-top: 20px;">
            <h2 class="hide">蛋糕</h2>
            <ul class="p_list_new clear_fix ">
                    <li class="p_item_new "
                    data-id="107682"
                    data-hideSpec="1"
                    data-items=''
                    data-goodsSweet=""
                    data-goodsTasteTxt="特殊商品"
                >
                    <a href="/shop/goods-107682.html" target="_blank"
                        >
                        <div class="img_wrap">
                            <div class="div_img">
                                                            <img class="lazy"
                                         src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                         data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/17720/list_17720_o.jpg?v=1541147047"
                                    />
                                                    </div>
                        </div>
                    </a>
                    <div class="p_info">
                        <a href="/shop/goods-107682.html" target="_blank"
                                               >
                            <h3 class="no_wrap p_name">飞利浦搅拌机</h3>
                        </a>
                        <div class="p_tag">
                                                                        <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                                            </div>
                        <div class="price_wrap">
                            <p class="new_price">
                                <small>¥</small>299                    </p>
                                                                        <p class="markup_price">
                                    <i>￥</i>269                        </p>
                                                                        <p class="f_right sales_volume">
                                    已售11                        </p>
                                            </div>
                        <a href="javascript:void(0)"
                           
                           class="buy_btn "
                                                    data-statistics="_button_1|加入购物车_飞利浦搅拌机"
                                            >
                            <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </a>
                    </div>
                </li>
                    <li class="p_item_new "
                    data-id="107968"
                    data-hideSpec="1"
                    data-items=''
                    data-goodsSweet=""
                    data-goodsTasteTxt="特殊商品"
                >
                    <a href="/shop/goods-107968.html" target="_blank"
                        >
                        <div class="img_wrap">
                            <div class="div_img">
                                                            <img class="lazy"
                                         src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                         data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/17998/list_17998.jpg"
                                    />
                                                    </div>
                        </div>
                    </a>
                    <div class="p_info">
                        <a href="/shop/goods-107968.html" target="_blank"
                                               >
                            <h3 class="no_wrap p_name">普洱小金砖礼盒</h3>
                        </a>
                        <div class="p_tag">
                                                                        <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                                            </div>
                        <div class="price_wrap">
                            <p class="new_price">
                                <small>¥</small>198                    </p>
                                                                        <p class="markup_price">
                                    <i>￥</i>88                        </p>
                                                                        <p class="f_right sales_volume">
                                    已售33                        </p>
                                            </div>
                        <a href="javascript:void(0)"
                           
                           class="buy_btn "
                                                    data-statistics="_button_18|加入购物车_普洱小金砖礼盒"
                                            >
                            <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </a>
                    </div>
                </li>
                    <li class="p_item_new num_cake"
                    data-id="107490"
                    data-hideSpec="1"
                    data-items=''
                    data-goodsSweet=""
                    data-goodsTasteTxt="特殊商品"
                >
                    <a href="/shop/goods-107490.html" target="_blank"
                        >
                        <div class="img_wrap">
                            <div class="div_img">
                                                            <img class="lazy"
                                         src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                         data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201808/17543/list_17543.jpg?v=1536060139"
                                    />
                                                    </div>
                        </div>
                    </a>
                    <div class="p_info">
                        <a href="/shop/goods-107490.html" target="_blank"
                                               >
                            <h3 class="no_wrap p_name">12星座蜡烛-处女座</h3>
                        </a>
                        <div class="p_tag">
                                                                        <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                                            </div>
                        <div class="price_wrap">
                            <p class="new_price">
                                <small>¥</small>198                    </p>
                                                                        <p class="markup_price">
                                    <i>￥</i>188                        </p>
                                                                        <p class="f_right sales_volume">
                                    已售15                        </p>
                                            </div>
                        <a href="javascript:void(0)"
                           
                           class="buy_btn "
                                                    data-statistics="_button_19|加入购物车_12星座蜡烛-处女座"
                                            >
                            <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </a>
                    </div>
                </li>
                    <li class="p_item_new "
                    data-id="107716"
                    data-hideSpec="1"
                    data-items=''
                    data-goodsSweet=""
                    data-goodsTasteTxt="特殊商品"
                >
                    <a href="/shop/goods-107716.html" target="_blank"
                        >
                        <div class="img_wrap">
                            <div class="div_img">
                                                            <img class="lazy"
                                         src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                         data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/17771/list_17771.jpg?v=1536832508"
                                    />
                                                    </div>
                        </div>
                    </a>
                    <div class="p_info">
                        <a href="/shop/goods-107716.html" target="_blank"
                                               >
                            <h3 class="no_wrap p_name">挂耳咖啡大满贯套装（配远山青杯）</h3>
                        </a>
                        <div class="p_tag">
                                                                        <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                                            </div>
                        <div class="price_wrap">
                            <p class="new_price">
                                <small>¥</small>189                    </p>
                                                                        <p class="markup_price">
                                    <i>￥</i>165                        </p>
                                                                        <p class="f_right sales_volume">
                                    已售31                        </p>
                                            </div>
                        <a href="javascript:void(0)"
                           
                           class="buy_btn "
                                                    data-statistics="_button_20|加入购物车_挂耳咖啡大满贯套装（配远山青杯）"
                                            >
                            <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </a>
                    </div>
                </li>
                    
            </ul>    
        </section>    
    </div>
        <jsp:include page="foot.jsp"/>
</article>
<script>
    document.write('<div style="display:none;">');
</script>
<div>
    <a href="${pageContext.request.contextPath}/category-0-1.html?moment=&taste=,113&spec=">冰淇淋蛋糕</a>
    <a href="${pageContext.request.contextPath}/category-0-1.html?moment=&taste=,114&spec=">奶油蛋糕</a>
    <a href="${pageContext.request.contextPath}/category-0-1.html?moment=&taste=,103&spec=">巧克力蛋糕</a>
    <a href="${pageContext.request.contextPath}/category-0-1.html?moment=&taste=,101&spec=">慕斯蛋糕</a>
    <a href="${pageContext.request.contextPath}/category-0-1.html?moment=&taste=,102&spec=">拿破仑蛋糕</a>
    <a href="${pageContext.request.contextPath}/category-0-1.html?moment=&taste=,104&spec=">芝士蛋糕</a>
    <a href="${pageContext.request.contextPath}/category-0-1.html?moment=&taste=,112&spec=">鲜果蛋糕</a>
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
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyJJi42TOUfg"};</script>
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

