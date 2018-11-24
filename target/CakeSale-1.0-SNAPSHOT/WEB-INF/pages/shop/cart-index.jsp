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
            'baseUrl': '<%=request.getContextPath()%>/',
            '<%=request.getContextPath()%>/staticUrl': '//newimgcdn.lapetit.cn/web/',
            'cookieDomain': '.lecake.com',
            'imageRoot': '<%=request.getContextPath()%>/static/images/commentsgoods',
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
    <link href="<%=request.getContextPath()%>/static/css/swiper.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/cart.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/commonlist.css" rel="stylesheet"></head>
<body>
<div class="container main_cart">
    <jsp:include page="../head-login-nav.jsp"/>
    <div class="main" id="mainCart">
        <template>
            <section class="top main_width">
                <a href="/category-0-1.html"
                   class="back_btn" v-if="itemCount>0">继续购物</a>
                <h1>您的购物车<span>（<b class="total_count">{{itemCount}}</b>）</span></h1>
            </section>
            <template v-if="itemCount > 0">
                <section class="goods_list">
                    <div class="goods_item" v-for="item of goodsList" :key="item.sku_id">
                        <p class="promotion no_wrap" v-for="tip of item.cartPromotionList" v-if="item.cartPromotionList">
                            <span>促销</span>
                            <b>{{tip.brief}}</b>
                        </p>
                        <div class="item_message clear_fix">
                            <a href="javascript:void(0)" class="check_status" :class="{active:item.checked}"
                               @click="toggleItem(item.sku_id)"></a>
                            <div class="img_wrap f_left">
                                <a :href="'/shop/goods-'+item.sku_id+'.html'" target="_blank">
                                    <img :src="item.main_pic|mainPic" :alt="item.goods_name">
                                </a>
                            </div>
                            <div class="p_info f_left">
                                <div class="p_detail f_left">
                                    <h2 class="no_wrap">
                                        <a :href="'/shop/goods-'+item.sku_id+'.html'" target="_blank">{{item.goods_name}}</a>
                                    </h2>
                                    <h3 class="no_wrap hide">{{item.english_name}}</h3>
                                    <h4>{{item.display_spec}}</h4>
                                    <div class="price_wrap">
                                        <p class="new_price">
                                            <small>单价：￥</small>
                                            {{item.sale_price}}
                                        </p>
                                        <!--心享价-->
                                        <p class="pass_card_price" v-if="item.passcard_price">
                                            <small>￥</small>
                                            {{item.passcard_price}}
                                        </p>
                                        <p class="old_price"
                                           v-if="item.sale_price !== item.market_price && !item.need_points>0 && !item.passcard_price && !item.preferentialPrice>0">
                                            <small>￥</small>
                                            {{item.market_price}}
                                        </p>
                                        <p class="markup_price" v-if="item.preferentialPrice>0 && !item.passcard_price>0">
                                            <small>￥</small>
                                            <strong>{{item.preferentialPrice|salePrice}}</strong>
                                        </p>
                                        <p v-if="item.need_points>0">&nbsp;&nbsp;积分价格 {{item.need_points}}</p>
                                    </div>
                                    <div class="third_logistics" v-if="item.thirdPartyDelivery==1">
                                        <span class="text">诺心自营商品送达后5-7个工作日内，本商品由第三方物流单独送达</span>
                                    </div>

                                    <div class="upgrade_price"
                                         :class="{active:item.use_bargain_id>0}"
                                         v-if="item.upgradePriceInfo.id"
                                         @click="toggleUpgradePrice(item.sku_id,item.upgradePriceInfo.id)">
                                        加{{item.upgradePriceInfo.amount}}元即可升级至{{item.upgradePriceInfo.tips}}
                                    </div>

                                    <p class="cut"
                                       :class="{active:item.attributes && item.attributes.goods_cut>0 || item.goodscut_flag===2}"
                                       v-if="item.goodscut_flag"
                                       @click="item.goodscut_flag === 1 && cut(item.sku_id,item.goodscut_num)">
                                        <i class="cut_btn"></i>
                                        切分{{item.goodscut_num}}份
                                    </p>

                                    <div class="birthday_card" v-if="item.birthday_flag"
                                         @mouseleave="toggleBirthdayCard(item.sku_id,false)">
                                        <span class="card_text no_wrap"
                                              :class="{gray:!(item.attributes && item.attributes.goods_birthday)}"
                                              data-statistics="carts_segmentation|生日牌"
                                              @click="toggleBirthdayCard(item.sku_id,true)">{{(item.attributes && item.attributes.goods_birthday) || '填写生日祝福'}}</span>
                                        <div class="birthday_list" v-show="item.isShowBirthdayCard">
                                            <span :class="{birthday_item:true,active:!(item.attributes && item.attributes.goods_birthday)}"
                                                  @click="setBirthdayWords(item.sku_id,'')">不需要</span>
                                            <span v-for="birthdayItem of birthdayList"
                                                  :class="{birthday_item:true,active:(item.attributes && item.attributes.goods_birthday)===birthdayItem.itemName}"
                                                  @click="setBirthdayWords(item.sku_id,birthdayItem.itemName)">{{birthdayItem.itemName}}</span>

                                            <p class="input_wrap clear_fix">
                                                <input type="text" maxlength="30" placeholder="自定义"
                                                       class="customer_input">
                                                <a href="javascript:void(0)" class="btn"
                                                   @click="setBirthdayWords(item.sku_id,'',$event)">确定</a>
                                            </p>
                                            <b class="text">(最多14个汉字或28个字母)</b>
                                        </div>
                                    </div>
                                </div>
                                <div class="p_edit f_right">
                                    <p class="p_price">小计：￥{{item.totalPrice}}</p>
                                    <div class="input_wrap">
                                        <a href="javascript:void(0)" class="down num_edit_btn"
                                           @click="updateCartNum(item.sku_id,item.amount-1)"></a>
                                        <input type="text" class="item_num"
                                               :value="item.amount"
                                               @change="changeNum(item.sku_id,item.amount,$event)"
                                               :readonly="item.notAdd"
                                        />
                                        <a href="javascript:void(0)" :class="['up','num_edit_btn',{disabled:item.notAdd}]"
                                           @click="!item.notAdd && updateCartNum(item.sku_id,item.amount+1)"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="amount">
                <div class="wrap">
                    <div class="mini_width clear_fix">
                        <a href="javascript:void(0)" class="check_status" :class="{active:isCheckAll}"
                           @click="toggleAll">全选</a>
                        <a href="javascript:void(0)" class="f_left delete_btn" @click="deleteAll">删除</a>
                        <p class="f_left total_count">
                            共<b>{{itemCount}}</b>件商品，已选择<b>{{selectedItemCount}}</b>件
                        </p>
                        <div class="f_right total_amount_wrap">
                            <div class="inner">
                                <p>
                                    <span>应付(不含运费)：</span>￥<strong>{{totalPrice|salePrice}}</strong>
                                </p>
                                <p v-if="discountsPrice>0 && false">
                                    <span>优惠：</span>￥<strong>{{discountsPrice|salePrice}}</strong>
                                </p>
                            </div>
                        </div>
                        <button class="order_btn" @click="submit(0)" :disabled="fetching">结算</button>
                    </div>
                </div>
            </section>
            </template>
            <div class="no_content" v-else>
                <img src="//newimgcdn.lapetit.cn/web/images/cart/no_content.png">
                <p>您还没有选购商品，
                    <a href="/category-0-1.html"
                       data-statistics="carts_stroll|去逛逛">去逛逛!</a>
                </p>
            </div>
            <h3 style="color: red;text-align: center;padding: 20px 0;" class="buy_notice hide">
                4月累计在线现金支付满298元(不含运费)并在当月完成配送，可获得礼品馆商品抵用券1张(该券于2018.5.8前发放)，可兑换98元米菲曲奇等部分商品(每个账户仅限1张)。
            </h3>
            <!-- 精品配件-->
            <section class="accessories" v-if="accessories.length>0">
                <div class="wrap">
                    <h2>精品配件</h2>
                    <div class="list_wrap">
                        <a href="javascript:void(0)" class="nav prev swiper-button-prev"></a>
                        <a href="javascript:void(0)" class="nav next swiper-button-next"></a>
                        <div class="accessories_list swiper-container">
                            <ul class="swiper-wrapper">
                                <li class="fitting_item swiper-slide" v-for="item of accessories">
                                    <div class="img_wrap">
                                        <a :href="'/shop/goods-'+item.uid+'.html'" target="_blank">
                                            <img :src="item.goodsMainPic" :alt="item.goodsName">
                                        </a>
                                    </div>
                                    <div class="p_info">
                                        <h3 class="no_wrap">{{item.goodsName}}</h3>
                                        <div class="price_wrap">
                                            <span class="p_price">￥{{item.salePrice}}</span>
                                            <a href="javascript:void(0)" class="add_cart"
                                               @click="updateCartNum(item.uid,1)">购买</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!--熊抱吐司加价购-->
            <section class="weekly_delivery" v-if="weeklyGoodsList.length>0">
                <div class="wrap main_width">
                    <div class="top">
                        <h2>熊抱吐司加价购</h2>
                        <h3>只可与蛋糕商品一起购买，享受优惠多多</h3>
                    </div>
                    <nav class="clear_fix">
                        <a href="javascript:void(0)"
                           :class="{f_left:true,active:isShowSingleWeeklyGoods===true}"
                           @click="isShowSingleWeeklyGoods=true">
                            <span>甄选独立装</span>
                        </a>
                        <a href="javascript:void(0)"
                           :class="{f_right:true,active:isShowSingleWeeklyGoods!==true}"
                           @click="isShowSingleWeeklyGoods=false">
                            <span>周周配套餐</span>
                        </a>
                    </nav>
                    <div class="single_list" v-if="isShowSingleWeeklyGoods===true">
                        <a href="javascript:void(0)" class="nav prev swiper-button-prev"></a>
                        <a href="javascript:void(0)" class="nav next swiper-button-next"></a>
                        <div class="accessories_list swiper-container">
                            <ul class="swiper-wrapper">
                                <li class="fitting_item swiper-slide" v-for="item of singleWeeklyGoodsList">
                                    <div class="img_wrap">
                                        <a :href="'/shop/goods-'+item.uid+'.html'" target="_blank">
                                            <img :src="item.goodsMainPic" :alt="item.goodsName">
                                        </a>
                                    </div>
                                    <div class="p_info">
                                        <h3 class="no_wrap">{{item.goodsName}}</h3>
                                        <div class="price_wrap">
                                            <span class="p_price">￥{{item.preferentialPrice||item.salePrice}}</span>
                                            <a href="javascript:void(0)" class="add_cart"
                                               @click="buyWeeklyGoods(item.uid)">购买</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <template v-else>
                        <div class="handler_wrap clear_fix">
                            <div class="f_left link_wrap">
                                <a href="javascript:void(0)"
                                   v-for="(item,idx) of notSingleWeeklyGoodsList"
                                   :class="{active:weeklyIndex===idx}"
                                   @click="weeklyIndex=idx">
                                    <span>{{item.goodsName}}</span>
                                </a>
                            </div>
                            <ul class="list_wrap clear_fix f_left">
                                <li class="fitting_item" v-for="item of currentWeeklyGoods.childSpecs">
                                    <div class="img_wrap">
                                        <a :href="'/shop/goods-'+currentWeeklyGoods.uid+'.html'" target="_blank">
                                            <img :src="item.pic" :alt="item.title">
                                        </a>
                                    </div>
                                    <div class="p_info">
                                        <h3>{{item.title}}</h3>
                                    </div>
                                </li>
                            </ul>
                            <div class="right_content">
                                <p>￥<strong>{{currentWeeklyGoods.preferentialPrice||currentWeeklyGoods.salePrice}}</strong></p>
                                <a href="javascript:void(0)" class="f_right add_cart" @click="buyWeeklyGoods(0)">加入购物车</a>
                            </div>
                        </div>
                        <div class="desc_wrap">
                            <h3>连续配送4周，周周有惊喜！</h3>
                            <h4>【周周配套餐】</h4>
                            <p>1.一周七天 任选一天配送 连续四周</p>
                            <p>2.每周为您提供美味的熊抱吐司</p>
                            <p>3.温馨提示：请至少提前1天确认配送时间，一经确认无法更改，以官网下单信息为准</p>
                        </div>
                    </template>
                </div>
            </section>

        </template>
        <section class="markup_list main_width" id="markupList">
            <div class="wrap main_width">
                <h2>加价礼品</h2>

                <ul class="p_list_new clear_fix ">
                    <li class="p_item_new "
                        data-id="107682"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-107682.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/17720/list_17720_o.jpg?v=1541147047"/>
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
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_1|加入购物车_飞利浦搅拌机"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                    <li class="p_item_new "
                        data-id="107689"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-107689.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/17726/list_17726.jpg"/>
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-107689.html" target="_blank"
                            >
                                <h3 class="no_wrap p_name">飞利浦咖啡机</h3>
                            </a>
                            <div class="p_tag">
                                <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>239                    </p>
                                <p class="markup_price">
                                    <i>￥</i>219                        </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_2|加入购物车_飞利浦咖啡机"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                    <li class="p_item_new "
                        data-id="107972"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-107972.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/18021/list_18021_o.jpg?v=1541146902"/>
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-107972.html" target="_blank"
                            >
                                <h3 class="no_wrap p_name">飞利浦多士炉</h3>
                            </a>
                            <div class="p_tag">
                                <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>499                    </p>
                                <p class="markup_price">
                                    <i>￥</i>389                        </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_3|加入购物车_飞利浦多士炉"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                    <li class="p_item_new "
                        data-id="107830"
                        data-hideSpec=""
                        data-items=''
                        data-goodsSweet=""
                        data-goodsTasteTxt="特殊商品"
                    >
                        <a href="/shop/goods-107830.html" target="_blank"
                        >
                            <div class="img_wrap">
                                <div class="div_img">
                                    <img src="https://imagecdn.lapetit.cn/postsystem/docroot/images/goods/201809/17888/list_17888.jpg?v=1541143954"/>
                                </div>
                            </div>
                        </a>
                        <div class="p_info">
                            <a href="/shop/goods-107830.html" target="_blank"
                            >
                                <h3 class="no_wrap p_name">飞利浦电动剃须刀PQ190</h3>
                            </a>
                            <div class="p_tag">
                                <p class="third_logistics">
                                    <b class="text">第三方物流</b>
                                </p>
                            </div>
                            <div class="price_wrap">
                                <p class="new_price">
                                    <small>¥</small>119                    </p>
                                <p class="markup_price">
                                    <i>￥</i>99                        </p>
                            </div>
                            <a href="javascript:void(0)"

                               class="buy_btn normal"
                               data-statistics="_button_4|加入购物车_飞利浦电动剃须刀PQ190"
                            >
                                <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </a>
                        </div>
                    </li>
                </ul>        <div class="link_wrap">
                <a href="/category-10-1.html">更多加价礼品&nbsp;&gt;</a>
            </div>
            </div>
        </section>
    </div>
    <jsp:include page="../foot.jsp"/>
</div>

<script>
// var cartData={
//     "count": 20,
//     "type": 2,
//     "owner": "7531703",
//     "buy_list": [{
//         "amount": 1,
//         "checked": 1,
//         "use_bargain_id": null,
//         "attributes": null,
//         "sku_id": 100839,
//         "spec": "1份",
//         "display_spec": "1份",
//         "market_price": 2.5,
//         "sale_price": 2.5,
//         "need_points": 0,
//         "goodscut_flag": 0,
//         "goodscut_num": null,
//         "standard_fitting": {
//             "cp": 0,
//             "lz": 0,
//             "dc": 0
//         },
//         "goods_name": "餐具(5套一组)",
//         "english_name": "",
//         "goods_type": 2,
//         "main_pic": "201212\/10838\/list_10838.jpg?v=1523527944",
//         "loukou_pic": "DD0113331BDBF2ADDA6AE73778D6DBE9.jpg",
//         "birthday_flag": 0,
//         "has_passcard": 0,
//         "passcard_price": null,
//         "alone": false,
//         "preferentialPrice": null,
//         "cartSkuPromotionList": null,
//         "discountsPromotionPrice": 0,
//         "totalPrice": 2.5,
//         "preferentialNum": 0,
//         "thirdPartyDelivery": 0,
//         "preferential": false
//     }],
//     "other_site": [],
//     "unavailable": [],
//     "totalPrice": 4206.5,
//     "discountsPrice": 346.5,
//     "birthDayCardList": [{
//         "itemID": 249,
//         "itemName": "生日快乐"
//     }, {
//         "itemID": 368,
//         "itemName": "Happy Birthday"
//     }]
// }
var cartData=JSON.parse('${shopCar}')
    //配件
    var accessories=[{
        "createTimeStr": "2017-11-30 14:08:44",
        "createTime": 1512022124000,
        "timeStamp": 1536552007000,
        "sortOrder": 88000,
        "uid": "105764",
        "goodsName": "许愿树蜡烛",
        "goodsEnglishName": "",
        "postId": 105763,
        "listPostId": 105763,
        "goodsId": 15826,
        "marketPrice": 39,
        "salePrice": 39,
        "addPoints": 0,
        "goodsMainPic": "https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201711\/15826\/list_15826.jpg?v=1522743650",
        "listGoodsMainPic": "https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201711\/15826\/list_15826.jpg?v=1522743650",
        "goodsMoment": 0,
        "inList": 2,
        "promotionInfo": "",
        "middleCategoryId": 106,
        "day10SalesCount": 104,
        "salesCount": 331,
        "midCategoryName": "蛋糕配件",
        "pictureLink": "201711\/15826\/display_15826_57294.jpg",
        "bitMap": 4096,
        "goodsSaleCount": 0,
        "preferentialPrice": null,
        "isPreferential": 0,
        "isNumberCake": 0,
        "isConstellation": null,
        "isMainProduct": 0,
        "h5description": "<div class=\"desc_col\">\r\n<h2>找寻心中的美好<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=\"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/5BD0ADBCD5EB144CF135B7400CA659D0.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">温馨提示：本品内含尖锐部件，使用时表面高温，冷却前请勿触碰以免烫伤，请勿让儿童单独操作。<\/p>\r\n<\/div>",
        "preferentialNum": null,
        "preferentialLabel": null,
        "preferentialPriceRed": null,
        "tasteTxt": null,
        "specTips": "规格",
        "displaySpec": "1个",
        "specId": 5,
        "url": "http:\/\/www.lecake.com\/shop\/goods-105764.html",
        "music": 0,
        "passCardPrice": 0,
        "tasteExt": null,
        "tasteExtId": null,
        "sweet": null,
        "marks": null,
        "series": null,
        "seriesId": null,
        "additionalIds": null,
        "productSpecs": [{
            "title": "许愿树蜡烛",
            "titleEn": "",
            "pic": "",
            "link": "http:\/\/www.lecake.com\/shop\/goods-105764.html",
            "specId": 5,
            "postId": 105764,
            "goodsId": 15827,
            "useFlg": 1,
            "buyFlg": 1,
            "isHide": 0,
            "sendEndDate": null,
            "enableSaleAmount": 100258,
            "specTips": "规格",
            "displaySpec": "1个",
            "salePrice": 39,
            "marketPrice": 39,
            "length": 0,
            "width": 0,
            "height": 0,
            "weight": 0,
            "dinnerware": 0,
            "specialDinnerware": null,
            "passCardPrice": 0,
            "isPreferential": 0,
            "preferentialPrice": null
        }],
        "mobileGoods": null,
        "thirdPartyDelivery": 0
    }];
    //购物车对象
    var cartObj = {};
    //周周配商品列表
    var weeklyGoods =null;
    //牛奶
    var milkGoods =[107544,103734,104165];
    //仅可单独购买的周周配商品列表
    var weeklyAloneSku =[106883,106880,106876,107032,107039,106981,106994,107006,107045,107003,107013,107165,107220,107171,107173,107187,1];
</script>
<script>
    document.write('<div style="display:none;">');
</script>
<script>
    document.write('<div style="display:none;">');
</script>

<script>
    document.write('</div>');
</script><script src="<%=request.getContextPath()%>/static/js/sitelist.js"></script>
<script src="<%=request.getContextPath()%>/static/js/widget.js"></script>
<script src="<%=request.getContextPath()%>/static/js/base.js"></script>
<script src="<%=request.getContextPath()%>/static/js/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/cart.js"></script>
<script src="<%=request.getContextPath()%>/static/js/jquery.lazyload.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/commonlistnew.js"></script>

<script src="<%=request.getContextPath()%>/static/js/statistics.js"></script>

<script src="<%=request.getContextPath()%>/static/js/rt.js"></script>
</body>
</html>


