<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        var navHeader = new Vue({
            el: '#head_wrap',
            data: {
                showPage: 0
            },
            method: {
                navShow: function (data) {
                    this.showPage = data;
                }
            }
        });
    })

</script>
<header class="global_header_new" id="globalHeader">
    <div class="header_wrap">
        <section class="top_bar">
            <div class="main_width clear_fix">
                <h2 class="hide" id="marquee">
                    亲爱的上海用户：
                    2018年11月5日至11月10日，每天8:00-19:00，因进博会临时交通管制，上海市崧泽大道-蟠臻路-蟠中东路-蟠文路-徐民东路-蟠秀路-盈港东路-涞港路-崧泽大道合围区域（除盈港东路-涞港路外）上述路段蛋糕站点物流配送可能延迟。特此公告，敬请谅解。
                </h2>
                <div class="f_right">
                    <a href="/customer/login.html" data-statistics="nav_login|登录">登录</a>
                    <b>/</b>
                    <a href="/customer/register.html" data-statistics="nav_register|注册" style="margin-left: 0">注册</a>
                    <a href="javascript:void (0)" class="wx_btn f_right" data-statistics="top_WeChat|微信|1">
                        <img src="${pageContext.request.contextPath}/static/picture/qr_code_top.png">
                        微信
                    </a>
                </div>
            </div>
        </section>
        <section class="header_content main_width clear_fix">
            <a href="/" target="_parent" class="logo_img">
                <img src="${pageContext.request.contextPath}/static/picture/logo_new.png">
            </a>
            <div class="f_right right_content">
                <div class="select_city_wrap">
                    <a class="select_city" href="javascript:void(0)" data-statistics="top_site|站点|1">
                        <span class="currentCity">北京</span>
                    </a>
                    <a href="/company/address-check.html" target="_blank" class="address_check_link"
                       data-statistics="top_address_check|查询地址">查询地址是否可配送</a>
                </div>
                <div class="search_wrap">
                    <p class="input_wrap">
                        <input type="text"
                               value=""
                               placeholder="雪域牛乳芝士" class="search_input"
                               maxlength="50">
                    </p>
                    <button class="search_btn global_search_btn" data-statistics="top_search|搜索">搜索</button>
                </div>
                <div class="customer_link_wrap">
                    <span class="s"></span>
                </div>
                <div class="nav_cart_wrap f_right">
                    <a href="/cart/index.html" class="nav_cart" data-statistics="nav_carts|购物车">
                        <strong class="global_cart_num hide">
                            <b>0</b>
                        </strong>
                    </a>
                    <span class="s"></span>
                </div>
            </div>
            <div id="head_wrap">
                <nav class="global_nav">
                    <ul class="nav clear_fix">
                        <li :class="{active:showPage==0}" @click="navShow(0)">
                            <a href="/" data-statistics="nav_home|首页">首页</a>
                        </li>
                        <li :class="{active:showPage==1}" @click="navShow(1)">
                            <a href="/category-0-1.html" data-statistics="nav_cake|蛋糕">蛋糕</a>
                        </li>
                        <!--    华东华西,展示吐司        -->

                        <li class="gift " :class="{active:showPage==2}" @click="navShow(2)">
                            <a href="/category-1000-1.html" data-statistics="nav_gift|礼品">礼品</a>
                        </li>
                        <li class="have_inner ">
                            <a href="javascript:void(0)">企业专区</a>
                            <div class="inner_wrap">
                                <a href="/shop/companyPurchase.html" class="inner_item"
                                   data-statistics="nav_procurement|企业采购">企业采购</a>
                                <a href="/shop/ncompany/nlogin.html" class="inner_item"
                                   data-statistics="nav_major_account|大客户区">大客户区</a>
                                <a href="/company/welfare.html" class="inner_item"
                                   data-statistics="nav_Welfare|福利券区">福利券区</a>
                                <a href="/shop/bank_list.html" class="inner_item" data-statistics="nav_Bank|银行专区">合作专区</a>
                                <a href="/shop/help-637.html" class="inner_item"
                                   data-statistics="nav_AirChina|国航专区">国航专区</a>
                            </div>
                        </li>
                        <li class="have_inner ">
                            <a href="/customer/index.html">我的诺心</a>
                            <%--<div class="inner_wrap">
                                <a href="/i/duihuan/" class="inner_item" data-statistics="nav_leclub|LECLUB">LECLUB</a>
                                <a href="/customer/order-list.html?orderflg=1" class="inner_item"
                                   data-statistics="nav_order|我的订单">我的订单</a>
                                <a href="/customer/find-pw.html" class="inner_item"
                                   data-statistics="nav_password|找回密码">找回密码</a>
                                <a href="/customer/czcard.html" class="inner_item"
                                   data-statistics="nav_Gift_cards|礼卡专区">礼卡专区</a>
                            </div>--%>
                        </li>
                    </ul>
                </nav>
            </div>
        </section>
    </div>
    <div class="global_top_customer" id="globalTopCustomer">
        <a href="/customer/login.html">登录</a>
        <a href="/customer/register.html">注册</a>
    </div>
    <div class="global_top_cart" id="globalTopCart">
        <div class="loading_wrap" v-if="isLoading">
            <img src="${pageContext.request.contextPath}/static/picture/loading.gif">
        </div>
        <template v-else-if="itemCount>0">
            <ul class="goods_list">
                <li class="goods_item clear_fix" v-for="item of goodsList" :key="item.sku_id">
                    <div class="img_wrap f_left">
                        <img :src="${pageContext.request.contextPath}/static/picture/9b810462740c4b74a28c9e9dd2798b05.gif"
                             :alt="item.goods_name">
                    </div>
                    <div class="goods_detail">
                        <h2 class="no_wrap">
                            {{item.goods_name}}
                            <a href="javascript:void(0)" class="delete_btn" @click="deleteItem(item.sku_id)"></a>
                        </h2>
                        <h3>{{item.display_spec}}</h3>
                        <div class="price_wrap">
                            <p v-if="item.need_points>0">
                                积分价格
                                <strong>{{item.need_points}}</strong>
                            </p>
                            <p class="new_price">￥<strong>{{item.sale_price|salePrice}}</strong></p>
                            <!--心享价-->
                            <p class="pass_card_price" v-if="item.passcard_price">
                                ￥<strong>{{item.passcard_price|salePrice}}</strong>
                            </p>
                            <p class="markup_price" v-if="item.preferentialPrice>0 && !item.passcard_price>0">
                                ￥<strong>{{item.preferentialPrice|salePrice}}</strong>
                            </p>
                            <p class="count">x{{item.amount}}</p>
                        </div>
                    </div>
                </li>
            </ul>
            <div class="cart_bottom">
                <p>共计{{itemCount}}件商品</p>
                <p class="total_price">
                    ￥<strong>{{totalPrice-discountsPrice}}</strong>
                </p>
                <a href="/cart/index.html">去购物车结算</a>
            </div>
        </template>
        <div class="no_content" v-else>
            购物车中还没有商品，赶紧选购吧
        </div>
    </div>
</header>
<script>

</script>
