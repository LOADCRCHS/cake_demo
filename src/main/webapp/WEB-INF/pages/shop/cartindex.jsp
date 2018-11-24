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
    <link href="<%=request.getContextPath()%>/static/css/swiper.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/cart.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/commonlist.css" rel="stylesheet"></head>
<body>
<div class="container main_cart">
    <jsp:include page="../head-login-nav.jsp"/>
    <div class="main" id="mainCart">
    <section class="login_status">
        <span>您还没有登录，登录后购物车的商品将保存到您的账号中！</span>
        <a href="/customer/login.html"
           data-statistics="carts_login|立即登录">立即登录</a>
    </section>
    <template>
        <section class="top main_width">
            <a href="/BJ/category-0-1.html"
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
                                <img :src="<%=request.getContextPath()%>/static/picture/37c37dcaeacc42f7a1338579c6c809b9.gif" :alt="item.goods_name">
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
                                <p class="p_price">小计：￥{{item.totalPrice|salePrice}}</p>
                                <div class="input_wrap">
                                    <a href="javascript:void(0)" class="down num_edit_btn"
                                       @click="updateCartNum(item.sku_id,-1)"></a>
                                    <input type="text" class="item_num"
                                           :value="item.amount"
                                           @change="changeNum(item.sku_id,item.amount,$event)"
                                           :readonly="item.notAdd"
                                    />
                                    <a href="javascript:void(0)" :class="['up','num_edit_btn',{disabled:item.notAdd}]"
                                       @click="!item.notAdd && updateCartNum(item.sku_id,1)"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>                <section class="amount">
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
        </section>            </template>
        <div class="no_content" v-else>
            <img src="<%=request.getContextPath()%>/static/picture/no_content.png">
            <p>您还没有选购商品，
                <a href="/BJ/category-0-1.html"
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
                                        <img :src="<%=request.getContextPath()%>/static/picture/item.goodsmainpic" :alt="item.goodsName">
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
                                        <img :src="<%=request.getContextPath()%>/static/picture/item.goodsmainpic" :alt="item.goodsName">
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
                                        <img :src="<%=request.getContextPath()%>/static/picture/item.pic" :alt="item.title">
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
                                <small>¥</small>158                    </p>
                            <p class="markup_price">
                                <i>￥</i>69                        </p>
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
                                <small>¥</small>256                    </p>
                            <p class="markup_price">
                                <i>￥</i>128                        </p>
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
                                <img src="<%=request.getContextPath()%>/static/picture/cakes/list_17633.jpg"/>
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
                                <small>¥</small>68                    </p>
                            <p class="markup_price">
                                <i>￥</i>38                        </p>
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
                                <small>¥</small>99                    </p>
                            <p class="markup_price">
                                <i>￥</i>89                        </p>
                        </div>
                        <a href="javascript:void(0)"

                           class="buy_btn normal"
                           data-statistics="_button_4|加入购物车_漫游计划随行杯（U1-URBAN1）"
                        >
                            <span>加入购物车&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </a>
                    </div>
                </li>
            </ul>        <div class="link_wrap">
            <a href="/BJ/category-10-1.html">更多加价礼品&nbsp;&gt;</a>
        </div>
        </div>
    </section>            </div>
    <jsp:include page="../foot.jsp"/>
</div>
<script>
    //购物车数据
    var cartData ={"count":0,"type":1,"owner":"KyHkSLdtBVKr","buy_list":[],"other_site":[],"unavailable":[],"totalPrice":0,"discountsPrice":0,"birthDayCardList":[{"itemID":249,"itemName":"\u751f\u65e5\u5feb\u4e50"},{"itemID":368,"itemName":"Happy Birthday"}]};
    //配件
    var accessories = [{"createTimeStr":"2017-11-30 14:08:44","createTime":1512022124000,"timeStamp":1536552007000,"sortOrder":88000,"uid":"105764","goodsName":"\u8bb8\u613f\u6811\u8721\u70db","goodsEnglishName":"","postId":105763,"listPostId":105763,"goodsId":15826,"marketPrice":39,"salePrice":39,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201711\/15826\/list_15826.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201711\/15826\/list_15826.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":"","middleCategoryId":106,"day10SalesCount":98,"salesCount":331,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201711\/15826\/display_15826_57294.jpg","bitMap":4096,"goodsSaleCount":0,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http://www.lecake.com\/postsystem\/docroot\/images\/goods\/5BD0ADBCD5EB144CF135B7400CA659D0.jpg\" alt=\"\" \/><\/div>\r\n<p class="goods_intro">\u6e29\u99a8\u63d0\u793a\uff1a\u672c\u54c1\u5185\u542b\u5c16\u9510\u90e8\u4ef6\uff0c\u4f7f\u7528\u65f6\u8868\u9762\u9ad8\u6e29\uff0c\u51b7\u5374\u524d\u8bf7\u52ff\u89e6\u78b0\u4ee5\u514d\u70eb\u4f24\uff0c\u8bf7\u52ff\u8ba9\u513f\u7ae5\u5355\u72ec\u64cd\u4f5c\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4e2a","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-105764.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u8bb8\u613f\u6811\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-105764.html","specId":5,"postId":105764,"goodsId":15827,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100249,"specTips":"\u89c4\u683c","displaySpec":"1\u4e2a","salePrice":39,"marketPrice":39,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:24:52","createTime":1356510292000,"timeStamp":1526895169000,"sortOrder":70015,"uid":"100839","goodsName":"\u9910\u5177(5\u5957\u4e00\u7ec4)","goodsEnglishName":"","postId":100838,"listPostId":100838,"goodsId":10838,"marketPrice":2.5,"salePrice":2.5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10838\/list_10838.jpg?v=1523527944","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10838\/list_10838.jpg?v=1523527944","goodsMoment":0,"inList":2,"promotionInfo":"","middleCategoryId":106,"day10SalesCount":4250,"salesCount":15055,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10838\/display_10838_17652.jpg","bitMap":4096,"goodsSaleCount":0,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/E45BE98048F9AF09466402D5C1A56E82.jpg\" alt=\"\" \/><\/div>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100839.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u9910\u5177(5\u5957\u4e00\u7ec4)","titleEn":"","pic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10838\/list_10838.jpg","link":"http:\/\/www.lecake.com\/shop\/goods-100839.html","specId":5,"postId":100839,"goodsId":10839,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":101560,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":2.5,"marketPrice":2.5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2013-10-17 09:28:17","createTime":1381973297000,"timeStamp":1526894447000,"sortOrder":70014,"uid":"102217","goodsName":"\u91d1\u8272\u8721\u70db","goodsEnglishName":"","postId":102216,"listPostId":102216,"goodsId":12278,"marketPrice":10,"salePrice":10,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201310\/12278\/list_12278.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201310\/12278\/list_12278.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":1446,"salesCount":4371,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201310\/12278\/display_12278_46782.jpg","bitMap":4096,"goodsSaleCount":0,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/6C90DC0C22E957E4EC8B51D977085CA3.jpg\" alt=\"\" \/><\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-102217.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u91d1\u8272\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-102217.html","specId":5,"postId":102217,"goodsId":12279,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100357,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":10,"marketPrice":10,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:34:57","createTime":1356510897000,"timeStamp":1526894502000,"sortOrder":70013,"uid":"100845","goodsName":"Happy Birthday\u8721\u70db","goodsEnglishName":"","postId":100844,"listPostId":100844,"goodsId":10844,"marketPrice":15,"salePrice":15,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10844\/list_10844.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10844\/list_10844.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":"","middleCategoryId":106,"day10SalesCount":1008,"salesCount":3318,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10844\/display_10844_87480.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/4685971CF6B937C245AADA3D3F4BDF1F.jpg\" alt=\"\" \/><\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100845.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"Happy Birthday\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100845.html","specId":5,"postId":100845,"goodsId":10845,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100418,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":15,"marketPrice":15,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2014-04-25 16:42:39","createTime":1398415359000,"timeStamp":1526894530000,"sortOrder":70012,"uid":"102602","goodsName":"I LOVE MAMA \u8721\u70db","goodsEnglishName":"","postId":102601,"listPostId":102601,"goodsId":12663,"marketPrice":15,"salePrice":15,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201404\/12663\/list_12663.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201404\/12663\/list_12663.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":"","middleCategoryId":106,"day10SalesCount":202,"salesCount":535,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201404\/12663\/display_12663_34452.jpg","bitMap":12288,"goodsSaleCount":0,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/F836CB0ADBCDB9786904F38115A1818A.jpg\" alt=\"\" \/><\/div>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-102602.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"I LOVE MAMA \u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-102602.html","specId":5,"postId":102602,"goodsId":12664,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100065,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":15,"marketPrice":15,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:33:28","createTime":1356510808000,"timeStamp":1526894662000,"sortOrder":70011,"uid":"100842","goodsName":"I LOVE PAPA \u8721\u70db","goodsEnglishName":"","postId":100841,"listPostId":100841,"goodsId":10841,"marketPrice":15,"salePrice":15,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10841\/list_10841.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10841\/list_10841.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":"","middleCategoryId":106,"day10SalesCount":116,"salesCount":417,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10841\/display_10841_58855.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/243976A68F16C5E3E264CC97693C7E89.jpg\" alt=\"\" \/><\/div>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100842.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"I LOVE PAPA \u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100842.html","specId":5,"postId":100842,"goodsId":10842,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100050,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":15,"marketPrice":15,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:37:23","createTime":1356511043000,"timeStamp":1526894721000,"sortOrder":70010,"uid":"100848","goodsName":"\u5fc3\u5f62\u8721\u70db","goodsEnglishName":"","postId":100847,"listPostId":100847,"goodsId":10847,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10847\/list_10847.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10847\/list_10847.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":"","middleCategoryId":106,"day10SalesCount":1354,"salesCount":4041,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10847\/display_10847_2463.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/F763AD1F630A677E55DF819FEE3B7CD0.jpg\" alt=\"\" \/><\/div>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100848.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u5fc3\u5f62\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100848.html","specId":5,"postId":100848,"goodsId":10848,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100546,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:57:44","createTime":1356512264000,"timeStamp":1526894797000,"sortOrder":70009,"uid":"100884","goodsName":"\u6570\u5b579\u8721\u70db","goodsEnglishName":"","postId":100883,"listPostId":100883,"goodsId":10883,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10883\/list_10883.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10883\/list_10883.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":172,"salesCount":664,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10883\/display_10883_69729.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/F4DB1B4DEB4799A653C72AE7E2841E6F.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100884.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b579\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100884.html","specId":5,"postId":100884,"goodsId":10884,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100135,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:56:09","createTime":1356512169000,"timeStamp":1526894835000,"sortOrder":70008,"uid":"100881","goodsName":"\u6570\u5b578\u8721\u70db","goodsEnglishName":"","postId":100880,"listPostId":100880,"goodsId":10880,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10880\/list_10880.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10880\/list_10880.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":530,"salesCount":1733,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10880\/display_10880_68783.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/08E9D181582FA5294672C5B0514B5BED.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100881.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b578\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100881.html","specId":5,"postId":100881,"goodsId":10881,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100227,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:54:19","createTime":1356512059000,"timeStamp":1526894869000,"sortOrder":70007,"uid":"100878","goodsName":"\u6570\u5b577\u8721\u70db","goodsEnglishName":"","postId":100877,"listPostId":100877,"goodsId":10877,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10877\/list_10877.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10877\/list_10877.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":251,"salesCount":936,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10877\/display_10877_54462.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/6E9374B05B7B7311C3B87DD647EF2D13.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100878.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b577\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100878.html","specId":5,"postId":100878,"goodsId":10878,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100101,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:52:59","createTime":1356511979000,"timeStamp":1526894893000,"sortOrder":70006,"uid":"100875","goodsName":"\u6570\u5b576\u8721\u70db","goodsEnglishName":"","postId":100874,"listPostId":100874,"goodsId":10874,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10874\/list_10874.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10874\/list_10874.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":398,"salesCount":1558,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10874\/display_10874_21903.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/65D5AABA18268A73312515F496D6990A.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100875.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b576\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100875.html","specId":5,"postId":100875,"goodsId":10875,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100172,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:51:00","createTime":1356511860000,"timeStamp":1526894936000,"sortOrder":70005,"uid":"100872","goodsName":"\u6570\u5b575\u8721\u70db","goodsEnglishName":"","postId":100871,"listPostId":100871,"goodsId":10871,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10871\/list_10871.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10871\/list_10871.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":343,"salesCount":1144,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10871\/display_10871_14188.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/0E07EC8D4D3CFBF728C3A36CE88F236B.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100872.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b575\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100872.html","specId":5,"postId":100872,"goodsId":10872,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100173,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:49:22","createTime":1356511762000,"timeStamp":1526894966000,"sortOrder":70004,"uid":"100869","goodsName":"\u6570\u5b574\u8721\u70db","goodsEnglishName":"","postId":100868,"listPostId":100868,"goodsId":10868,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10868\/list_10868.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10868\/list_10868.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":300,"salesCount":1111,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10868\/display_10868_56322.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/D14A8B2A34EE55C56FB9F59DF725F293.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100869.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b574\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100869.html","specId":5,"postId":100869,"goodsId":10869,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100138,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:47:32","createTime":1356511652000,"timeStamp":1526894998000,"sortOrder":70003,"uid":"100866","goodsName":"\u6570\u5b573\u8721\u70db","goodsEnglishName":"","postId":100865,"listPostId":100865,"goodsId":10865,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10865\/list_10865.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10865\/list_10865.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":500,"salesCount":1850,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10865\/display_10865_59219.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/F218A3D175BFB6F65DBF2445B2494FF4.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100866.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b573\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100866.html","specId":5,"postId":100866,"goodsId":10866,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100180,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:44:39","createTime":1356511479000,"timeStamp":1526895047000,"sortOrder":70002,"uid":"100857","goodsName":"\u6570\u5b572\u8721\u70db","goodsEnglishName":"","postId":100856,"listPostId":100856,"goodsId":10856,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10856\/list_10856.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10856\/list_10856.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":532,"salesCount":1845,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10856\/display_10856_34254.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/A809BC29A3F3E767FC7274BDD79D19CB.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100857.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b572\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100857.html","specId":5,"postId":100857,"goodsId":10857,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100235,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:42:02","createTime":1356511322000,"timeStamp":1526895078000,"sortOrder":70001,"uid":"100854","goodsName":"\u6570\u5b571\u8721\u70db","goodsEnglishName":"","postId":100853,"listPostId":100853,"goodsId":10853,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10853\/list_10853.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10853\/list_10853.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":819,"salesCount":2808,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10853\/display_10853_21324.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/0AEFD15EB057F935E61A59EF4CD16866.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100854.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b571\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100854.html","specId":5,"postId":100854,"goodsId":10854,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100338,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0},{"createTimeStr":"2012-12-26 16:40:17","createTime":1356511217000,"timeStamp":1526895111000,"sortOrder":70000,"uid":"100851","goodsName":"\u6570\u5b570\u8721\u70db","goodsEnglishName":"","postId":100850,"listPostId":100850,"goodsId":10850,"marketPrice":5,"salePrice":5,"addPoints":0,"goodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10850\/list_10850.jpg?v=1522743650","listGoodsMainPic":"https:\/\/imagecdn.lapetit.cn\/postsystem\/docroot\/images\/goods\/201212\/10850\/list_10850.jpg?v=1522743650","goodsMoment":0,"inList":2,"promotionInfo":null,"middleCategoryId":106,"day10SalesCount":416,"salesCount":1489,"midCategoryName":"\u86cb\u7cd5\u914d\u4ef6","pictureLink":"201212\/10850\/display_10850_27120.jpg","bitMap":12288,"goodsSaleCount":null,"preferentialPrice":null,"isPreferential":0,"isNumberCake":0,"isConstellation":null,"isMainProduct":0,"h5description":"<div class=\"desc_col\">\r\n<h2>\u627e\u5bfb\u5fc3\u4e2d\u7684\u7f8e\u597d<\/h2>\r\n<div class=\"imgDesc_wrap\"><img src=<%=request.getContextPath()%>/static/picture/04ef4412129c49a3a5ccf685c361f0f1.gif"http:\/\/www.lecake.com\/postsystem\/docroot\/images\/goods\/54C4DE3892AD90D6C074D8F3BBB493A5.jpg\" alt=\"\" \/><\/div>\r\n<p class=\"goods_intro\">\u6e29\u99a8\u63d0\u793a\uff1a\u4e00\u6b3e\u8721\u70db\u5305\u542b\u591a\u79cd\u989c\u8272\uff0c\u968f\u673a\u53d1\u8d27\uff0c\u8bf7\u4ee5\u5b9e\u7269\u4e3a\u51c6\u3002<\/p>\r\n<\/div>","preferentialNum":null,"preferentialLabel":null,"preferentialPriceRed":null,"tasteTxt":null,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","specId":5,"url":"http:\/\/www.lecake.com\/shop\/goods-100851.html","music":0,"passCardPrice":0,"tasteExt":null,"tasteExtId":null,"sweet":null,"marks":null,"series":null,"seriesId":null,"additionalIds":null,"productSpecs":[{"title":"\u6570\u5b570\u8721\u70db","titleEn":"","pic":"","link":"http:\/\/www.lecake.com\/shop\/goods-100851.html","specId":5,"postId":100851,"goodsId":10851,"useFlg":1,"buyFlg":1,"isHide":0,"sendEndDate":null,"enableSaleAmount":100173,"specTips":"\u89c4\u683c","displaySpec":"1\u4efd","salePrice":5,"marketPrice":5,"length":0,"width":0,"height":0,"weight":0,"dinnerware":0,"specialDinnerware":null,"passCardPrice":0,"isPreferential":0,"preferentialPrice":null}],"mobileGoods":null,"thirdPartyDelivery":0}];
        //购物车对象
        var cartObj = {};
        //周周配商品列表
        var weeklyGoods =null;
        //牛奶
        var milkGoods =[107544,103734,104165];
        //仅可单独购买的周周配商品列表
        var weeklyAloneSku =[106883,106880,106876,107032,107039,106981,106994,107006,107045,107003,107013,107165,107220,107171,107173,107187,1];
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
<script src="<%=request.getContextPath()%>/static/js/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/cart.js"></script>
<script src="<%=request.getContextPath()%>/static/js/jquery.lazyload.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/commonlistnew.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHkSLdtBVKr"};</script>
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


