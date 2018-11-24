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
        <link href="${pageContext.request.contextPath}/static/css/welfare.css" rel="stylesheet"></head>
<body>
<style>
    .rules_stamp ul li {
        margin-bottom: 6px;
    }

    .rules_stamp ul label {
        float: left;
    }

    .rules_stamp ul p {
        width: 646px;
        float: left;
    }
</style>
<article class="container main_welfare main_snack">
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
            <nav class="global_nav">
                <ul class="nav clear_fix">
                    <li class="">
                        <a href="/" data-statistics="nav_home|首页">首页</a>
                    </li>
                    <li class="">
                        <a href="/BJ/category-0-1.html" data-statistics="nav_cake|蛋糕">蛋糕</a>
                    </li>
                    <!--    华东华西,展示吐司        -->
                    
                    <li class="gift ">
                        <a href="/BJ/category-1000-1.html" data-statistics="nav_gift|礼品">礼品</a>
                    </li>
                    <li class="have_inner  active">
                        <a href="javascript:void(0)">企业专区</a>
                        <div class="inner_wrap">
                                                            <a href="/shop/companyPurchase.php" class="inner_item"
                                   data-statistics="nav_procurement|企业采购">企业采购</a>
                                                        <a href="/shop/ncompany/nlogin.php" class="inner_item"
                               data-statistics="nav_major_account|大客户区">大客户区</a>
                            <a href="/company/welfare.html" class="inner_item"
                               data-statistics="nav_Welfare|福利券区">福利券区</a>
                            <a href="/shop/bank_list.php" class="inner_item" data-statistics="nav_Bank|银行专区">合作专区</a>
                                                            <a href="/shop/help-637.html" class="inner_item"
                                   data-statistics="nav_AirChina|国航专区">国航专区</a>
                                                                                </div>
                    </li>
                    <li class="have_inner ">
                        <a href="/customer/index.html">我的诺心</a>
                        <div class="inner_wrap">
                            <a href="/i/duihuan/" class="inner_item" data-statistics="nav_leclub|LECLUB">LECLUB</a>
                            <a href="/customer/order-list.html?orderflg=1" class="inner_item"
                               data-statistics="nav_order|我的订单">我的订单</a>
                            <a href="/customer/find-pw.html" class="inner_item"
                               data-statistics="nav_password|找回密码">找回密码</a>
                            <a href="/customer/czcard.html" class="inner_item"
                               data-statistics="nav_Gift_cards|礼卡专区">礼卡专区</a>
                                                    </div>
                    </li>
                </ul>
            </nav>
        </section>
    </div>
    <div class="global_top_customer" id="globalTopCustomer">
    <a href="/customer/login.html">登录</a>
    <a href="/customer/register.html">注册</a>
</div>    <div class="global_top_cart" id="globalTopCart">
    <div class="loading_wrap" v-if="isLoading">
        <img src="${pageContext.request.contextPath}/static/picture/loading.gif">
    </div>
    <template v-else-if="itemCount>0">
        <ul class="goods_list">
            <li class="goods_item clear_fix" v-for="item of goodsList" :key="item.sku_id">
                <div class="img_wrap f_left">
                    <img :src="${pageContext.request.contextPath}/static/picture/2b494bd2f5b24c0dafea8287fd3eecb9.gif" :alt="item.goods_name">
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
</header>    <div class="main">
        <section class="p_list_wrap main_width pleasant">
                            <div class="no_content">
                    <img src="${pageContext.request.contextPath}/static/picture/no_content.png">
                    <p>抱歉，找不到相关商品，选择“
                        <a href="/BJ/category-0-1.html"
                           class="" data-statistics="nav_cake|蛋糕">全部</a>
                        ”试试。
                    </p>
                </div>
                    </section>
        <section class="rules_stamp main_width">
            <div class="rules_title">
                <h1>小食盒购买规则</h1>
            </div>
            <ul>
                <li class="clear_fix">
                    <label>销售说明：</label>
                    <p>本券为提货凭证，需一次性兑换完成，不挂失，不兑现，不找零；本券购买时可开具发票，兑换时不开具发票；</p>
                </li>
                <li class="clear_fix">
                    <label>使用说明：</label>
                    <p>
                        登录诺心官网www.lecake.com、诺心APP客户端可兑换同等面值小食产品一份，不可兑换其他产品；扫描二维码后填写必要信息，绑定用户后方可使用，如不绑定，则收货时需向配送员交回本券完成收货。本券自首次售出之日起三年内有效，请于有效期内完成兑换。
                    </p>
                </li>
                <li class="clear_fix">
                    <label>注意事项：</label>
                    <p>节日期间兑换集中，请至少提前一日兑换；本券不记名，遗失不补，请妥善保管。请注意券面完好，号码、二维码等污损无法使用的，损失自负。</p>
                </li>
                <li class="clear_fix">
                    <label>配送说明：</label>
                    <p>
                        ①单个地址使用单张小食券在诺心官网明示的免费配送区域内配送的，须另支付12元运费。<br>
                        ②单个地址使用二张及以上小食券(或单张小食券与单张蛋糕卡搭配)在诺心官网明示的免费配送区域内一次性配送的，不再收取运费。<br>
                        ③其他超出免费配送区域的运费、订购及配送时间等、以诺心官网最新发布信息为准。
                    </p>
                </li>
                <li class="clear_fix">
                    <label>优惠说明：</label>
                    <p>使用本券兑换，不参与诺心积分奖励及其他优惠活动。</p>
                </li>
                <li class="clear_fix">
                    <label>特别声明：</label>
                    <p>
                        ①非授权的单位或个人，均无权销售本券，否则诺心有权不予兑换且所有损失概不负责。<br>
                        ②券面图案仅供参考，实际以诺心官网所售实物为准。
                    </p>
                </li>
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
<script src="${pageContext.request.contextPath}/static/js/welfare.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHhpzxbh2M."};</script>
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

