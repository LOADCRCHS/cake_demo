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
        <link href="${pageContext.request.contextPath}/static/css/notice.css" rel="stylesheet"></head>
<body>
<div class="container main_notice">
    <jsp:include page="../head-nav.jsp"/>
    <div class="main main_width">
        <div class="top">
            <section class="clear_fix section_title">
                <div class="content content_left f_left">
                    诺心公告
                </div>
            </section>
        </div>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">进博会期间上海地区配送公告</h3>
                    <p class="date">2018-11-01</p>
                </div>
                <div class="content content_right f_right">
                    <span>亲爱的上海用户：<br>    2018年11月5日至11月10日，每天8:00-19:00，因进博会临时交通管制，上海市崧泽大道-蟠臻路-蟠中东路-蟠文路-徐民东路-蟠秀路-盈港东路-涞港路-崧泽大道合围区域（除盈港东路-涞港路外）上述路段蛋糕站点物流配送可能延迟。特此公告，敬请谅解。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">2018年中秋月饼券兑换公告</h3>
                    <p class="date">2018-10-22</p>
                </div>
                <div class="content content_right f_right">
                    <span>亲爱的诺心用户：<br>如您未及时兑换中秋迷藏月饼礼盒，可于2018年10月23日至2018年12月31日期间，凭月饼券兑换诺心其他在线商品，具体兑换方案如下：<br><br>方案一：补差换蛋糕<br>168元面值月饼券可补差兑换【企业专区】-【福利券区】-【悦享福利】2-4人食蛋糕1个，如1张168元月饼券补差30元，可兑换198元蛋糕1个。<br><br>方案二：自由组合兑换<br>凭月饼券可自由组合兑换下列商品，超出券面金额的部分补足即可：<br>1.	浪漫巴黎曲奇礼包（混合装）<br>2.	千层蝴蝶酥•For Me（原味）<br>3.	蔓越莓曲奇礼盒（樱花粉）<br>4.	海盐乳酪芝士蛋糕（2-4人食）<br>5.	海盐乳酪芝士蛋糕（5-8人食）<br>6.	雪域大理石芝士蛋糕（2-4人食）<br>7.	雪域大理石芝士蛋糕（5-8人食）<br>温馨提示：月饼券需一次性兑换完成，不找零，兑换时不开具发票。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">华北天津滨海新区区域配送调整公告</h3>
                    <p class="date">2017-12-25</p>
                </div>
                <div class="content content_right f_right">
                    <span>尊敬的天津用户：    <br>    2018年1月1日起天津部分地区调整配送范围。天津滨海新区取消配送，具体调整区域请查看1月1日起发布的天津配送地图或提前电话咨询，特此公告。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">华南区白云机场区域配送调整公告</h3>
                    <p class="date">2017-11-25</p>
                </div>
                <div class="content content_right f_right">
                    <span>尊敬的广州用户：    <br>    2017年12月1日起广州部分地区调整配送范围。广州白云机场区域取消配送，具体调整区域请查看12月1日起发布的广州配送地图或提前电话咨询，特此公告。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">上海迪士尼区域配送调整公告</h3>
                    <p class="date">2017-04-01</p>
                </div>
                <div class="content content_right f_right">
                    <span>亲爱的诺心用户：<br>    2017年4月14日起上海部分地区调整配送范围。由于迪士尼园区官方不准第三方进入配送，故迪士尼园区内不做配送，订购产品需在园区门口进行交接，特此公告。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">蛋糕计量单位升级公告</h3>
                    <p class="date">2017-03-01</p>
                </div>
                <div class="content content_right f_right">
                    <span>重要公告：<br>    为方便广大顾客选购蛋糕，根据用户反馈建议，3月16日起诺心蛋糕规格将全面升级，蛋糕计量单位由“1磅”改为“2-4人食”、“2磅”改为“5-8人食”、“3磅”改为“10-12人食”、“5磅”改为“15-20人食”。敬请知悉，感谢！</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">中秋蛋糕券兑换公告</h3>
                    <p class="date">2016-09-20</p>
                </div>
                <div class="content content_right f_right">
                    <span>亲爱的诺心用户：<br>    中秋已过，余韵不绝。持有中秋218元合月蛋糕券、336元心月·月光宝合蛋糕券的用户，因错过中秋产品兑换期限。现可持218元合月蛋糕券可兑换1磅海盐乳酪芝士蛋糕，或1磅巧克力三部曲蛋糕；持有336元心月·月光宝合蛋糕券可兑换2磅海盐乳酪芝士蛋糕，或2磅巧克力三部曲蛋糕。2016年11月1日起至2016年12月31日完成订购与配送~美味正当时，请尽快订购。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">诺心蛋糕价格调整公告</h3>
                    <p class="date">2016-06-10</p>
                </div>
                <div class="content content_right f_right">
                    <span>尊敬的诺心用户：<br>    2016年7月1日起诺心官网部分蛋糕将进行价格调整，原价1磅188元调整为198元；原价2磅290元调整为298元；原价3磅434元调整为458元；原价5磅724元调整为756元；另持有188元蛋糕券用户可免差价购买198元蛋糕，持有290元蛋糕券用户可免差价购买298元蛋糕，持有434元蛋糕券用户可免差价购买458元蛋糕，特此公告。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">北京地区配送调整公告</h3>
                    <p class="date">2015-03-25</p>
                </div>
                <div class="content content_right f_right">
                    <span>尊贵的北京用户：<br>    2015年4月1日起部分地区调整配送范围。具体调整区域请查看4月1日起发布的北京配送地图或前电话咨询，特此始。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">温馨提示</h3>
                    <p class="date">2014-12-16</p>
                </div>
                <div class="content content_right f_right">
                    <span>尊贵的广大客户：    <br>    近期出现因诺心蛋糕券卡号/密码被刮花、折损而不能识别的情况，导致了蛋糕券无法使用。请各位客户不要使用利器刮开密码栏或刮损卡号，保持密码栏的清晰完整。如卡号与密码栏被折损至无法识别的情况，蛋糕券只能按作废处理。请尊贵的各位客户务必妥善保存诺心蛋糕券。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">诺心公示</h3>
                    <p class="date">2014-02-01</p>
                </div>
                <div class="content content_right f_right">
                    <span>尊贵的各位客户：
<br>    本公司发现以下卡号段的代金卡
<br>201407057151556212-201407057151556511
<br>201312057125087624-201312057125087723
<br>201308057102953035-201308057102953084
<br>201402057122185096-201402057122185195
<br>201402001033212880-201402001033212919
<br>201402001034214303-201402001034214362
<br>201402001035215869-201402001035215918
<br>201407002154582031-201407002154582280
<br>201407002154582781-201407002154582912
<br>201407002154576780-201407002154576780
<br>201407002154582009-201407002154582030
<br>201409002197678134-201409002197678933
<br>    属于未经本公司授权的非正常渠道的代金卡。由于诺心代金卡背面已经明确公示“非诺心食品授权单位或个人，不可对本卡进行二次销售，否则诺心有券暂停该卡的使用”。任何非诺心官方或授权渠道的转卖行为纯属个人行为与诺心lecake无关。
<br>    非正常渠道购买的代金卡无法在诺心lecake的任何渠道购买产品。
<br>    请持有此字段代金卡的用户自行个卖家协商。</span>
                </div>
            </section>
                    <section class="clear_fix section_content">
                <div class="content content_left f_left">
                    <h3 class="title">苏州地区配送调整公告</h3>
                    <p class="date">2013-10-20</p>
                </div>
                <div class="content content_right f_right">
                    <span>尊贵的苏州用户：<br>    2013年11月1日起苏州部分地区上调配送费用。具体上调区域请查看11月1日起发布的苏州配送地图或提前电话咨询，特此公告。</span>
                </div>
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
</div><script>
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
</script><script src="${pageContext.request.contextPath}/static/js/sitelist.js"></script>
<script src="${pageContext.request.contextPath}/static/js/widget.js"></script>
<script src="${pageContext.request.contextPath}/static/js/base.js"></script>
<!--HPSTAT start-->
<script type="text/javascript">var glbStatConfig={stat_host:"www.lecake.com",click_id: "KyHhq1JRgVif"};</script>
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

