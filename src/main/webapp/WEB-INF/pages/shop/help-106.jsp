<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
			<title>客服服务-诺心LECAKE</title>
		<meta name="Keywords" content="诺心在线客服服务,诺心购物指南,蛋糕购买指南,蛋糕预订指南" />
	<meta name="Description" content="诺心蛋糕购物指南频道，提供详细的蛋糕购买指南，蛋糕预订指南，让消费者安全购买诺心蛋糕。诺心LECAKE蛋糕官网，臻品蛋糕，美味直送到家！" />

<meta property="qc:admins" content="24055663606453135637573071645060454" />
<meta property="wb:webmaster" content="bebfa4568578b1d6" />
<meta http-equiv="cache-control" content="max-age=1800" />
<link rel="shortcut icon" href="/favicon.ico?01"/>

<!-- 强制转换浏览器浏览模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!--解决IE6不支持png图片透明问题-->
<!--[if IE 6]>
    <script type="text/javascript" src="../static/js/dd_belatedpng.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('*');
</script>
<![endif]-->
<!--/解决IE6不支持png图片透明问题-->
<link type="text/css" href="../static/css/comm_header.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../static/css/tnstyle.css"/>
<link rel="stylesheet" type="text/css" href="../static/css/tnheadandfootstyle.css"/>
<link rel="stylesheet" type="text/css" href="../static/css/tnindexstyle.css"/><!----样式按此顺序排放------>
<script type="text/javascript">var glbStatConfig={stat_host:"res.lecake.com",click_id: "KyHhqGoIZua2"};</script>
<script type="text/javascript" src="../static/js/mystat.js"></script>
<script type="text/javascript" src="../static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../static/js/tnlecakeindex.js"></script>

<link rel="stylesheet" href="../static/css/base_1.css">
<link type="text/css" href="../static/css/widget_1.css" rel="stylesheet"/>
<!--[if lt IE 9]>
<script type="text/javascript" src="../static/js/html5.min.js"></script>
<![endif]-->
	
<script type="text/javascript" charset="UTF-8">
/* <![CDATA[ */
try { if (undefined == xajax.config) xajax.config = {}; } catch (e) { xajax = {}; xajax.config = {}; };
xajax.config.requestURI = "/shop/help.php";
xajax.config.statusMessages = false;
xajax.config.waitCursor = true;
xajax.config.version = "xajax 0.5";
xajax.config.legacy = false;
xajax.config.defaultMode = "asynchronous";
xajax.config.defaultMethod = "POST";
/* ]]> */
</script>
<script type="text/javascript" src="../static/js/xajax_core.js" charset="UTF-8"></script>

<script type='text/javascript' charset='UTF-8'>
/* <![CDATA[ */
xajax_do_req_header = function() { return xajax.request( { xjxfun: 'do_req_header' }, { parameters: arguments } ); };
xajax_get_shop_date = function() { return xajax.request( { xjxfun: 'get_shop_date' }, { parameters: arguments } ); };
xajax_do_savefondantcakes = function() { return xajax.request( { xjxfun: 'do_savefondantcakes' }, { parameters: arguments } ); };
xajax_do_req_goods = function() { return xajax.request( { xjxfun: 'do_req_goods' }, { parameters: arguments } ); };
xajax_do_req_cart = function() { return xajax.request( { xjxfun: 'do_req_cart' }, { parameters: arguments } ); };
xajax_do_req_checkout = function() { return xajax.request( { xjxfun: 'do_req_checkout' }, { parameters: arguments } ); };
/* ]]> */
</script>
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
                                    <a href="/SH/index.html" data-site-id="2" onclick="return city.set_city('2','上海市','SH');" cityFlg="2">上海市</a>
                            <a href="/BJ/index.html" data-site-id="287" onclick="return city.set_city('287','北京市','BJ');" cityFlg="287">北京市</a>
                            <a href="/GZ/index.html" data-site-id="420" onclick="return city.set_city('420','广州市','GZ');" cityFlg="420">广州市</a>
                            <a href="/NJ/index.html" data-site-id="355" onclick="return city.set_city('355','南京市','NJ');" cityFlg="355">南京市</a>
                            <a href="/CD/index.html" data-site-id="449" onclick="return city.set_city('449','成都市','CD');" cityFlg="449">成都市</a>
                            <a href="/CQ/index.html" data-site-id="499" onclick="return city.set_city('499','重庆市','CQ');" cityFlg="499">重庆市</a>
                            <a href="/SN/index.html" data-site-id="386" onclick="return city.set_city('386','深圳市','SN');" cityFlg="386">深圳市</a>
                            <a href="/HZ/index.html" data-site-id="83" onclick="return city.set_city('83','杭州市','HZ');" cityFlg="83">杭州市</a>
                            <a href="/SZ/index.html" data-site-id="228" onclick="return city.set_city('228','苏州市','SZ');" cityFlg="228">苏州市</a>
                            <a href="/TJ/index.html" data-site-id="334" onclick="return city.set_city('334','天津市','TJ');" cityFlg="334">天津市</a>
                            <a href="/NB/index.html" data-site-id="356" onclick="return city.set_city('356','宁波市','NB');" cityFlg="356">宁波市</a>
                            <a href="/WX/index.html" data-site-id="261" onclick="return city.set_city('261','无锡市','WX');" cityFlg="261">无锡市</a>
                            <a href="/SX/index.html" data-site-id="446" onclick="return city.set_city('446','绍兴市','SX');" cityFlg="446">绍兴市</a>
                            <a href="/JX/index.html" data-site-id="447" onclick="return city.set_city('447','嘉兴市','JX');" cityFlg="447">嘉兴市</a>
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
            <dt><a href="/"><img alt="首页" src="../static/picture/tntoplist1.jpg"></a></dt><!-----首页1----->
            <dd><a href="/"></a></dd>
        </li>
        <li>
            <!---蛋糕馆--->
            <dt><a href="/SH/category-0-1.html"><img alt="蛋糕馆" src="../static/picture/tntoplist2.jpg"></a></dt>
            <dd><a href="/SH/category-0-1.html"></a></dd>
            <dt class="TN_drop-down">
                    <div class="TN_drop-down_menuBG" style=" height:370px;"></div><!----height=170px=40px*4+10px---下拉菜单默认4个，数量改变请同步改变heigh的值------>
            <div class="TN_drop-down_menu">
                <p><img class="L" src="../static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                <ul class="L">
                                            <li ><a href="/SH/category-104-1.html">芝士口味</a>
                                            <li ><a href="/SH/category-121-1.html">雪域口味</a>
                                            <li ><a href="/SH/category-101-1.html">慕斯口味</a>
                                            <li ><a href="/SH/category-103-1.html">巧克力味</a>
                                            <li ><a href="/SH/category-102-1.html">拿破仑口味</a>
                                            <li ><a href="/SH/category-112-1.html">鲜果口味</a>
                                            <li ><a href="/SH/category-113-1.html">冰淇淋味</a>
                                            <li ><a href="/SH/category-114-1.html">奶油口味</a>
                                            <li  class="TN_noneBUT"><a href="/SH/category-124-1.html">其他</a>
                                        <!--<li class="TN_noneBUT"><a href="javascript:void(0)" onclick="allOperate.pointsArea(); return false;" target="_blank">积分专区</a></li>-->
                </ul>
                <!-----宽度有限，数字控制在5个字------------------->
            </div>
                </li>

        <li>
            <!----甜品馆---->
            <dt><a href="/SH/category-1000-1.html"><img alt="甜品馆" src="../static/picture/tntoplist7.jpg"></a></dt>
            <dt class="TN_drop-down">
            <div class="TN_drop-down_menuBG" style="height: 0px"></div>
            <!--div class="TN_drop-down_menu">
                <p><img class="L" src="../static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                <ul class="L">
                    <li class="TN_noneBUT"><a href="/shop/member_user.php" target="_blank">蝴蝶酥</a></li>
                </ul>
            </div-->
        </li>


        <li class="TN_logo" style=" margin: 0 10px;">
            <img alt="诺心蛋糕" src="../static/picture/tntoplistlogo.jpg" width="271" height="52" />
        </li>

        <li  style="margin-left: 0px; ">
            <!----我的诺心---->
            <dt><a href="/shop/member_user.php"><img alt="我的诺心" src="../static/picture/tntoplist3.jpg"></a></dt>
            <dd><a href="/shop/member_user.php"></a></dd>
            <dt class="TN_drop-down">
            <div class="TN_drop-down_menuBG" style="height: 170px"></div>
            <div class="TN_drop-down_menu">
                <p><img class="L" src="../static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                <ul class="L">
                    <li><a href="/i/duihuan/" target="_blank">LECLUB</a></li>
                    <li><a href="/shop/member_order.php?orderflg=1" target="_blank">我的订单</a></li>
                    <!--<li><a href="/shop/member_user.php?operFlg=1" target="_blank">我的信息</a></li>-->
                    <li><a href="/customer/find-pw.html" target="_blank">找回密码</a></li>
                    <!--<li><a href="/shop/member_pwd.php" target="_blank">修改密码</a></li>-->

                                            <li class="TN_noneBUT"><a href="/customer/czcard.html" target="_blank">礼卡专区</a></li>
                                    </ul>
            </div>
        </li>

        <li>
            <!----企业专区---->
            <dt style="cursor: pointer"><img alt="企业专区" src="../static/picture/tntoplist4.jpg"></dt>
            <dd style="cursor: pointer"></dd>
            <dt class="TN_drop-down">
            <div class="TN_drop-down_menuBG" style="height: 170px"></div>
            <div class="TN_drop-down_menu">
                <p><img class="L" src="../static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                <ul class="L">
					                    <!-- <li><a href="/companyActive-2.html">企业SC</a></li> -->
                    <li><a href="/shop/companyPurchase.php">企业采购</a></li>
					                    <li><a href="/shop/ncompany/nlogin.php">大客户区</a></li>
                    <li ><a href="/company/welfare.html">福利券区</a></li>
                    <li class="TN_noneBUT"><a href="/shop/bank_list.php">合作专区</a></li>
                    					                         <li><a href="/company/snack.html">小食盒区</a></li>
                                    </ul>
            </div>
            </dt>
        </li>
        <li>
            <!---关于诺心-->
            <dt style="cursor: pointer"><img alt="关于诺心" src="../static/picture/tntoplist8.jpg"></dt>
            <dd style="cursor: pointer"></dd>
            <dt class="TN_drop-down">
            <div class="TN_drop-down_menuBG" style="height: 290px"></div>
            <div class="TN_drop-down_menu">
                <p><img class="L" src="../static/picture/tn_top_little_03.png" width="8" height="4" /></p>
                <ul class="L">
                    <li><a href="/SH/siteNews.html">诺心新闻</a></li>
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
                <a id="shop_cart" class="cursorPointer" onclick="self.location='/shop/cart.php'">购物车<span id="js_cart_goods_number" class="TNgg">0</span>件</a><span class="TN_st">|</span>
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
                        <img src="../static/picture/qr_code_top.png"/>
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
                        <img src="../static/picture/logo_new.png" style="height: 20px;"/>
                    </a>
                </div>
                <ul class="nav f_left">
                    <li>
                        <a href="/" class="<?= $activeLink == 'home' ? ' active' : '' ?>"
                           onclick="_statLog.logClick('nav_home', '首页',true)">首页</a>
                    </li>
                    <li>
                        <a href="/SH/category-0-1.html"
                           onclick="_statLog.logClick('nav_cake', '蛋糕',true)">蛋糕</a>
                    </li>
                                        <li>
                        <a href="/SH/category-100-1.html"
                           onclick="_statLog.logClick('nav_toast', '吐司',true)">吐司</a>
                    </li>
                                        <li class="gift">
                        <a href="/SH/category-1000-1.html"
                           onclick="_statLog.logClick('nav_gift', '礼品',true)">礼品</a>
                    </li>
                    <li class="have_inner" id="enterpriseLink">
                        <a href="javascript:void(0)">企业专区</a>
                        <div class="inner_wrap"></div>
                    </li>
                    <li class="have_inner" id="customerLink">
                        <a href="/shop/member_user.php">我的诺心</a>
                        <div class="inner_wrap"></div>
                    </li>
                </ul>
                <div class="f_right">
                    <span id="customerName"></span>
                    <a href="/cart/index.html" class="nav_cart f_right"
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
            
<div id="container" style="width:980px; float: left;background-color: #FEFAEC;">

	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<p><style type="text/css">


    BODY P {
        font-size: 12px;
        color: #636363;

    }
    BODY TABLE {
        font-size: 12px;
    ;
    }
    .listQL LI EM {
        font-style: normal;
        cursor: pointer;
    }
    .listQL UL, .listQL UL LI A {
        color: #636363;
        clear: both;
        font-family:"微软雅黑"
    }
    .listQL LI {
        display: block;
        width: 200px;
        line-height: 20px;
        color: #636363;
        font-family:"微软雅黑"
    }
    .listQL UL LI A:hover {
        color: #83391a;
    }
    .listQL OL {
        display: none;
    }
    .listQL font12 {
        color: #636363;
        font-family:"微软雅黑"
    }
    .listQL OL SUP {
        margin-left: 10px;
        font-weight: bold;
    }
    .left_menu {
        border-bottom: #d4d4d4 1px solid;
        border-left: #d4d4d4 1px solid;
        border-top: #d4d4d4 1px solid;
        border-right: #d4d4d4 1px solid;
    }
    .left_menu OL LI {
        line-height: 21px;
    }
    .left_menu .left_title2 STRONG {
        line-height: 31px;
        padding-left: 18px;
        display: block;
        background: url

        (http://www.lecake.com/postsystem/docroot/images/goods/wzw/rczp/image/menu_tit.png) repeat-x;
        height: 31px;
        color: #333333;
        font-size: 14px;
        font-family:"微软雅黑";
    }
    .left_menu EM {
        border-bottom: #d4d4d4 1px solid;
        line-height: 29px;
        padding-left: 20px;
        width: 183px;
        display: block;
        background: url

        (http://www.lecake.com/postsystem/docroot/images/goods/wzw/rczp/image/menu_sub_tit.png) no-repeat;
        height: 29px;
    }
    .left_menu EM.on {
        background: url

        (http://www.lecake.com/postsystem/docroot/images/goods/wzw/rczp/image/menu_sub_tit_on.png) no-repeat;
        color: #cc0000;
        font-weight: bold;
        font-family:"微软雅黑";
    }
    .left_menu OL LI A {
        padding-left: 10px;
        background: url

        (http://www.lecake.com/postsystem/docroot/images/goods/wzw/rczp/image/listimg.png) no-repeat 0px 7px;
        margin-left: 10px;
        color: #636363;
        font-family:"微软雅黑";
    }
    .job_list {
        line-height: 24px;
    }
    TD.font12 {
        line-height: 25px;
        padding-left: 10px;
        height: 25px;
        color: #636363;
        font-family:"微软雅黑";
    }
    #jzg {
        padding-left: 20px;
    }
    #jzg SPAN {
        color: #0066cc;
        font-size: 14px;
        font-family:"微软雅黑"
    }
    .red16 {
        color: #c00;
        font-size: 14px;
        font-weight: bold;
        width: 730px;
        font-family:"微软雅黑";
    }
    .job_item {
        display: none;
    }
    .job_item TD {
        padding-left: 20px;
        padding-top: 10px;
    }
    .job_item TD P{font-family:"微软雅黑";}
    .right_top P {
        line-height: 24px;
    }</style><script type="text/JavaScript">




    $(function(){
        //左侧收缩
        $(".listQL li ol").toggle(function(){
            $(this).next("ol").show();
            $(this).addClass("on");
            return false;

        });

        //点击左侧导航，显示右侧内容
        var _list_li = $(".listQL ol li");
        _list_li.find("a").click(function(){
            var num = _list_li.index($(this).parent());
            $(".job_desc").show();
            $("#qywh").hide();
            $(".job_list .job_item").hide();
            $(".job_list .job_item").eq(num).show();
            return false;
        });

    });
    //-->
</script></p>
<p>
    <table style="margin: 0px auto" width="980" cellspacing="0" cellpadding="0" border="0">
        <tbody>
        <tr>
            <td colspan="2" height="25">&nbsp;</td>
        </tr>
        <tr>
            <td id="homepage_left" width="205" valign="top" height="540">
                <div class="border_blue mt10">
                    <table class="left_menu" width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                        <tr>
                            <td class="left_title2"><strong>购物指南</strong></td>
                        </tr>
                        <tr>
                            <td class="listQL" align="left">
                                <ul>
                                    <li>
                                        <ol>
                                            <li><a href="#">购物流程</a></li>
                                            <li><a href="#">购物安全</a></li>
                                            <li><a href="#">商品评价</a></li>
                                            <li><a href="#">如何订购</a></li>
                                            <li><a href="#">如何结帐</a></li>
                                            <li><a href="#">如何收货</a></li>
                                            <li><a href="#">蛋糕卡使用</a></li>
                                        </ol>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td class="left_title2"><strong>售后服务</strong></td>
                        </tr>
                        <tr>
                            <td class="listQL" align="left">
                                <ul>
                                    <li>
                                        <ol>
                                            <li><a href="#">退换货须知</a></li>
                                            <li><a href="#">退款须知</a></li>
                                            <li><a href="#">投诉通道</a></li>
                                        </ol>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </td>
            <td width="774" valign="top">
                <table style="margin-left: 10px">
                    <tbody>
                    <tr>
                        <td>
                            <table class="right_top" style="width: 100%">
                                <tbody>
                                <tr>
                                    <td>
                                        <table class="job_list" width="100%" cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                            <!--<tr>
                                                <td valign="bottom" height="0" align="left"

class="font12"><strong></strong></td>
                                            </tr>--><!--帮助项目-->
                                            <tr class="job_item" style="display: block">
                                                <td align="left">
                                                    <div><img alt="" src="../static/picture/goum.jpg" width="730" height="103" /></div>
<p><strong>1 搜索商品</strong> <br />
    LE CAKE为您提供了方便快捷的商品搜索功能： <br />
    （1）您还可以通过LE CAKE的分类导航栏来找到您想要购买的  蛋糕 <br />
    <strong>2 放入购物车</strong> <br />
    在您想要购买的商品的详情页点击&ldquo;放入购物车&rdquo;  ，商品会添加到您的购物车中；您还可以继续挑选商品放入购物车，一起结算。 <br />
    （1）在购物车中，系统默认每件商品的订购数量为一件，如果  您想购买多件商品，可修改购买数量 <br />
    （2）在购物车中，您可以将商品删除 <br />
    （3）在购物车中，您可以直接查看到商品的优惠折和参加促销  活动的商品名称、促销主题 <br />
    （4）购物车页面下方的商品是LE CAKE根据您挑选的商品为您  作出的推荐，若有您喜爱的商品，点击&ldquo;放入购物车&rdquo;即可 <br />
    温馨提示： <br />
    （1）商品价格会不定期调整，最终价格以您提交订单后订单中  的价格为准 <br />
    （2）优惠政策、配送时间、运费收取标准等都有可能进行调整  ，最终成交信息以您提交订单时网站公布的最新信息为准 <br />
    <strong>3 注册登陆</strong> <br />
    （1）老顾客：请在&ldquo;登陆 &rdquo;页面输入Email地址，  手机号或昵称、注册密码进行登陆 <br />
    （2）新顾客：请在&ldquo;新用户注册 &rdquo;页面按照提示  完成注册 <br />
    <strong>4 填写收货人信息</strong> <br />
    （1）请填写正确完整的收货人姓名、收货人联系方式、详细的  收货地址和邮编，否则将会影响您订单的处理或配送 <br />
    （2）如果您订购过商品，再订购时，系统会用你上次订购的地  址作为默认收货地址，否则系统用您的资料信息中的地址作为默认收货地址； <br />
    你也可以修改这个地址再提交订单 <br />
    <strong>5 选择收货方式</strong> <br />
    LE CAKE提供收货方式： <br />
    （1）普通快递送货上门 <br />
    <strong>6 选择支付方式（北京）</strong> <br />
    诺心LE CAKE提供多种支付方式，订购过程中您可以选择： <br />
    （1）货到付款：现金支付，POS终端机； <br />
    （2）线上支付：支付宝，招商银行（同时支持非招行卡在线支  付）； <br />
    <strong>北京免费配送区域：</strong><br />
    <!--[if gte mso 9]><xml>
        <w:WordDocument>
            <w:View>Normal</w:View>
            <w:Zoom>0</w:Zoom>
            <w:TrackMoves />
            <w:TrackFormatting />
            <w:PunctuationKerning />
            <w:DrawingGridVerticalSpacing>7.8 磅

            </w:DrawingGridVerticalSpacing>


            <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>


            <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
            <w:ValidateAgainstSchemas />
            <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
            <w:IgnoreMixedContent>false</w:IgnoreMixedContent>


            <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
            <w:DoNotPromoteQF />
            <w:LidThemeOther>EN-US</w:LidThemeOther>
            <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>
            <w:LidThemeComplexScript>X-

                NONE</w:LidThemeComplexScript>
            <w:Compatibility>
                <w:SpaceForUL />
                <w:BalanceSingleByteDoubleByteWidth />
                <w:DoNotLeaveBackslashAlone />
                <w:ULTrailSpace />
                <w:DoNotExpandShiftReturn />
                <w:AdjustLineHeightInTable />
                <w:BreakWrappedTables />
                <w:SnapToGridInCell />
                <w:WrapTextWithPunct />
                <w:UseAsianBreakRules />
                <w:DontGrowAutofit />
                <w:SplitPgBreakAndParaMark />
                <w:DontVertAlignCellWithSp />
                <w:DontBreakConstrainedForcedTables />
                <w:DontVertAlignInTxbx />
                <w:Word11KerningPairs />
                <w:CachedColBalance />
                <w:UseFELayout />
            </w:Compatibility>


            <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
            <m:mathPr>
                <m:mathFont m:val="Cambria Math" />
                <m:brkBin m:val="before" />
                <m:brkBinSub m:val="--" />
                <m:smallFrac m:val="off" />
                <m:dispDef />
                <m:lMargin m:val="0" />
                <m:rMargin m:val="0" />
                <m:defJc m:val="centerGroup" />
                <m:wrapIndent m:val="1440" />
                <m:intLim m:val="subSup" />
                <m:naryLim m:val="undOvr" />
            </m:mathPr></w:WordDocument>
    </xml><![endif]--></p>
<p><!--[if gte mso 9]><xml>
    <w:LatentStyles DefLockedState="false"

                    DefUnhideWhenUsed="true"
                    DefSemiHidden="true" DefQFormat="false"

                    DefPriority="99"
                    LatentStyleCount="267">
        <w:LsdException Locked="false" Priority="0"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Normal" />
        <w:LsdException Locked="false" Priority="9"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="heading 1"

        />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 2" />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 3" />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 4" />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 5" />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 6" />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 7" />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 8" />
        <w:LsdException Locked="false" Priority="9"

                        QFormat="true" Name="heading 9" />
        <w:LsdException Locked="false" Priority="39" Name="toc

1" />
        <w:LsdException Locked="false" Priority="39" Name="toc

2" />
        <w:LsdException Locked="false" Priority="39" Name="toc

3" />
        <w:LsdException Locked="false" Priority="39" Name="toc

4" />
        <w:LsdException Locked="false" Priority="39" Name="toc

5" />
        <w:LsdException Locked="false" Priority="39" Name="toc

6" />
        <w:LsdException Locked="false" Priority="39" Name="toc

7" />
        <w:LsdException Locked="false" Priority="39" Name="toc

8" />
        <w:LsdException Locked="false" Priority="39" Name="toc

9" />
        <w:LsdException Locked="false" Priority="35"

                        QFormat="true" Name="caption" />
        <w:LsdException Locked="false" Priority="10"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Title" />
        <w:LsdException Locked="false" Priority="1"

                        Name="Default Paragraph Font" />
        <w:LsdException Locked="false" Priority="11"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Subtitle"

        />
        <w:LsdException Locked="false" Priority="22"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Strong" />
        <w:LsdException Locked="false" Priority="20"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Emphasis"

        />
        <w:LsdException Locked="false" Priority="59"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Table Grid" />
        <w:LsdException Locked="false" UnhideWhenUsed="false"

                        Name="Placeholder Text" />
        <w:LsdException Locked="false" Priority="1"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="No Spacing"

        />
        <w:LsdException Locked="false" Priority="60"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Shading" />
        <w:LsdException Locked="false" Priority="61"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light List" />
        <w:LsdException Locked="false" Priority="62"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Grid" />
        <w:LsdException Locked="false" Priority="63"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 1" />
        <w:LsdException Locked="false" Priority="64"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 2" />
        <w:LsdException Locked="false" Priority="65"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 1" />
        <w:LsdException Locked="false" Priority="66"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 2" />
        <w:LsdException Locked="false" Priority="67"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 1" />
        <w:LsdException Locked="false" Priority="68"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 2" />
        <w:LsdException Locked="false" Priority="69"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 3" />
        <w:LsdException Locked="false" Priority="70"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Dark List" />
        <w:LsdException Locked="false" Priority="71"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Shading" />
        <w:LsdException Locked="false" Priority="72"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful List" />
        <w:LsdException Locked="false" Priority="73"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Grid" />
        <w:LsdException Locked="false" Priority="60"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Shading Accent 1" />
        <w:LsdException Locked="false" Priority="61"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light List Accent 1" />
        <w:LsdException Locked="false" Priority="62"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Grid Accent 1" />
        <w:LsdException Locked="false" Priority="63"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"

        />
        <w:LsdException Locked="false" Priority="64"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"

        />
        <w:LsdException Locked="false" Priority="65"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 1 Accent 1" />
        <w:LsdException Locked="false" UnhideWhenUsed="false"

                        Name="Revision" />
        <w:LsdException Locked="false" Priority="34"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="List

Paragraph" />
        <w:LsdException Locked="false" Priority="29"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Quote" />
        <w:LsdException Locked="false" Priority="30"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Intense

Quote" />
        <w:LsdException Locked="false" Priority="66"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 2 Accent 1" />
        <w:LsdException Locked="false" Priority="67"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1" />
        <w:LsdException Locked="false" Priority="68"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1" />
        <w:LsdException Locked="false" Priority="69"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1" />
        <w:LsdException Locked="false" Priority="70"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Dark List Accent 1" />
        <w:LsdException Locked="false" Priority="71"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Shading Accent 1"

        />
        <w:LsdException Locked="false" Priority="72"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful List Accent 1" />
        <w:LsdException Locked="false" Priority="73"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Grid Accent 1" />
        <w:LsdException Locked="false" Priority="60"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Shading Accent 2" />
        <w:LsdException Locked="false" Priority="61"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light List Accent 2" />
        <w:LsdException Locked="false" Priority="62"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Grid Accent 2" />
        <w:LsdException Locked="false" Priority="63"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"

        />
        <w:LsdException Locked="false" Priority="64"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"

        />
        <w:LsdException Locked="false" Priority="65"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 1 Accent 2" />
        <w:LsdException Locked="false" Priority="66"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 2 Accent 2" />
        <w:LsdException Locked="false" Priority="67"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2" />
        <w:LsdException Locked="false" Priority="68"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2" />
        <w:LsdException Locked="false" Priority="69"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2" />
        <w:LsdException Locked="false" Priority="70"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Dark List Accent 2" />
        <w:LsdException Locked="false" Priority="71"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Shading Accent 2"

        />
        <w:LsdException Locked="false" Priority="72"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful List Accent 2" />
        <w:LsdException Locked="false" Priority="73"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Grid Accent 2" />
        <w:LsdException Locked="false" Priority="60"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Shading Accent 3" />
        <w:LsdException Locked="false" Priority="61"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light List Accent 3" />
        <w:LsdException Locked="false" Priority="62"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Grid Accent 3" />
        <w:LsdException Locked="false" Priority="63"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"

        />
        <w:LsdException Locked="false" Priority="64"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"

        />
        <w:LsdException Locked="false" Priority="65"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 1 Accent 3" />
        <w:LsdException Locked="false" Priority="66"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 2 Accent 3" />
        <w:LsdException Locked="false" Priority="67"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3" />
        <w:LsdException Locked="false" Priority="68"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3" />
        <w:LsdException Locked="false" Priority="69"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3" />
        <w:LsdException Locked="false" Priority="70"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Dark List Accent 3" />
        <w:LsdException Locked="false" Priority="71"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Shading Accent 3"

        />
        <w:LsdException Locked="false" Priority="72"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful List Accent 3" />
        <w:LsdException Locked="false" Priority="73"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Grid Accent 3" />
        <w:LsdException Locked="false" Priority="60"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Shading Accent 4" />
        <w:LsdException Locked="false" Priority="61"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light List Accent 4" />
        <w:LsdException Locked="false" Priority="62"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Grid Accent 4" />
        <w:LsdException Locked="false" Priority="63"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"

        />
        <w:LsdException Locked="false" Priority="64"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"

        />
        <w:LsdException Locked="false" Priority="65"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 1 Accent 4" />
        <w:LsdException Locked="false" Priority="66"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 2 Accent 4" />
        <w:LsdException Locked="false" Priority="67"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4" />
        <w:LsdException Locked="false" Priority="68"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4" />
        <w:LsdException Locked="false" Priority="69"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4" />
        <w:LsdException Locked="false" Priority="70"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Dark List Accent 4" />
        <w:LsdException Locked="false" Priority="71"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Shading Accent 4"

        />
        <w:LsdException Locked="false" Priority="72"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful List Accent 4" />
        <w:LsdException Locked="false" Priority="73"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Grid Accent 4" />
        <w:LsdException Locked="false" Priority="60"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Shading Accent 5" />
        <w:LsdException Locked="false" Priority="61"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light List Accent 5" />
        <w:LsdException Locked="false" Priority="62"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Grid Accent 5" />
        <w:LsdException Locked="false" Priority="63"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"

        />
        <w:LsdException Locked="false" Priority="64"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"

        />
        <w:LsdException Locked="false" Priority="65"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 1 Accent 5" />
        <w:LsdException Locked="false" Priority="66"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 2 Accent 5" />
        <w:LsdException Locked="false" Priority="67"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5" />
        <w:LsdException Locked="false" Priority="68"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5" />
        <w:LsdException Locked="false" Priority="69"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5" />
        <w:LsdException Locked="false" Priority="70"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Dark List Accent 5" />
        <w:LsdException Locked="false" Priority="71"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Shading Accent 5"

        />
        <w:LsdException Locked="false" Priority="72"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful List Accent 5" />
        <w:LsdException Locked="false" Priority="73"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Grid Accent 5" />
        <w:LsdException Locked="false" Priority="60"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Shading Accent 6" />
        <w:LsdException Locked="false" Priority="61"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light List Accent 6" />
        <w:LsdException Locked="false" Priority="62"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Light Grid Accent 6" />
        <w:LsdException Locked="false" Priority="63"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"

        />
        <w:LsdException Locked="false" Priority="64"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"

        />
        <w:LsdException Locked="false" Priority="65"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 1 Accent 6" />
        <w:LsdException Locked="false" Priority="66"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium List 2 Accent 6" />
        <w:LsdException Locked="false" Priority="67"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6" />
        <w:LsdException Locked="false" Priority="68"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6" />
        <w:LsdException Locked="false" Priority="69"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6" />
        <w:LsdException Locked="false" Priority="70"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Dark List Accent 6" />
        <w:LsdException Locked="false" Priority="71"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Shading Accent 6"

        />
        <w:LsdException Locked="false" Priority="72"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful List Accent 6" />
        <w:LsdException Locked="false" Priority="73"

                        SemiHidden="false"
                        UnhideWhenUsed="false" Name="Colorful Grid Accent 6" />
        <w:LsdException Locked="false" Priority="19"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Subtle

Emphasis" />
        <w:LsdException Locked="false" Priority="21"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Intense

Emphasis" />
        <w:LsdException Locked="false" Priority="31"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Subtle

Reference" />
        <w:LsdException Locked="false" Priority="32"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Intense

Reference" />
        <w:LsdException Locked="false" Priority="33"

                        SemiHidden="false"
                        UnhideWhenUsed="false" QFormat="true" Name="Book Title"

        />
        <w:LsdException Locked="false" Priority="37"

                        Name="Bibliography" />
        <w:LsdException Locked="false" Priority="39"

                        QFormat="true" Name="TOC Heading" />
    </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
    <style>
        /* Style Definitions */
        table.MsoNormalTable
        {mso-style-name:普通表格;
            mso-tstyle-rowband-size:0;
            mso-tstyle-colband-size:0;
            mso-style-noshow:yes;
            mso-style-priority:99;
            mso-style-qformat:yes;
            mso-style-parent:"";
            mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
            mso-para-margin:0cm;
            mso-para-margin-bottom:.0001pt;
            mso-pagination:widow-orphan;
            font-size:10.5pt;
            mso-bidi-font-size:11.0pt;
            font-family:"Calibri","sans-serif";
            mso-ascii-font-family:Calibri;
            mso-ascii-theme-font:minor-latin;
            mso-fareast-font-family:宋体;
            mso-fareast-theme-font:minor-fareast;
            mso-hansi-font-family:Calibri;
            mso-hansi-theme-font:minor-latin;
            mso-bidi-font-family:"Times New Roman";
            mso-bidi-theme-font:minor-bidi;
            mso-font-kerning:1.0pt;}
    </style>
    <![endif]--><span style="font-size:9.0pt;font-&#10;&#10;family:&quot;微软雅黑&quot;,&quot;sans-serif&quot;;&#10;                                                mso-bidi-font-family:微软雅黑;mso-font-&#10;&#10;kerning:1.0pt;mso-ansi-language:EN-US;&#10;                                                mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">六  环以内：全部免费配送；六环以外、顺义城区：龙塘路以北、右堤路以西、与京沈路交叉的顺沙路以南收取<span lang="EN-US">50</span>元配送费，六环外其他区域不做配送。</span><br />
    请以下单时实际运费为准，如有疑问可联系呼叫中心，配送服  务时间:10:00-20:00 <br />
    <strong>7 提交订单</strong> <br />
    （1）以上信息核实无误后，请点击&ldquo;提交订单&rdquo;，  系统生成一个订单号，就说明您已经成功提交订单 <br />
    （2）订单提交成功后，您可以登陆&ldquo;我的LE CAKE   &rdquo;查看订单信息或为订单进行网上支付</p>
</td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16">&nbsp;</div>
        <strong>购物安全</strong><br />
        <p>LE CAKE为使用者提供安全无虑、便利舒适的购物环境，特  別采用SSL电子安全机制，以及与网络银行等级相同的128bit伺服器数位凭证来<br />
            提高网 站的安全性。所谓 SSL，是 Secure Socket Layer 的  缩写，这是由 Netscape 研发出来的网络讯息加密技术。当您输入您的重要资料时， 所有的数据均会经过复杂的加密  程序，您的所有个人资料由此便受到层层的保护。<br />
            防止他人未经授权使用您的密码或进入您的计算机是非常重要  的。因此，您应确保在与他人共用一台计算机时，使用完毕后即时退出登录。<br />
            此外，关于你的个人资料，LE CAKE都将严格遵守各项法律规定  ，绝不会泄露给非业务相关的第三者。自此，请您安心地享受购物乐趣。 <br />
            &nbsp;</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16">&nbsp;</div>
        <strong>商品评价</strong>
        <p>1：发表评价了,保证评价真实、有效，您可以对您成功购买  的商品进行评价；一张订单中的一个商品只可以评价一次；<br />
            2：等待审核评价发布成功，等待审核<br />
            为了确保您的评价中没有违反国家相关规定的言辞出现，我们  采用了人工审核的方式，包含以下内容的评价不予审核通过：<br />
            1、含有反党、反社会、支持邪教的评价内容<br />
            2、与商品无关的评价内容<br />
            3、对商品和厂家进行无理谩骂和攻击的评价内容<br />
            4、重复发表的灌水评价<br />
            5、评价中包含广告信息<br />
            您的评价提交后，请耐心等待审核结果。</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16">&nbsp;</div>
        <strong>如何订购诺心LE CAKE蛋糕</strong>
        <p>北京地区请提前24小时订购，如需当天紧急订购请在当天13  点前联络客服订购。<br />
            若需要修改蛋糕或配送时间，请及时联络客服中心。<br />
            1&gt;网络订购请登陆：www.lecake.com<br />
            2&gt;我们的客服中心：4001-578-578 / 021-31155890<br />
            3&gt;Email我们：services@lecake.com<br />
            4&gt;微博@诺心LECAKE私信订购<br />
            5&gt;微信Q号订购 1805561868<br />
            * 订购时需注意产品规格，请选择适当磅数配合相应人数。订  购5磅蛋糕请提前至少48小时。<br />
            1、电话订购<br />
            当您选择好需要订购的蛋糕及配件，请确认清楚磅数及购买数  量。拨打我们的客服电话，将您想购买的蛋糕名称、详细配送地址及<br />
            要求等信息准确告知我们的客服人员，客服人员会配合您完成  蛋糕订购。<br />
            打电话给我们：4001-578-578 / 021-31155890<br />
            客服热线服务时间：8:30- 22:30<br />
            2、电子邮件订购<br />
            当您选择好需要订购的蛋糕及配件，请确认清楚磅数及购买数  量。通过电子邮件与我们的客服人员联络，请按照下述格式将您想预订<br />
            的蛋糕及配件、详细配送地址及要求等信息Email给我们，客服  人员会尽快联络您，帮您完成订购。<br />
            电子邮件：services@lecake.com<br />
            服务时间：AM 9:00- PM 20:00<br />
            邮件内容:<br />
            &lt;1&gt;邮件标题：订购****（****为商品名称）<br />
            &lt;2&gt;邮件正文(包括以下)：<br />
            名称：<br />
            磅数：<br />
            数量：<br />
            订货人姓名：<br />
            订货人电话：<br />
            收货人姓名：<br />
            收货人电话：<br />
            收货人地址：<br />
            电子邮件：<br />
            配送方式：<br />
            支付方式：<br />
            需求配件：（如蜡烛、餐盘）<br />
            订货备注：（如巧克力牌、祝福内容、贺卡）<br />
            3、微博订购<br />
            当您选择好需要订购的蛋糕及配件，请确认清楚磅数及购买数  量。请登录新浪或腾讯微博，@诺心LECAKE 请私信详细告知您的需求<br />
            如下：<br />
            蛋糕名称：<br />
            磅数：<br />
            数量：<br />
            订货人姓名：<br />
            订货人电话：<br />
            收货人姓名：<br />
            收货人电话：<br />
            收货人地址：<br />
            微博将及时与您互动，并由客服中心统一与您确认订单信息，  帮助您完成下单订购。<br />
            4、微信订购<br />
            当您选择好需要订购的蛋糕及配件，请确认清楚磅数及购买数  量。请手机APP微信软件添加诺心LECAKE 微信Q号1805561868，并<br />
            将您的语音或文字订单留言告知我们以下内容： 蛋糕名称：  <br />
            磅数：<br />
            数量：<br />
            订货人姓名：<br />
            订货人电话：<br />
            收货人姓名：<br />
            收货人电话：<br />
            收货人地址：<br />
            <br />
            微信将由客服人员及时与您互动，并与您确认订单信息，帮助  您完成下单订购。</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16 ptb">&nbsp;</div>
        <strong>诺心LE CAKE如何结帐</strong><br />
        <p>目前诺心LE CAKE支持以下付款方式：<br />
            1、网上银行：若您的银行卡开通了银联网络支付功能，您可以  通过网络支付平台轻松付款。<br />
            2、支付宝：请在完成订单后，选择进入支付宝支付界面进行付  款。<br />
            3、快钱支付方式：可以选择快钱支付平台来支付您的货款。快  钱支付平台已同中国建设银行、中国银联、中国农业银行、中国银行、<br />
            招商银行、交通银行、华夏银行、中国光大银行、中信银行、  深圳发展银行、广东发展银行等结成战略合作并推出网上交易的收付款服务。<br />
            4、货到付款：在订单送到后将由配送人员直接收取相关订单金  额或POS机结算。</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16 ptb">&nbsp;</div>
        <strong>诺心LE CAKE如何收货</strong><br />
        <p>诺心LE CAKE现支持北京地区配送上门服务。<br />
            配送范围：<br />
            <strong>北京免费配送区域：</strong><br />
            1、六环以内：全部免费配送；六环以外、顺义城区：龙塘路以  北、右堤路以西、与京沈路交叉的顺沙路以南收取50元配送费，六环外其他区域不做配送。<br />
            请以下单时实际运费为准，如有疑问可联系呼叫中心，配送服  务时间:10:00-20:00 <br />
            配送方式：<br />
            诺心LE CAKE配送服务人员是自主专业冷链物流配送上门<br />
            <br />
            温馨收货提示：<br />
            1.当您在收到蛋糕时，请根据诺心LE CAKE订单仔细查核所收到  的商品，验收蛋糕无误后再进行签收。 <br />
            2.若发现蛋糕出现缺失、脏污、破损、配送错误等问题，请在验收时当场指出  。请及时与客服人员联系，
            让我们免费为您重新配送，验收过后我们将不予受理此类问题。<br />
            3.如订购蛋糕出现断货现象，客服人员会及时与您联系，征询  您的意见，调换或取消订单！若您已完成付款，
            取消订单后，我们会将及时为您退回支付金额。</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16 ptb">&nbsp;</div>
        <strong>诺心LE CAKE如何使用蛋糕卡</strong><br />
        <p>蛋糕卡规则和异地收卡规则：<br />
            有效期限：蛋糕卡订购及配送有效期请查询蛋糕卡背面；<br />
            使用方法：蛋糕卡用于诺心官网及400热线订购使用，可抵扣同  等值蛋糕1个，卡密用作支付凭证，请妥善保管，遗失不补；<br />
            关于优惠：使用蛋糕卡订购，不参与诺心积分奖励，不与其他  优惠活动同享；<br />
            关于配送：蛋糕卡配送范围参考诺心官网www.lecake.com最新  发布信息为准；<br />
            关于销售：蛋糕卡售出恕不退款，不兑现，不找零；<br />
            特别声明：非诺心授权单位或个人，不可对本卡进行二次销售  ，否则诺心有权暂停该卡的使用；<br />
            本卡须在配送货品时回收，无蛋糕卡实卡一律不做订购配送；  <br />
            如产生异地支付（异地收卡），需额外收取服务费，收费标准  请咨询400客服热线。</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16 ptb">&nbsp;</div>
        <strong>退换货须知</strong><br />
        <p>由于食品的特殊性，非我们的失误引起的蛋糕在运输途中的  变形、损坏均不接受退换货。 <br />
            如果由于因我们运输途中发生的变形，你可以拒收，请您在第  一时间联系我们的客服人员，我们的客服人员会帮您满意的解决。</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16 ptb">&nbsp;</div>
        <strong>退款须知</strong><br />
        <p>自您提交退款申请当日起，诺心会在14个工作日内核实并将  货款退回至您原支付账号中，请您耐心等候。<br />
            *若您在超过14个工作日仍未收到退款，请致电4001578578。  <br />
            感谢您对诺心的支持！<br />
            &nbsp;</p>
    </td>
</tr>
<tr class="job_item">
    <td align="left">
        <div class="red16 ptb">&nbsp;</div>
        <strong>投诉通道</strong><br />
        <p>如您在购物过程中有任何建议或投诉请和我们联系，联系方  式 4001-578-578</p>
    </td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</p>
</body>
</html>

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
<script type="text/javascript" src="../static/js/site.js"></script>
<script type="text/javascript" src="../static/js/global.js"></script>

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
<script type="text/javascript" src="../static/js/common.js"></script><!---------footer star---------------------------------->
</div><!--  开始标签 <div class="TN_BigBoxBG"> 位于 comm_naviBanner.tpl -->
<div class="TN_footer hide">
    <div class="TN_footercen">

        <div class="TN_Fone">
            <span class="TN_but_logo"><img src="../static/picture/tn_but_logo.png" width="258" height="55" /></span>
            <span class="TN_butL_Byu">新鲜配送上门</span>
            <!--span class="TN_but_flower"><img src="../static/picture/tn_footflower_14.jpg" width="22" height="24" /></span--->
            <p style="margin-right: 5px">
                <p>
                        <a href="/SH/index.html" class="L" onclick="return city.set_city('2','上海市','SH');">上海</a>
            <span class="TN_st">|</span>        <a href="/BJ/index.html" class="L" onclick="return city.set_city('287','北京市','BJ');">北京</a>
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
            <li><img class="L" src="../static/picture/tn_round_l.png" width="52" height="52" />&nbsp;<b>全年无休</b></li>
            <li><img class="L" src="../static/picture/tn_round_e.png" width="52" height="52" />&nbsp;<b>安全配送</b></li>
            <li><img class="L" src="../static/picture/tn_round_c.png" width="52" height="52" />&nbsp;<b>品质保证</b></li>
            <li><img class="L" src="../static/picture/tn_round_a.png" width="52" height="52" />&nbsp;<b>上乘食材</b></li>
            <li><img class="L" src="../static/picture/tn_round_k.png" width="52" height="52" />&nbsp;<b>专业客服</b></li>
            <li><img class="L" src="../static/picture/tn_round_e.png" width="52" height="52" />&nbsp;<b>企业采购</b></li>
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
								<a href="/shop/help-55.html" target="_blank" class="L">客服服务</a><span>|</span>
								<a href="/shop/help-497.html" target="_blank" class="L">磅改食公告</a><span>|</span>
								<a href="/shop/help-517.html" target="_blank" class="L">上海迪士尼区域配送调整公告</a><span>|</span>
								<a href="/shop/help-614.html" target="_blank" class="L">华南区白云机场区域配送调整公告</a><span>|</span>
								<a href="/shop/help-620.html" target="_blank" class="L">华北天津滨海新区区域配送调整公告</a><span>|</span>
								<a href="/shop/help-702.html" target="_blank" class="L">翻滚吧，冰淇淋！让酷暑离你远远的</a><span>|</span>
								<a href="/shop/help-711.html" target="_blank" class="L">诺心LECAKE</a><span>|</span>
								<a href="/shop/help-717.html" target="_blank" class="L">心悦中秋大礼包</a><span>|</span>
								<a href="/shop/help-757.html" target="_blank" class="L">诺心LECAKE</a><span>|</span>
			
			<!--  上海工商局 -->
            <SCRIPT LANGUAGE="JavaScript" >
            document.writeln("<a href='https://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&entyId=1u2xwmwzpxrk6u2rvor2928au92degmyr8rxc2ylqre60wm'><img src='../static/picture/gsicon.gif' style='margin-top:-4px' border=0></a>")
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
        <img class="icon" src="../static/picture/ico_service.png" alt="" />
        <img class="pop_img service_help" src="../static/picture/service_help.png" alt="" />
    </a>
    <a class="service_btn" href="javascript:void(0)">
        <img class="icon" src="../static/picture/ico_wechat.png" alt="" />
        <img class="pop_img wechat_qr_code" src="../static/picture/wechat_qr_code.png" alt="" />
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
        },    });
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
    <a href="/shop/unionlogin.php?uniontype=alipay" class="union_alipay">支付宝</a>
    <a href="/shop/unionlogin.php?uniontype=sina" class="union_sina">新浪微博</a>
    <a href="/shop/unionlogin.php?uniontype=qq" class="union_qq">QQ</a>
    <a href="/shop/unionlogin.php?uniontype=renren" class="union_renren">人人网</a>
    <a href="/shop/unionlogin.php?uniontype=wanlitong" class="union_wanlitong">平安万里通</a>
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
				
				<a href="/shop/checkout.php" class="checkout sprite">&nbsp;</a>
	      
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
					&nbsp;&nbsp;<img class="hand" src="../static/picture/btn_ok.jpg" onclick="pop_add_goods_to_cart();" />
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
			<img src="../static/picture/b_logo.png">
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
			url: '/shop/wechat/msg.php', //测试接口，请根据实际情况修改
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
            <img src="../static/picture/qr_code_bottom.png"/>
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