<%--
  Created by IntelliJ IDEA.
  User: yu
  Date: 2018/11/9
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Language" content="zh-CN" />
    <title>收货地址-诺心LECAKE</title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />

    <meta property="qc:admins" content="24055663606453135637573071645060454" />
    <meta property="wb:webmaster" content="bebfa4568578b1d6" />
    <meta http-equiv="cache-control" content="max-age=1800" />
    <link rel="shortcut icon" href="/favicon.ico?01"/>

    <!-- 强制转换浏览器浏览模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!--解决IE6不支持png图片透明问题-->
    <!--[if IE 6]>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/dd_belatedpng.js"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('*');
    </script>
    <![endif]-->
    <!--/解决IE6不支持png图片透明问题-->
    <link type="text/css" href="<%=request.getContextPath()%>/static/css/comm_header.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/tnstyle.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/tnheadandfootstyle.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/tnindexstyle.css"/><!----样式按此顺序排放------>
    <script type="text/javascript">var glbStatConfig={stat_host:"res.lecake.com",click_id: "KyJFi7qsvt9n"};</script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/mystat.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/tnlecakeindex.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/base.css">
    <link type="text/css" href="<%=request.getContextPath()%>/static/css/widget.css" rel="stylesheet"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/html5.min.js"></script>
    <![endif]-->
    <link type="text/css" href="<%=request.getContextPath()%>/static/css/member.css" rel="stylesheet" />

    <script type="text/javascript" charset="UTF-8">
        /* <![CDATA[ */
        try { if (undefined == xajax.config) xajax.config = {}; } catch (e) { xajax = {}; xajax.config = {}; };
        xajax.config.requestURI = "/shop/member_consignee.html";
        xajax.config.statusMessages = false;
        xajax.config.waitCursor = true;
        xajax.config.version = "xajax 0.5";
        xajax.config.legacy = false;
        xajax.config.defaultMode = "asynchronous";
        xajax.config.defaultMethod = "POST";
        /* ]]> */
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/xajax_core.js" charset="UTF-8"></script>

    <script type='text/javascript' charset='UTF-8'>
        /* <![CDATA[ */
        xajax_do_req_header = function() { return xajax.request( { xjxfun: 'do_req_header' }, { parameters: arguments } ); };
        xajax_do_req_user = function() { return xajax.request( { xjxfun: 'do_req_user' }, { parameters: arguments } ); };
        /* ]]> */
    </script>
    <style>
        .member_box a{
            color:#057BD2;
            text-decoration:underline;
        }
    </style>

</head>
<body>

<script type="text/javascript">
    $(function() {
//        $(".wrapper").css("float","left")
        //获取主商品的价格添加到换了价内
        var space_z="";
        $("#spec").text(space_z);
        //删除最后一个棕色的加号
        $("dd[class=TN_teemred]:last").remove();
        var isnull=$(".TN_gou").html();
        if(isnull==null){
            $(".TN_Goodsteem").remove();
        }
    });


</script>
<div class="TN_topheader hide">
    <!-- 城市列表 -->
    <div class="TN_chooseADD">
        <div class="Ndd">
            <span class="Wadd">选择地点：</span>
            <div class="Xadd">
                <a href="/index.html" data-site-id="2" onclick="return city.set_city('2','上海市','SH');" cityFlg="2">上海市</a>
                <a href="/index.html" data-site-id="287" onclick="return city.set_city('287','北京市','BJ');" cityFlg="287">北京市</a>
                <a href="/index.html" data-site-id="420" onclick="return city.set_city('420','广州市','GZ');" cityFlg="420">广州市</a>
                <a href="/index.html" data-site-id="355" onclick="return city.set_city('355','南京市','NJ');" cityFlg="355">南京市</a>
                <a href="/index.html" data-site-id="449" onclick="return city.set_city('449','成都市','CD');" cityFlg="449">成都市</a>
                <a href="/index.html" data-site-id="499" onclick="return city.set_city('499','重庆市','CQ');" cityFlg="499">重庆市</a>
                <a href="/index.html" data-site-id="386" onclick="return city.set_city('386','深圳市','SN');" cityFlg="386">深圳市</a>
                <a href="/index.html" data-site-id="83" onclick="return city.set_city('83','杭州市','HZ');" cityFlg="83">杭州市</a>
                <a href="/index.html" data-site-id="228" onclick="return city.set_city('228','苏州市','SZ');" cityFlg="228">苏州市</a>
                <a href="/index.html" data-site-id="334" onclick="return city.set_city('334','天津市','TJ');" cityFlg="334">天津市</a>
                <a href="/index.html" data-site-id="356" onclick="return city.set_city('356','宁波市','NB');" cityFlg="356">宁波市</a>
                <a href="/index.html" data-site-id="261" onclick="return city.set_city('261','无锡市','WX');" cityFlg="261">无锡市</a>
                <a href="/index.html" data-site-id="446" onclick="return city.set_city('446','绍兴市','SX');" cityFlg="446">绍兴市</a>
                <a href="/index.html" data-site-id="447" onclick="return city.set_city('447','嘉兴市','JX');" cityFlg="447">嘉兴市</a>
            </div>
        </div>
    </div>
    <script>
        var objCityList = [];
        objCityList['SH'] = '上海市';
        objCityList['BJ'] = '北京市';
        objCityList['GZ'] = '广州市';
        objCityList['NJ'] = '南京市';
        objCityList['CD'] = '成都市';
        objCityList['CQ'] = '重庆市';
        objCityList['SN'] = '深圳市';
        objCityList['HZ'] = '杭州市';
        objCityList['SZ'] = '苏州市';
        objCityList['TJ'] = '天津市';
        objCityList['NB'] = '宁波市';
        objCityList['WX'] = '无锡市';
        objCityList['SX'] = '绍兴市';
        objCityList['JX'] = '嘉兴市';


    </script>

    <!-- 导航 -->
    <div class="TN_menu">
        <ul>
            <li class="TN_LEFTone">
                <dt><a href="/"><img alt="首页" src="<%=request.getContextPath()%>/static/picture/tntoplist1.jpg"></a></dt><!-----首页1----->
                <dd><a href="/"></a></dd>
            </li>
            <li>
                <!---蛋糕馆--->
                <dt><a href="/category-0-1.html"><img alt="蛋糕馆" src="<%=request.getContextPath()%>/static/picture/tntoplist2.jpg"></a></dt>
                <dd><a href="/category-0-1.html"></a></dd>
                <dt class="TN_drop-down">
                    <div class="TN_drop-down_menuBG" style=" height:370px;"></div><!----height=170px=40px*4+10px---下拉菜单默认4个，数量改变请同步改变heigh的值------>
                    <div class="TN_drop-down_menu">
                        <p><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                        <ul class="L">
                            <li ><a href="/category-104-1.html">芝士口味</a>
                            <li ><a href="/category-121-1.html">雪域口味</a>
                            <li ><a href="/category-101-1.html">慕斯口味</a>
                            <li ><a href="/category-103-1.html">巧克力味</a>
                            <li ><a href="/category-102-1.html">拿破仑口味</a>
                            <li ><a href="/category-112-1.html">鲜果口味</a>
                            <li ><a href="/category-113-1.html">冰淇淋味</a>
                            <li ><a href="/category-114-1.html">奶油口味</a>
                            <li  class="TN_noneBUT"><a href="/category-124-1.html">其他</a>
                                <!--<li class="TN_noneBUT"><a href="javascript:void(0)" onclick="allOperate.pointsArea(); return false;" target="_blank">积分专区</a></li>-->
                        </ul>
                        <!-----宽度有限，数字控制在5个字------------------->
                    </div>
            </li>

            <li>
                <!----甜品馆---->
                <dt><a href="/category-1000-1.html"><img alt="甜品馆" src="<%=request.getContextPath()%>/static/picture/tntoplist7.jpg"></a></dt>
                <dt class="TN_drop-down">
                    <div class="TN_drop-down_menuBG" style="height: 0px"></div>
                    <!--div class="TN_drop-down_menu">
                        <p><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                        <ul class="L">
                            <li class="TN_noneBUT"><a href="/shop/member_user.html" target="_blank">蝴蝶酥</a></li>
                        </ul>
                    </div-->
            </li>


            <li class="TN_logo" style=" margin: 0 10px;">
                <img alt="诺心蛋糕" src="<%=request.getContextPath()%>/static/picture/tntoplistlogo.jpg" width="271" height="52" />
            </li>

            <li  style="margin-left: 0px; ">
                <!----我的诺心---->
                <dt><a href="/shop/member_user.html"><img alt="我的诺心" src="<%=request.getContextPath()%>/static/picture/tntoplist3.jpg"></a></dt>
                <dd><a href="/shop/member_user.html"></a></dd>
                <dt class="TN_drop-down">
                    <div class="TN_drop-down_menuBG" style="height: 170px"></div>
                    <div class="TN_drop-down_menu">
                        <p><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                        <%--<ul class="L">--%>
                            <%--<li><a href="/i/duihuan/" target="_blank">LECLUB</a></li>--%>
                            <%--<li><a href="/shop/member_order.html?orderflg=1" target="_blank">我的订单</a></li>--%>
                            <%--<!--<li><a href="/shop/member_user.html?operFlg=1" target="_blank">我的信息</a></li>-->--%>
                            <%--<li><a href="/customer/find-pw.html" target="_blank">找回密码</a></li>--%>
                            <%--<!--<li><a href="/shop/member_pwd.html" target="_blank">修改密码</a></li>-->--%>

                            <%--<li class="TN_noneBUT"><a href="/customer/czcard.html" target="_blank">礼卡专区</a></li>--%>
                        <%--</ul>--%>
                    </div>
            </li>

            <li>
                <!----企业专区---->
                <dt style="cursor: pointer"><img alt="企业专区" src="<%=request.getContextPath()%>/static/picture/tntoplist4.jpg"></dt>
                <dd style="cursor: pointer"></dd>
                <dt class="TN_drop-down">
                    <div class="TN_drop-down_menuBG" style="height: 170px"></div>
                    <div class="TN_drop-down_menu">
                        <p><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                        <ul class="L">
                            <!-- <li><a href="/companyActive-2.html">企业SC</a></li> -->
                            <li><a href="/shop/companyPurchase.html">企业采购</a></li>
                            <li><a href="/shop/ncompany/nlogin.html">大客户区</a></li>
                            <li class=""><a href="/company/welfare.html">福利券区</a></li>
                            <li class="TN_noneBUT"><a href="/shop/bank_list.html">合作专区</a></li>
                            <li><a href="/shop/help-637.html">国航专区</a></li>
                            <li><a href="/company/snack.html">小食盒区</a></li>
                        </ul>
                    </div>
                </dt>
            </li>
            <li>
                <!---关于诺心-->
                <dt style="cursor: pointer"><img alt="关于诺心" src="<%=request.getContextPath()%>/static/picture/tntoplist8.jpg"></dt>
                <dd style="cursor: pointer"></dd>
                <dt class="TN_drop-down">
                    <div class="TN_drop-down_menuBG" style="height: 290px"></div>
                    <div class="TN_drop-down_menu">
                        <p><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                        <ul class="L">
                            <li><a href="/siteNews.html">诺心新闻</a></li>
                            <li><a href="/companyActive-1.html">诺心公告</a></li>
                            <li><a href="/shop/help-31.html">公司简介</a></li>
                            <li><a  href="/shop/help-47.html">诺心故事</a></li>
                            <li><a  href='/shop/help-48.html'>品牌理念</a></li>
                            <li><a  href="/shop/help-54.html">诺心食材</a></li>
                            <li class="TN_noneBUT"><a href="/shop/help-71.html">联系我们</a></li>
                        </ul>
                    </div>
                </dt>
            </li>
        </ul>
    </div>
    <!-- 登录|购物车 -->
    <div class="TN_list">
        <ul>
            <li id="g_now_city" class="TN_address">
                上海站
            </li>
            <li class="TN_call">
                全国客服热线&nbsp;&nbsp;4001-578-578&nbsp;&nbsp;服务时间&nbsp;&nbsp;8:30-22:30
            </li>
            <li class="TN_done">
                <span id="welcome"></span>
                <a id="shop_cart" class="cursorPointer" onclick="self.location='/shop/cart.html'">购物车<span id="js_cart_goods_number" class="TNgg">0</span>件</a><span class="TN_st">|</span>
                <a class="cursorPointer" onclick="allOperate.getBuyHelp(); return false;" target="_blank">帮助</a>
                <div id="cart_list" class="cart-list"></div>
            </li>
        </ul>


        <!-- 2014.06.27 头部公告 BJ 显示时间：9.1-9.3，  9月3号下午16:00后 -->



    </div>
</div>


<!-- 2014.06.27 头部公告 -->
<script type="text/javascript">
    $(".TN_gonggao .gonggaoMS").mousemove(function(){
        $(".TN_gonggao marquee").attr("scrollamount","0");
    });
    $(".TN_gonggao .gonggaoMS").mouseout(function(){
        $(".TN_gonggao marquee").attr("scrollamount","4");
    });
    /*
        var oMarquee = document.getElementById("listtow"); //滚动对象
      if(oMarquee) {
        var iLineHeight = 25; //单行高度，像素
        var iLineCount = $("ul#listtow li").length;//实际行数
        if(iLineCount==0)
        {
            $("ul#listtow").css("display","none");
        }
        //alert(iLineCount);
        //var iLineCount = 2; //实际行数
        var iScrollAmount = 1; //每次滚动高度，像素
        function run() {
            oMarquee.scrollTop += iScrollAmount;
            if ( oMarquee.scrollTop == iLineCount * iLineHeight )
                oMarquee.scrollTop = 0;
            if ( oMarquee.scrollTop % iLineHeight == 0 ) {
                window.setTimeout( "run()", 4000 ); //暂停的时间
            } else {
                window.setTimeout( "run()", 25 ); //滚动的时间
            }
        }
        oMarquee.innerHTML += oMarquee.innerHTML;
        window.setTimeout( "run()", 4000 );
      }*/


    function foundBG(){
        var y=document.getElementById("focus2").offsetHeight;
        $(".Lbg").css("height",y);
        $(".Rbg").css("height",y);
    }
    function timedMsg()
    {
        var t=setTimeout(foundBG,5000);
    }
    $(document).ready(function(){
        foundBG();
        timedMsg();
    })

</script>

<div id="focus3"><!-----全屏大背景---------->

    <div id="focus2"  class="newbgbox"><!------内容背景第二层--------------->
        <div  class="TN_BigBoxBG " ><!----内容大箱子  结束标签 </div> 位于 comm_footer.tpl -->
            <header class="global_header">
                <div class="wrap">
                    <section class="top_bar">
                        <div class="main_width clear_fix">
                            <a class="select_city f_left" id="selectCity" href="javascript:void(0)"
                               onclick="_statLog.logClick('top_site', '站点',true)">
                                <i></i>
                                <span id="currentCity">上海</span>
                            </a>
                            <h2 class="hide"
                                style="position: absolute;top: 0;width: 750px;left: 200px;color: #ff0000;font-size: 12px;">
                                400电话系统升级通知：亲爱的用户，即日起诺心呼叫中心系统升级，暂时无法接通。若有需要，烦请联系在线客服。谢谢您的谅解。</h2>
                            <div class="f_right">
                                <a href="javascript:void(0)" class="service_btn" id="serviceBtn"
                                   onclick="_statLog.logClick('top_online_service', '在线客服',true)"><i></i>在线客服</a>
                                <a href="javascript:void (0)" class="wx_btn" id="wxBtn"
                                   onclick="_statLog.logClick('top_WeChat', '微信',true)">
                                    <img src="<%=request.getContextPath()%>/static/picture/qr_code_top.png"/>
                                    <i></i>
                                    微信
                                </a>
                            </div>
                        </div>
                    </section>
                    <section class="global_nav">
                        <div class="main_width clear_fix">
                            <div class="f_left logo_wrap">
                                <a href="/">
                                    <img src="<%=request.getContextPath()%>/static/picture/logo_new.png" style="height: 20px;"/>
                                </a>
                            </div>
                            <ul class="nav f_left">
                                <li>
                                    <a href="/" class="<?= $activeLink == 'home' ? ' active' : '' ?>"
                                       onclick="_statLog.logClick('nav_home', '首页',true)">首页</a>
                                </li>
                                <li>
                                    <a href="/category-0-1.html"
                                       onclick="_statLog.logClick('nav_cake', '蛋糕',true)">蛋糕</a>
                                </li>
                                <li class="gift">
                                    <a href="/category-1000-1.html"
                                       onclick="_statLog.logClick('nav_gift', '礼品',true)">礼品</a>
                                </li>
                                <li class="have_inner" id="enterpriseLink">
                                    <a href="javascript:void(0)">企业专区</a>
                                    <div class="inner_wrap"></div>
                                </li>
                                <li class="have_inner" id="customerLink">
                                    <a href="/shop/member_user.html">我的诺心</a>
                                    <div class="inner_wrap"></div>
                                </li>
                            </ul>
                            <div class="f_right">
                                <span id="customerName"></span>
                                <a href="/shop/cartindex.html" class="nav_cart f_right"
                                   onclick="_statLog.logClick('nav_carts', '购物车',true)">
                                    <i></i>
                                    <strong class="global_cart_num"
                                            id="globalCartNum" style="display: none">
                                        <b></b>
                                    </strong>
                                </a>
                            </div>
                        </div>
                    </section>
                </div>
            </header>
            <script>
                var isLecakeCNDomain =     false;
                $(function () {
                    //顶部切换导航
                    $('.have_inner').hover(function () {
                        $(this).find('.inner_wrap').fadeIn(200);
                    }, function () {
                        $(this).find('.inner_wrap').fadeOut(200);
                    });
                    /**
                     * 点击心享卡图标
                     * 如果已经购买了心享卡权益，则显示心享卡说明，否则跳转权益购买页面
                     */
                    $(document).on('click', '#passCardFlag', function () {
                        if ($(this).hasClass('active')) {
                            $('    <article class="container main_pass_card_rule" id="passCardRule">\n' +
                                '        <div class="main">\n' +
                                '            <a href="javascript:void(0)" id="closePassCardRule" class="close_btn">关闭</a>\n' +
                                '            <h3>【心享卡使用指南】</h3>\n' +
                                '            <h4>1. 心享卡是面向诺心用户的专享特权。心享卡会员可获得「购买千层系列蛋糕权益」。</h4>\n' +
                                '            <h4>2. 心享卡会员购买任意诺心千层系列蛋糕，可享立减50元优惠。</h4>\n' +
                                '            <h4>3. 心享卡会员购买全场蛋糕单笔订单实付满178元（不含运费），可享心享值积分返利；每实付10元累计1个心享值（心享值48小时以内到账；实际现金消费指微信、支付宝支付）。</h4>\n' +
                                '            <h4>4. 心享值结算蛋糕、礼品、配件时（不含运费），可直接抵扣现金，1心享值=1元；现有积分和心享值可同时获取累计，但不可同时使用）。</h4>\n' +
                                '            <h4>5. 权益购买后即刻生效，有效期为1年，心享值永久有效。</h4>\n' +
                                '        </div>\n' +
                                '    </article>').appendTo($('body'));
                            $('#closePassCardRule').click(function () {
                                $('#passCardRule').remove();
                            });
                        } else {
                            // window.location = '/shop/help-625.html';
                        }
                    });
                    (function () {
                        //构造企业专区、我的诺心链接
                        var enterpriseLis = $('.TN_menu>ul>li:eq(5) .TN_drop-down_menu li'),
                            customerDomLis = $('.TN_menu>ul>li:eq(4) .TN_drop-down_menu li'),
                            enterpriseLinks = '',
                            customerDomLinks = '';
                        $.each(enterpriseLis, function () {
                            var me = $(this).find('a');
                            enterpriseLinks += '<a href="' + me.attr('href') + '" class="inner_item">' + me.text() + '</a>';
                        });
                        $.each(customerDomLis, function () {
                            var me = $(this).find('a');
                            customerDomLinks += '<a href="' + me.attr('href') + '" class="inner_item" target="_blank">' + me.text() + '</a>';
                        });
                        $('#enterpriseLink .inner_wrap').html(enterpriseLinks);
                        $('#customerLink .inner_wrap').html(customerDomLinks);
                        //埋点
                        var enterpriseTypes = [['nav_procurement', '企业采购'], ['nav_major_account', '大客户区'], ['nav_Welfare ', '福利券区'], ['nav_Bank', '合作专区'], ['nav_AirChina', '国航专区'], ['nav_Snack', '小食盒区']],
                            customerTypes = [['nav_lecake', 'leclub'], ['nav_order', '我的订单'], ['nav_password ', '找回密码'], ['nav_Gift_cards', '礼卡专区']];
                        $('#enterpriseLink .inner_wrap a').each(function () {
                            var me = $(this),
                                title = $.trim(me.text());
                            $.each(enterpriseTypes, function (i, v) {
                                if (title === v[1]) {
                                    me.attr('onclick', '_statLog.logClick("' + v[0] + '", "' + title + '")');
                                }
                            });
                        });
                        $('#customerLink .inner_wrap a').each(function () {
                            var me = $(this),
                                title = $.trim(me.text()).toLowerCase();
                            $.each(customerTypes, function (i, v) {
                                if (title === v[1]) {
                                    me.attr('onclick', '_statLog.logClick("' + v[0] + '", "' + title + '")');
                                }
                            });
                        });
                    })();
                });


                //添加购物车
                var globalCart = {
                    //单个商品编辑购物车,构造如['sku_id'=>102025,'amount'=>2,'attributes'=>['goods_cut'=>0,'goods_birthday'=>'']]的格式,amount为0时为删除
                    //obj = {sku_id:int,amount:int,attributes:array,success:fn,fail:fn,always:fn} || {params:[{sku_id:int,amount:int,attributes:array}],success:fn,fail:fn,always:fn}
                    update: function (obj, isAdd) {
                        var params,
                            itemInfo;
                        if (!obj.params) {
                            itemInfo = {
                                sku_id: obj.sku_id,
                                amount: obj.amount || 1,
                                checked: obj.checked
                            };
                            if (obj.attributes) {
                                itemInfo.attributes = obj.attributes;
                            }
                            params = [itemInfo];
                        } else {
                            params = obj.params;
                        }
                        var url = isAdd ? '/cart/add-new.html' : '/cart/update-new.html';
                        $.ajax({
                            method: 'get',
                            url: url,
                            data: {
                                params: params
                            }
                        }).done(function (res) {
                            if (res.error === 0) {
                                //更新全局购物车数量
                                globalCart.count();
                                obj.success && obj.success(res.data);
                            } else {
                                obj.fail && obj.fail(res.msg);
                            }
                        }).fail(function () {
                            obj.fail && obj.fail('编辑购物车失败');
                        }).always(function (res) {
                            obj.always && obj.always(res);
                        });
                    },
                    //全局购物车数量
                    count: function (dom) {
                        dom = dom || $('#globalCartNum');
                        var num = get_COOKIE_INFO('CARTCNT');
                        if (num && parseInt(num) > 0) {
                            dom.show().find('b').text(num);
                        } else {
                            dom.hide().find('b').text(0);
                        }
                    }
                };

                var app_js = {
                    /**
                     * 购买商品函数，
                     * @param sku_id 商品SKU ID 或 SKU ARRAY => [{sku_id: 100000, amount: 1}]
                     * @param amount  数量 默认1
                     * @param quickBuyFlag true OR false, default false 购买成功后是否直接跳转结算页
                     * @param fn   购买结果回调
                     * @param isNew 是否是新购物车接口
                     */
                    buyItem: function (sku_id, amount, quickBuyFlag, fn) {
                        var params = [];
                        amount = amount || 1;
                        fn = fn || {};
                        if (typeof sku_id === 'object') {
                            //代表是id数组
                            params = sku_id;
                        } else {
                            if (!sku_id) {
                                comm_alert("添加购物车失败！（未输入商品ID）");
                                return;
                            }
                            params.push({
                                sku_id: sku_id,
                                amount: amount,
                                checked: 1
                            });
                        }
                        if (quickBuyFlag) {
                            $.ajax({
                                method: 'get',
                                url: '/cart/to-order.html',
                                data: {
                                    params: params
                                }
                            }).done(function (res) {
                                if (res.error === 0) {
                                    if (fn.success) {
                                        fn.success(res.data);
                                    } else {
                                        //跳转结算页
                                        window.location = '/order/index.html?buyId=' + res.data.buyId;
                                    }
                                } else {
                                    if (fn.fail) {
                                        fn.fail(res.msg);
                                    } else {
                                        comm_alert(res.msg);
                                    }
                                }
                            }).fail(function () {
                                if (fn.fail) {
                                    fn.fail('提交失败，请重试');
                                } else {
                                    comm_alert('提交失败，请重试');
                                }
                            }).always(function () {
                                fn.always && fn.always();
                            });
                        } else {
                            globalCart.update({
                                params: params,
                                always: function () {
                                    fn.always && fn.always();
                                },
                                success: function () {
                                    if (fn.success) {
                                        fn.success();
                                    } else {
                                        window.location = '/cart/index.html';
                                    }
                                },
                                fail: function (msg) {
                                    if (fn.fail) {
                                        fn.fail(msg);
                                    } else {
                                        comm_alert(msg);
                                    }
                                }
                            }, true);
                        }
                    }
                };
            </script>

            <div id="container">

                <!--开始-->
                <div class="member_container" style="text-align:left;margin:0px auto;">
                    <style>
                        .member_title{
                            width:986px; height:60px;padding:0px; margin-top:15px;
                        }
                        .member_title .picture{
                            width:166px;
                            height:45px;
                            background: url("<%=request.getContextPath()%>/static/images/myaccount_title_02.png") no-repeat;

                        }

                        .member_title .logo{
                            margin-top:-35px;
                        }

                        .member_title .all{
                            width:800px;
                            position:relative;
                            top:-30px;
                            margin-left:185px;
                            font-size:12px;

                        }
                        #username_shop{
                            font-weight: bold;
                            color:#FD9A00;
                            font-size:15px;
                            width:800px;
                            margin-top:20px;

                        }
                        .notice{

                            width:200px;
                            height:30px;
                            margin-top:10px;
                        }
                    </style>
                    <div class="member_title">
                        <div class="picture"></div>
                        <!--<div class="logo"></div>-->
                        <div class="all">
                            <div id="username_shop">
                                <span style="font-size:12px;color:#000;!important ">欢迎您:</span>
                                ${num==1?user1.phoneNum:user2.account}
                                <span style="font-size:12px;color:#000;!important ">，欢迎光临诺心商城。</span>
                            </div>
                        </div>
                    </div>
                    <div class="member">
                        <script type="text/javascript">
                            function doMemberLogout(){
                                if (check_confirm('您确定要退出吗？'))
                                    self.location = '/shop/logout.html';
                            }
                        </script>

                        <div class="menu">
                            <div class="box">
                                <!-- 会员中心菜单开始 -->
                                <dl>
                                    <dt>会员中心</dt>
                                    <dd >
                                        <a href="/shop/member_user.html?operFlg=1">首页</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>交易记录</dt>
                                    <dd >
                                        <a href="/shop/member_order.html?orderflg=1">我的订单</a>
                                    </dd>
                                    <!--
                                    <dd {if $classFlg=='tuanOrder'}class="current"{/if}>
                                        <a href="/shop/tuan_order.html">团购订单</a>
                                    </dd>
                                    -->
                                </dl>
                                <dl>
                                    <dt>我的账户</dt>
                                    <dd >
                                        <a href="/shop/member_account.html?userId=${num==1?user1.id:user2.id}">积分明细</a>

                                    </dd>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_accountHistory.html">积分明细</a>--%>
                                    <%--</dd>--%>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_balance.html">账户余额</a>--%>
                                    <%--</dd>--%>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_balanceHistory.html">余额明细</a>--%>
                                    <%--</dd>--%>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_cake_coupons.html?flg=1">蛋糕卡</a>--%>
                                    <%--</dd>--%>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_coupons.html?flg=1">优惠券</a>--%>
                                    <%--</dd>--%>
                                </dl>
                                <!--<dl>
                                    <dt>我的收藏</dt>
                                    <dd >
                                        <a href="/shop/member_favorites.html">商品收藏</a>
                                    </dd>			
                                </dl>-->
                                <dl>
                                    <dt>我的咨询</dt>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_consultation.html">商品咨询</a>--%>
                                    <%--</dd>--%>
                                    <dd >
                                        <a href="getComment.html?userId=${num==1?user1.id:user2.id}">商品评论</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>个人设置</dt>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_user_profile.html">LE家族</a>--%>
                                    <%--</dd>--%>
                                    <dd >
                                        <a href="/shop/member_editUser.html?userId=${num==1?user1.id:user2.id}">修改资料</a>
                                    </dd>
                                    <dd >
                                        <a href="/customer/edit-password.html?userId=${num==1?user1.id:user2.id}">修改密码</a>
                                    </dd>

                                    <dd class="current">
                                        <a href="/shop/member_consignee.html?userId=${num==1?user1.id:user2.id}">收货地址</a>
                                    </dd>
                                    <%--<dd >--%>
                                        <%--<a href="/shop/member_invoice.html">发票管理</a>--%>
                                    <%--</dd>--%>
                                    <!--
                                    <dd {if $classFlg=='easybuy'}class="current"{/if}>
                                        <a href='/shop/member_easybuy.html'>轻松购</a>
                                    </dd>
                                    -->
                                </dl>

                                <dl>
                                    <dt>其他操作</dt>
                                    <dd>
                                        <a href="javascript:if (confirm('您确定要退出登录吗？')) self.location = '/shop/logout.html';">退出登录</a>
                                    </dd>
                                </dl>
                                <!-- 会员中心菜单 结束 -->
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                        <div class="main">
                            <h2 class="title">管理收货地址</h2>
                            <p class="tar">
                                <img src="<%=request.getContextPath()%>/static/picture/li_02.gif" alt="">&nbsp;&nbsp;
                                <a href="<%=request.getContextPath()%>/shop/member_consignee_add_add.html">添加新的收货地址</a>
                            </p>
                            <div class="member_box">
                                <table>
                                    <thead>
                                    <tr>
                                        <td style="text-align:center;" width="10%">收货人</td>
                                        <td style="text-align:center;" width="41%">地址</td>
                                        <%--<td style="text-align:center;" width="9%">邮编</td>--%>
                                        <td style="text-align:center;" width="14%">手机</td>
                                        <%--<td style="text-align:center;" width="14%">电话</td>--%>
                                        <td style="text-align:center;" width="12%">操作</td>
                                    </tr>
                                    <c:forEach  items="${address}" var="address">
                                    <tr>
                                        <td style="text-align:center;" width="10%">${address.receiveName}</td>
                                        <td style="text-align:center;" width="41%">${address.province.name}${address.city.name}${address.detailAddr}${address.homeNum}</td>
                                        <%--<td style="text-align:center;" width="9%">邮编</td>--%>
                                        <td style="text-align:center;" width="14%">${address.phoneNum}</td>
                                        <%--<td style="text-align:center;" width="14%">电话</td>--%>
                                        <td style="text-align:center;" width="12%">
                                            <a href="<%=request.getContextPath()%>/shop/member_consignee_edit.html?addressId=${address.id}">编辑</a>
                                            <a href="<%=request.getContextPath()%>/shop/member_consignee_del.html?addressId=${address.id}&userId=${num==1?user1.id:user2.id}">删除</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </thead>
                                </table>
                            </div>

                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
            </div>


            <!-- 公共javascript文件 -->
            <script type="text/javascript">
                var global = {
                    img_path: "//rescdn.lapetit.cn/shop/lecake/theme/xth2/images",
                    file_path: "//rescdn.lapetit.cn/shop/lecake/theme/xth2",
                    href: window.location.host,
                    cookie_domain: ".lecake.com",
                    isSSL: 0
                };
                $("base").attr("href", "//" + global.href);

            </script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/site.js"></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/global.js"></script>

            <script type="text/javascript">
                //显示客户登录状态
                customer.show_IDENTIFIER();
                //购物车商品数量
                cart.goods_amount();
                if (document.getElementById("searchTemp")) {
                    init_search_suggestion(document.getElementById("searchTemp"),1,1);
                }
                init_lazy();
            </script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/common.js"></script>
            <script type="text/javascript">
                var deliver = {
                    del : function(deliverID){
                        xajax_do_req_header(deliverID,9);
                    },

                    callback : function(deliverID){
                        comm_alert("客户地址信息已删除",3);
                        $("#deliver_" + deliverID).remove();
                    }
                }

            </script>

            <!---------footer star---------------------------------->
        </div><!--  开始标签 <div class="TN_BigBoxBG"> 位于 comm_naviBanner.tpl -->
        <div class="TN_footer hide">
            <div class="TN_footercen">

                <div class="TN_Fone">
                    <span class="TN_but_logo"><img src="<%=request.getContextPath()%>/static/picture/tn_but_logo.png" width="258" height="55" /></span>
                    <span class="TN_butL_Byu">新鲜配送上门</span>
                    <!--span class="TN_but_flower"><img src="<%=request.getContextPath()%>/static/picture/tn_footflower_14.jpg" width="22" height="24" /></span--->
                    <p style="margin-right: 5px">
                    <p>
                        <a href="/SH/index.html" class="L" onclick="return city.set_city('2','上海市','SH');">上海</a>
                        <span class="TN_st">|</span>        <a href="/index.html" class="L" onclick="return city.set_city('287','北京市','BJ');">北京</a>
                        <span class="TN_st">|</span>        <a href="/GZ/index.html" class="L" onclick="return city.set_city('420','广州市','GZ');">广州</a>
                        <span class="TN_st">|</span>        <a href="/NJ/index.html" class="L" onclick="return city.set_city('355','南京市','NJ');">南京</a>
                        <span class="TN_st">|</span>        <a href="/CD/index.html" class="L" onclick="return city.set_city('449','成都市','CD');">成都</a>
                        <span class="TN_st">|</span>        <a href="/CQ/index.html" class="L" onclick="return city.set_city('499','重庆市','CQ');">重庆</a>
                        <span class="TN_st">|</span>        <a href="/SN/index.html" class="L" onclick="return city.set_city('386','深圳市','SN');">深圳</a>
                        <span class="TN_st">|</span>        <a href="/HZ/index.html" class="L" onclick="return city.set_city('83','杭州市','HZ');">杭州</a>
                        <span class="TN_st">|</span>        <a href="/SZ/index.html" class="L" onclick="return city.set_city('228','苏州市','SZ');">苏州</a>
                        <span class="TN_st">|</span>        <a href="/TJ/index.html" class="L" onclick="return city.set_city('334','天津市','TJ');">天津</a>
                        <span class="TN_st">|</span>        <a href="/NB/index.html" class="L" onclick="return city.set_city('356','宁波市','NB');">宁波</a>
                        <span class="TN_st">|</span>        <a href="/WX/index.html" class="L" onclick="return city.set_city('261','无锡市','WX');">无锡</a>
                        <span class="TN_st">|</span>        <a href="/SX/index.html" class="L" onclick="return city.set_city('446','绍兴市','SX');">绍兴</a>
                        <span class="TN_st">|</span>        <a href="/JX/index.html" class="L" onclick="return city.set_city('447','嘉兴市','JX');">嘉兴</a>
                    </p>

                    </p>
                </div>
                <ul>
                    <li><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_round_l.png" width="52" height="52" />&nbsp;<b>全年无休</b></li>
                    <li><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_round_e.png" width="52" height="52" />&nbsp;<b>安全配送</b></li>
                    <li><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_round_c.png" width="52" height="52" />&nbsp;<b>品质保证</b></li>
                    <li><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_round_a.png" width="52" height="52" />&nbsp;<b>上乘食材</b></li>
                    <li><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_round_k.png" width="52" height="52" />&nbsp;<b>专业客服</b></li>
                    <li><img class="L" src="<%=request.getContextPath()%>/static/picture/tn_round_e.png" width="52" height="52" />&nbsp;<b>企业采购</b></li>
                </ul>
                <p class="TN_Ftow">
                    <!--
                    <a href="#" class="L">关于诺心</a><span>|</span>
                    <a href="#" class="L">人才招聘</a><span>|</span>
                    <a href="#" class="L">联系我们</a><span>|</span>
                    <a href="#" class="L">企业SC</a><span>|</span>
                    <a href="#" class="L">呼叫中心</a><span>|</span>
                    <a href="#" class="L">客服服务</a><span>|</span>
                    -->
                    <a href="/shop/help-1.html" target="_blank" class="L">关于诺心</a><span>|</span>
                    <a href="/shop/help-79.html" target="_blank" class="L">人才招聘</a><span>|</span>
                    <a href="/shop/help-80.html" target="_blank" class="L">联系我们</a><span>|</span>
                    <a href="/shop/help-82.html" target="_blank" class="L">呼叫中心</a><span>|</span>
                    <a href="/shop/help-61.html" target="_blank" class="L">品牌理念</a><span>|</span>
                    <a href="/shop/help-106.html" target="_blank" class="L">客服服务</a><span>|</span>
                    <a href="/shop/help-497.html" target="_blank" class="L">磅改食公告</a><span>|</span>
                    <a href="/shop/help-517.html" target="_blank" class="L">上海迪士尼区域配送调整公告</a><span>|</span>
                    <a href="/shop/help-614.html" target="_blank" class="L">华南区白云机场区域配送调整公告</a><span>|</span>
                    <a href="/shop/help-620.html" target="_blank" class="L">华北天津滨海新区区域配送调整公告</a><span>|</span>
                    <a href="/shop/help-711.html" target="_blank" class="L">诺心LECAKE</a><span>|</span>
                    <a href="/shop/help-717.html" target="_blank" class="L">心悦中秋大礼包</a><span>|</span>

                    <!--  上海工商局 -->
                    <SCRIPT LANGUAGE="JavaScript" >
                        document.writeln("<a href='https://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&entyId=1u2xwmwzpxrk6u2rvor2928au92degmyr8rxc2ylqre60wm'><img src='<%=request.getContextPath()%>/static/picture/gsicon.gif' style='margin-top:-4px' border=0></a>")
                    </SCRIPT>
                </p>
                <p class="TN_Fstree L">
                    <a href="http://www.miibeian.gov.cn/" target="_blank">沪ICP备10211730</a> |
                    <span><a href="//rescdn.lapetit.cn/shop/lecake/theme/xth2/images/index/business_certificate3.jpg" style="margin: 0" target="_blank">社会信用代码：913100005648062293</a></span> |
                    <span><a href="//rescdn.lapetit.cn/shop/lecake/theme/xth2/images/index/business_certificate1.jpg" style="margin: 0" target="_blank">食品经营许可证</a></span> |
                    <span><a href="//rescdn.lapetit.cn/shop/lecake/theme/xth2/images/index/business_certificate2.jpg" style="margin: 0" target="_blank">诺心上海生产许可证</a></span> |
                    <span>copyright©2010-2016诺心lecake.com版权所有</span> <br/>
                    <span>公司名称：诺心食品（上海）有限公司</span> |
                    <span>公司地址：上海徐汇区田林路140号28号楼</span> |
                    <span>客服邮箱: services@lecake.com</span> |
                    <span>公司电话：4001-578-578</span>

                </p>
            </div>
        </div>



        <!--div class="mask hide" id="mask"></div>
        <div class="mask hide" id="pop_mask" style=""></div---->
        <div id="comm_alert" class="comm_alert hide comm_layer">
            <table>
                <tbody>
                <tr>
                    <td class="top_l"></td>
                    <td class="top_c"></td>
                    <td class="top_r"></td>
                </tr>
                <tr>
                    <td class="mid_l"></td>
                    <td class="mid_c">
                        <div class="pb-b-box">
                            <a title="关闭" class="close-popup" onclick="come_bcak_href();" id="aClose_dialog" href="javascript:void(0)">关闭</a>
                            <div class="pb-titleg">
                                <strong>提示信息</strong>
                            </div>
                            <div class="pb-content">
                                <table width="100%">
                                    <tbody>
                                    <tr>
                                        <td class="alert_img" style="width: 37px;"></td>
                                        <td id="comm_error"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="linkbox" id="linkbox">
                                <a onclick="come_bcak_href();" class="link-button" id="btnClose_dialog" href="javascript:void(0)">
                                    <span>确定</span>
                                </a>
                            </div>
                        </div>
                    </td>
                    <td class="mid_r"></td>
                </tr>
                <tr>
                    <td class="bottom_l"></td>
                    <td class="bottom_c"></td>
                    <td class="bottom_r"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="comm_confirm" class="comm_alert comm_layer hide">
            <table>
                <tbody>
                <tr>
                    <td class="top_l"></td>
                    <td class="top_c"></td>
                    <td class="top_r"></td>
                </tr>
                <tr>
                    <td class="mid_l"></td>
                    <td class="mid_c">
                        <div class="pb-b-box">
                            <a title="关闭" class="close-popup" onclick="comm_box.confirm_close(0);" id="aClose_dialog" href="javascript:void(0)">关闭</a>
                            <div class="pb-titleg">
                                <strong>提示信息</strong>
                            </div>
                            <div class="pb-content">
                                <table width="100%">
                                    <tbody>
                                    <tr>
                                        <td class="confirm_img"></td>
                                        <td id="confirm_msg"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="linkbox">
                                <a onclick="comm_box.confirm_close(1);" class="link-button-green" href="javascript:void(0)">
                                    <span>确定</span>
                                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a onclick="comm_box.confirm_close(0);" class="link-button" href="javascript:void(0)">
                                    <span>取消</span>
                                </a>
                            </div>
                        </div>
                    </td>
                    <td class="mid_r"></td>
                </tr>
                <tr>
                    <td class="bottom_l"></td>
                    <td class="bottom_c"></td>
                    <td class="bottom_r"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="popLayer" class="popLayer comm_layer hide">
            <table>
                <tbody>
                <tr>
                    <td class="top_l"></td>
                    <td class="top_c"></td>
                    <td class="top_r"></td>
                </tr>
                <tr>
                    <td class="mid_l"></td>
                    <td class="mid_c">
                        <div class="layerBox">
                            <div class="layerArrow"></div>
                            <div style="padding: 10px;" id="layer_text"></div>
                        </div>
                    </td>
                    <td class="mid_r"></td>
                </tr>
                <tr>
                    <td class="bottom_l"></td>
                    <td class="bottom_c"></td>
                    <td class="bottom_r"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="loadding" class="comm_loadding hide">
            <div>
                <table>
                    <tbody>
                    <tr>
                        <td class="loadding_img"></td>
                        <td class="loadding_str">请稍候......</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="layer hide" id="layer">
            <div class="layer-main" id="layer_main">
                <div class="layer-title" style="background:none repeat scroll 0 0 white;border-bottom:1px solid white;">
                    <h3 id="layer_title"></h3>
                    <button title="关闭" onclick="layer.close();">
                        <span class="hide">╳</span>
                    </button>
                </div>
                <div class="layer-content" id="layer_content" ></div>
                <div class="layer-footer" id="layer_footer" style="background:none repeat scroll 0 0 white;border-top:1px solid white;"></div>
            </div>
        </div>


        <div class="online_service hide">
            <a class="service_btn" href="javascript:void(0)" id="online_service">
                <img class="icon" src="<%=request.getContextPath()%>/static/picture/ico_service.png" alt="" />
                <img class="pop_img service_help" src="<%=request.getContextPath()%>/static/picture/service_help.png" alt="" />
            </a>
            <a class="service_btn" href="javascript:void(0)">
                <img class="icon" src="<%=request.getContextPath()%>/static/picture/ico_wechat.png" alt="" />
                <img class="pop_img wechat_qr_code" src="<%=request.getContextPath()%>/static/picture/wechat_qr_code.png" alt="" />
            </a>
        </div>
        <script>
            (function(a, h, c, b, f, g) {
                a["UdeskApiObject"] = f;
                a[f] = a[f] || function() {
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
                "targetSelector":"#online_service",
                "pop": {
                    "direction": "top",
                    "arrow": {
                        "top": 0,
                        "left": "80%"
                    }
                },"customer":{"nonce":"coTNqsvQcHWKELGT","timestamp":1541755320724,"web_token":"7527158","signature":"608CC30B313B38A66C38C6451003FA4D9BB3400C","c_cn_pcustID":"7527158","c_cn_clickID":"KyJFi7qsvt9n","c_cn_zzuID":"KyHRa3ClJ3wO"}    });
        </script>






        <div id="login_main" class="comm_pop hide" style="margin-top:10px;">
            <div class="eb_div" style="width:450px;">
                <div class="eb_title">
                    <span style="padding-left:15px;">你尚未登录</span>
                    <span class="eb_close" title="关闭" onclick="customer.close_login();">关闭</span>
                </div>
                <div class="eb_opencont">
                    <div id="cust_main">
                        <h3 id="h3_open_reglogin">
                            <span class="span_open_login now" onclick="customer.switchover(this, 1);">登 录</span>
                            <span class="span_open_reg" onclick="customer.switchover(this, 2);">注 册</span>
                        </h3>
                        <div class="alert_underline">
                            <div class="" id="a_triangle_l"></div>
                            <div class="" id="a_triangle_r"></div>
                        </div>
                        <div id="span_open_login">
                            <div class="blank8"></div>
                            <p class="pspt_back_msg" id="login_login_error"></p>
                            <p class="p_item">
                                <label class="itemtitle">用户名：</label>
                                <input type="text" maxlength="60" name="userName" id="login_userName" class="txt" />
                            <div class="pspt_msg" id="login_userName_error"></div>
                            </p>

                            <p class="p_item">
                                <label class="itemtitle">密码：</label>
                                <input type="password" maxlength="30" name="pwd" id="login_pwd" class="txt" />

                            </p>
                            <div class="pspt_msg" id="login_pwd_error"></div>
                            <p class="p_item p_item_vcode">
                                <label class="itemtitle">验证码：</label>
                                <input type="text" maxlength="4" style="" name="yzm" id="login_yzm" class="txt" />
                                <span id="login_yzm_span"></span>&nbsp;
                            <div class="pspt_msg" id="login_yzm_error"></div>
                            </p>

                            <p class="p_item p_btn">
                                <button class="eb_btn login_btn" type="button" onclick="customer.login(2);"><h3>登 录</h3></button>&nbsp;&nbsp;
                                <a class="c_g" target="_blank" href="/customer/find-pw.html">忘记密码？</a>
                            </p>
                            <div class="open_otherlogin hide">
                                <h4 class="h4_otherlogin">您也可以使用合作网站帐号登录</h4>
                                <div class="union_login">
                                    <a href="/shop/unionlogin.html?uniontype=alipay" class="union_alipay">支付宝</a>
                                    <a href="/shop/unionlogin.html?uniontype=sina" class="union_sina">新浪微博</a>
                                    <a href="/shop/unionlogin.html?uniontype=qq" class="union_qq">QQ</a>
                                    <a href="/shop/unionlogin.html?uniontype=renren" class="union_renren">人人网</a>
                                    <a href="/shop/unionlogin.html?uniontype=wanlitong" class="union_wanlitong">平安万里通</a>
                                </div>					</div>
                        </div>

                        <div id="span_open_reg" class="hide">
                            <div class="blank8"></div>
                            <p class="pspt_back_msg" id="reg_fatal_error"></p>
                            <p class="p_item">
                                <label class="itemtitle">手机号：</label>
                                <input type="text" autocomplete="off" maxlength="11" name="userName" id="reg_userName" class="txt" />
                            <div class="pspt_msg" id="reg_userName_error">&nbsp;</div>
                            <!--div class="pspt_msg" id="reg_mobile_error"></div-->
                            </p>
                            <p class="p_item" style="display: none;">
                                <label class="itemtitle">手机号码：</label>
                                <input type="text" maxlength="30" name="mobile" id="reg_mobile" class="txt" />
                            </p>
                            <p class="p_item">
                                <label class="itemtitle">密码：</label>
                                <input type="password" maxlength="30" name="pwd" id="reg_pwd" class="txt" />
                            </p>
                            <div class="pspt_msg" id="reg_pwd_error">&nbsp;</div>
                            <p class="p_item">
                                <label class="itemtitle">确认密码：</label>
                                <input type="password" maxlength="30" name="pwd2" id="reg_pwd2" class="txt" />
                            <div class="pspt_msg" id="reg_pwd2_error">&nbsp;</div>
                            </p>

                            <!--<p class='p_item'>
                                <label class="itemtitle">出生年月：</label>
                                    <select name='birthyear_reg' id='birthyear_reg' onchange="month_reg_change();">
                                        $yearOption-->
                            <!--</select>
                            <select name='birthMonth_reg' id='birthMonth_reg' onchange="day_reg_change();">
                                <option value="">请选择</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <span id='birthday_reg_span'>
                                <select name='birthDay_reg' id='birthDay_reg'>
                                    <option value="">请选择</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                </select>
                            </span>
                    </p>-->
                            <!--<p class="p_item">
                                <label class="itemtitle">加入营区：</label>
                                <div class="chkbox1">
                                    <input type="checkbox" name='applyZone' value='1' class='applyZone'/>&nbsp;&nbsp;篮球营
                                    <input type="checkbox" name='applyZone' value='2' class='applyZone'/>&nbsp;&nbsp;羽球营
                                    <input type="checkbox" name='applyZone' value='3' class='applyZone'/>&nbsp;&nbsp;网球营
                                    <input type="checkbox" name='applyZone' value='4' class='applyZone'/>&nbsp;&nbsp;跑步营
                                </div>
                                <div class='chkbox1'>
                                    <input type="checkbox" name='applyZone' value='5' class='applyZone'/>&nbsp;&nbsp;健身营
                                    <input type="checkbox" name='applyZone' value='6' class='applyZone'/>&nbsp;&nbsp;乒乓营
                                    <input type="checkbox" name='applyZone' value='7' class='applyZone'/>&nbsp;&nbsp;户外运动营
                                    <input type="checkbox" name='applyZone' value='8' class='applyZone'/>&nbsp;&nbsp;运动休闲营
                                </div>
                            </p>-->
                            <p class="p_item">
                                <label class="itemtitle">验证码：</label>
                                <input type="text" maxlength="4" style="" name="yzm" id="reg_yzm" autocomplete="off" class="txt" />
                                <span id="reg_yzm_span"></span>&nbsp;
                            <div class="pspt_msg" id="reg_yzm_error"></div>
                            </p>
                            <p class="p_item">
                                <label class="itemtitle">手机验证码：</label>
                                <input type="text" id="reg_m_vcode" class="reg_vcode" name="mobile_vcode" class="txt" maxlength="6">
                                <button type="button" class="btn-get-vcode" id="get_reg_mobile_vcode">获取验证码</button>
                                <span id="reg_mobile_vcode_span"></span>&nbsp;
                            <div class="pspt_msg" id="reg_mobile_vcode_error"></div>
                            </p>
                            <p class="p_item p_btn">
                                <button class="eb_btn reg_btn" type="button" onclick="customer.register(2,2);"><h3>提交注册信息</h3></button>
                                <br><br>
                                阅读《<a href="/shop/help-41.html" target="_blank">诺心LECAKE蛋糕服务协议</a>》
                            </p>
                        </div>
                    </div>
                    <!--<div id="extend_main">
                        
                        <h2>您是新客户?</h2>
                        <p class="myaccount_title">无需登录即可结帐</p>
                        
                        <p>您无需登录即可购物，</p>
                        
                        <p>在结帐步骤中，会为您提供注册选项。</p>
                        <p><a href="/shop/help-3.html" target="_blank">现在注册送即赠送500积分!详细见积分规则》</a></p>
                        
                        <a href="/shop/checkout.html" class="checkout sprite">&nbsp;</a>
                  
                    </div>-->
                    <div class="blank0"></div>
                </div>
            </div>
        </div>

        <div id="region_pop" class="comm_pop hide" style="z-index: 99;">
            <table>
                <thead>
                <tr>
                    <th>
                        <span class="fl">&nbsp;&nbsp;请选择收货区域</span>
                        <a class="fr" href="javascript: void(0);" onclick="$('#region_pop').hide();$('#ap_provincebox_pop').hide();">[关闭]</a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="height: 50px;line-height: 50px;border-bottom: 0px;">
                        <strong>您的收货区域为</strong>&nbsp;&nbsp;<span id="name_pop"></span> |
                        <a href="javascript: void(0);" onclick="click_region_pop();">
                            切换收货区域
                            <div class="ap_provincebox" id="ap_provincebox_pop">
                                <ul class="title">
                                    <li class="fl blod ml10">选择您的收货区域</li>
                                    <li class="fr">
                                        <a href="javascript:void(0);" class="close" onclick="$('#ap_provincebox_pop').hide();">[关闭]</a>
                                    </li>
                                </ul>
                                <div class="clear"></div>
                                <div class="line" id="part_region_pop"></div>
                                <div class="title fl tar">
                                    <a href="javascript:void(0);" onclick="select_all();" class="pr10">[选择其他区域]</a>
                                </div>
                            </div>
                        </a>
                        &nbsp;&nbsp;<img class="hand" src="<%=request.getContextPath()%>/static/picture/btn_ok.jpg" onclick="pop_add_goods_to_cart();" />
                    </td>
                </tr>
                <tr>
                    <td  style="padding-bottom: 5px;;border-top: 0px;">请正确选择您的收货区域，以免商品超出配送范围！</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div id="add_cart_success" class="comm_pop hide" style="margin-top:150px;">
            <table>
                <thead>
                <tr>
                    <th class="white" id="cp_title" style="width: 30%;"></th>
                    <th class="tar"><a id="CloseLogin" href="javascript:void(0);" onclick="$('#add_cart_success').hide();">[关闭]</a></th>
                </tr>
                </thead>
                <tbody id="success_html">
                </tbody>
            </table>
        </div>

        <!--select city-->
        <div id="city_pop_mask" class="city_mask hide"></div>
        <div id="city_login_main" class="city_comm_pop hide">
            <div class="city_eb_div">
                <div class="lecake_city_logo">
                    <img src="<%=request.getContextPath()%>/static/picture/b_logo.png">
                </div>
                <div id="lecake_city_list" class="lecake_city_list">						<a onclick="city.set_city('2','上海市','SH');">上海市</a>

                    | <a onclick="city.set_city('287','北京市','BJ');">北京市</a>

                    | <a onclick="city.set_city('420','广州市','GZ');">广州市</a>

                    | <a onclick="city.set_city('355','南京市','NJ');">南京市</a>

                    | <a onclick="city.set_city('449','成都市','CD');">成都市</a>

                    | <a onclick="city.set_city('499','重庆市','CQ');">重庆市</a>

                    | <a onclick="city.set_city('386','深圳市','SN');">深圳市</a>

                    | <a onclick="city.set_city('83','杭州市','HZ');">杭州市</a>

                    | <a onclick="city.set_city('228','苏州市','SZ');">苏州市</a>

                    | <a onclick="city.set_city('334','天津市','TJ');">天津市</a>

                    | <a onclick="city.set_city('356','宁波市','NB');">宁波市</a>

                    | <a onclick="city.set_city('261','无锡市','WX');">无锡市</a>

                    | <a onclick="city.set_city('446','绍兴市','SX');">绍兴市</a>

                    | <a onclick="city.set_city('447','嘉兴市','JX');">嘉兴市</a>
                </div>
            </div>
        </div>
        <!--快速购买弹出框-->
        <div id="buy_high_speed" class="buy-com-alert">

        </div>
        <!--快速购买弹出框end-->
        <script type="text/javascript">
            $(document).ready(function() {
                // 倒计时
                var $btn = $('#get_reg_mobile_vcode'),
                    btn_text = '获取验证码',
                    countdown_text = '已发送 <i id="timer">120</i>s';

                var _countdown = function () {
                    var seconds = 120;
                    $('#reg_userName').attr('readonly', true);
                    var countdown_fn = function () {
                        seconds = seconds > 0 ? seconds - 1 : 0;
                        $('#timer').text(seconds);
                        if (seconds != 0)
                            countdown_interval = setTimeout(countdown_fn, 1000);
                        else {
                            clearTimeout(countdown_interval);
                            $btn.text(btn_text);
                            $('#reg_userName').removeAttr('readonly');
                            $btn[0].disabled = false;
                        }
                    };
                    countdown_interval = setTimeout(countdown_fn, 1000);
                };
                // 获取手机验证码
                $btn[0].onclick = function () {
                    var mobile = Utils.trim($("#reg_userName").val());
                    var _yzm = Utils.trim($("#reg_yzm").val());
                    if (!Utils.isMobile(mobile)) {
                        $("#reg_userName_error").addClass("note").text('请输入正确的手机号!');
                        return;
                    }
                    if(_yzm==''){
                        $("#reg_yzm_error").addClass("note").text(customer.yzm_empty);
                        return;
                    }else{
                        $("#reg_yzm_error").removeClass("note").text('');
                    }
                    this.disabled = true;
                    $.ajax({
                        type: 'POST',
                        url: '/shop/wechat/msg.html', //测试接口，请根据实际情况修改
                        data: {mobile:mobile,yzm:_yzm}, //测试传递数据，请根据实际情况修改
                        dataType: 'json',
                        success: function (data) {
                            if(data.isok==1){
                                $btn.html(countdown_text);
                                _countdown();
                            }else{
                                if(data.isok==-1) $("#reg_yzm_error").addClass("note").text(customer.yzm_error);
                                $btn.html(btn_text);
                                $btn[0].disabled = false;
                            }
                        },
                        error: function () {
                            $btn.html(btn_text);
                            $btn[0].disabled = false;
                        }
                    });
                };
            });
        </script></div><!-----大背景第二层----------->

</div><!------全屏大背景----------------------->
<footer class="global_footer clear_both">
    <div class="footer_online text_center">
        <a href="javascript:void(0)" class="service_btn" id="footerServiceBtn"><i></i>在线客服</a>
        <a href="javascript:void (0)" class="wx_btn" id="footerWxBtn">
            <img src="<%=request.getContextPath()%>/static/picture/qr_code_bottom.png"/>
            <i></i>
            微信
        </a>
    </div>
    <div class="footer_tel text_center">
        <p>
            <i></i>
            <span>客服电话：4001-578-578 服务时间（08:30-22:30）</span>
        </p>
    </div>
    <div class="footer_nav clear_fix text_center">
        <p class="clear_fix">
            <a href="/about/notice.html" target="_blank">诺心公告</a>
            <a href="/shop/help-1.html" target="_blank">关于诺心</a>
            <a href="/shop/help-80.html" target="_blank">联系我们</a>
            <a href="/shop/help-55.html" target="_blank">客服服务</a>
            <a href="//rescdn.lapetit.cn/shop/lecake/theme/xth2/images/index/business_certificate4.jpg" target="_blank">食品经营许可证</a>
            <a href="//rescdn.lecake.com/postsystem/docroot/images/promotion/201805/S22C-2180516134800_0001_0101.jpg"
               target="_blank">生产许可证</a>
            <a href="/shop/help-668.html" target="_blank">预付费卡协议</a>
            <a href="https://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&entyId=1u2xwmwzpxrk6u2rvor2928au92degmyr8rxc2ylqre60wm"
               class="last" target="_blank"><i></i>上海工商</a>
        </p>
    </div>
    <div class="footer_address text_center">
        <p class="clear_fix">
            诺心食品（上海）有限公司            &nbsp;&nbsp;上海徐汇区田林路140号28号楼503室&nbsp;&nbsp;客服邮箱：services@lecake.com&nbsp;&nbsp;公司电话：4001-578-578
        </p>
    </div>
    <div class="footer_copy text_center">
        <p>copyright©2010-2017诺心lecake.com版权所有 沪ICP备10211730</p>
    </div>
</footer>
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
<script>
    (function () {
        var href = location.href;
        if (href.indexOf('//www.lecake.com') !== -1 || href.indexOf('//wx01.lecake.com') !== -1) {
            var rt = document.createElement("script");
            rt.src = "//rescdn.lapetit.cn/shop/lecake/theme/xth2/scripts_new/rt.js?04";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(rt, s);
        }
    })();
</script>


<!--百度统计-->
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?0aab2028932298cda55c549351d0a22b";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

</body>
</html>


