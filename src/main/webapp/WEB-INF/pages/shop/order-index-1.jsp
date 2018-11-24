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
            'baseUrl': 'https://www.lecake.com/',
            'staticUrl': '//newimgcdn.lapetit.cn/web/',
            'cookieDomain': '.lecake.com',
            'imageRoot': '//imagecdn.lapetit.cn/postsystem/docroot/images',
            'staticVersions': '2018111002',
            'site_env': 'prod'
        };
        var isLecakeCNDomain = false;
        //用户id
        var customerId = '7531703';
        //用户信息
        var customerInfo = {"rankID":"1","rankName":"LEV1","pcustID":"7531703","custID":"18975261877","mobile":"18975261877","email":"","guest":1,"isNew":0,"privilege":{"has_discount88":false,"has_pass_card":false,"has_visa_discount83":false,"bit_map":0},"balance":{"cashback":0},"order":{"finish_count":0}};
        //某些商品特殊餐具数量
        var globalSpecialDinnerware = {"105819":"\u542b2\u628a\u9910\u53c9","105822":"\u542b2\u628a\u9910\u53c9","105909":"\u542b2\u628a\u9910\u53c9","105978":"\u542b2\u628a\u9910\u53c9","106041":"\u5404\u542b2\u628a\u9910\u52fa","106032":"\u542b2\u628a\u9910\u52fa","106038":"\u542b2\u628a\u9910\u52fa","106031":"\u542b2\u628a\u9910\u52fa","106035":"\u542b2\u628a\u9910\u52fa","106071":"\u542b2\u628a\u9910\u52fa","106068":"\u542b2\u628a\u9910\u52fa","107135":"\u542b1\u628a\u9910\u53c9"};
    </script>

    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/vue.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/order.css" rel="stylesheet">
</head>
<body>
<article class="container main_order">
    <jsp:include page="../head-login-nav.jsp"/>
    <div class="main" id="mainOrder">

        <template>
            <%--<!--优惠价格提示-->
            <transition name="promotion_price_tips">
                <section class="promotion_price_tips" v-show="isShowPromotionPriceTips">
                    <div class="text bottom_shadow">选择收货地址及配送时间后，将为您显示最终的优惠价格</div>
                </section>
            </transition>
            <!--周周配-->
            <div class="area_wrap group_buy_warp main_width" v-if="isGroupBuy">
                <!--提示-->
                <section class="weekly_tips">
                    <h2 class="clear_fix">
                        <strong>信息填写</strong>
                        <strong class="sp">&nbsp;</strong>
                        <strong>熊抱吐司加价购</strong>
                    </h2>
                </section>
                <!--地址-->
                <section class="address">
                    <h2>
                        <strong>熊抱吐司商品收货地址</strong>
                    </h2>
                    <div class="content">
                        <template v-if="groupBuyDeliverID">
                            <h3 class="clear_fix">
                                <label>收货人：</label>
                                <strong>{{groupBuyAddress.receiver_name}}</strong>
                            </h3>
                            <h3>
                                <label>联系方式：</label>
                                <strong>{{groupBuyAddress.mobile||groupBuyAddress.phone}}</strong>
                            </h3>
                            <h3>
                                <label>收货地址：</label>
                                <strong>
                                    {{groupBuyAddress.province}} {{groupBuyAddress.city}} {{groupBuyAddress.county}}
                                    {{groupBuyAddress.address}}{{groupBuyAddress.room_no}}
                                </strong>
                                <a href="javascript:void(0)"
                                   @click="isGroupBuyAddress=true;editAddress(groupBuyAddress.deliver_id)"
                                   class="edit_btn">修改地址</a>
                            </h3>
                        </template>
                        <div class="btn_wrap">
                            <a href="javascript:void(0)"
                               @click="isShowAddressList=true;isGroupBuyAddress=true;" class="f_left"
                               v-if="groupBuyDeliverID || addressList">
                                <span>切换地址</span>
                            </a>
                            <a href="javascript:void(0)" @click="isGroupBuyAddress=true;editAddress(0)" class="f_right">
                                <span>添加地址</span>
                            </a>
                        </div>
                    </div>
                </section>

                <div id="groupBuyAddressTips" class="orange" v-if="isShowGroupBuyAddressTips"
                     style="overflow: hidden;margin-top: 8px;">
                    亲爱的上海用户：
                    2018年11月5日至11月10日，每天8:00-19:00，因进博会临时交通管制，上海市崧泽大道-蟠臻路-蟠中东路-蟠文路-徐民东路-蟠秀路-盈港东路-涞港路-崧泽大道合围区域（除盈港东路-涞港路外）上述路段蛋糕站点物流配送可能延迟。特此公告，敬请谅解。
                </div>
                <!--配送时间-->
                <section class="delivery_time">
                    <h2>
                        <strong>{{groupBuyDeliveryType===2?'全国物流发货日期':'配送时间'}}</strong>
                        <b class="orange" style="font-size: 12px;" v-if="groupBuyDeliveryType===2">第三方物流揽件后1-3天送达</b>
                        <span v-if="!groupBuyEditingTime.isEdit && groupBuyEditingTime.hasSet"
                              @click="groupBuyEditingTime.isEdit=true">[修改]</span>
                        <span v-if="groupBuyEditingTime.isEdit && groupBuyEditingTime.hasSet"
                              @click="groupBuyEditingTime.isEdit=false">[关闭]</span>
                    </h2>
                    <div class="content">
                        <div class="select_wrap clear_fix" v-show="groupBuyEditingTime.isEdit">
                            <p class="f_left delivery_date">
                                <label>{{groupBuyDeliveryDate||'请选择'}}</label>
                                <input type="text" id="groupBuyDeliveryDate" readonly>
                            </p>
                            <p class="f_left start_time">
                                <label>{{groupBuyStartTime|parseTime}}</label>
                            </p>
                            <p class="f_left end_time">
                                <label>{{groupBuyEndTime|parseTime}}</label>
                            </p>
                            <button class="f_left" @click="changeTime(true)">确定</button>
                        </div>
                        <h3 class="time_show" v-show="!groupBuyEditingTime.isEdit">
                            {{groupBuyDeliveryDate}}
                            {{groupBuyStartTime|parseTime}}:00 - {{groupBuyEndTime|parseTime}}:00
                        </h3>
                    </div>
                </section>
                <!--配送类型-->
                <section class="delivery_type">
                    <h2>
                        <strong>诺心配送</strong>
                        <span class="gray">诺心自有物流配送</span>
                    </h2>
                </section>
                <!--商品列表-->
                <section class="p_list">
                    <h2>
                        <strong>商品信息</strong>
                    </h2>
                    <h3 class="clear_fix col_wrap col_head">
                        <template v-if="toastViewType===1">
                            <span class="col col_1 type_2">商品信息</span>
                            <span class="col col_2 type_2">商品金额</span>
                            <span class="col col_3 type_2">配送计划</span>
                        </template>
                        <template v-else>
                            <span class="col col_1">商品信息</span>
                            <span class="col col_2"></span>
                            <span class="col col_3">积分价格</span>
                            <span class="col col_4">单价</span>
                            <span class="col col_5">数量</span>
                            <span class="col col_6">金额</span>
                        </template>
                    </h3>
                    <ul>
                        <li class="p_item" v-for="item of goodsList" v-if="item.isGroupBuyGoods">
                            <div class="col_wrap">
                                <div class="col col_1 goods_info" :class="{type_2:toastViewType===1}">
                                    <a :href="'/shop/goods-'+item.sku_id+'.html'" target="_blank" class="div_img">
                                        <img :src="${pageContext.request.contextPath}/static/picture/886cd282604d4147a61e74de4f10f644.gif"
                                             :alt="item.goods_name">
                                    </a>
                                    <div class="goods_detail">
                                        <h3 class="no_wrap">{{item.goods_name}}<i v-if="item.isUp">免费加大</i></h3>
                                        <h4 class="no_wrap gray">{{item.display_spec}}</h4>
                                        <div class="third_logistics" v-if="item.thirdPartyDelivery==1">
                                            <span class="text">第三方物流</span>
                                        </div>
                                        <h5 v-if="item.goods_type===1" class="gray">
                                            <span>建议{{item.display_spec}}</span>
                                            <span v-if="item.goodscut_flag">{{item.attributes && item.attributes.goods_cut>0 || item.goodscut_flag===2?'切分'+item.goodscut_num+'份':'不切分'}}</span>
                                        </h5>
                                        <h4 class="gray"
                                            v-if="item.standard_fitting && item.standard_fitting.cp>0 && !item.specialDinnerware">
                                            每份含餐具{{item.standard_fitting.cp}}套</h4>
                                        <h4 class="gray" v-if="item.specialDinnerware">{{item.specialDinnerware}}</h4>
                                        <h4 v-if="item.upgradePriceInfo.bargain_id">
                                            加价{{item.upgrade_plus_price/item.amount}}元升级为{{item.upgrade_sku_spec}}</h4>
                                    </div>
                                </div>
                                <template v-if="toastViewType===1">
                                    <div class="col col_2 type_2">￥{{item.sale_price*item.amount|salePrice}}</div>
                                    <div class="col col_3 type_2 child_goods">
                                        <ul class="clear_fix" v-if="childGoods.length">
                                            <li v-for="item of childGoods" class="no_wrap">
                                                <span>{{item.time}}：</span>
                                                <strong>{{item.title}}</strong>
                                            </li>
                                        </ul>
                                        <p v-else>请先选择配送日期</p>
                                    </div>
                                </template>
                                <template v-else>
                                    <div class="col col_2 birthday_card">
                                    </div>
                                    <div class="col col_3">{{item.need_points}}</div>
                                    <div class="col col_4">￥{{item.sale_price|salePrice}}</div>
                                    <div class="col col_5">{{item.amount}}</div>
                                    <div class="col col_6 orange">
                                        <strong>￥{{item.sale_price*item.amount|salePrice}}</strong>
                                        <span class="upgrade_price_price" v-if="item.upgradePriceInfo.bargain_id">￥{{item.upgrade_plus_price|salePrice}}</span>
                                    </div>
                                </template>
                            </div>
                            <h6 v-if="item.orderEnjoyBargains && item.orderEnjoyBargains.length"
                                v-for="bargain of item.orderEnjoyBargains"
                                class="item_promotion no_wrap">
                                <span>[促销]</span> {{bargain.brief}}
                            </h6>
                        </li>
                    </ul>
                    <div class="promotion" v-if="isExchange && enjoyBargains && enjoyBargains.length">
                        <h3>促销信息</h3>
                        <p v-for="item of enjoyBargains">{{item.brief}}</p>
                    </div>
                </section>
            </div>
            <!--周周配-->
            <!--跳转按钮-->
            <section class="weekly_jump" id="weeklyJump" v-if="isGroupBuy">
                <a href="javascript:void(0);" @click="jumpToWeeklyArea">点击查看 熊抱吐司加价购配送信息</a>
            </section>
            <!--吐司单独购买-->
            <div class="area_wrap group_buy_warp main_width" v-if="isExchange" style="border: 0;">
                <!--地址-->
                <section class="address">
                    <h2>
                        <strong>{{activityType===5&&!isExchange?'蛋糕':''}}收货地址</strong>
                        <span @click="isShowAreaMap=true" v-if="deliverType===1">[查看区域配送地图]</span>
                    </h2>
                    <div class="content">
                        <template v-if="selectedDeliver">
                            <h3 class="clear_fix">
                                <label>收货人：</label>
                                <strong>{{selectedDeliver.receiver_name}}</strong>
                            </h3>
                            <h3>
                                <label>联系方式：</label>
                                <strong>{{selectedDeliver.mobile||selectedDeliver.phone}}</strong>
                            </h3>
                            <h3>
                                <label>收货地址：</label>
                                <strong>
                                    {{selectedDeliver.province}} {{selectedDeliver.city}} {{selectedDeliver.county}}
                                    {{selectedDeliver.address}}{{selectedDeliver.room_no}}
                                </strong>
                                <a href="javascript:void(0)"
                                   @click="isGroupBuyAddress=false,editAddress(selectedDeliver.deliver_id)"
                                   class="edit_btn">修改地址</a>
                            </h3>
                        </template>
                        <div class="btn_wrap">
                            <a href="javascript:void(0)" @click="isShowAddressList=true;isGroupBuyAddress=false;"
                               class="f_left"
                               v-if="selectedDeliver || addressList">
                                <span>切换地址</span>
                            </a>
                            <a href="javascript:void(0)" @click="isGroupBuyAddress=false;editAddress(0)"
                               class="f_right">
                                <span>添加地址</span>
                            </a>
                        </div>
                    </div>
                </section>

                <div id="addressTips" class="orange" v-if="isShowAddressTips" style="overflow: hidden;margin-top: 8px;">
                    亲爱的上海用户：
                    2018年11月5日至11月10日，每天8:00-19:00，因进博会临时交通管制，上海市崧泽大道-蟠臻路-蟠中东路-蟠文路-徐民东路-蟠秀路-盈港东路-涞港路-崧泽大道合围区域（除盈港东路-涞港路外）上述路段蛋糕站点物流配送可能延迟。特此公告，敬请谅解。
                </div>                    <!--配送时间-->
                <section class="delivery_time">
                    <h2>
                        <strong>开始配送时间</strong>
                        <span v-if="!editingTime.isEdit && editingTime.hasSet"
                              @click="editingTime.isEdit=true">[修改]</span>
                        <span v-if="editingTime.isEdit && editingTime.hasSet"
                              @click="editingTime.isEdit=false">[关闭]</span>
                    </h2>
                    <div class="content">
                        <div class="select_wrap clear_fix" v-show="editingTime.isEdit">
                            <p class="f_left delivery_date">
                                <label>{{deliveryDate||'请选择'}}</label>
                                <input type="text" id="deliveryDate" readonly>
                            </p>
                            <p class="f_left start_time">
                                <label>{{startTime|parseTime}}</label>
                            </p>
                            <p class="f_left end_time">
                                <label>{{endTime|parseTime}}</label>
                            </p>
                            <button class="f_left" @click="changeTime(false)">确定</button>
                        </div>
                        <h3 class="time_show" v-show="!editingTime.isEdit">
                            {{deliveryDate}}
                            {{startTime|parseTime}}:00 - {{endTime|parseTime}}:00
                        </h3>
                    </div>
                </section>                    <!--配送类型-->
                <section class="delivery_type">
                    <h2>
                        <strong>诺心配送</strong>
                        <span class="gray">诺心自有物流配送</span>
                    </h2>
                </section>
                <!--商品列表-->
                <section class="p_list">
                    <h2>
                        <strong>商品信息</strong>
                    </h2>
                    <h3 class="clear_fix col_wrap col_head">
                        <template v-if="toastViewType===1">
                            <span class="col col_1 type_2">商品信息</span>
                            <span class="col col_2 type_2">商品金额</span>
                            <span class="col col_3 type_2">配送计划</span>
                        </template>
                        <template v-else>
                            <span class="col col_1">商品信息</span>
                            <span class="col col_2"></span>
                            <span class="col col_3">积分价格</span>
                            <span class="col col_4">单价</span>
                            <span class="col col_5">数量</span>
                            <span class="col col_6">金额</span>
                        </template>
                    </h3>
                    <ul>
                        <li class="p_item" v-for="item of goodsList" v-if="item.isGroupBuyGoods">
                            <div class="col_wrap">
                                <div class="col col_1 goods_info" :class="{type_2:toastViewType===1}">
                                    <a :href="'/shop/goods-'+item.sku_id+'.html'" target="_blank" class="div_img">
                                        <img :src="${pageContext.request.contextPath}/static/picture/886cd282604d4147a61e74de4f10f644.gif"
                                             :alt="item.goods_name">
                                    </a>
                                    <div class="goods_detail">
                                        <h3 class="no_wrap">{{item.goods_name}}<i v-if="item.isUp">免费加大</i></h3>
                                        <h4 class="no_wrap gray">{{item.display_spec}}</h4>
                                        <div class="third_logistics" v-if="item.thirdPartyDelivery==1">
                                            <span class="text">第三方物流</span>
                                        </div>
                                        <h5 v-if="item.goods_type===1" class="gray">
                                            <span>建议{{item.display_spec}}</span>
                                            <span v-if="item.goodscut_flag">{{item.attributes && item.attributes.goods_cut>0 || item.goodscut_flag===2?'切分'+item.goodscut_num+'份':'不切分'}}</span>
                                        </h5>
                                        <h4 class="gray"
                                            v-if="item.standard_fitting && item.standard_fitting.cp>0 && !item.specialDinnerware">
                                            每份含餐具{{item.standard_fitting.cp}}套</h4>
                                        <h4 class="gray" v-if="item.specialDinnerware">{{item.specialDinnerware}}</h4>
                                        <h4 v-if="item.upgradePriceInfo.bargain_id">
                                            加价{{item.upgrade_plus_price/item.amount}}元升级为{{item.upgrade_sku_spec}}</h4>
                                    </div>
                                </div>
                                <template v-if="toastViewType===1">
                                    <div class="col col_2 type_2">￥{{item.sale_price*item.amount|salePrice}}</div>
                                    <div class="col col_3 type_2 child_goods">
                                        <ul class="clear_fix" v-if="childGoods.length">
                                            <li v-for="item of childGoods" class="no_wrap">
                                                <span>{{item.time}}：</span>
                                                <strong>{{item.title}}</strong>
                                            </li>
                                        </ul>
                                        <p v-else>请先选择配送日期</p>
                                    </div>
                                </template>
                                <template v-else>
                                    <div class="col col_2 birthday_card">
                                    </div>
                                    <div class="col col_3">{{item.need_points}}</div>
                                    <div class="col col_4">￥{{item.sale_price|salePrice}}</div>
                                    <div class="col col_5">{{item.amount}}</div>
                                    <div class="col col_6 orange">
                                        <strong>￥{{item.sale_price*item.amount|salePrice}}</strong>
                                        <span class="upgrade_price_price" v-if="item.upgradePriceInfo.bargain_id">￥{{item.upgrade_plus_price|salePrice}}</span>
                                    </div>
                                </template>
                            </div>
                            <h6 v-if="item.orderEnjoyBargains && item.orderEnjoyBargains.length"
                                v-for="bargain of item.orderEnjoyBargains"
                                class="item_promotion no_wrap">
                                <span>[促销]</span> {{bargain.brief}}
                            </h6>
                        </li>
                    </ul>
                    <div class="promotion" v-if="isExchange && enjoyBargains && enjoyBargains.length">
                        <h3>促销信息</h3>
                        <p v-for="item of enjoyBargains">{{item.brief}}</p>
                    </div>
                </section>
            </div>
            <!--周周配-->--%>
            <div :class="{area_wrap:isGroupBuy,normal_area_wrap:true,main_width:true}" v-if="!isExchange">
                <template v-if="isGroupBuy && activityType===5">
                    <!--提示-->
                    <section class="weekly_tips">
                        <h2 class="clear_fix">
                            <strong>信息填写</strong>
                            <strong class="sp">&nbsp;</strong>
                            <strong>诺心蛋糕</strong>
                        </h2>
                    </section>
                </template>

                <template v-if="!isVirtual">
                    <!--地址-->
                    <section class="address">
                        <h2>
                            <strong>{{activityType===5&&!isExchange?'蛋糕':''}}收货地址</strong>
                            <span @click="isShowAreaMap=true" v-if="deliverType===1">[查看区域配送地图]</span>
                        </h2>
                        <div class="content">
                            <template v-if="selectedDeliver">
                                <h3 class="clear_fix">
                                    <label>收货人：</label>
                                    <strong>{{selectedDeliver.receiver_name}}</strong>
                                </h3>
                                <h3>
                                    <label>联系方式：</label>
                                    <strong>{{selectedDeliver.mobile||selectedDeliver.phone}}</strong>
                                </h3>
                                <h3>
                                    <label>收货地址：</label>
                                    <strong>
                                        {{selectedDeliver.province}} {{selectedDeliver.city}} {{selectedDeliver.county}}
                                        {{selectedDeliver.address}}{{selectedDeliver.room_no}}
                                    </strong>
                                    <a href="javascript:void(0)"
                                       @click="isGroupBuyAddress=false,editAddress(selectedDeliver.deliver_id)"
                                       class="edit_btn">修改地址</a>
                                </h3>
                            </template>
                            <div class="btn_wrap">
                                <a href="javascript:void(0)" @click="isShowAddressList=true;isGroupBuyAddress=false;"
                                   class="f_left"
                                   v-if="selectedDeliver || addressList">
                                    <span>切换地址</span>
                                </a>
                                <a href="javascript:void(0)" @click="isGroupBuyAddress=false;editAddress(0)"
                                   class="f_right">
                                    <span>添加地址</span>
                                </a>
                            </div>
                        </div>
                    </section>

                    <div id="addressTips" class="orange" v-if="isShowAddressTips"
                         style="overflow: hidden;margin-top: 8px;">
                        亲爱的上海用户：
                        2018年11月5日至11月10日，每天8:00-19:00，因进博会临时交通管制，上海市崧泽大道-蟠臻路-蟠中东路-蟠文路-徐民东路-蟠秀路-盈港东路-涞港路-崧泽大道合围区域（除盈港东路-涞港路外）上述路段蛋糕站点物流配送可能延迟。特此公告，敬请谅解。
                    </div>                        <!--配送时间-->
                    <section class="delivery_time" v-if="isNeedDeliveryDate">
                        <h2>
                            <strong>{{deliverType===2?'全国物流发货日期':'配送时间'}}</strong>
                            <b class="orange" style="font-size: 12px;" v-if="deliverType===2">第三方物流揽件后1-3天送达</b>
                            <span v-if="!editingTime.isEdit && editingTime.hasSet"
                                  @click="editingTime.isEdit=true">[修改]</span>
                            <span v-if="editingTime.isEdit && editingTime.hasSet"
                                  @click="editingTime.isEdit=false">[关闭]</span>
                        </h2>
                        <div class="content">
                            <div class="select_wrap clear_fix" v-show="editingTime.isEdit">
                                <p class="f_left delivery_date">
                                    <label>{{deliveryDate||'请选择'}}</label>
                                    <input type="text" id="deliveryDate" readonly>
                                </p>
                                <template v-if="isNeedTimeArea">
                                    <p class="f_left start_time">
                                        <label>{{startTime|parseTime}}</label>
                                        <select v-model="startTime">
                                            <option disabled>请选择</option>
                                            <option v-for="item of startTimeArr" :value="item.value" :key="item.value">
                                                {{item.label}}
                                            </option>
                                        </select>
                                    </p>
                                    <p class="f_left end_time">
                                        <label>{{endTime|parseTime}}</label>
                                        <select v-model="endTime">
                                            <option disabled>请选择</option>
                                            <option v-for="item of endTimeArr" :value="item.value" :key="item.value">
                                                {{item.label}}
                                            </option>
                                        </select>
                                    </p>
                                </template>
                                <button class="f_left" @click="changeTime(false)">确定</button>
                            </div>
                            <h3 class="time_show" v-show="!editingTime.isEdit">
                                {{deliveryDate}}
                                <template v-if="isNeedTimeArea">
                                    {{startTime|parseTime}}:00 - {{endTime|parseTime}}:00
                                </template>
                            </h3>
                        </div>
                    </section>                        <!--配送方式-->
                    <section class="delivery_type">
                        <h2 v-if="deliverType===1">
                            <strong>诺心配送</strong>
                            <span class="orange" v-if="isHasThirdPartyDeliveryGoods">部分商品由第三方物流发货。节假日期间，第三方物流配送可能延迟，敬请谅解！</span>
                            <span class="gray">诺心冷链配送</span>
                        </h2>
                        <h2 v-else>
                            <strong>全国物流配送</strong>
                            <span class="orange" v-if="isHasThirdPartyDeliveryGoods">部分商品由第三方物流发货。节假日期间，第三方物流配送可能延迟，敬请谅解！</span>
                            <span v-if="!isMoonCake" class="orange">{{checkoutConfig.thirdText}}</span>
                            <span v-else-if="isMoonCake>=1" class="orange">订购后七天内发货（节假日除外）</span>
                        </h2>
                    </section>
                </template>
                <!--商品列表-->
                <section class="p_list">
                    <h2>
                        <strong>商品信息</strong>
                        <a href="javascript:void(0)"
                           class="f_right change_up_btn"
                           @click="forceShowUpList=true"
                           v-if="upList.length>1">修改升磅商品</a>
                    </h2>
                    <h3 class="clear_fix col_wrap col_head">
                        <span class="col col_1">商品信息</span>
                        <span class="col col_2">生日牌</span>
                        <span class="col col_3">积分价格</span>
                        <span class="col col_4">单价</span>
                        <span class="col col_5">数量</span>
                        <span class="col col_6">金额</span>
                    </h3>
                    <ul>
                        <li class="p_item" v-for="item of goodsList" v-if="!item.isGroupBuyGoods">
                            <div class="col_wrap">
                                <div class="col col_1 goods_info">
                                    <a :href="'/shop/goods-'+item.sku_id+'.html'" target="_blank" class="div_img">
                                        <img :src="${pageContext.request.contextPath}/static/picture/886cd282604d4147a61e74de4f10f644.gif"
                                             :alt="item.goods_name">
                                    </a>
                                    <div class="goods_detail">
                                        <h3 class="no_wrap">{{item.goods_name}}<i v-if="item.isUp">免费加大</i></h3>
                                        <h4 class="no_wrap hide">{{item.english_name}}</h4>
                                        <div class="third_logistics" v-if="item.thirdPartyDelivery==1">
                                            <span class="text">诺心自营商品送达后5-7个工作日内，<br>本商品由第三方物流单独送达</span>
                                        </div>
                                        <h5 v-if="item.goods_type===1" class="gray">
                                            <span>建议{{item.display_spec}}</span>
                                            <span v-if="item.goodscut_flag">{{item.attributes && item.attributes.goods_cut>0 || item.goodscut_flag===2?'切分'+item.goodscut_num+'份':'不切分'}}</span>
                                        </h5>
                                        <h4 class="gray"
                                            v-if="item.standard_fitting && item.standard_fitting.cp>0 && !item.specialDinnerware">
                                            每份含餐具{{item.standard_fitting.cp}}套</h4>
                                        <h4 class="gray" v-if="item.specialDinnerware">{{item.specialDinnerware}}</h4>
                                        <h4 v-if="item.upgradePriceInfo.bargain_id">
                                            加价{{item.upgrade_plus_price/item.amount}}元升级为{{item.upgrade_sku_spec}}</h4>
                                    </div>
                                </div>
                                <div class="col col_2 birthday_card">{{item.attributes && item.attributes.goods_birthday
                                    || '无'}}
                                </div>
                                <div class="col col_3">{{item.need_points}}</div>
                                <div class="col col_4">￥{{item.sale_price|salePrice}}</div>
                                <div class="col col_5">{{item.amount}}</div>
                                <div class="col col_6 orange">
                                    <strong>￥{{item.sale_price*item.amount|salePrice}}</strong>
                                    <span class="upgrade_price_price" v-if="item.upgradePriceInfo.bargain_id">￥{{item.upgrade_plus_price|salePrice}}</span>
                                </div>
                            </div>
                            <h6 v-if="item.orderEnjoyBargains && item.orderEnjoyBargains.length"
                                v-for="bargain of item.orderEnjoyBargains"
                                class="item_promotion no_wrap">
                                <span>[促销]</span> {{bargain.brief}}
                            </h6>
                        </li>
                    </ul>
                    <div class="promotion" v-if="enjoyBargains && enjoyBargains.length">
                        <h3>促销信息</h3>
                        <p v-for="item of enjoyBargains">{{item.brief}}</p>
                    </div>
                </section>
            </div>
            <!--支付方式-->
            <section class="pay_type" v-if="payList.length">
                <h2>
                    <strong>支付方式</strong>
                </h2>
                <div class="content">
                    <div class="switch_wrap" v-if="activityType!==5">
                        <a href="javascript:void(0)" :class="{active:payCategory===6}" @click="payCategory=6">在线支付</a>
                        <template v-if="promoFlag.canCashOnDelivery">
                            <span @click="toggleIsShowMorePayType(true)" v-if="!isShowMorePayType">更多&gt;</span>
                            <template v-if="isShowMorePayType">
                                <a href="javascript:void(0)" :class="{active:payCategory===1}" @click="payCategory=1"
                                   v-if="deliverType===1">货到付款</a>
                                <span @click="toggleIsShowMorePayType(false)"
                                      v-if="isShowMorePayType && isShowCancelIsShowMorePayTypeBtn">&lt;收起</span>
                                <b class="outline_tips gray">（注意：如果选择货到付款方式支付，到货时不得以蛋糕卡代替支付）</b>
                            </template>
                        </template>
                    </div>
                    <div class="handler_area">
                        <div class="tab_wrap clear_fix" v-show="payCategory===1" v-if="promoFlag.canCashOnDelivery">
                            <a href="javascript:void(0)" :class="{active:!isCredit}" @click="isCredit=false">现金或刷卡</a>
                            <a href="javascript:void(0)" :class="{active:isCredit}" @click="isCredit=true">信用卡支付</a>
                        </div>
                        <div class="pay_list clear_fix">
                            <a href="javascript:void(0)"
                               v-for="item of currentPayList"
                               :data-id="item.payTypeID"
                               :class="{comment_selected:true,active:orderInfo.payment_id===item.payTypeID}"
                               :style="{background:item.bg}"
                               @click="choosePayType(item.payTypeID)">{{item.payTypeName}}</a>
                        </div>
                        <div class="detail_wrap">
                            <template v-if="isShowPayTypeDetail(94)">
                                <div class="edit_area" data-id="94">
                                    请填写上海银行信用卡卡号：
                                    <input type="text" maxlength="6" class="val val1">（前六位）
                                    <input type="text" maxlength="6" class="val val2">（后六位）
                                    <label>手机号：</label>
                                    <input type="tel" maxlength="11" class="mobile">
                                    <button class="confirm_btn" @click="bankCheckConfirm">确认</button>
                                    <button class="cancel_btn hide" @click="bankCheckCancel(94)">取消</button>
                                </div>
                                <div class="rule_wrap">
                                    <p>1、参与货到刷上海银行信用卡支付优惠活动，需完成“上海银行信用卡”的验证并使用该卡支付，否则上海银行有权取消其参与本活动的资格。</p>
                                    <p>2、请务必点击【确认】按钮，验证通过后方可参与活动！</p>
                                </div>
                            </template>
                        </div>
                    </div>
                </div>
            </section>
            <!--发票-->
            <section class="invoice" v-if="isCanUseInvoice || invoiceID">
                <h2>
                    <strong>发票信息</strong>
                </h2>
                <div class="content clear_fix">
                    <a href="javascript:void(0)"
                       class="toggle_btn f_left"
                       :class="{active:invoiceID}"
                       @click="toggleUseInvoice">
                        <span>我需要开发票</span>
                    </a>
                    <div class="detail_wrap f_right" v-if="invoiceID">
                        <p>
                            <label>发票类型：</label>
                            <strong>{{invoiceType===1?'普通发票':'电子发票'}}</strong>
                        </p>
                        <p>
                            <label>内容：</label>
                            <strong>{{orderInfo.invoice.content}}</strong>
                        </p>
                        <p>
                            <label>发票抬头：</label>
                            <strong>{{orderInfo.invoice.company_name||'个人'}}</strong>
                        </p>
                        <p v-if="orderInfo.invoice.receive_mobile">
                            <label>收票手机：</label>
                            <strong>{{orderInfo.invoice.receive_mobile}}</strong>
                        </p>
                        <p v-if="orderInfo.invoice.tax_number">
                            <label>纳税人识别号：</label>
                            <strong>{{orderInfo.invoice.tax_number}}</strong>
                        </p>
                        <a href="javascript:void(0)" class="edit_btn" @click="isShowEditInvoice=true">修改信息</a>
                    </div>
                </div>
            </section>
            <!--心享值-->
            <section class="enjoy_balance">
                <h2>
                    <strong>心享值</strong>
                    <a href="javascript: void(0)" class="rule_tips" @click="isShowPassCardRule=true">什么是心享值</a>
                </h2>
                <div class="content">
                    <template v-if="orderInfo.user.balance.cashback>0">
                        账户共{{orderInfo.user.balance.cashback}}点心享值&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        本次使用
                        <input type="number" maxlength="11" v-model.number.trim="enjoyBalance.value"
                               v-if="enjoyBalance.isEdit">
                        <span v-else>{{orderInfo.total_balance_paid}}</span>
                        点心享值抵扣 <strong>￥<i>{{orderInfo.total_balance_paid|salePrice}}</i></strong>
                        <button @click="useEnjoyBalance" v-if="enjoyBalance.isEdit">确认</button>
                        <button @click="enjoyBalance.isEdit=true" v-else>修改</button>
                        <button v-if="!enjoyBalance.isEdit && orderInfo.total_balance_paid>0" class="cancel_btn"
                                @click="toggleUseEnjoyBalance">取消使用
                        </button>
                    </template>
                    <template v-else>账户共0点心享值，暂无可用</template>
                </div>
                <div class="main_pass_card_rule" v-show="isShowPassCardRule">
                    <div class="main">
                        <a href="javascript:void(0)" class="close_btn" @click="isShowPassCardRule=false">关闭</a>
                        <h3>【心享值说明】</h3>
                        <h4>1. 心享值，是开通心享卡后获得的返利福利。</h4>
                        <h4>2. 心享卡会员购买全场蛋糕单笔订单实付满178元（不含运费），可享心享值积分返利；每实付10元累计1个心享值（心享值48小时以内到账）。</h4>
                        <h4>3. 心享值结算蛋糕、礼品、配件时（不含运费），可直接抵扣现金，1心享值=1元；现有积分和心享值可同时获取累计，但不可同时使用。</h4>
                        <h4>4. 心享值永久有效，可与优惠券同享，但不与蛋糕卡、储值卡等同享；心享值抵扣部分不开发票。</h4>
                    </div>
                </div>
            </section>
            <!--运费券-->
            <section class="deliver_right" v-if="isHasDeliverRight">
                <h2>
                    <strong>运费券</strong>
                    <a href="javascript: void(0)" class="rule_tips" @click="isShowDeliverRightDesc=true">什么是运费券</a>
                </h2>
                <div class="content clear_fix">
                    <a href="javascript:void(0)"
                       class="toggle_btn f_left"
                       :class="{active:isUseDeliverRight}"
                       @click="toggleDeliverRight">
                        <span>使用运费券<i class="gray">（可使用次数：1次）</i></span>
                    </a>
                </div>
                <h2 class="no_after hide">
                    <strong>运费券</strong>
                    <span class="gray">（可使用次数：1次）<i class="desc_btn"
                                                    @click="isShowDeliverRightDesc=true">权益说明</i></span>
                    <label @click="toggleDeliverRight">
                        <input type="checkbox" class="ios_checkbox" :checked="isUseDeliverRight"
                               id="toggleDeliverRight"/>
                    </label>
                </h2>
                <div class="main_pass_card_rule" v-show="isShowDeliverRightDesc">
                    <div class="main" style="padding-top: 16px;">
                        <a href="javascript:void(0)" class="close_btn" @click="isShowDeliverRightDesc=false">关闭</a>
                        <h3 class="text_center" style="padding-bottom: 12px;font-size: 14px;">运费券说明</h3>
                        <h3>【使用说明】</h3>
                        <h4>使用本券，下单结算时可抵扣20元运费（应付运费超出20元时，补足超出部分即可）。</h4>
                        <h3>【特殊说明】</h3>
                        <h4>本券不退款、不兑现、不找零；有效期至2018年12月31日，可与蛋糕卡、心享值、优惠券叠加使用。</h4>
                    </div>
                </div>
            </section>
            <!--优惠方式-->
            <section class="preferential"
                     v-if="isPassCard && promoFlag.passCardGoods || promoFlag.coupon || promoFlag.goldCard || promoFlag.valueCard || isHasDiscountRight && promoFlag.discount || isHasVISARight && promoFlag.visaGoods">
                <h2>
                    <strong>使用优惠</strong>
                </h2>
                <div class="tab_wrap flex">
                    <a href="javascript:void(0)"
                       class="flex_item"
                       v-if="isPassCard && promoFlag.passCardGoods"
                       :class="{active:isUsePassCardRight}"
                       @click="togglePassCardRight">心享卡优惠</a>

                    <a href="javascript:void(0)"
                       class="flex_item"
                       v-if="promoFlag.coupon"
                       :class="{active:showCouponList}"
                       @click="clickShowCouponList">优惠券<span v-if="couponList.length">（{{couponList.length}}）</span></a>

                    <a href="javascript:void(0)"
                       class="flex_item"
                       v-if="promoFlag.goldCard"
                       :class="{active:showGoldCardList}"
                       @click="clickShowGoldCardList">诺心蛋糕卡</a>

                    <a href="javascript:void(0)"
                       class="flex_item"
                       v-if="promoFlag.valueCard"
                       :class="{active:showValueCardList}"
                       @click="clickShowValueCardList">诺心储值卡</a>

                    <a href="javascript:void(0)"
                       class="flex_item"
                       v-if="isHasDiscountRight && promoFlag.discount"
                       :class="{active:isUseDiscount}"
                       @click="toggleDiscount">尊享团（8.8折）</a>

                    <a href="javascript:void(0)"
                       class="flex_item"
                       v-if="isHasVISARight && promoFlag.visaGoods"
                       :class="{active:isUseVISARight}"
                       @click="toggleVISARight">VISA专享（83折）</a>
                </div>
                <div class="detail_wrap"
                     v-if="isUsePassCardRight || showCouponList || showGoldCardList || showValueCardList || isUseDiscount || isUseVISARight">

                    <h3 v-show="isUsePassCardRight">
                        心享卡专享：千层系列蛋糕立减50元优惠
                    </h3>

                    <div class="coupon_list" v-show="showCouponList">
                        <div class="input_wrap">
                            <input type="text" placeholder="输入已有的优惠券" v-model.trim="couponCode" maxlength="32">
                            <button @click="useCoupon(couponCode,1)">使用</button>
                        </div>
                        <ul v-if="couponList.length" class="clear_fix coupon_type">
                            <li v-for="(item,index) of couponList" @click="useCoupon(item.coupon_code)" :key="index"
                                :class="{active:selectedCouponCode===item.coupon_code}"
                                v-show="isShowAllCoupon || index<4">
                                <div class="price">
                                    <strong v-if="item.use_type===2">加大券</strong>
                                    <template v-else-if="item.use_type===3">
                                        <strong>{{parseInt(item.coupon_amount*10000)/1000}}</strong>折
                                    </template>
                                    <template v-else>
                                        ￥&nbsp;<strong>{{item.coupon_amount}}</strong>
                                    </template>
                                </div>
                                <p class="name no_wrap">{{item.coupon_name}}</p>
                                <p class="time">{{item.end_date}}</p>
                            </li>
                        </ul>
                        <p class="toggle_all" v-if="couponList.length>4">
                            <span @click="isShowAllCoupon=!isShowAllCoupon">{{isShowAllCoupon?'隐藏更多':'显示更多'}}</span>
                        </p>
                    </div>

                    <div class="gold_card_list" v-show="showGoldCardList">
                        <div class="input_wrap">
                            <input type="text" placeholder="蛋糕卡后4位" class="gold_card_no" v-model.trim="goldCardNo"
                                   maxlength="4">
                            <input type="password" placeholder="密码" v-model.trim="goldCardPw"
                                   maxlength="20">
                            <button @click="useGoldCard(goldCardNo,goldCardPw,1)">兑换</button>
                            <span class="orange hide">（月饼券仅供月饼类商品兑换）</span>
                        </div>
                        <div class="tips">
                            <label :class="{active:isAgreeGoldCardRule}"
                                   @click="isAgreeGoldCardRule=!isAgreeGoldCardRule">true/false</label>
                            <a href="/shop/help-55.html#6" target="_blank">您已明确知晓蛋糕卡的使用规则</a>
                        </div>
                        <ul v-if="goldCardList.length" class="clear_fix coupon_type">
                            <li v-for="(item,index) of goldCardList" @click="useGoldCard(item.card_no)" :key="index"
                                :class="{active:item.isSelected}">
                                <div class="price">
                                    ￥&nbsp;<strong>{{item.money}}</strong>
                                </div>
                                <p class="name no_wrap">{{item.card_no}}</p>
                                <p class="time">有效期至：{{item.expire_time && item.expire_time.split(' ')[0]}}</p>
                            </li>
                        </ul>
                    </div>

                    <div class="value_card_list" v-show="showValueCardList">
                        <div class="input_wrap">
                            <input type="text" placeholder="请输入卡号" v-model.trim="valueCardCode"
                                   maxlength="14">
                            <input type="text" placeholder="请输入密码" v-model.trim="valueCardPw"
                                   maxlength="11">
                            <button @click="bindValueCard(true)">绑定并使用</button>
                        </div>
                        <ul v-if="valueCardArray.length" class="table">
                            <li class="tr th">
                                <div class="title tc">卡号</div>
                                <div class="balance tc">余额</div>
                                <div class="used tc">扣除</div>
                                <div class="use tc">使用</div>
                            </li>
                            <li v-for="item of valueCardArray" class="tr">
                                <div class="title tc">{{item.card_no}}</div>
                                <div class="balance tc">{{item.balance}}</div>
                                <div class="used tc">{{item.used_amount}}</div>
                                <div class="status tc">
                                    <a href="javascript:void(0)" @click="useValueCard(item.card_no)"
                                       :class="{active:item.isUsed}">切换选中</a>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <h3 v-show="isUseDiscount">
                        亲，尊享团员能终生购买金牌系列蛋糕享88折。该特权不与诺心其他优惠同享
                    </h3>

                    <h3 v-show="isUseVISARight">
                        亲，VISA贵宾用户能享受购买全场蛋糕享83折（特殊商品除外）。该特权不与诺心其他优惠共享
                    </h3>
                </div>
            </section>
            <!--吐司一元购-->
            <section class="toast_one" v-if="toastOneInfo.bargain_id">
                <h2>
                    <strong class="orange">1元加价购，加1元多一份惊喜！</strong>
                    <a href="javascript: void(0)" class="rule_tips" @click="isShowToastOneRule=true">活动规则</a>
                </h2>
                <div class="content">
                    <div class="toast_info clear_fix">
                        <a href="javascript:void(0)"
                           class="toggle_btn"
                           :class="{active:isUseToastOne}"
                           @click="toggleToastOne">切换选中</a>
                        <div class="img_wrap">
                            <img :src="${pageContext.request.contextPath}/static/picture/ce4ab92b09634354ba5a7a99248de051.gif">
                        </div>
                        <div class="detail">
                            <h3>1元加购{{toastOneInfo.goods_name}}</h3>
                            <h4>{{toastOneInfo.brief}}</h4>
                        </div>
                    </div>
                </div>
                <div class="main_pass_card_rule" v-show="isShowToastOneRule">
                    <div class="main">
                        <a href="javascript:void(0)" class="close_btn" @click="isShowToastOneRule=false">关闭</a>
                        <h3>【活动规则】</h3>
                        <h4>1. 实付满199，加1元买原味半条吐司；实付满278，加1元买原味整条吐司；实付满316，加1元买随机口味吐司整条。</h4>
                        <h4>2. 促销在结算页，用户选定商品配送时间、配送地址、促销，判断出实付价格后展示。用户可勾选是否加1元购买吐司商品。</h4>
                        <h4>3. 组成实付的商品可以是蛋糕、吐司等任何商品，包含运费，只需满足实付价即可参与1元购。</h4>
                        <h4>4. 仅华东华西有这个活动，其他城市（北京、天津、广州、深圳）不参与。</h4>
                    </div>
                </div>
                <div class="toast_slide" id="toastSlide" @click="jumpToToastOne">
                    <img src="${pageContext.request.contextPath}/static/picture/toastslide.png">
                </div>
            </section>
            <!--金额信息-->
            <section class="account">
                <h3>
                    <label>商品金额：</label>
                    <span>￥{{orderInfo.total_sale_price|salePrice}}</span>
                </h3>
                <h3>
                    <label>运费：</label>
                    <span>￥{{orderInfo.deliver_fee|salePrice}}</span>
                </h3>
                <h3 v-if="upgradePromo.flag > 1">
                    <label>加价升级</label>
                    <span>￥{{upgradePromo.plus_price|salePrice}}</span>
                </h3>
                <h3 v-if="isHasDeliverRight">
                    <label>运费优惠：</label>
                    <span>-￥{{orderInfo.freight_coupon_paid|salePrice}}</span>
                </h3>
                <h3 v-if="orderInfo.user.balance.cashback>0">
                    <label>心享值：</label>
                    <span>-￥{{orderInfo.total_balance_paid|salePrice}}</span>
                </h3>
                <h3 v-if="orderInfo.total_need_points>0">
                    <label>积分支付：</label>
                    <span>-{{orderInfo.total_need_points}}</span>
                </h3>
                <h3>
                    <label>优惠：</label>
                    <!--商品总金额加运费减去现金支付总金额减去心享值减去运费优惠-->
                    <span>-￥{{orderInfo.total_sale_price+orderInfo.deliver_fee-orderInfo.total_cash_pay-orderInfo.total_balance_paid-orderInfo.freight_coupon_paid|salePrice}}</span>
                </h3>
                <h3>
                    <label>赠送积分：</label>
                    <span>{{orderInfo.give_points}}</span>
                </h3>
                <h3>
                    <label>赠送心享值：</label>
                    <span>{{orderInfo.give_cashback}}</span>
                </h3>
            </section>
            <!--底部处理-->
            <footer>
                <div class="footer_wrap">
                    <h3 class="clear_fix">
                        <label>应付：</label>
                        <span>￥&nbsp;<strong>{{orderInfo.total_cash_pay|salePrice}}</strong></span>
                    </h3>
                    <h4 v-if="selectedDeliver && !isVirtual">
                        配送至：{{selectedDeliver.province}} {{selectedDeliver.city}} {{selectedDeliver.county}}
                        {{selectedDeliver.address}}{{selectedDeliver.room_no}}&nbsp;&nbsp;&nbsp;
                        收货人：{{selectedDeliver.receiver_name}} {{selectedDeliver.mobile||selectedDeliver.phone}}
                    </h4>
                    <button @click="submitOrder">去支付</button>
                </div>
            </footer>
            <template>
                <div class="area_map pop_view" v-show="isShowAreaMap">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">
                            <a href="javascript:void(0)" @click="isShowAreaMap=false" class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <div class="div_img">
                                <img :src="'//www.lecake.com/postsystem/docroot/images/activity/map/' + cityMapName + '.png'">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="overview pop_view" v-show="isShowOverView">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">订单确认
                            <a href="javascript:void(0)" @click="isShowOverView=false" class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <h4>{{customerInfo.custID}}，为您核对订单：</h4>
                            <template v-if="!isExchange">
                                <dl>
                                    <dt>订购的商品：</dt>
                                    <dd>
                                        <p v-for="item of goodsList" v-if="!item.isGroupBuyGoods" class="goods_title">
                                            {{item.display_spec}}的{{item.goods_name}}，数量{{item.amount}}，金额为{{item.sale_price*item.amount|salePrice}}元；
                                            <template v-if="item.upgradePriceInfo.bargain_id">
                                                <br>加价{{item.upgrade_plus_price|salePrice}}元升级为{{item.upgrade_sku_spec}};
                                            </template>
                                        </p>
                                    </dd>
                                </dl>
                                <dl v-if="!isVirtual">
                                    <dt>{{isGroupBuy?'蛋糕':''}}发货日期：</dt>
                                    <dd v-if="(isNeedDeliveryDate || isNeedTimeArea) && !isMoonCake">
                                        {{deliveryDate}} <span v-if="isNeedTimeArea">{{startTime|parseTime}}:00-{{endTime|parseTime}}:00；</span>
                                    </dd>
                                    <dd v-else-if="deliverType!==1 && isMoonCake>=1">
                                        订购后七天内发货（节假日除外）
                                    </dd>
                                    <dd v-else>
                                        下单后7天内发货
                                    </dd>
                                    <h5 class="orange"
                                        v-if="checkoutConfig.customText && checkoutConfig.customText.billsubmit">
                                        {{checkoutConfig.customText.billsubmit}}
                                    </h5>
                                </dl>
                                <dl v-if="selectedDeliver && !isVirtual">
                                    <dt>
                                        {{isGroupBuy?'蛋糕':''}}收货信息：
                                    </dt>
                                    <dd>
                                        {{selectedDeliver.receiver_name}}&nbsp;{{selectedDeliver.mobile||selectedDeliver.phone}}&nbsp;
                                        {{selectedDeliver.province}}
                                        {{selectedDeliver.city}}
                                        {{selectedDeliver.county}}&nbsp;
                                        {{selectedDeliver.address}}&nbsp;{{selectedDeliver.room_no}}
                                        （物流费用：{{orderInfo.deliver_fee|salePrice}}元)；
                                    </dd>
                                </dl>
                            </template>
                            <dl v-if="activityType===5">
                                <dt>熊抱吐司商品：</dt>
                                <dd>
                                    <p v-for="item of goodsList" v-if="item.isGroupBuyGoods">
                                        {{item.display_spec}}的{{item.goods_name}}，数量{{item.amount}}，金额为{{item.sale_price*item.amount|salePrice}}元；
                                    </p>
                                </dd>
                            </dl>
                            <dl v-if="groupBuyDeliveryDate && !isExchange">
                                <dt>熊抱吐司商品开始配送时间：</dt>
                                <dd>
                                    {{groupBuyDeliveryDate}} <span>{{groupBuyStartTime|parseTime}}:00-{{groupBuyEndTime|parseTime}}:00；</span>
                                </dd>
                            </dl>
                            <dl v-if="groupBuyDeliverID">
                                <dt>熊抱吐司商品收货信息：</dt>
                                <dd>
                                    {{groupBuyAddress.receiver_name}}&nbsp;{{groupBuyAddress.mobile||groupBuyAddress.phone}}&nbsp;
                                    {{groupBuyAddress.province}}
                                    {{groupBuyAddress.city}}
                                    {{groupBuyAddress.county}}&nbsp;
                                    {{groupBuyAddress.address}}&nbsp;{{groupBuyAddress.room_no}}
                                </dd>
                            </dl>
                            <template v-if="isExchange">
                                <dl v-if="deliveryDate">
                                    <dt>熊抱吐司商品开始配送时间：</dt>
                                    <dd>
                                        {{deliveryDate}}
                                        <span>{{startTime|parseTime}}:00-{{endTime|parseTime}}:00；</span>
                                    </dd>
                                </dl>

                                <dl v-if="selectedDeliver">
                                    <dt>熊抱吐司商品收货信息：</dt>
                                    <dd>
                                        {{selectedDeliver.receiver_name}}&nbsp;{{selectedDeliver.mobile||selectedDeliver.phone}}&nbsp;
                                        {{selectedDeliver.province}}
                                        {{selectedDeliver.city}}
                                        {{selectedDeliver.county}}&nbsp;
                                        {{selectedDeliver.address}}&nbsp;{{selectedDeliver.room_no}}
                                    </dd>
                                </dl>
                            </template>
                            <dl v-if="orderInfo.total_cards_paid>0">
                                <dt>优惠信息：</dt>
                                <dd>
                                    <span v-if="selectedCouponCode">优惠券优惠</span>
                                    <span v-if="selectedGoldCard.length">蛋糕卡优惠</span>
                                    <span v-if="selectedValueCard.length">储值卡支付</span>：
                                    <span>{{orderInfo.total_cards_paid}}</span>元；
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    订单金额：{{upgradePromo.flag >
                                    1?orderInfo.total_sale_price+upgradePromo.plus_price:orderInfo.total_sale_price|salePrice}}元，应付：{{orderInfo.total_cash_pay|salePrice}}元；
                                </dt>
                            </dl>
                            <h5>诺心LECAKE.不定期有新产品推出，请您关注我们的网站信息，祝您购物愉快！</h5>
                            <div class="btn_wrap">
                                <button @click="createOrder">确认</button>
                                <button @click="isShowOverView=false" class="cancel_btn">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="edit_address pop_view" v-show="address.isEdit">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">{{address.deliverID===0?'添加':'编辑'}}地址信息
                            <a href="javascript:void(0)" @click="resetAddressDetail" class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <div class="edit_item clear_fix select_wrap">
                                <label>收货地址</label>
                                <div class="input_wrap">
                                    <select class="province" v-model="address.provinceid">
                                        <option disabled>请选择省</option>
                                        <option v-for="item of provinceArr" :value="item.id" :key="item.id">
                                            {{item.name}}
                                        </option>
                                    </select>
                                    <select class="city" v-model="address.cityid">
                                        <option disabled>请选择市</option>
                                        <option v-for="item of cityArr" :value="item.id" :key="item.id">
                                            {{item.name}}
                                        </option>
                                    </select>
                                    <select class="zone" v-model="address.countyid">
                                        <option disabled>请选择区县</option>
                                        <option v-for="item of zoneArr" :value="item.id" :key="item.id">
                                            {{item.name}}
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="edit_item detail_wrap clear_fix" @mouseleave.self="searchList=[]">
                                <label>详细地址</label>
                                <div class="input_wrap need_tips">
                                    <div class="search_wrap">
                                        <input type="text" v-model.trim="address.address" maxlength="50"
                                               @input="search">
                                        <div class="search_list" v-show="searchList.length">
                                            <ul>
                                                <li v-for="item of searchList"
                                                    @click="setDetail(item.name,item.county)">
                                                    <strong>{{item.name}}</strong>
                                                    <b class="gray">{{item.county}}</b>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="edit_item clear_fix room_no_item">
                                <label>门牌号</label>
                                <input type="text" placeholder="门牌号  如1栋101" v-model.trim="address.roomNo"
                                       maxlength="30">
                            </div>
                            <div class="edit_item clear_fix">
                                <label>收货人</label>
                                <div class="input_wrap">
                                    <input type="text" placeholder="收货人姓名" v-model.trim="address.custName"
                                           maxlength="20">
                                </div>
                            </div>
                            <div class="edit_item clear_fix">
                                <label>手机</label>
                                <div class="input_wrap">
                                    <input type="tel" placeholder="收货人手机号码" v-model.trim="address.mobile"
                                           maxlength="11">
                                    <span>或 固定电话</span>
                                    <input type="text" placeholder="收货人电话号码" v-model.trim="address.phone"
                                           maxlength="20">
                                </div>
                            </div>
                            <div class="btn_wrap">
                                <a href="javascript:void(0)"
                                   :class="{default_flag:true,active:address.postUseFlg===1}"
                                   @click="address.postUseFlg=address.postUseFlg===1?0:1">设为默认</a>
                                <button @click="saveAddress">确定</button>
                                <button @click="resetAddressDetail" class="cancel_btn" v-show="address.deliverID!==0">
                                    取消
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="up_list pop_view" v-show="showUpList || forceShowUpList">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">
                            以下商品均可使用该升磅券，请选择一个商品升磅
                            <a href="javascript:void(0)" @click="clickShowUpList" class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <ul class="clear_fix">
                                <li v-for="item of upList"
                                    :class="{comment_selected:true,active:item.originId===upItemId}"
                                    @click="selectUpItem(item.originId)">
                                    <div class="img_wrap">
                                        <img :src="${pageContext.request.contextPath}/static/picture/886cd282604d4147a61e74de4f10f644.gif">
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="value_card_check pop_view" v-show="isShowValueCardCheck">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">储值卡绑定
                            <a href="javascript:void(0)" @click="isShowValueCardCheck=false" class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <h4>
                                当前储值卡已经操作过绑定激活，为保证您的安全，请验证绑卡时使用的手机号，验证成功后储值卡将绑定至您当前登录账号
                            </h4>
                            <p class="input_wrap">
                                <label>手机号</label>
                                <input type="tel" maxlength="11" class="mobile" :value="valueCardInfo.showMobile"
                                       disabled/>
                            </p>
                            <p class="input_wrap yzm_wrap">
                                <label>验证码</label>
                                <input type="text" maxlength="4" v-model.trim="valueCardInfo.yzm"/>
                                <img data-src="${pageContext.request.contextPath}/static/picture/captcha.html"
                                     alt="点击刷新" @click="getCaptcha" id="captchaImg">
                            </p>
                            <p class="input_wrap code_wrap">
                                <label>短信验证码</label>
                                <input type="text" v-model.trim="valueCardInfo.code" maxlength="6"/>
                                <button class="btn"
                                        @click="valueCardSendSMS"
                                        v-show=" !valueCardInfo.isCodeGetting && valueCardInfo.time === 0 ">
                                    获取验证码
                                </button>
                                <button class="btn" v-show=" valueCardInfo.isCodeGetting " disabled>正在发送</button>
                                <button class="btn" disabled v-show=" valueCardInfo.time > 0 ">{{valueCardInfo.time}}秒
                                </button>
                            </p>

                            <div class="btn_wrap">
                                <button @click="valueCardQuery" :disabled="valueCardInfo.isFetching">验证</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="address_list pop_view" v-show="isShowAddressList">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">
                            地址信息
                            <a href="javascript:void(0)" @click="isShowAddressList=false" class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <ul>
                                <li v-for="(item,index) of addressList"
                                    :data-id="item.deliverID"
                                    :class="{comment_selected:true,active:isGroupBuyAddress?item.deliverID==groupBuyDeliverID:item.deliverID==deliverID}"
                                    @click="chooseAddress(item.deliverID)">

                                    <h3 class="clear_fix">
                                        <label>收货人：</label>
                                        <strong>{{item.custName}}</strong>
                                    </h3>
                                    <h3>
                                        <label>联系方式：</label>
                                        <strong>{{item.mobile||item.phone}}</strong>
                                    </h3>
                                    <h3>
                                        <label>收货地址：</label>
                                        <strong>
                                            {{item.provinceName}}{{item.cityName}}{{item.countyName}}{{item.address}}{{item.roomNo}}
                                        </strong>
                                        <a href="javascript:void(0)" @click.stop="editAddress(item.deliverID)"
                                           class="edit_btn">修改地址</a>
                                    </h3>
                                </li>
                                <li class="add_new_address">
                                    <a href="javascript:void(0)"
                                       @click.stop="editAddress(0)"
                                       class="add_btn">添加新地址</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="edit_invoice pop_view" v-show="isShowEditInvoice">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">
                            发票信息
                            <a href="javascript:void(0)" @click="isShowEditInvoice=false" class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <p class="input_wrap">
                                发票抬头：
                                <label :class="{comment_selected:true,active:invoice.invoiceTitle===1}"
                                       @click="invoice.invoiceTitle=1">个人</label>
                                <label :class="{comment_selected:true,active:invoice.invoiceTitle===2}"
                                       @click="invoice.invoiceTitle=2">单位</label>
                            </p>
                            <p class="input_wrap">
                                发票内容：
                                <label v-for="item of invoiceContentList"
                                       :class="{comment_selected:true,active:invoice.invoiceContent===item.id}"
                                       @click="invoice.invoiceContent=item.id">{{item.name}}
                                </label>
                            </p>
                            <template v-if="invoice.invoiceTitle===2">
                                <p class="input_wrap">
                                    <input type="text"
                                           placeholder="请输入单位名称"
                                           class="input"
                                           v-model.trim="invoice.invoiceName"
                                           maxlength="100">
                                </p>
                                <p class="input_wrap clear_fix">
                                    <input type="text"
                                           placeholder="请输入纳税人识别号"
                                           class="input"
                                           v-model.trim="invoice.taxNumber"
                                           maxlength="20">
                                    <span class="taxpayer_txt f_right">
                            为了您能顺利报销，请准确填写纳税人识别号<br>
                            一旦提交电子发票不可修改和重开。
                        </span>
                                </p>
                            </template>
                            <p class="input_wrap" v-if="invoiceType===2">
                                <input type="tel"
                                       placeholder="请输入手机号"
                                       v-model.trim="invoice.getMsg"
                                       maxlength="11">
                                <span class="gray">必填：用于接收电子发票</span>
                            </p>
                            <div class="btn_wrap">
                                <p class="invoice_error" v-if="invoiceError">{{invoiceError}}</p>
                                <button class="submit_btn" @click="saveInvoice(0)">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </template>
        </template>
    </div>
    <jsp:include page="../foot.jsp"/>
</article>
<script>
    window.orderObj = {};
    //某些商品特殊餐具数量
    var specialDinnerware = null;
    //结算大对象
    var orderInfo = {
        "buy_id": "Kych0LjCc-51gLvx",
        "agent_id": "KyHToqMRK5fq",
        "uid": 7531703,
        "channel": "website",
        "site_id": 287,
        "bill_type": 1,
        "bill_source": 1,
        "payment_id": 29,
        "extend_flag": 0,
        "invoice": {
            "invoice_id": 0,
            "electronic_flag": 1,
            "personal_flag": 1,
            "content": "",
            "company_name": "",
            "tax_number": "",
            "receive_mobile": ""
        },
        "promo_use_type": 0,
        "stock_config": {
            "error": "0",
            "data": {
                "is_limited": false,
                "filter_period": [],
                "matched_list": null
            }
        },
        "time_config": {
            "start_date": "2018-11-14",
            "end_date": "2019-02-11",
            "details": [{
                "start_date": "2018-11-14",
                "end_date": "2019-02-11",
                "start_time": "10:00",
                "end_time": "22:00",
                "interval": "30",
                "default_time": "12:30"
            }]
        },
        "total_sale_price": 892,
        "total_buy_price": 892,
        "total_need_points": 0,
        "total_cards_paid": 0,
        "total_balance_paid": 0,
        "total_cash_pay": 892,
        "give_cashback": 0,
        "give_points": 892,
        "deliver_fee": 0,
        "freight_coupon_paid": 0,
        "deliver_coupon_flag": 0,
        "promo_flag": 3145775,
        "deliver_type": 1,
        "user": {
            "privilege": 0,
            "balance": {
                "cashback": 0
            }
        },
        "max_pay_cashback": 0,
        "max_invoice_amount": 892,
        "sku_list": [{
            "sku_id": 105412,
            "amount": 2,
            "seqno": 0,
            "checked": 0,
            "attributes": {
                "goods_cut": "",
                "goods_birthday": "生日快乐"
            },
            "goods_name": "美刀刀蛋糕",
            "english_name": "",
            "spec": "3磅",
            "display_spec": "5-8人食",
            "market_price": 298,
            "goods_type": 1,
            "sale_price": 298,
            "need_points": 0,
            "birthday_flag": 1,
            "goodscut_flag": 0,
            "standard_fitting": {
                "cp": 10,
                "lz": 1,
                "dc": 1
            },
            "main_pic": "201706\/15474\/list_15474.jpg?v=1529291148",
            "loukou_pic": "E99489B49D9199257B849DE2CB6D7B91.jpg",
            "buy_price": 298,
            "specialDinnerware": ""
        }, {
            "sku_id": 106135,
            "amount": 1,
            "seqno": 0,
            "checked": 0,
            "attributes": {
                "goods_cut": "",
                "goods_birthday": "Happy Birthday"
            },
            "goods_name": "数字蛋糕（数字6）",
            "english_name": "",
            "spec": "1磅",
            "display_spec": "2-4人食",
            "market_price": 198,
            "goods_type": 1,
            "sale_price": 198,
            "need_points": 0,
            "birthday_flag": 1,
            "goodscut_flag": 0,
            "standard_fitting": {
                "cp": 5,
                "lz": 1,
                "dc": 1
            },
            "main_pic": "201803\/16196\/list_16196.jpg?v=1531882379",
            "loukou_pic": "03C2BF0F2732B0512EE1F1D6A04EE0CE.jpg",
            "buy_price": 198,
            "specialDinnerware": ""
        }, {
            "sku_id": 107415,
            "amount": 1,
            "seqno": 0,
            "checked": 0,
            "attributes": {
                "goods_cut": null,
                "goods_birthday": ""
            },
            "goods_name": "核桃曲奇礼盒（迷迭紫）",
            "english_name": "",
            "spec": "1盒",
            "display_spec": "1盒",
            "market_price": 98,
            "goods_type": 21,
            "sale_price": 98,
            "need_points": 0,
            "birthday_flag": 0,
            "goodscut_flag": 0,
            "standard_fitting": {
                "cp": 0,
                "lz": 0,
                "dc": 0
            },
            "main_pic": "201808\/17477\/list_17477.jpg?v=1541489720",
            "loukou_pic": null,
            "buy_price": 98,
            "specialDinnerware": ""
        }],
        "bit_map_or": 4,
        "buyLimit": []
    };
    //地址列表
    var addressList = [{
        "error_flag": 0,
        "deliver_id": 6852785,
        "user_id": 7531703,
        "deliver_type": 1,
        "province_name": "上海",
        "city_name": "上海市",
        "county_name": "黄浦区",
        "town_name": "外环线以内",
        "province_id": 1,
        "city_id": 2,
        "county_id": 3,
        "town_id": 59,
        "receiver_name": "李大也",
        "postal_code": null,
        "address": "1号线 黄陂南路-地铁站",
        "room_no": "102",
        "mobile": "13756556588",
        "phone": "",
        "is_default": false,
        "deliverID": 6852785,
        "provinceid": 1,
        "cityid": 2,
        "countyid": 3,
        "townid": 59,
        "provinceName": "上海",
        "cityName": "上海市",
        "countyName": "黄浦区",
        "townName": "外环线以内",
        "custName": "李大也",
        "roomNo": "102",
        "deliverType": 1
    }];
    //百度关联搜索
    var searchUrl = 'https://lbsyun.lecake.com/suggestion?openargs=eyJnX3BsYXRmb3JtIjoibGVjYWtlIiwiZ19hZ2VudCI6Ikt5SFRvcU1SSzVmcSIsImdfY2xpY2siOiJLeU9MbXhoM2hKVi4iLCJnX2FjY291bnQiOiI3NTMxNzAzIiwiZ190aW1lIjoxNTQxODM4Nzk1LCJnX3NpZ24iOiI0NDllZmRiNDNhMmJkZjUyZTI1YzUwNjA5NDAzNGVmYSJ9';
    //结算页配置
    //结算页配置
    var checkoutConfig = {"buy_id":"Kych0LjCc-51gLvx","bill_source":1,"send_interval":1800,"channel":"website","thirdFreight":true,"coldFreight":true,"thirdType":1,"cake_music":null,"deliver_type":1,"site_id":287,"haveValidOrder":null,"thirdText":"\uff08\u8be5\u5730\u533a\u6682\u4e0d\u652f\u6301\u8d27\u5230\u4ed8\u6b3e\uff09\u8ba2\u8d2d\u540e\u4e03\u5929\u5185\u53d1\u8d27\uff08\u6cd5\u5b9a\u8282\u5047\u65e5\u9664\u5916\uff09","customText":[],"activity":"","supportList":{"393":"\u86cb\u7cd5"},"payList":[{"payTypeID":"29","payTypeName":"\u5fae\u652f\u4ed8","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8f4c21a34.jpg"},{"payTypeID":"1","payTypeName":"\u8d27\u5230\u4ed8\u6b3e","typeID":"1","credit_cash":"2","berfor_image":"payUpload\/2017\/04\/10\/58ea8f5e0f245.jpg"},{"payTypeID":"8","payTypeName":"\u652f\u4ed8\u5b9d","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8fb95d0e1.jpg"},{"payTypeID":"72","payTypeName":"\u8d27\u5230\u5237\u94f6\u884c\u5361","typeID":"1","credit_cash":"2","berfor_image":"payUpload\/2017\/04\/10\/58ea986bced32.jpg"},{"payTypeID":"96","payTypeName":"\u94f6\u8054\u652f\u4ed8","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8f75ca8b5.jpg"},{"payTypeID":"9","payTypeName":"\u62db\u5546\u94f6\u884c","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8f89789bd.jpg"},{"payTypeID":"30","payTypeName":"\u5efa\u8bbe\u94f6\u884c","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8dd697cb4.jpg"},{"payTypeID":"37","payTypeName":"\u8d27\u5230\u5237\u519c\u884c\u5361","typeID":"1","credit_cash":"2","berfor_image":"payUpload\/2017\/04\/10\/58ea957d4020d.jpg"},{"payTypeID":"22","payTypeName":"\u8d27\u5230\u5237\u62db\u884c\u5361","typeID":"1","credit_cash":"2","berfor_image":"payUpload\/2017\/04\/10\/58ea8f9d6bdc1.jpg"},{"payTypeID":"53","payTypeName":"\u519c\u4e1a\u94f6\u884c","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8e46667ac.jpg"},{"payTypeID":"49","payTypeName":"\u6d66\u53d1\u94f6\u884c","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8ed86c688.jpg"},{"payTypeID":"61","payTypeName":"\u5e7f\u53d1\u94f6\u884c","typeID":"6","credit_cash":"0","berfor_image":"payUpload\/2017\/04\/10\/58ea8dc23beae.jpg"},{"payTypeID":"63","payTypeName":"\u8d27\u5230\u5237\u5e73\u5b89\u94f6\u884c\u4fe1\u7528\u5361","typeID":"1","credit_cash":"1","berfor_image":"payUpload\/2017\/04\/10\/58ea8e830441a.jpg"},{"payTypeID":"86","payTypeName":"\u8d27\u5230\u5e73\u5b89\u94f6\u884c\u5361","typeID":"1","credit_cash":"2","berfor_image":"payUpload\/2017\/04\/10\/58ea915b0f314.jpg"},{"payTypeID":"94","payTypeName":"\u8d27\u5230\u5237\u4e0a\u6d77\u94f6\u884c\u4fe1\u7528\u5361","typeID":"1","credit_cash":"1","berfor_image":"payUpload\/2017\/04\/10\/58ea8f27dac24.jpg"}],"payment_id":"29","getLastInvoice":false};
    //是否存在购买心享卡权益的虚拟商品
    var isPassCardVirtualGoods = false;
    //发票内容
    var invoiceContentList ={"393":"\u86cb\u7cd5"};
    //组合购对象
    var groupBuy = null;
    // 购买商品是否存在月饼
    var isMoonCake = 0;


    //牛奶
    var milkGoods =[107544,103734,104165];

</script>
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
</script>
<script src="${pageContext.request.contextPath}/static/js/sitelist.js"></script>
<script src="${pageContext.request.contextPath}/static/js/widget.js"></script>
<script src="${pageContext.request.contextPath}/static/js/base.js"></script>
<script src="${pageContext.request.contextPath}/static/js/laydate.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.marquee.js"></script>
<script src="${pageContext.request.contextPath}/static/js/order.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig = {stat_host: "www.lecake.com", click_id: "KyOLmxh3hJV."};</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/mystat.js"></script>

<script src="${pageContext.request.contextPath}/static/js/rt.js"></script>
</body>
</html>

