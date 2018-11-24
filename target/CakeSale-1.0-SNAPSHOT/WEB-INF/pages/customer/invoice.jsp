<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 2018/11/9
  Time: 15:55
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
    <link href="<%=request.getContextPath()%>/static/css/customer.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/static/css/invoice.css" rel="stylesheet"></head>
<body>
<article class="container main_customer_common main_invoice max_width">
    <jsp:include page="../head-login-nav.jsp"/>
    <div class="main main_width clear_fix">
    <nav class="main_customer_sidebar f_left">
        <div class="nav_list">
            <h2>我的诺心</h2>
            <%--<p><a href="/customer/index.html" class=""--%>
                  <%--target="_blank">个人中心</a></p>--%>
            <p><a href="/shop/member_consignee.html" class=""
                  target="_blank">地址管理</a></p>
            <p><a href="/shop/member_account.html" class=""
                  target="_blank">我的积分</a>
            </p>
            <%--<p class="hide"><a href="/shop/member_editUser.html" class=""--%>
                               <%--target="_blank">我的心享值</a></p>--%>
            <%--<p><a href="/shop/member_user_profile.html" class=""--%>
                  <%--target="_blank">我的LE家族</a>--%>
            <%--</p>--%>
            <p><a href="/shop/member_editUser.html?userId=${num==1?user1.id:user2.id}" class=""
                  target="_blank">个人资料</a></p>
            <p><a href="/customer/edit-password.html?userId=${num==1?user1.id:user2.id}" class=""
                  target="_blank">
                修改密码
            </a></p>
            <%--<p><a href="/customer/invoice.html" class="active"--%>
                  <%--target="_blank">发票管理</a></p>--%>
        </div>
        <div class="nav_list">
            <h2>交易管理</h2>
            <p><a href="/customer/order-list.html?userId=${num==1?user1.id:user2.id}" class=""
                  target="_blank">订单管理</a></p>
            <%--<p><a href="/customer/coupon.html" class=""--%>
                  <%--target="_blank">优惠券--%>
            <%--</a>--%>
            <%--</p>--%>
            <%--<p><a href="/customer/cake-coupon.html" class=""--%>
                  <%--target="_blank">蛋糕卡--%>
            <%--</a>--%>
            <%--</p>--%>
            <%--<p><a href="/customer/stored-card.html" class=""--%>
                  <%--target="_blank">储值卡--%>
            <%--</a>--%>
            <%--</p>--%>
        </div>
        <div class="nav_list">
            <h2>客户服务</h2>
            <p><a href="/shop/help-55.html" target="_blank">帮助中心</a></p>
        </div>
    </nav>        <div class="content" id="invoiceContent">
    <h2 class="top">
        <strong>发票管理</strong>
        <a href="/shop/help-55.html" target="_blank" class="link_btn">发票说明&gt;</a>
        <a href="javascript:void(0)" class="add_btn" @click="editInvoice()">新增发票</a>
    </h2>
    <section class="middle">
        <h3 class="clear_fix col_wrap col_head">
            <span class="col col_1">发票类型</span>
            <span class="col col_2">发票抬头</span>
            <span class="col col_3">发票内容</span>
            <span class="col col_4">操作</span>
        </h3>
        <div class="invoice_list">
            <template>
                <div v-if="invoiceList.length">
                    <ul>
                        <li class="clear_fix col_wrap" v-for="item of invoiceList">
                            <div class="col col_1">
                                {{item.invoiceType===1?'普通发票':'电子发票'}}
                            </div>
                            <div class="col col_2">{{item.invoiceName}}</div>
                            <div class="col col_3">{{item.invoiceContentName}}</div>
                            <div class="col col_4">
                                <a
                                        href="javascript:void(0)"
                                        class="edit_btn"
                                        @click="editInvoice(item.invoiceid)">编辑</a>
                                <a
                                        href="javascript:void(0)"
                                        class="delete_btn"
                                        @click="deleteInvoice(item.invoiceid)">删除</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div v-else class="no_content text_center">暂无发票</div>
            </template>
            <template>
                <div class="edit_invoice pop_view" v-show="isShowEditInvoice">
                    <div class="cover"></div>
                    <div class="inner">
                        <h3 class="title">
                            发票信息
                            <a href="javascript:void(0)" @click="isShowEditInvoice=false"
                               class="close_btn">取消</a>
                        </h3>
                        <div class="form">
                            <p class="input_wrap">
                                * 发票类型：
                                <label :class="{active:invoice.invoiceType===1}">
                                    普通发票
                                </label>
                            </p>
                            <p class="input_wrap">
                                * 发票抬头：
                                <label :class="{active:invoice.invoiceTitle===1}"
                                       @click="invoice.invoiceTitle=1">个人</label>
                                <label :class="{active:invoice.invoiceTitle===2}"
                                       @click="invoice.invoiceTitle=2">单位</label>
                            </p>
                            <template v-if="invoice.invoiceTitle===1">
                                <p class="input_wrap">
                                    * 姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
                                    <input type="text"
                                           class="input"
                                           v-model.trim="personalInvoice.invoiceName"
                                           maxlength="30">
                                </p>
                                <p class="input_wrap">
                                    * 发票内容：
                                    <label v-for="item of invoiceContentList"
                                           :class="{active:personalInvoice.invoiceContent===item.itemId}"
                                           @click="personalInvoice.invoiceContent=item.itemId">
                                        {{item.itemName}}
                                    </label>
                                </p>
                            </template>
                            <template v-if="invoice.invoiceTitle===2">
                                <p class="input_wrap">
                                    * 企&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：
                                    <input type="text"
                                           class="input"
                                           v-model.trim="companyInvoice.invoiceName"
                                           maxlength="30">
                                </p>
                                <div class="input_wrap clear_fix">
                                    <span class="taxTitle">纳税人识别号或社会统一信用代码：</span>
                                    <input type="text"
                                           class="input"
                                           v-model.trim="companyInvoice.taxNumber"
                                           maxlength="20">
                                    <a class="taxpayer_txt f_right">
                                        为了您能顺利报销，请准确填写纳税人识别号<br>
                                        一旦提交不可修改和重开。
                                    </a>
                                </div>
                                <p class="input_wrap">
                                    * 发票内容：
                                    <label v-for="item of invoiceContentList"
                                           :class="{active:companyInvoice.invoiceContent===item.itemId}"
                                           @click="companyInvoice.invoiceContent=item.itemId">
                                        {{item.itemName}}
                                    </label>
                                </p>
                            </template>
                            <div class="btn_wrap">
                                <button class="submit_btn" @click="saveInvoice(0)">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </template>
        </div>
    </section>
    <section class="paging clear_fix" :class="{hide:Math.ceil(pageCount)<2}">
        <div class="paging_wrap"></div>
    </section>
</div>
</div>
    <jsp:include page="../foot.jsp"/>
</article>
<script>
    var invoiceContentList = null;
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
<script src="<%=request.getContextPath()%>/static/js/page.js"></script>
<script src="<%=request.getContextPath()%>/static/js/invoice.js"></script><!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHf74vPyGK2"};</script>
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


