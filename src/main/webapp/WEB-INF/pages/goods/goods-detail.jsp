<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/widget.css">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/js/html5.min.js"></script>
    <![endif]-->
    <script>
        var GlobalConfig = {
            'baseUrl': 'https://${pageContext.request.contextPath}/',
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
            "105819": "u542b2u628au9910u53c9",
            "105822": "u542b2u628au9910u53c9",
            "105909": "u542b2u628au9910u53c9",
            "105978": "u542b2u628au9910u53c9",
            "106041": "u5404u542b2u628au9910u52fa",
            "106032": "u542b2u628au9910u52fa",
            "106038": "u542b2u628au9910u52fa",
            "106031": "u542b2u628au9910u52fa",
            "106035": "u542b2u628au9910u52fa",
            "106071": "u542b2u628au9910u52fa",
            "106068": "u542b2u628au9910u52fa",
            "107135": "u542b1u628au9910u53c9"
        };
    </script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/vue.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/swiper.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/goods_detail.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/commonlist.css" rel="stylesheet">
</head>
<body>
<article class="container main_goods_detail">
    <jsp:include page="../head-nav.jsp"/>
    <input type="hidden" id="uid" value="${sp_id}">
    <input type="hidden" id="twoPostId" value="105411">
    <input type="hidden" id="productCode" value="105410-9-3">
    <input type="hidden" id="goodsName" value="${productDetail.name}">
    <div class="main main_width">
        <!-- 商品主图 -->
        <div class="goods_img">
            <c:forEach items="${productDetail.imgsList}" var="picture">
                <c:if test="${picture.sort eq 1}">
                    <img src="${pageContext.request.contextPath}/static/picture/details/${picture.detail_img_url}"
                         data-digital="">
                </c:if>
            </c:forEach>
        </div>
        <section class="goods_detail clear_fix">
            <!-- 左边促销信息 -->
            <div class="f_left left_wrap">
                <div class="title_wrap clear_fix">
                    <h1 class="title no_wrap f_left">
                        <span id="goodsTitle">${productDetail.name}</span>
                    </h1>
                    <div class="price_wrap f_right">
                        <p class="new_price">
                            <small>¥</small>
                            <span id="goodsPrice">${price}</span>
                        </p>
                    </div>
                </div>
                <div id="promotion">
                    <div class="promotion">
                        <h5>${productDetail.remark}</h5>
                    </div>
                </div>
            </div>            <!-- 右边规格选择 -->
            <div class="f_right right_wrap">

                <!-- 顶部悬浮 -->
                <div class="goods_fixed hide">
                    <div class="fixed_wrap">
                        <p class="goods_name">${productDetail.name}</p>
                        <p class="goods_comment">用户评论<span class="comment_count"></span></p>
                        <p class="goods_hot">热门推荐</p>
                        <p class="goods_price">
                                                            <span class="price">
                            <small>￥</small><i>298</i>
                        </span>
                            <span class="people">(<i>5-8人食</i>)</span>
                        </p>
                        <p class="add_cart_wrap">
                            <a href="javascript:void(0)" class="add_cart" id="cartAdd1"
                               data-statistics="details_add_shopcar|加入购物车|1">加入购物车＋</a>
                        </p>
                    </div>
                </div>

                <div class="eat_num">
                    <p class="spec_notice">建议食用人数</p>
                    <div class="clear_fix">
                        <c:forEach items="${productDetail.productValueList}" var="pvalue">
                            <a href="/shop/goods-${pvalue.id}.html"
                                <%--<a href="/shop/goodsdetail-${productDetail.id}-${specification.id}.html"--%>
                               class="">
                                    ${pvalue.number_of_eat}
                                <b></b>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <c:forEach items="${productDetail.productValueList}" var="pvalue">
                    <c:if test="${pvalue.id eq sp_id}">
                        <div class="spec clear_fix">
                            <p class="tableware no_wrap">
                                <i></i>
                                    ${pvalue.tablewareNum}
                            </p>
                            <p class="size no_wrap">
                                <i></i>
                                约
                                    ${pvalue.length}cm
                            </p>
                            <p class="weight">
                                <i></i>
                                约${pvalue.weight}g
                            </p>
                            <p class="sweet" id="${productDetail.sweet}">
                                甜度：
                                <i class="level_${productDetail.sweet}"></i>
                            </p>
                        </div>
                    </c:if>
                </c:forEach>
                <!--超值套餐-->
                <!--经典套餐-->
                <!--尊享套餐-->

                <!--超值套餐-->
                <div id="bread_type01" class="bread_spec hide">
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱原味匠心吐司</p>
                        <p class="size no_wrap" style="width: 31%"><i></i>约10.5*11.0*9.5cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约240g/个</p>
                        <p style="width: 20%">3个（半条装）</p>
                    </div>
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">随机口味</p>
                        <p class="size no_wrap" style="width: 31%"><i></i>约10.5*10.5*9.5cm</p>
                        <p class="weight" style="width: 20%"><i></i>约250g-300g</p>
                        <p style="width: 20%">1个（半条装）</p>
                    </div>
                </div>

                <!--经典套餐-->
                <div id="bread_type02" class="bread_spec hide">
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱原味匠心吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*11.0*9.5cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约240g/个</p>
                        <p style="width: 20%">1个（半条装）</p>
                    </div>
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱巧克力吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*11.0*9.5cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约300g/个</p>
                        <p style="width: 20%">1个（半条装）</p>
                    </div>
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱彩虹吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*11.0*9.5cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约250g/个</p>
                        <p style="width: 20%">1个（半条装）</p>
                    </div>
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱芝麻吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*10.5*9.5cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约250g/个</p>
                        <p style="width: 20%">1个（半条装）</p>
                    </div>
                </div>

                <!--尊享套餐-->
                <div id="bread_type03" class="bread_spec hide">
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱原味匠心吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*11.0*19cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约485g/个</p>
                        <p style="width: 20%">1个（整条装）</p>
                    </div>
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱巧克力吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*11.0*19cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约600g/个</p>
                        <p style="width: 20%">1个（整条装）</p>
                    </div>
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱彩虹吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*11.0*19cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约500g/个</p>
                        <p style="width: 20%">1个（整条装）</p>
                    </div>
                    <div class="spec clear_fix" style="padding: 14px 0;">
                        <p style="width: 22%;text-indent: 0;">熊抱芝麻吐司</p>
                        <p class="size no_wrap" style="width: 30%"><i></i>约10.5*10.5*19cm/个</p>
                        <p class="weight" style="width: 20%"><i></i>约500g/个</p>
                        <p style="width: 20%">1个（整条装）</p>
                    </div>
                </div>

                <div class="btn_wrap clear_fix">
                    <a href="javascript:void(0)" class="add_cart f_left" id="cartAdd"
                       data-statistics="details_add_shopcar|加入购物车|1">加入购物车＋</a>
                    <a href="javascript:void(0)" class="buy_now f_right" id="buyNow"
                       data-statistics="details_buy_now|立即购买|1">立即购买</a>
                </div>
            </div>
        </section>
        <!-- 温馨提示 -->
        <section class="clear_fix">
            <div class="promo_tips f_left">
            </div>
        </section>
        <!-- 组合购 -->

        <section class="group_buy_warp clear_fix">
            <div class="group_title">组合优惠</div>
            <div class="group_buy clear_fix">
                <div class="goods_main">
                    <div class="img_wrap"><img
                            src="${pageContext.request.contextPath}/static/picture/${productDetail.imgUrl}">
                    </div>
                    <p class="goods_name no_wrap">${productDetail.name}</p>
                </div>

                <div class="group_add icon">+</div>

                <div class="group_list_wrap need_swiper">
                    <a href="javascript:void(0)" class="nav prev icon swiper-button-prev"></a>
                    <a href="javascript:void(0)" class="nav next icon swiper-button-next"></a>
                    <div class="group_list swiper-container" id="groupList">
                        <ul class="swiper-wrapper">

                            <li class="group_item swiper-slide" data-uid="108682"
                                data-price="9.9">
                                <div class="img_wrap">
                                    <a target="_blank" href="/shop/goods-108682.html">
                                        <img src="${pageContext.request.contextPath}/static/picture/list_18744.jpg">
                                    </a>
                                </div>
                                <div class="group_info">
                                    <a target="_blank" href="/shop/goods-108682.html">
                                        <h3 class="name">诺心派对礼包（B款）</h3>
                                    </a>
                                    <p class="price_wrap clear_fix">
                                        <a href="javascript:void(0)" class="add_group f_left"></a>
                                        <span class="f_left  orange">+<i>9.9</i>元</span>
                                        <strong class="f_right">限时抢</strong>
                                    </p>
                                </div>
                            </li>
                            <li class="group_item swiper-slide" data-uid="107505"
                                data-price="188">
                                <div class="img_wrap">
                                    <a target="_blank" href="/shop/goods-107505.html">
                                        <img src="${pageContext.request.contextPath}/static/picture/list_17566_o.jpg">
                                    </a>
                                </div>
                                <div class="group_info">
                                    <a target="_blank" href="/shop/goods-107505.html">
                                        <h3 class="name">12星座蜡烛-天蝎座</h3>
                                    </a>
                                    <p class="price_wrap clear_fix">
                                        <a href="javascript:void(0)" class="add_group f_left"></a>
                                        <span class="f_left ">+<i>188</i>元</span>
                                        <span class="f_right logistics_tips">三方配</span>
                                    </p>
                                </div>
                            </li>
                            <li class="group_item swiper-slide" data-uid="107485"
                                data-price="378">
                                <div class="img_wrap">
                                    <a target="_blank" href="/shop/goods-107485.html">
                                        <img src="${pageContext.request.contextPath}/static/picture/list_17540.jpg">
                                    </a>
                                </div>
                                <div class="group_info">
                                    <a target="_blank" href="/shop/goods-107485.html">
                                        <h3 class="name">JR骑士鎏金杯礼盒组-荣誉骑士</h3>
                                    </a>
                                    <p class="price_wrap clear_fix">
                                        <a href="javascript:void(0)" class="add_group f_left"></a>
                                        <span class="f_left ">+<i>378</i>元</span>
                                        <span class="f_right logistics_tips">三方配</span>
                                    </p>
                                </div>
                            </li>
                            <li class="group_item swiper-slide" data-uid="107716"
                                data-price="165">
                                <div class="img_wrap">
                                    <a target="_blank" href="/shop/goods-107716.html">
                                        <img src="${pageContext.request.contextPath}/static/picture/list_17771.jpg">
                                    </a>
                                </div>
                                <div class="group_info">
                                    <a target="_blank" href="/shop/goods-107716.html">
                                        <h3 class="name">挂耳咖啡大满贯套装（配远山青杯）</h3>
                                    </a>
                                    <p class="price_wrap clear_fix">
                                        <a href="javascript:void(0)" class="add_group f_left"></a>
                                        <span class="f_left ">+<i>165</i>元</span>
                                        <span class="f_right logistics_tips">三方配</span>
                                    </p>
                                </div>
                            </li>
                            <li class="group_item swiper-slide" data-uid="107613"
                                data-price="598">
                                <div class="img_wrap">
                                    <a target="_blank" href="/shop/goods-107613.html">
                                        <img src="${pageContext.request.contextPath}/static/picture/list_17654.jpg">
                                    </a>
                                </div>
                                <div class="group_info">
                                    <a target="_blank" href="/shop/goods-107613.html">
                                        <h3 class="name">正谷古树红茶</h3>
                                    </a>
                                    <p class="price_wrap clear_fix">
                                        <a href="javascript:void(0)" class="add_group f_left"></a>
                                        <span class="f_left ">+<i>598</i>元</span>
                                        <span class="f_right logistics_tips">三方配</span>
                                    </p>
                                </div>
                            </li>
                            <li class="group_item swiper-slide" data-uid="107968"
                                data-price="88">
                                <div class="img_wrap">
                                    <a target="_blank" href="/shop/goods-107968.html">
                                        <img src="${pageContext.request.contextPath}/static/picture/list_17998.jpg">
                                    </a>
                                </div>
                                <div class="group_info">
                                    <a target="_blank" href="/shop/goods-107968.html">
                                        <h3 class="name">普洱小金砖礼盒</h3>
                                    </a>
                                    <p class="price_wrap clear_fix">
                                        <a href="javascript:void(0)" class="add_group f_left"></a>
                                        <span class="f_left ">+<i>88</i>元</span>
                                        <span class="f_right logistics_tips">三方配</span>
                                    </p>
                                </div>
                            </li>
                            <li class="group_item swiper-slide" data-uid="107608"
                                data-price="598">
                                <div class="img_wrap">
                                    <a target="_blank" href="/shop/goods-107608.html">
                                        <img src="${pageContext.request.contextPath}/static/picture/list_17652_o.jpg">
                                    </a>
                                </div>
                                <div class="group_info">
                                    <a target="_blank" href="/shop/goods-107608.html">
                                        <h3 class="name">598元正谷阳澄湖大闸蟹兑换券</h3>
                                    </a>
                                    <p class="price_wrap clear_fix">
                                        <a href="javascript:void(0)" class="add_group f_left"></a>
                                        <span class="f_left ">+<i>598</i>元</span>
                                        <span class="f_right logistics_tips">三方配</span>
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="group_to icon">=</div>

                <div class="group_result">
                    <h3>已添加<span id="groupBuyCount">0</span>个组合商品</h3>
                    <h4>组合价：<span class="price_wrap">￥<strong id="totalGroupPrice">0</strong></span></h4>
                    <a href="javascript:void(0)"
                       class="buy_now f_right"
                       id="buyNow1"
                       data-statistics="details_buy_now|立即购买|1">立即购买</a>
                    <a href="/BJ/category-10-1.html" class="more_link">查看更多</a>
                </div>
            </div>
        </section>

        <section class="goods_images">
            <div class="img" style="background: #f9f9f9">
                <c:forEach items="${productDetail.imgsList}" var="picture">
                    <c:if test="${picture.sort eq 2}">
                        <img src="${pageContext.request.contextPath}/static/picture/details/${picture.detail_img_url}"
                             alt=""/>
                    </c:if>
                </c:forEach>
            </div>
            <div class="img" style="text-align:center;padding:30px 0;">
                <c:forEach items="${productDetail.imgsList}" var="picture">
                    <c:if test="${picture.sort eq 3}">
                        <video style="width:800px;" controls="" autoplay="" loop="" preload="auto"
                               src="<%=request.getContextPath()%>/static/picture/details/${picture.detail_img_url}"></video>
                    </c:if>
                </c:forEach>
            </div>
            <div class="img" style="background: #f9f9f9">
                <c:forEach items="${productDetail.imgsList}" var="picture">
                    <c:if test="${picture.sort eq 4}">
                        <img src="${pageContext.request.contextPath}/static/picture/details/${picture.detail_img_url}"
                             alt=""/>
                    </c:if>
                </c:forEach>
            </div>
            <div class="img clear_fix" style="background: #f9f9f9">
                <div class="f_wrap">
                    <c:forEach items="${productDetail.imgsList}" var="picture">
                        <c:if test="${picture.sort eq 5}">
                            <img src="<%=request.getContextPath()%>/static/picture/details/${picture.detail_img_url}"
                                 alt=""/>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="r_wrap"><br/>
                    <div class="r_wrap"><br/>
                        <c:forEach items="${productDetail.imgsList}" var="picture">
                            <c:if test="${picture.sort eq 8}">
                                <img src="<%=request.getContextPath()%>/static/picture/details/${picture.detail_img_url}"
                                     alt=""/>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="img clear_fix" style="background: #f9f9f9">
                <div class="r_wrap"><br/>
                    <c:forEach items="${productDetail.imgsList}" var="picture">
                        <c:if test="${picture.sort eq 9}">
                            <img src="<%=request.getContextPath()%>/static/picture/details/${picture.detail_img_url}"
                                 alt=""/>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="f_wrap">
                    <c:forEach items="${productDetail.imgsList}" var="picture">
                        <c:if test="${picture.sort eq 6}">
                            <img src="<%=request.getContextPath()%>/static/picture/details/${picture.detail_img_url}"
                                 alt=""/>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="material_desc">
                <div class="inner">
                    <c:forEach items="${productDetail.imgsList}" var="picture">
                        <c:if test="${picture.sort eq 10}">
                            <img src="<%=request.getContextPath()%>/static/picture/details/${picture.detail_img_url}"
                                 alt=""/>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="text_wrap clear_fix">
                <div class="f_left audio_desc">
                    <h4 class="orange">如何定制个性语音</h4>
                    <h5>DIY radio</h5>
                    <img src="<%=request.getContextPath()%>/static/picture/details/audio_icon1.jpg" alt=""/> <img
                        src="<%=request.getContextPath()%>/static/picture/details/wave1.jpg" alt=""/>
                    <div class="inner">
                        <p><b>1</b>成功提交订单后，添加录音</p>
                        <p><b>2</b>添加录音（时长限制21秒）</p>
                        <p><b>3</b>录制成功后，上传即可</p>
                        <p><b>4</b>收货人收到蛋糕后，微信扫描卡片上的二维码，即可倾听ta的心声</p>
                    </div>
                </div>
                <div class="f_right eat_desc">
                    <h4>关于食用</h4>
                    <h5>About edible</h5>
                    <img src="<%=request.getContextPath()%>/static/picture/details/fork1.jpg" alt=""/>
                    <div class="inner">
                        <p>适合人群：大众</p>
                        <p>适合季节：所有</p>
                        <p>保鲜条件：冷藏0~4摄氏度</p>
                        <p>食用方法：请收到蛋糕后2-3小时内食用</p>
                        <p>温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用。</p>
                        <p>*商品以实物为准。</p>
                    </div>
                </div>
            </div>
            <div class="text_wrap text_center">
                <div class="goods_desc">
                    <h2 class="no_wrap">${productDetail.name}</h2>
                    <h4>Ms. Golden Cake</h4>
                    <div class="sp_1">&nbsp;</div>
                    <div class="inner">
                        <c:forEach items="${productDetail.imgsList}" var="picture">
                            <c:if test="${picture.sort eq 11}">
                                <img src="<%=request.getContextPath()%>/static/picture/details/${picture.detail_img_url}"
                                     alt=""/>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="div_img"><img src="${pageContext.request.contextPath}/static/picture/总厨.jpg" alt=""/></div>
            </div>
            <p>&nbsp;</p></section>
        <!-- 商品评论 -->
        <section class="clear_fix" id="allComment">
            <!-- <h3>Reviews</h3> -->
            <div class="top ">
                <h2>用户评论</h2>
                <h4></h4>
            </div>
            <div class="clear_fix">
                <div class="comment_wrap f_left">
                    <div class="all_comment">
                        <c:forEach items="${detailComments}" var="detailCom">
                            <ul class="comment_list">
                                <li class="clear_fix">
                                    <div class="img_wrap f_left"></div>
                                    <div class="info">
                                        <p class="clear_fix comment_title">
                                            <span class="comment_username">${detailCom.phone_num}</span>
                                            <span class="comment_spec">规格：${detailCom.number_of_eat}</span>
                                            <span class="comment_date">${detailCom.comment_date}</span>
                                        </p>
                                        <p>${detailCom.comment}</p>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="clear_fix">
                <div class="comment_wrap f_left"></div>
            </div>
            <p class="btn_wrap ">
                <a href="javascript:void(0)" class="more" id="toggleMoreComment"></a>
            </p>
        </section>

        <section class="recommend" id="recommend">
            <h3 class="title">热门推荐</h3>

            <ul class="p_list_new clear_fix ">
                <c:forEach items="${productList}" var="product">
                    <li class="p_item_new "
                        data-id="${product.id}"
                        data-hideSpec=""
                        data-items='${product.name}||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://${pageContext.request.contextPath}/shop/goods-100801.html|1|100801|10801|1|1|0||100086|建议食用人数|2-4人食|198|198|13|13|4|450|5||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://${pageContext.request.contextPath}/shop/goods-100802.html|2|100802|10802|1|1|0||100036|建议食用人数|5-8人食|298|298|17|17|4|820|10||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://${pageContext.request.contextPath}/shop/goods-100803.html|3|100803|10803|1|1|0||100006|建议食用人数|10-12人食|458|458|22|22|4|1300|15||0|0|@@雪域牛乳芝士蛋糕||https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201212/10800/list_10800.jpg|http://${pageContext.request.contextPath}/shop/goods-100804.html|4|100804|10804|1|1|0||100036|建议食用人数|15-20人食|756|756|31|31|4|2600|20||0|0|'
                        data-goodsSweet="${product.sweet}"
                        data-goodsTasteTxt="${product.taste}"
                    >
                        <a href="<%=request.getContextPath()%>/shop/goods-${product.id}.html" target="_blank"
                           data-statistics="details_featured_first_img_1|点击商品图片跳转商品详情页_${product.name}"
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
                            <a href="<%=request.getContextPath()%>/shop/goods-${product.id}.html" target="_blank"
                               data-statistics="details_featured_first_title_1|点击商品名称跳转商品详情页_${product.name}"
                            >
                                <h3 class="no_wrap p_name">${product.name}</h3>
                            </a>
                            <div class="p_tag">
                                <p>
                                    <c:if test="${!empty product.tage}">
                                        <span class="tag">${product.tage}</span>
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
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </section>
    </div>
    <jsp:include page="../foot.jsp"/>
</article>



<script>
    document.write('<div style="display:none;">');
</script>
<div>
    <a href="http://${pageContext.request.contextPath}/SH/category-0-1.html?moment=&taste=,113&spec=">冰淇淋蛋糕</a>
    <a href="http://${pageContext.request.contextPath}/SH/category-0-1.html?moment=&taste=,114&spec=">奶油蛋糕</a>
    <a href="http://${pageContext.request.contextPath}/SH/category-0-1.html?moment=&taste=,103&spec=">巧克力蛋糕</a>
    <a href="http://${pageContext.request.contextPath}/SH/category-0-1.html?moment=&taste=,101&spec=">慕斯蛋糕</a>
    <a href="http://${pageContext.request.contextPath}/SH/category-0-1.html?moment=&taste=,102&spec=">拿破仑蛋糕</a>
    <a href="http://${pageContext.request.contextPath}/SH/category-0-1.html?moment=&taste=,104&spec=">芝士蛋糕</a>
    <a href="http://${pageContext.request.contextPath}/SH/category-0-1.html?moment=&taste=,112&spec=">鲜果蛋糕</a>
</div>
<script>
    document.write('</div>');
</script>
<script src="${pageContext.request.contextPath}/static/js/sitelist.js"></script>
<script src="${pageContext.request.contextPath}/static/js/widget.js"></script>
<script src="${pageContext.request.contextPath}/static/js/base.js"></script>
<script src="${pageContext.request.contextPath}/static/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/goodsdetail.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.lazyload.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/commonlistnew.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig = {
    stat_host: "${pageContext.request.contextPath}",
    click_id: "KyHkraVrfiHF"
};</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/mystat.js"></script>
<script src="${pageContext.request.contextPath}/static/js/statistics.js"></script>
<script src="${pageContext.request.contextPath}/static/js/rt.js"></script>
</body>
</html>

