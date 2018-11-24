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
        <link href="${pageContext.request.contextPath}/static/css/welfare.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/commonlist.css" rel="stylesheet"></head>
<body>
<article class="container main_welfare main_welfare_new">
    <jsp:include page="../head-nav.jsp"/>
    <div class="main">
        <section class="filter_wrap">
            <div class="wrap clear_fix">
                <div class="tab_welfare pleasant f_left">
                    <h1 class="active">悦享<span class="highLight">福利</span>兑换</h1>
                    <p>规格 &nbsp;<span class="goodsMark"> 2-4人食</span></p>
                </div>
                <div class="tab_welfare honorable f_right">
                    <h1>尊享<span class="highLight">福利</span>兑换</h1>
                    <p>规格 &nbsp;<span class="goodsMark"> 5-8人食</span></p>
                </div>
            </div>
        </section>
    <section class="p_list_wrap main_width pleasant">
                            
        <ul class="p_list_new clear_fix pleasant">
            <li class="p_item_new "
            data-id="102192"
            data-hideSpec=""
            data-items=''
            data-goodsSweet="1"
            data-goodsTasteTxt="慕斯口味"
        >
            <a href="/shop/goods-102192.html" target="_blank"
                >
                <div class="img_wrap">
                    <div class="div_img">
                                                    <img class="lazy"
                                 src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                 data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201309/12253/list_12253.jpg?v=1529284330"
                            />
                                            </div>
                </div>
            </a>
            <div class="p_info">
                <a href="/shop/goods-102192.html" target="_blank"
                                       >
                    <h3 class="no_wrap p_name">阿尔蒙麦香蛋糕</h3>
                </a>
                <div class="p_tag">
                                                        </div>
                <div class="price_wrap">
                    <p class="new_price">
                        <small>¥</small>198                    </p>
                                                                            </div>
                <a href="javascript:void(0)"

                   class="buy_btn normal"
                                    >
                    <span>立即兑换&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </a>
            </div>
        </li>
            <li class="p_item_new "
                data-id="103428"
                data-hideSpec=""
                data-items=''
                data-goodsSweet="2"
                data-goodsTasteTxt="慕斯口味"
            >
                <a href="/shop/goods-103428.html" target="_blank"
                    >
                    <div class="img_wrap">
                        <div class="div_img">
                                                        <img class="lazy"
                                     src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                     data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201505/13490/list_13490.jpg?v=1529284307"
                                />
                                                </div>
                    </div>
                </a>
                <div class="p_info">
                    <a href="/shop/goods-103428.html" target="_blank"
                                           >
                        <h3 class="no_wrap p_name">和风抹茶红豆蛋糕</h3>
                    </a>
                    <div class="p_tag">
                                                <p>
                                                                <span class="tag">+18元升级</span>
                                                        </p>
                                                            </div>
                    <div class="price_wrap">
                        <p class="new_price">
                            <small>¥</small>198                    </p>
                                                                                </div>
                    <a href="javascript:void(0)"

                       class="buy_btn normal"
                                        >
                        <span>立即兑换&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </a>
                </div>
            </li>
        </ul>
    </section>
    <section class="p_list_wrap main_width honorable">
                            
        
    </section>
        <section class="recommend_list main_width clear_fix">
            <div class="wrap recommend_title">
                <h1>热门推荐</h1>
                <p>可使用悦享券抵扣100元，使用尊享券抵扣200元</p>
            </div>
            <p class="goods_more">
                <a href="/category-0-1.html"
                   class="" data-statistics="nav_cake|蛋糕">查看更多></a>
            </p>
            <div class="fitting">
                <div class="bd">
                    <a href="javascript:void(0)" class="nav prev"></a>
                    <a href="javascript:void(0)" class="nav next"></a>
                    <div class="fitting_list">
                                                    
<ul class="p_list_new clear_fix recommend">
            <li class="p_item_new "
            data-id="100801"
            data-hideSpec=""
            data-items='雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100801.html|1|100801|10801|1|1|0|||建议食用人数|2-4人食|198|198|13|13|4|450|5||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100802.html|2|100802|10802|1|1|0|||建议食用人数|5-8人食|298|298|17|17|4|820|10||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100803.html|3|100803|10803|1|1|0|||建议食用人数|10-12人食|458|458|22|22|4|1300|15||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://www.lecake.com/shop/goods-100804.html|4|100804|10804|1|1|0|||建议食用人数|15-20人食|756|756|31|31|4|2600|20||0|0|'
            data-goodsSweet="2"
            data-goodsTasteTxt="雪域口味"
        >
            <a href="/shop/goods-100801.html" target="_blank"
                >
                <div class="img_wrap">
                    <div class="div_img">
                                                    <img class="lazy"
                                 src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                 data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg?v=1535097629"
                            />
                                            </div>
                </div>
            </a>
            <div class="p_info">
                <a href="/shop/goods-100801.html" target="_blank"
                                       >
                    <h3 class="no_wrap p_name">雪域牛乳芝士蛋糕</h3>
                </a>
                <div class="p_tag">
                                            <p>
                                                            <span class="tag">人气爆款</span>
                                                    </p>
                                                        </div>
                <div class="price_wrap">
                    <p class="new_price">
                        <small>¥</small>198                    </p>
                                                                            </div>
                <a href="javascript:void(0)"
                   
                   class="buy_btn "
                                            data-statistics="_button_1|加入购物车_雪域牛乳芝士蛋糕"
                                    >
                    <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </a>
            </div>
        </li>
            <li class="p_item_new "
            data-id="102714"
            data-hideSpec=""
            data-items='提拉米苏乐脆蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201405/12775/list_12775.jpg|http://www.lecake.com/shop/goods-102714.html|1|102714|12776|1|1|0|||建议食用人数|2-4人食|198|198|13|13|4|430|5||0|0|@@提拉米苏乐脆蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201405/12775/list_12775.jpg|http://www.lecake.com/shop/goods-102715.html|2|102715|12777|1|1|0|||建议食用人数|5-8人食|298|298|17|17|4|750|10||0|0|@@提拉米苏乐脆蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201405/12775/list_12775.jpg|http://www.lecake.com/shop/goods-102716.html|3|102716|12778|1|1|0|||建议食用人数|10-12人食|458|458|22|22|4|1150|15||0|0|@@提拉米苏乐脆蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201405/12775/list_12775.jpg|http://www.lecake.com/shop/goods-102717.html|4|102717|12779|1|1|0|||建议食用人数|15-20人食|756|756|31|31|4|2250|20||0|0|'
            data-goodsSweet="1"
            data-goodsTasteTxt="慕斯口味"
        >
            <a href="/shop/goods-102714.html" target="_blank"
                >
                <div class="img_wrap">
                    <div class="div_img">
                                                    <img class="lazy"
                                 src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                 data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201405/12775/list_12775.jpg?v=1531882385"
                            />
                                            </div>
                </div>
            </a>
            <div class="p_info">
                <a href="/shop/goods-102714.html" target="_blank"
                                       >
                    <h3 class="no_wrap p_name">提拉米苏乐脆蛋糕</h3>
                </a>
                <div class="p_tag">
                                            <p>
                                                            <span class="tag">人气爆款</span>
                                                            <span class="tag">+18元升级</span>
                                                    </p>
                                                        </div>
                <div class="price_wrap">
                    <p class="new_price">
                        <small>¥</small>198                    </p>
                                                                            </div>
                <a href="javascript:void(0)"
                   
                   class="buy_btn "
                                            data-statistics="_button_2|加入购物车_提拉米苏乐脆蛋糕"
                                    >
                    <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </a>
            </div>
        </li>
            <li class="p_item_new "
            data-id="103602"
            data-hideSpec=""
            data-items='公主蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201508/13664/list_13664.jpg|http://www.lecake.com/shop/goods-103602.html|1|103602|13665|1|1|0|||建议食用人数|2-4人食|218|218|13|9|0|460|5||0|0|@@公主蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201508/13664/list_13664.jpg|http://www.lecake.com/shop/goods-103603.html|2|103603|13666|1|1|0|||建议食用人数|5-8人食|336|336|17|9|0|720|10||0|0|@@公主蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201508/13664/list_13664.jpg|http://www.lecake.com/shop/goods-103604.html|3|103604|13667|1|1|0|||建议食用人数|10-12人食|504|504|22|9|0|1100|15||0|0|@@公主蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201508/13664/list_13664.jpg|http://www.lecake.com/shop/goods-103605.html|4|103605|13668|1|1|0|||建议食用人数|15-20人食|840|840|31|9|0|2300|20||0|0|'
            data-goodsSweet="2"
            data-goodsTasteTxt="巧克力味"
        >
            <a href="/shop/goods-103602.html" target="_blank"
                >
                <div class="img_wrap">
                    <div class="div_img">
                                                    <img class="lazy"
                                 src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                 data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201508/13664/list_13664.jpg?v=1522743650"
                            />
                                            </div>
                </div>
            </a>
            <div class="p_info">
                <a href="/shop/goods-103602.html" target="_blank"
                                       >
                    <h3 class="no_wrap p_name">公主蛋糕</h3>
                </a>
                <div class="p_tag">
                                            <p>
                                                            <span class="tag">+18元升级</span>
                                                    </p>
                                                        </div>
                <div class="price_wrap">
                    <p class="new_price">
                        <small>¥</small>218                    </p>
                                                                            </div>
                <a href="javascript:void(0)"
                   
                   class="buy_btn "
                                            data-statistics="_button_3|加入购物车_公主蛋糕"
                                    >
                    <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </a>
            </div>
        </li>
            <li class="p_item_new "
            data-id="100492"
            data-hideSpec=""
            data-items='雪域蓝莓芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201211/10491/list_10491.jpg|http://www.lecake.com/shop/goods-100492.html|1|100492|10492|1|1|0|||建议食用人数|2-4人食|198|198|13|13|5|450|5||0|0|@@雪域蓝莓芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201211/10491/list_10491.jpg|http://www.lecake.com/shop/goods-100493.html|2|100493|10493|1|1|0|||建议食用人数|5-8人食|298|298|17|17|5|770|10||0|0|@@雪域蓝莓芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201211/10491/list_10491.jpg|http://www.lecake.com/shop/goods-100494.html|3|100494|10494|1|1|0|||建议食用人数|10-12人食|458|458|22|22|5|1250|15||0|0|@@雪域蓝莓芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201211/10491/list_10491.jpg|http://www.lecake.com/shop/goods-100495.html|4|100495|10495|1|1|0|||建议食用人数|15-20人食|756|756|31|31|5|2500|20||0|0|'
            data-goodsSweet="2"
            data-goodsTasteTxt="雪域口味"
        >
            <a href="/shop/goods-100492.html" target="_blank"
                >
                <div class="img_wrap">
                    <div class="div_img">
                                                    <img class="lazy"
                                 src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                 data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201211/10491/list_10491.jpg?v=1529291174"
                            />
                                            </div>
                </div>
            </a>
            <div class="p_info">
                <a href="/shop/goods-100492.html" target="_blank"
                                       >
                    <h3 class="no_wrap p_name">雪域蓝莓芝士蛋糕</h3>
                </a>
                <div class="p_tag">
                                            <p>
                                                            <span class="tag">HOT</span>
                                                    </p>
                                                        </div>
                <div class="price_wrap">
                    <p class="new_price">
                        <small>¥</small>198                    </p>
                                                                            </div>
                <a href="javascript:void(0)"
                   
                   class="buy_btn "
                                            data-statistics="_button_4|加入购物车_雪域蓝莓芝士蛋糕"
                                    >
                    <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </a>
            </div>
        </li>
            <li class="p_item_new "
            data-id="102024"
            data-hideSpec=""
            data-items='蓝莓拿破仑蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201303/12085/list_12085.jpg|http://www.lecake.com/shop/goods-102024.html|1|102024|12086|1|1|0|||建议食用人数|2-4人食|198|198|13|13|5|450|5||0|0|@@蓝莓拿破仑蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201303/12085/list_12085.jpg|http://www.lecake.com/shop/goods-102025.html|2|102025|12087|1|1|0|||建议食用人数|5-8人食|298|298|17|17|5|950|10||0|0|@@蓝莓拿破仑蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201303/12085/list_12085.jpg|http://www.lecake.com/shop/goods-102026.html|3|102026|12088|1|1|0|||建议食用人数|10-12人食|458|458|22|22|5|1450|15||0|0|@@蓝莓拿破仑蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201303/12085/list_12085.jpg|http://www.lecake.com/shop/goods-102027.html|4|102027|12089|1|1|0|||建议食用人数|15-20人食|756|756|31|31|5|2450|20||0|0|'
            data-goodsSweet="2"
            data-goodsTasteTxt="鲜果口味"
        >
            <a href="/shop/goods-102024.html" target="_blank"
                >
                <div class="img_wrap">
                    <div class="div_img">
                                                    <img class="lazy"
                                 src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                 data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201303/12085/list_12085.jpg?v=1522743650"
                            />
                                            </div>
                </div>
            </a>
            <div class="p_info">
                <a href="/shop/goods-102024.html" target="_blank"
                                       >
                    <h3 class="no_wrap p_name">蓝莓拿破仑蛋糕</h3>
                </a>
                <div class="p_tag">
                                            <p>
                                                            <span class="tag">+18元升级</span>
                                                    </p>
                                                        </div>
                <div class="price_wrap">
                    <p class="new_price">
                        <small>¥</small>198                    </p>
                                                                            </div>
                <a href="javascript:void(0)"
                   
                   class="buy_btn "
                                            data-statistics="_button_5|加入购物车_蓝莓拿破仑蛋糕"
                                    >
                    <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </a>
            </div>
        </li>
            <li class="p_item_new "
            data-id="102517"
            data-hideSpec=""
            data-items='芒果心愿盒蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201403/12578/list_12578.jpg|http://www.lecake.com/shop/goods-102517.html|1|102517|12579|1|1|0|1542988800000||建议食用人数|2-4人食|218|218|13|13|5|480|5||0|0|@@芒果心愿盒蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201403/12578/list_12578.jpg|http://www.lecake.com/shop/goods-102518.html|2|102518|12580|1|1|0|1542988800000||建议食用人数|5-8人食|336|336|17|17|5|860|10||0|0|@@芒果心愿盒蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201403/12578/list_12578.jpg|http://www.lecake.com/shop/goods-102519.html|3|102519|12581|1|1|0|1542988800000||建议食用人数|10-12人食|504|504|22|22|5|1350|15||0|0|@@芒果心愿盒蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201403/12578/list_12578.jpg|http://www.lecake.com/shop/goods-102520.html|4|102520|12582|1|1|0|1542988800000||建议食用人数|15-20人食|840|840|31|31|5|2550|20||0|0|'
            data-goodsSweet="2"
            data-goodsTasteTxt="鲜果口味"
        >
            <a href="/shop/goods-102517.html" target="_blank"
                >
                <div class="img_wrap">
                    <div class="div_img">
                                                    <img class="lazy"
                                 src="${pageContext.request.contextPath}/static/picture/grey.gif"
                                 data-original="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201403/12578/list_12578.jpg?v=1522743650"
                            />
                                            </div>
                </div>
            </a>
            <div class="p_info">
                <a href="/shop/goods-102517.html" target="_blank"
                                       >
                    <h3 class="no_wrap p_name">芒果心愿盒蛋糕</h3>
                </a>
                <div class="p_tag">
                                            <p>
                                                            <span class="tag">+18元升级</span>
                                                    </p>
                                                        </div>
                <div class="price_wrap">
                    <p class="new_price">
                        <small>¥</small>218                    </p>
                                                                            </div>
                <a href="javascript:void(0)"
                   
                   class="buy_btn "
                                            data-statistics="_button_6|加入购物车_芒果心愿盒蛋糕"
                                    >
                    <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </a>
            </div>
        </li>
    </ul>                                            </div>
                </div>
            </div>
        </section>
        <section class="rules_stamp main_width">
            <div class="rules_title">
                <h1>福利券使用规则</h1>
            </div>
            <ul>
                <li>1、本券为提货凭证，需一次性兑换完成，不退款、不兑现、不找零；</li>
                <li>2、本券购买时可开具发票，兑换时不开具发票。</li>
                <li>
                    3、登录诺心官网www.lecake.com[企业专区]下[福利券专区]，
                    使用悦享券可兑换悦享福利产品一个，使用尊享券可兑换尊享福利产品一个；
                    如兑换福利产品外的其他产品，可使用悦享券抵扣100元，尊享券抵扣200元，
                    差价应另外支付，明示不参与商品除外。
                </li>
                <li>4、扫描二维码后填写必要信息，绑定用户后方可使用。</li>
                <li>5、如不绑定，则收货时需向配送员交回本券完成收货。</li>
                <li>6、本券有效期以福利券背面有效期为准，请于有效期内完成兑换。</li>
                <li>
                    7、注意事项：节日期间兑换集中，请至少提前一日兑换；本券不记名，
                    遗失不补，应妥善保管；请注意券面完好，号码、二维码等污损无法使用的，损失自负。
                </li>
                <li>8、配送说明：订购时间、配送及收费等标准以诺心官网最新发布信息为准。</li>
                <li>9、优惠说明：使用本券兑换，不参与诺心积分奖励及其他优惠活动。</li>
                <li>10、特别声明：非授权的单位或个人，均无权销售本券，否则诺心有权不予兑换且对所有损失概不负责。</li>
            </ul>
        </section>
    </div>
        <footer class="global_footer">
        <div class="footer_online">
            <a href="javascript:void(0)" class="service_btn" id="footerServiceBtn"><i></i>在线客服</a>
            <a href="javascript:void (0)" class="wx_btn" id="footerWxBtn">
                <img src="${pageContext.request.contextPath}/static/picture/qr_code_bottom.png">
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
                <a href="/about/notice.html" target="_blank">诺心公告</a>
                <a href="/shop/help-1.html" target="_blank">关于诺心</a>
                <a href="/shop/help-80.html" target="_blank">联系我们</a>
                <a href="/shop/help-106.html"
                   target="_blank">客服服务</a>
                <a href="//rescdn.lecake.com/shop/lecake/theme/xth2/images/index/business_certificate4.jpg"
                   target="_blank">食品经营许可证</a>
                <a href="//rescdn.lecake.com/postsystem/docroot/images/promotion/201805/S22C-2180516134800_0001_0101.jpg"
                   target="_blank">生产许可证</a>
                <a href="/shop/help-668.html" target="_blank">预付费卡协议</a>
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
<script src="${pageContext.request.contextPath}/static/js/jquery.superslide.2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/welfare.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/commonlistnew.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHhpmyPZlBw"};</script>
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

