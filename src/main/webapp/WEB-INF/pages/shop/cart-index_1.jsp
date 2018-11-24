<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 2018/11/9
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8"/>
    <title>诺心蛋糕官网|诺心LE CAKE—诺心蛋糕网上订购</title>
    <meta name="Keywords" content="诺心蛋糕官网,诺心, 生日蛋糕订购，芝士蛋糕,慕斯蛋糕,草莓蛋糕，蛋糕网上订购，订蛋糕，网上订蛋糕"/>
    <meta name="Description"
          content="诺心蛋糕官网提供生日蛋糕,巧克力蛋糕,芝士蛋糕,水果蛋糕,慕斯蛋糕,草莓蛋糕订购,蛋糕店已在上海,北京,广州,深圳,天津,杭州,苏州,成都,重庆,宁波,南京开通网上订蛋糕,免费配送到家。"/>
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
    <script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/vue.min.js"></script>
    <link href="<%=request.getContextPath()%>/static/css/swiper.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/cart.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/commonlist.css" rel="stylesheet">
</head>
<body>
<div class="container main_cart">
    <jsp:include page="../head-login-nav.jsp"/>
    <div class="main" id="mainCart">
        <%-- 如果没登陆，显示下列代码 --%>
        <section class="login_status">
            <span>您还没有登录，登录后购物车的商品将保存到您的账号中！</span>
            <a href="/customer/login.html"
               data-statistics="carts_login|立即登录">立即登录</a>
        </section>
      <c:if test="${CART_SESSION!=null}" var="flag">
        <section class="top main_width">
            <a href="/category-0-1.html" class="back_btn" >继续购物</a>
            <h1>您的购物车<span>（<b class="total_count">4</b>）</span></h1>
        </section>
        <c:forEach items="${CART_SESSION.buy_list}" var="cart">
            <section class="goods_list">
                <div class="goods_item">
                    <div class="item_message clear_fix"><a href="javascript:void(0)" class="check_status active"></a>
                        <div class="img_wrap f_left"><a href="/shop/goods-${cart.sku_id}.html" target="_blank"><img
                                src="${pageContext.request.contextPath}/static/picture/${cart.main_pic}"
                                alt="${cart.goods_name}"></a></div>
                        <div class="p_info f_left">
                            <div class="p_detail f_left">
                                <h2 class="no_wrap">
                                    <a href="/shop/goods-${cart.sku_id}.html" target="_blank">
                                            ${cart.goods_name}
                                    </a>
                                </h2>
                                <h3 class="no_wrap hide"></h3>
                                <h4>${cart.totalPrice}</h4>
                                <div class="price_wrap">
                                    <p class="new_price">
                                        <small>单价：￥</small>
                                            ${cart.totalPrice}
                                    </p>
                                </div>
                                <p class="cut">
                                    <i class="cut_btn"></i>
                                    切分9份
                                </p>
                                <div class="birthday_card">
                                    <span data-statistics="carts_segmentation|生日牌" class="card_text no_wrap gray">
                                        填写生日祝福
                                    </span>
                                    <div class="birthday_list" style="display: none;">
                                        <span class="birthday_item active">不需要</span>
                                        <span class="birthday_item">生日快乐</span>
                                        <span class="birthday_item">Happy Birthday</span>
                                        <p class="input_wrap clear_fix">
                                            <input type="text" maxlength="30" placeholder="自定义" class="customer_input">
                                            <a href="javascript:void(0)" class="btn">确定</a>
                                        </p>
                                        <b class="text">(最多14个汉字或28个字母)</b>
                                    </div>
                                </div>
                            </div>
                            <div class="p_edit f_right">
                                <p class="p_price">小计：￥${cart.totalPrice}</p>
                                <div class="input_wrap">
                                    <a href="javascript:void(0)" class="down num_edit_btn"></a>
                                    <input type="text" class="item_num" value="${cart.amount}">
                                    <a href="javascript:void(0)" class="up num_edit_btn"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:forEach>

            <section class="amount">
                <div class="wrap">
                    <div class="mini_width clear_fix">
                        <a href="javascript:void(0)" class="check_status" @click="toggleAll">全选</a>
                        <a href="javascript:void(0)" class="f_left delete_btn" @click="deleteAll">删除</a>
                        <p class="f_left total_count">
                            共<b>${CART_SESSION.count}</b>件商品，已选择<b>5</b>件
                        </p>
                        <div class="f_right total_amount_wrap">
                            <div class="inner">
                                <p>
                                    <span>应付(不含运费)：</span>￥<strong>${CART_SESSION.totalPrice}</strong>
                                </p>
                                <p>
                                    <span>优惠：</span>￥<strong>0</strong>
                                </p>
                            </div>
                        </div>
                        <button class="order_btn" @click="submit(0)" :disabled="fetching">结算</button>
                    </div>
                </div>
            </section>

      </c:if>
        <%-- 如果购物车中没有商品 --%>
      <c:if test="${not flag}">
        <div class="no_content" >
            <img src="<%=request.getContextPath()%>/static/picture/no_content.png">
            <p>您还没有选购商品，
                <a href="/category-0-1.html"
                   data-statistics="carts_stroll|去逛逛">去逛逛!</a>
            </p>
        </div>
      </c:if>
        <h3 style="color: red;text-align: center;padding: 20px 0;" class="buy_notice hide">
            4月累计在线现金支付满298元(不含运费)并在当月完成配送，可获得礼品馆商品抵用券1张(该券于2018.5.8前发放)，可兑换98元米菲曲奇等部分商品(每个账户仅限1张)。
        </h3>
        <!-- 精品配件-->
        <!--熊抱吐司加价购-->
        <section class="markup_list main_width" id="markupList">
            <div class="wrap main_width">
                <h2>加价礼品</h2>

                <ul class="p_list_new clear_fix ">
                    <li class="p_item_new "
                        data-id="107836"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-107836.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="<%=request.getContextPath()%>/static/picture/list_17892.jpg"/>
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-107836.html" target="_blank"
                            >
                                <h3 class="no_wrap p_name">T24普洱熟茶（轻）</h3>
                            </a>
                            <div class="p_tag">
                                <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>
                                    158
                                </p>
                                <p class="markup_price">
                                    <i>￥</i>69 </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_1|加入购物车_T24普洱熟茶（轻）"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                    <li class="p_item_new "
                        data-id="107664"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-107664.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="<%=request.getContextPath()%>/static/picture/list_17703_o.jpg"/>
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-107664.html" target="_blank"
                            >
                                <h3 class="no_wrap p_name">我爱你小青柑</h3>
                            </a>
                            <div class="p_tag">
                                <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>
                                    256
                                </p>
                                <p class="markup_price">
                                    <i>￥</i>128 </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_2|加入购物车_我爱你小青柑"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                    <li class="p_item_new "
                        data-id="107571"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-107571.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="<%=request.getContextPath()%>/static/picture/list_17633.jpg"/>
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-107571.html" target="_blank"
                            >
                                <h3 class="no_wrap p_name">个性字母透明挎包</h3>
                            </a>
                            <div class="p_tag">
                                <p>
                                    <span class="tag">秀场街拍潮品</span>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>
                                    68
                                </p>
                                <p class="markup_price">
                                    <i>￥</i>38 </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_3|加入购物车_个性字母透明挎包"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                    <li class="p_item_new "
                        data-id="108093"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-108093.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="<%=request.getContextPath()%>/static/picture/list_18135.jpg"/>
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-108093.html" target="_blank"
                            >
                                <h3 class="no_wrap p_name">漫游计划随行杯（U1-URBAN1）</h3>
                            </a>
                            <div class="p_tag">
                                <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>
                                    99
                                </p>
                                <p class="markup_price">
                                    <i>￥</i>89 </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_4|加入购物车_漫游计划随行杯（U1-URBAN1）"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                </ul>
                <div class="link_wrap">
                    <a href="/category-10-1.html">更多加价礼品&nbsp;&gt;</a>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../foot.jsp"/>
</div>
<script>
    //购物车数据
    var cartData = {
        "count": 0,
        "type": 1,
        "owner": "KyHkSLdtBVKr",
        "buy_list": [],
        "other_site": [],
        "unavailable": [],
        "totalPrice": 0,
        "discountsPrice": 0,
        "birthDayCardList": [{"itemID": 249, "itemName": "\u751f\u65e5\u5feb\u4e50"}, {
            "itemID": 368,
            "itemName": "Happy Birthday"
        }]
    };
        //购物车对象
        var cartObj = {};
        //周周配商品列表
        var weeklyGoods = null;
        //牛奶
        var milkGoods = [107544, 103734, 104165];
        //仅可单独购买的周周配商品列表
        var weeklyAloneSku = [106883, 106880, 106876, 107032, 107039, 106981, 106994, 107006, 107045, 107003, 107013, 107165, 107220, 107171, 107173, 107187, 1];
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
<script src="<%=request.getContextPath()%>/static/js/sitelist.js"></script>
<script src="<%=request.getContextPath()%>/static/js/widget.js"></script>
<script src="<%=request.getContextPath()%>/static/js/base.js"></script>
<script src="<%=request.getContextPath()%>/static/js/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/cart.js"></script>
<script src="<%=request.getContextPath()%>/static/js/jquery.lazyload.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/commonlistnew.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig = {stat_host: "www.lecake.com", click_id: "KyHkSLdtBVKr"};</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/mystat.js"></script>
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


