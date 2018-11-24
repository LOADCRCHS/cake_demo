 var flg = 0;//控制时间显示
var distribute_array = {}; //配件分配数组

//选择省份信息
deliver.province_change = function() {
    var provinceid = $("#provinceid").val();
    var listHtml = "<option value=\"\" label=\"请选择...\">请选择...</option>";
    if (provinceid == "") {
        $("#render_province").text("");
    } else {
        $("#countyid").html(listHtml);

        var city_list = region_obj[provinceid].c;
        listHtml = "";
        if (city_list) {
            $.each(city_list , function (k, v) {
                if(get_COOKIE_INFO("CITY_ID").split('_')[1]==k){
                    listHtml += "<option value=\"" + k + "\" label=\"" + v.n + "\">" + v.n + "</option>";
                }

            });
        }
        $("#render_province").text($("#provinceid").find("option:selected").text());
    }
    $("#cityid").html(listHtml);
    $("#render_city").text("");
    $("#render_district").text("");
    deliver.provinceid = provinceid;
    deliver.provinceName = $("#provinceid").find("option:selected").text();

    bill.freight = 0.00;
    $("#font_total_amount").text(bill.total.toFixed(2));
    $("#font_freight").text(bill.freight);

}
//选择市区信息
deliver.city_change = function() {
    var provinceid = $("#provinceid").val();
    var cityid = $("#cityid").val();
    var listHtml = "<option value=\"\" label=\"请选择...\">请选择...</option>";
    if (cityid == "") {
        $("#render_city").text("");
    } else {
        var county_list = region_obj[provinceid].c[cityid].c;
        if (county_list) {
            $.each(county_list , function (k, v) {
                listHtml += "<option value=\"" + k + "\" label=\"" + v.n + "\">" + v.n + "</option>";
            });
        }
        $("#render_city").text($("#cityid").find("option:selected").text());
    }
    $("#countyid").html(listHtml);
    $("#render_district").text("");
    $("#render_town").text("");
    deliver.cityid = cityid;
    deliver.cityName = $("#cityid").find("option:selected").text();
    bill.freight = 0.00;
    $("#font_total_amount").text(bill.total.toFixed(2));
    $("#font_freight").text(bill.freight);
}
//选择地区信息
deliver.county_change = function() {
    var provinceid = $("#provinceid").val();
    var cityid = $("#cityid").val();
    var countyid = $("#countyid").val();
    var listHtml = "<option value=\"\" label=\"请选择...\">请选择...</option>";
    if (countyid == "") {
        $("#render_district").text("");
    } else {
        var town_list = region_obj[provinceid].c[cityid].c[countyid].c;
        if (town_list) {
            $.each(town_list , function (k, v) {
                listHtml += "<option value=\"" + k + "\" label=\"" + v + "\">" + v + "</option>";
            });
            $("#townid").html(listHtml);
            $("#render_town").text("");
            deliver.countyid = countyid;
            deliver.countyName = $("#countyid").find("option:selected").text();
            bill.freight = 0.00;
            $("#font_total_amount").text(bill.total.toFixed(2));
            $("#font_freight").text(bill.freight);
        }else{
            deliver.countyid = '';
            deliver.countyName = '';
        }
        
        //xajax_do_req_checkout([deliver.provinceid, deliver.cityid, deliver.countyid, deliver.townid, addressInfo], 14);
    }
}

//选择镇信息
deliver.town_change = function() {
    var townID = $("#townid").val();
    if (townID == "") {
        $("#render_town").text("");
    } else {
        var townName = $("#townid").find("option:selected").text();
        $("#render_town").text(townName);
    }
    deliver.townid = townID;
    deliver.townName = $("#townid").find("option:selected").text();
    
    var addressInfo = [
			$('textarea[id=addrMail]').val(),	//客户地址
			$('input[id=addrMobi]').val(),	//手机号码
			$('input[id=addrNum]').val(),		//电话号码
			$('#provinceid').find("option:selected").text(), //省名
			$('#cityid').find('option:selected').text(),//市名
			$('#countyid').find('option:selected').text(),//区名
		];
	//根据选择的镇信息查询运费
    //xajax_do_req_checkout([deliver.provinceid, deliver.cityid, deliver.countyid, deliver.townid, addressInfo ], 14);
}

deliver.province_change();
deliver.city_change();

 //未使用
//切换配送时间
 bill.changSendTime_bak = function( time_flg,flag ) {
     var sid = flag ? '#o_' : '#';
     var send_start_time = $(sid + 'send_start_time').find("option:selected").val();
     var send_end_time =  $(sid + 'send_end_time').find("option:selected").val();
     if (send_start_time < send_end_time){
         if (time_flg == 2 && send_start_time == "") {
             if (parseInt(send_end_time) != 0) {
                 $(sid + "send_start_time").val(parseInt(send_end_time) - 10000);
             } else {
                 //  var temp = parseInt(send_end_time);
                 $(sid + "send_start_time").val(parseInt(send_end_time) - 10000);
             }
         }
         return false;
     }

     if (time_flg == 1) {
         if (send_start_time !=0) {
             $(sid + "send_end_time").val(parseInt(send_start_time) + 10000);
         } else {
             $(sid + "send_end_time").val(parseInt(send_start_time) + 10000);
         }

     } else {
         if(send_end_time){
             if (parseInt(send_end_time) !=0 ) {
                 $(sid + "send_start_time").val(parseInt(send_end_time) - 10000);
             } else {
                 $(sid + "send_start_time").val(parseInt(send_end_time) - 10000);
             }
         }else
             $(sid + "send_start_time").find("option").eq(0).attr("selected",true);
     }
 }

bill.modifySendTime = function(choiceid,changeid){
    if($("#send_start_time").get(0).selectedIndex > $("#send_end_time").get(0).selectedIndex){
        $("#"+changeid).get(0).selectedIndex = $("#"+choiceid).get(0).selectedIndex;
    }
}
bill.changSendTime = function( time_flg ) {
    var send_start_time =$('#send_start_time').find("option:selected").val();
    var send_end_time =$('#send_end_time').find("option:selected").val();
    if (send_start_time < send_end_time){
        if (time_flg == 2 && send_start_time == "") {
            if (parseInt(send_end_time.substring(2)) == 3000) {
                $("#send_start_time").val(parseInt(send_end_time) - 3000);
            } else {
                var temp = parseInt(send_end_time.substring(0,2));
                $("#send_start_time").val(parseInt(send_end_time) - 7000);
            }
        }
        return false;
    }

    if (time_flg == 1) {
        if (send_start_time.substring(2) == "3000") {
            $("#send_end_time").val(parseInt(send_start_time) + 7000);
        } else {
            var temp = parseInt(send_start_time.substring(0,2));
            $("#send_end_time").val(parseInt(send_start_time) + 3000);
        }
    } else {
        if(send_end_time){
        if (parseInt(send_end_time.substring(2)) == 3000) {
            $("#send_start_time").val(parseInt(send_end_time) - 3000);
        } else {
            var temp = parseInt(send_end_time.substring(0,2));
            $("#send_start_time").val(parseInt(send_end_time) - 7000);
        }
        }else
            $("#send_start_time").find("option").eq(0).attr("selected",true);
    }
}

//货到刷京城热购卡
var rgk = {

    check_use:function(){

        cardNum = $.trim($("#rgknum").val());

        if( cardNum == ""){
            comm_alert("请填写建行京城热购卡会员号！");
            return false;
        }

        var reg = new RegExp("^[0-9]{12}$");
        if(!reg.test(cardNum)){
            comm_alert("请输入12位数字");
            return false;
        }
		
        $("#rgkCheck").hide();
        comm_box.loadding();
		
		$("#rgknum").attr("value",cardNum);
        this.cardNum = cardNum;

        xajax_do_req_checkout([this.cardNum], 25);

    },
    success:function(msg){
        comm_box.loadding_close();
        $("#rgkCheck").hide();
        $("#rgkCancel").show();
        comm_alert(msg);
		$("#rgk_other").attr("value",1);
        //this.isFavour = 1;
    },
    fail:function(msg){
        comm_box.loadding_close();
        $("#rgkCheck").show();
        comm_alert(msg);
		$("#rgk_other").attr("value",0);
       // this.isFavour = 0;
    },
    cancel:function(){
        comm_box.loadding_close();
        $("#rgkCheck").show();
        $("#rgkCancel").hide();
		$("#rgk_other").attr("value",0);
       // this.isFavour = 0;
    }

};

//快速支付类
var payQuick={
    flg:1,				//flg 1.快速购买 2.蛋糕券购买
    msg:'',   			//提示信息
    mobile:'',			//手机号
    orderUser:'',		//订货人姓名
    address:'',			//收货地址
    deliverUser:'',		//收货人姓名
    telephone:'',		//收货手机
    areaCode:'',		//收货电话(区号)
    phone:'',			//收货电话(号码)
    extNo:'',			//收货电话(分机号)
    payTypeID:'',		//支付方式
    deliverID:'',		//配送方式
    payMoneyType:'',	//付现方式
    send_date:'',		//配送日期
	hdfk:0,             //货到付款标志.0否;1是
    send_start_time:'',	//配送开始时间
    send_end_time:'',	//配送结束时间
    timeFlg : 0	,		//配送时间确定标识 0.未确认 1.确认
    params : {},		//提交订单数据数组
    check:function(){	//快速支付检查
    	this.orderUser = Utils.trim($("#orderUser").val());
        if(this.orderUser == '' ){
            this.msg += '请填写订货人姓名<br/>';
        }
    	
        this.mobile = Utils.trim($("#cellphone").val());
        if(this.mobile == ''){
            this.msg += '请填写手机号<br/>';
        }else if(!Utils.isMobile(this.mobile)){
            this.msg += '请填写正确的手机号<br/>';
        }
        
        this.deliverUser = Utils.trim($("#deliverUser").val());
        if(this.deliverUser == ''){
            this.msg += '请填写收货人姓名<br/>';
        }
        if(typeof(bill.shipID) =="undefined" || bill.shipID == 0){
            this.address = Utils.trim($("#addrMail").val());
        }else
        {
            this.address = Utils.trim($("#confirm_street").html());
        }
        if(this.address == ''){
            this.msg += '请填写街道地址<br/>';
        }
        
        this.telephone = Utils.trim($("#addrMobi").val());
        this.phone = Utils.trim($("#addrNum").val());
        
        if (this.telephone && !Utils.isMobile(this.telephone)) {
        	this.msg += '请输入正确的收货人手机<br/>';
        }
        
        if (this.phone && !Utils.isTel(this.phone)) {
        	this.msg += '请输入正确的收货人固定电话<br/>';
        }
        
        if (!this.telephone && !this.phone) {
        	this.msg += '收货人手机和固定电话至少填写一项<br/>';
        }
        
        //判断收货地址是否确认
    	var address_confirm_flg = $('#address_confirm_flg').val();
    	if (address_confirm_flg != 1) {
    		this.msg += '请确认收货地址<br/>';
    	}
        
        if(this.timeFlg == 0){
            this.msg += '请确认配送时间<br/>';
        }

        if(this.payTypeID == ''){
            this.msg += '请选择支付方式';
        }else if(this.payTypeID == 1){//货到付款,获取付现方式
            this.payMoneyType = $("#payMoneyType").val();
            if(this.payMoneyType == ''){
                this.msg += '请选择付现方式';
            }
        }else{//在线支付
            this.payMoneyType = '';//清空付现方式
        }
        //配送时间
        this.send_date = Utils.trim($("#send_date").val());			//配送开始日期
        var send_start_time = Utils.trim($('#send_start_time').find("option:selected").val());//Utils.trim($("#send_start_time").val());
        var send_end_time = Utils.trim($('#send_end_time').find("option:selected").val());//Utils.trim($("#send_end_time").val());
        this.send_start_time = send_start_time.substring(0, 2) + ":" + send_start_time.substring(2,4) + ":00";		//配送开始时间
        this.send_end_time = send_end_time.substring(0, 2) + ":" + send_end_time.substring(2,4) + ":00";			//配送结束
		
		//货到刷建行京城热购卡
		this.rgk_other = Utils.trim($("#rgk_other").val());
		this.cardNum = Utils.trim($("#rgknum").val());
		this.hdfk = Utils.trim($("#hdfk").val());



        //检查是否有蛋糕券未验证
        var cardPwd = $("#goldCard_input").val();

        if(cardPwd != '' && cardPwd != undefined){
            if(jQuery.isEmptyObject(goldCard.card)){
                comm_alert('您有蛋糕券未验证,请验证蛋糕券信息');
                return;
            }
        }
        if(this.msg != ''){
            comm_alert(this.msg);
            this.msg = '';
            return;
        }else{
            //var params = {};
            this.params.billType = 1;											//订单类型
            this.params.mobile = this.mobile;									//订货人手机号
            this.params.orderUser = this.orderUser;								//订货人姓名
            this.params.deliverUser = this.deliverUser;								//收货人姓名
            this.params.address = this.address;									//收货地址
            this.params.telephone = this.telephone;								//收货人手机
            //this.params.areaCode = this.areaCode;								//电话区号
            this.params.phone = this.phone;										//电话号码
            //this.params.extNo = this.extNo;										//电话分机号
            this.params.payment_id = this.payTypeID;								//支付方式
            this.params.sendTypeID = this.deliverID;								//配送方式
            this.params.payMoneyType = this.payMoneyType;						//付现方式
            this.params.send_date    = this.send_date;							//配送日期
            this.params.send_start_time = this.send_start_time;					//配送开始时间
            this.params.send_end_time = this.send_end_time;						//配送结束时间
            this.params.goldCard = goldCard.card;								//蛋糕券数组
            this.params.bonus_array = bonus_array;								//促销换购数组
            //add by Jerry 20130814 运费
            this.params.zpt_route_fName = $("#zpt_route_fName").val();
            this.params['promotion_source'] = get_COOKIE_INFO('PROMOTION_SOURCE_ID'); //促销来源
            this.params.shipID = bill.shipID;                                   //addby LFL 2013-08-23 自提ID

            if(this.payMoneyType == 1){
                this.params.pay_cash = 1;
                this.params.pay_cash_name = '现金';
            }else if(this.payMoneyType == 2){
                this.params.pay_cash = 2;
                this.params.pay_cash_name = 'pose';
            }else{
                this.params.pay_cash = 3;
                this.params.pay_cash_name = '线上';
            }


			//货到刷建行京城热购卡
			this.params.rgk_other = Utils.trim($("#rgk_other").val());
			this.params.cardNum = Utils.trim($("#rgknum").val());
			this.params.hdfk = Utils.trim($("#hdfk").val()); //是否货到付款



            //addby LFL 2013-09-02 验证订单上限
            this.params['billdelay'] = 0;
            if(bill.shipID == 0){
                var zpt_line = $("#zpt_route_fName").val();
                var delay_params = {};
                delay_params[0] = zpt_line;
                delay_params[1] = this.params['send_date'];
                delay_params[2] = this.params['send_start_time'];
                xajax_do_req_bill(delay_params,18); //判断是否延时  更改bill.billdelay = 1
            }

            //核对订单显示内容 -- 开始
            var listHtml = "<div style='line-height:25px; padding:10px;'>";
            listHtml += "<div>为您核对订单：</div>";
            var lecake_num = $('input[id=cart_cake_goods_amount]').val();
            listHtml += "<div>　　您订购了诺心LECAKE<span class=\"red\">   " + lecake_num +"</span>款蛋糕：</div>";
            listHtml += "<div style='max-height:200px; overflow-y:auto; width:500px;'>";
            $.each($('#cart_general_goods').data(), function(k, v) {
                //addby LFL 2013-09-06 确认页显示生日牌、是否切分
                var strhtml = "";
                if($('input[id^=goods_sixteen_piece_]').attr('checked') == 'checked'){
                    strhtml ="<span class=\"red\">需切分 ，</span>";
                }
                listHtml += "<div>　　　　<span class=\"red\">" + v.spec +"</span>的" + v.goodsName +"，数量<span class=\"red\">" + v.goods_amount +"</span> ，" + strhtml + "蛋糕金额为<span class=\"red\">" + (v.purchasePrice * v.goods_amount).toFixed(2) +"</span>元</div>";
            })
            listHtml += "</div>";
            listHtml += "<div>　　配送日期为：<span class=\"red\">" + this.params['send_date'] + " " + this.params['send_start_time'] + "-" + this.params['send_end_time'] + "</span></div>";
            //收货人信息
            listHtml += "<div>　　配送至：<span class=\"red\">" + this.orderUser+' '+deliver.provinceName+' '+deliver.cityName+' '+deliver.countyName+' ';
            if (deliver.townName) {
            	listHtml += deliver.townName;
            }
			listHtml += ' '+this.address + "（物流费用：" + bill.freight.toFixed(2) + "元)</span></div>";
            var pro_list_html = '';
            if (goldCard.goldCard_total > 0) {
                pro_list_html += "蛋糕券优惠：<span class=\"red\">" + goldCard.goldCard_total.toFixed(2) + "</span>元 ";
            }

            if (pro_list_html.length > 0) {
                pro_list_html = "<div>　　" + pro_list_html + "</div>";
                listHtml += pro_list_html;
            }

            //var isPay = bill.initTotal + bill.freight - goldCard.goldCard_total + promotion.addMoney;
			var isPay = bill.total + bill.freight - goldCard.goldCard_total + promotion.addMoney;	

            if (isPay < 0) {
                isPay = 0;
            }
            listHtml += "<div>　　订单总金额为：<span class=\"red\">" + isPay.toFixed(2) + "</span>元，应付：<span class=\"red\">" + isPay.toFixed(2) + "</span>元</div>";
            listHtml += "<div>　　诺心LECAKE.不定期有新产品推出，请您关注我们的网站信息，祝您购物愉快！</div></div>";
            $('#comm_confirm').css('top','20px');
            $('#comm_confirm').css('z-index','999');
            comm_box.confirm_open(listHtml,'payQuick.submitcConfirm');
        }
    },
    submitcConfirm:function() {
        comm_box.loadding();
        this.params['billdelay'] = bill.billdelay;
        xajax_do_req_bill([this.params,deliver], 8);
    },
    callback:function(result_str){
        comm_box.loadding_close();
        comm_alert(result_str);
    },
    login_back:function(mobile){
        comm_box.loadding_close();
        customer.open_login('payQuick.jumpUrl');
    },
    success:function(custID){
        //customer.custID = custID;
        customer.set_cookie(custID);
        customer.show_IDENTIFIER();
    },
    jumpUrl:function(){
        self.location = '/shop/checkout.php';
    }
    
}
function get_all_region(){
    //customer.last_url = '/shop/quickbuy.php';
    customer.open_login();
}
//获取支付方式
function getPayTypeID_bak(payTypeID){
    payQuick.payTypeID = payTypeID;
    if(payTypeID == 1){//货到付款
        if ($('input[name=payType]').attr('flg') != 1) {
            var html = "<select name='payMoneyType' id='payMoneyType'>";
            html += "<option value='1'>现金1</option>";
            html += "<option value='2'>pos2</option>";
            $('#span_'+payTypeID).append(html);
            $('input[name=payType]').attr('flg',1);
        }
    }else{
        var html = "<input type='radio' name='payType' value='1' class='payType' onclick='getPayTypeID(1);'>货到付款";
        $("#span_1").html(html);
    }
    flg=1;
    promotion.execute();
}


//获取支付方式
function getPayTypeID(payTypeID){
    payQuick.payTypeID = payTypeID;
    flg=1;
    promotion.execute();
}


//配送方式
var Send = {

    //展开和收起配送方式
    change: function() {
        if (bill.changFlg == 1) {
            $("tr[id^='send_list_']").removeClass("hide");
            $("#change_send").text("关闭");
            bill.changFlg = 0;
            $("#deliver_header").addClass("opt")
        } else {
            var check_id = $("input[name='send_type']:checked").val();
            if (!check_id) {
                return false;
            }
            $.each($("tr[id^='send_list_']"),function(k,v) {
                if ("send_list_" + check_id != v.id)
                    $(v).addClass("hide");
            });
            $("#change_send").text("修改");
            bill.changFlg = 1;
            $("#deliver_header").removeClass("opt")
        }
    },

    //检查运费
    getFreightFree: function() {
        //运费信息
        var check_id = $("#sendType").text();
        payQuick.deliverID = check_id;
        //配送方式被选中
        var send_data = $("#send_data").data("send_data_" + check_id);
        //检查订单金额是否满足免运费订单下限金额
        if (bill.total >= send_data.freeBillMoney && send_data.isPrivilege) {
            $("#font_total_amount").text((bill.total-coupons.coupon_total-giftCards.cards_total-goldCard.goldCard_total).toFixed(2));
            $("#font_freight").text(send_data.promotionFreight.toFixed(2));
            $("#spread_tr").addClass("hide");
            $("#postageNumer").show();		//隐藏免邮卡输入
        } else {

            //检查距离订单免运费差额
            if (send_data.freight > 0 && send_data.isPrivilege) {
                $("#spread").text((send_data.freeBillMoney - bill.total).toFixed(2));
                $("#spread_tr").removeClass("hide");
            } else {
                $("#spread_tr").addClass("hide");
            }
            //查看是否免运费
            if (bill.freeFreightFlg == 1) {
                send_data.freight = 0;
            }
            var isPay = bill.total + send_data.freight - goldCard.goldCard_total;
            $("#font_total_amount").text(isPay.toFixed(2));
            $("#font_freight").text(send_data.freight.toFixed(2));
            bill.freight = send_data.freight;

        }
    },
    
    //宅配通运费提示
	zpt_catchline: function (flg) {
		switch (flg) {
			case 1:
				comm_alert('该区域不支持配送，如果您要下单请联系网站客服。');
				break;
			case 2:
				comm_alert('请完善收货地址的地区信息');
				break;
		}
		
	},
	
	//收货地址修改
    editAdress: function () {
    	$('.address_confirm_show').addClass('hide');
		$('.address_confirm_hide').removeClass('hide');
        if(bill.shipID == 0){
            $('#shipself').addClass('hide');
        }else{
            $('#shiplecake').addClass('hide');
        }
        $("input[name='shipWay']").attr('disabled',false);
		//修改收货地址确认标记
		$('#address_confirm_flg').val('0');
		//editby LFL 2014.11.19 合并时间地址确认按钮
        $('#deliver_address_confirm').removeClass('hide');
        $('#deliver_address_amend').addClass('hide');
        time.edit();
    },
    
    //地址确认成功调用
    addressConfirm: function() {
		$('.address_confirm_show').removeClass('hide');
		$('.address_confirm_hide').addClass('hide');
        $("input[name='shipWay']").attr('disabled',true);
		//修改收货地址确认标记
		$('#address_confirm_flg').val('1');
		//editby LFL 2014.11.19 合并时间地址确认按钮
        $('#deliver_address_confirm').addClass('hide');
        $('#deliver_address_amend').removeClass('hide');
        time.confirm();
        promotion.execute();
    }
    
};

//收货地址确认
$('#deliver_address_confirm').click(function(){
    var provinceid, cityid, countyid, townid;
    var provinceName, cityName, countyName, townName, streetAddress;
    var HDFK = 0;
    error_msg = ''; //错误提示信息

    provinceid = $('#provinceid').val(); //省ID
    provinceName = $("#provinceid").find("option:selected").text(); //省名
    cityid = $('#cityid').val(); //市ID
    cityName = $('#cityid').find("option:selected").text(); //市名
    countyid = $('#countyid').val(); //区ID
    countyName = $('#countyid').find("option:selected").text(); //区名
    townid = $('#townid').val(); //县ID
    townName = $('#townid').find("option:selected").text(); //县名
    streetAddress = Utils.trim($('#addrMail').val()); //街道地址

    if (!provinceid || !cityid || !countyid||!townid) {
        error_msg += '请完善收货地址地区<br/>';
    }
    if (streetAddress == '') {
        error_msg += '请填写街道地址<br/>';
    }

    var deliverUser = Utils.trim($('#deliverUser').val()); //收货人姓名
    if (deliverUser == '') {
        error_msg += '请填写收货人姓名<br/>';
    }

    var mobile = $('#addrMobi').val(); //手机号码
    var phone = $('#addrNum').val(); //电话号码

    if (mobile && !Utils.isMobile(mobile)) {
        error_msg += '收货人手机格式不正确<br/>';
    }
    if (phone && !Utils.isTel(phone)) {
        error_msg += '固定电话格式不正确<br/>';
    }
    if (mobile=='' && phone=='') {
        error_msg += '收货人手机和电话至少填一项<br/>';
    }
    //editby LFL 2014.11.19 合并时间地址确认按钮
    //验证时间
    var date = $('#send_date').val();   //选择日期
    var send_start_time = Utils.trim($('#send_start_time').find("option:selected").val());//Utils.trim($('#send_start_time').val());
    var send_end_time = Utils.trim($('#send_end_time').find("option:selected").val());//Utils.trim($("#send_end_time").val());
    var send_start_t = tstart_time.substring(0, 2) + ":" + tstart_time.substring(2,4) + ":00";
    
    //添加配送限制时间 2015121 判断开始最晚时间 与结束最早时间
    var send_start_date_s = $('#isenddate').attr('min');
    var send_end_date_s = $('#isenddate').attr('max');    
    if(send_start_date_s && date<send_start_date_s){
    	comm_alert('该蛋糕暂不支持提前配送');
        return false;
    }
    if(send_end_date_s && date>send_end_date_s){
    	comm_alert('该蛋糕已停止售卖，不可配送');
        return false;
    }


    //判断日期时间合法性add by Jerry 20140305
    if(!dateCheck(date)){
        error_msg += '配送日期格式不正确<br/>';
    }
    if(date<tsend_date){
        error_msg += '配送日期不能小于'+tsend_date+'<br/>';
    }else{
        if(date==tsend_date && send_start_time<tstart_time){
            error_msg += '请选择配送时间！<br/>';
        }else{
            if(send_start_time==0 || send_end_time==0 )
            {
                comm_alert('请选择配送时间！');
                return false;
            }
        }
    }
    if (error_msg != '') {
        comm_alert(error_msg);
        return false;
    }

    //省市区html
    var addressHtml = '<div class="menu-select">'+provinceName+'</div><div class="menu-select">'+cityName+'</div><div class="menu-select">'+countyName+'</div>';
    if (townid != '') {
        addressHtml += '<div class="menu-select">'+townName+'</div>';
    }
    $('#confirm_pcct').html(addressHtml);

    //街道地址
    $('#confirm_street').html(streetAddress);

    //收货人姓名
    $('#confirm_username').html(deliverUser);

    //手机号码和电话号码
    var contactHtml = '';
    if (mobile) {
        contactHtml += '<div class="menu-name">收货人手机：</div><div class="menu-select">'+mobile+'</div>';
    }
    if (phone) {
        contactHtml += '<div class="menu-name">或固定电话：</div><div class="menu-select">'+phone+'</div>';
    }
    $('#confirm_contact').html(contactHtml);

    var addressInfo = [ streetAddress, mobile, phone, provinceName, cityName, countyName ];
    //查询配送方式
    $("#deliverValue").html("LE CAKE冷链配送");
    
    var send_date =  $('#send_date').val();
    var send_start_time =  $('#send_start_time').find("option:selected").text();
    xajax_do_req_checkout([provinceid, cityid, countyid, townid, addressInfo,send_date,send_start_time], 14);
});

//蛋糕券使用类
//蛋糕券

var goldCard = {

    goldCard_pwd: [],	//已使用蛋糕券数组
    goldCard_total: 0,	//蛋糕券抵扣总金额
    card:{},			//蛋糕券数组
    pwd:0,				//蛋糕券密码
    productID : '',
    //add by 杨杰 2013-04-22 限制拼卡
    cardcout:0,
    //使用蛋糕券
    use: function () {
        //add by 杨杰 2013-04-22 限制拼卡
        var goodscout=$("#cart_cake_goods_amount").val();
        var maxcard=$("#maxcard").val();
        var cardcout=this.cardcout;
        //add by 2014-04-09 yangjie  是否勾选使用说明
        if(!$("#isuseCaed").is(':checked')){
            comm_alert("请勾选蛋糕券使用说明！");
            return false;
        }

        if(maxcard==''){
            if(goodscout<=cardcout){
                comm_alert("使用蛋糕券数不能大于蛋糕数");
                return false;
            }
        }
		var card_num = Utils.trim($('input[name=cake_card_num]').val());
        if (Utils.isEmpty(card_num)) {
			comm_alert('请输入蛋糕券券号后4位');
			return false;
		}
        var pwd = Utils.trim($('input[name=cake_card_input]').val());
        //判断该蛋糕券是否已经使用
        if (!Utils.isEmpty(this.goldCard_pwd)) {
            for(var key in this.goldCard_pwd) {
                if (key == pwd) {
                    comm_alert('该蛋糕券已经使用过');
                    return false;
                }
            }
        }

        if (Utils.isEmpty(pwd)) {
            comm_alert('请输入蛋糕券密码');
            return false;
        }

        comm_box.loadding();
        xajax_do_req_checkout([pwd,card_num],13);
    },

    //蛋糕券使用失败
    fail: function(result_str) {
        comm_box.loadding_close();
        comm_alert(result_str);
    },

    //蛋糕券使用成功
    success: function (goldCard_arr) {
        comm_box.loadding_close();
        //comm_alert('收货时，蛋糕券需回收');
        goldCard_amount = goldCard_arr['cardAmount'];
        this.productID = goldCard_arr['productID'];
        this.pwd = Utils.trim($('input[name=cake_card_input]').val());
        this.goldCard_total += parseFloat(goldCard_amount);
        this.goldCard_pwd[this.pwd] = parseFloat(goldCard_amount);

        this.card[this.pwd] = {
            cardTypeName : goldCard_arr['cardTypeName'],
            cardAmount: goldCard_amount,
            productID: this.productID,
            flg: 1

        };
        //add by 杨杰 2013-04-22 限制拼卡
        this.cardcout++;
        //add by 2014-04-09 yangjie  是否勾选使用说明
        if(this.cardcout>0){
            $("#isuseCaed").attr("disabled","disabled");
        }else{
            $("#isuseCaed").attr("disabled","");
        }
//		var isPay = bill.total + bill.freight - this.goldCard_total;
//		if(isPay < 0){
//			var balance_amount = bill.total + bill.freight;
//			var balance_error = "使用的蛋糕券金额大于订单应付总金额<br />订单应付总金额[" + balance_amount + "]元<br/>多余的金额不返还，您确定使用吗？";
//			comm_box.confirm_open(balance_error,'goldCard.beyondPaid','goldCard.cancel');
//			return false;
//		}
//		$("#font_total_amount").text(isPay.toFixed(2));
//		$("#goldCardShow").text(this.goldCard_total.toFixed(2));
//		var listHtml = '';
//		for(var key in this.goldCard_pwd) {
//			listHtml += "蛋糕券密码为[" + key + "]，抵扣<span class=\"red\" style='color:red'>" + this.goldCard_pwd[key].toFixed(2) + "</span>元";
//			listHtml += "&nbsp;&nbsp;&nbsp;<a href=\"javascript: void(0);\" onclick=\"goldCard.cancel(" + key + ");\">取消使用</a><br/>";
//		}
//		$("#goldCard_html").removeClass('hide').html(listHtml);
//		$("#goldCard_input").val("");
//		var cardHtml = '-蛋糕券支付:'+this.goldCard_total.toFixed(2)+'元';
//		$("#goldCard").html(cardHtml);
        //重新加载促销
        promotion.execute();
    },

    //蛋糕券金额超出订单总金额
    beyondPaid: function () {
        comm_box.loadding_close();
        $("#font_total_amount").text('0.00');
        $("#goldCardShow").text(this.goldCard_total.toFixed(2));
        var listHtml = '';
        for(var key in this.goldCard_pwd) {
            listHtml += "蛋糕券密码为[" + key + "]，抵扣<span class=\"red\">" + this.goldCard_pwd[key].toFixed(2) + "</span>元";
            listHtml += "&nbsp;&nbsp;&nbsp;<a href=\"javascript: void(0);\" onclick=\"goldCard.cancel(" + key + ");\">取消使用</a><br/>";
        }
        $("#goldCard_html").removeClass('hide').html(listHtml);
    },

    //蛋糕券取消
    cancel: function (key) {
        this.productID = '';
        if (!key)
            key = this.pwd;
        this.card[key]['flg'] = 0;
        promotion.execute();
        this.goldCard_total -= this.goldCard_pwd[key];
        delete(this.goldCard_pwd[key]);
        delete(this.card[key]);

        //add by 杨杰 2013-04-22 限制拼卡
        this.cardcout--;
        //add by 2014-04-09 yangjie  是否勾选使用说明
        if(this.cardcout<1){
            $("#isuseCaed").attr("disabled","");
        }else{
            $("#isuseCaed").attr("disabled","disabled");
        }
//		var isPay = bill.total + bill.freight - this.goldCard_total;
//		
//		if (isPay > 0) {
//			$("#font_total_amount").text(isPay.toFixed(2));
//		} else {
//			$("#font_total_amount").text('0.00');
//		}
//		delete(this.goldCard_pwd[key]);
//		//this.goldCard_pwd.splice(key,1);
//		if (this.goldCard_total > 0) {
//			$("#goldCardShow").text(this.goldCard_total.toFixed(2));
//		} else {
//			$("#goldCardShow").text('0.00');
//		}
//		var listHtml = '';
//		for(var k in this.goldCard_pwd) {
//			listHtml += "蛋糕券密码为[" + k + "]，抵扣<span class=\"red\" style='color:red'>" + this.goldCard_pwd[k].toFixed(2) + "</span>元";
//			listHtml += "&nbsp;&nbsp;&nbsp;<a href=\"javascript: void(0);\" onclick=\"goldCard.cancel(" + k + ");\">取消使用</a><br/>";
//		}
//		if (listHtml.length > 0) {
//			$("#goldCard_html").removeClass('hide').html(listHtml);
//		}  else {
//			$("#goldCard_html").addClass('hide').html('');
//		}
//		$("#goldCard_input").val('');
//		$("#goldCard").html("");
//		var cardHtml = '-蛋糕券支付:'+this.goldCard_total.toFixed(2)+'元';
//		$("#goldCard").html(cardHtml);
    },
    alertGold : function(totalPaid){
        bill.total = totalPaid;
        var isPay = bill.total + bill.freight - this.goldCard_total + promotion.addMoney;
        if(isPay < 0){
            var balance_amount = bill.total;
            var balance_error = "使用的蛋糕券金额大于订单应付总金额<br />订单应付总金额[" + balance_amount + "]元<br/>多余的金额不返还，您确定使用吗？";
            comm_box.confirm_open(balance_error,'goldCard.beyondPaid','goldCard.cancel');
            return false;
        }
        $("#font_total_amount").text(isPay.toFixed(2));
        var listHtml = '';
        if (this.goldCard_total > 0) {
            $("#goldCardShow").text(this.goldCard_total.toFixed(2));
            for(var key in this.goldCard_pwd) {
                listHtml += "蛋糕券密码为[" + key + "]，抵扣<span class=\"red\" style='color:red'>" + this.goldCard_pwd[key].toFixed(2) + "</span>元";
                listHtml += "&nbsp;&nbsp;&nbsp;<a href=\"javascript: void(0);\" onclick=\"goldCard.cancel(" + key + ");\">取消使用</a><br/>";
            }
        }else{
            $("#goldCardShow").text('0.00');
        }
        if (listHtml.length > 0) {
            $("#goldCard_html").removeClass('hide').html(listHtml);
        }  else {
            $("#goldCard_html").addClass('hide').html('');
        }
        $("#goldCard_input").val("");
        var cardHtml = '-蛋糕券支付:'+this.goldCard_total.toFixed(2)+'元';
        bill.total = isPay;
        $("#goldCard").html(cardHtml);
    }
}
var bonus_array ={};
var promotion = {

    //调用购物车内商品促销信息
    execute: function (){

        var params = [];
        var payment_id = '';
        //获取配送时间
        var send_start_time = Utils.trim($('#send_start_time').find("option:selected").val());//Utils.trim($('#send_start_time').val());
        send_start_time = Utils.trim($('#send_date').val())+' '+send_start_time.substring(0, 2) + ":" + send_start_time.substring(2,4) + ":00";
        params['deliver_time'] = Utils.trim($('#send_date').val());			//配送时间
        //params['card_amount'] = goldCard.goldCard_total;	//蛋糕券金额
        params['payment_id'] = payQuick.payTypeID;			//支付方式ID
        params['productID'] = goldCard.card;				//蛋糕券生产号
        xajax_do_req_bill(params,5);
    },

    //改变商品实付总金额
    changBillInfo: function (params) {
        //总优惠
        if (params['totalSpread'] != 'undefined') {
            //alert(params['totalSpread']);
            $('#couponMoney').text(params['totalSpread'].toFixed(2));
        }
        //商品总金额
        if (params['totalMoney'] != 'undefined') {
            //alert(params['totalMoney']);
            $('#totalMarketPrice').text(params['totalMoney'].toFixed(2));
        }

        //总赠送积分
        if (params['totalPoints'] != 'undefined') {
            //alert(params['totalPoints']);
            $('#integalShow').text(params['totalPoints']);
        }

        //总积分价格
        if (params['totalAddPoints'] != 'undefined') {
            //alert(params['totalAddPoints']);
            $('#totalIntegalPrice').text(params['totalAddPoints']);
        }

        //改变订单运费
        if (params['freeFreightFlg'] != 'undefined') {
            if (params['freeFreightFlg'] == 1) {
                bill.freight = 0;
                bill.freeFreightFlg = 1;	//免运费标记
                $('#font_freight').text('0.00');
            }
        } else {
            bill.freeFreightFlg = 0;	//免运费标记
        }

        //改变实付总金额
        if (params['totalPaid'] != 'undefined') {
            bill.total = params['totalPaid'];
            var isPay = params['totalPaid'] + bill.freight - goldCard.goldCard_total + promotion.addMoney;
            //alert(isPay);
            $('#font_total_amount').text(isPay.toFixed(2));
        }

        $('#tbody_add_buy_gift').html('');
        $('#add_total_contain').addClass('hide').html('');
        this.addTotalMoney = [];
        this.alreadyBuy = [];
        //$('#font_total_amount').text(bill.total.toFixed(2));//改变实付金额
        $('.bill_promotion_add_money_li').css('display','block');
    },

    //已经换购数量
    alreadyBuy:[],
    //已经换购总金额
    addTotalMoney:[],
    addMoney:0,
    //加钱换购 postID商品网购号 num数量
    addMoneyBuyGoods: function (postID,bargainID,can_total_amount) {
        xajax_do_req_bill([postID,bargainID,can_total_amount],9);
    },

    //params换购商品数组
    addGoods: function (params,bargainID,can_total_amount) {

        if (this.alreadyBuy[params.postID+''+bargainID+'9'] != null) {
            this.alreadyBuy[params.postID+''+bargainID+'9'] += 1;
        } else {
            this.alreadyBuy[params.postID+''+bargainID+'9'] = 1;
        }

        this.addTotalMoney[params.postID+''+bargainID+'9'] = params.addMoney*this.alreadyBuy[params.postID+''+bargainID+'9'];

        var spreadMoney = (params.salePrice-params.addMoney).toFixed(2);
        var totalMoney = 0;
        var buyTotal = 0;//已兑换的商品总数
        for(key in this.alreadyBuy){
            buyTotal += this.alreadyBuy[key];
            totalMoney += params.addMoney*this.alreadyBuy[params.postID+''+bargainID+'9'];
        }
        totalMoney = totalMoney.toFixed(2);
        if (buyTotal >= can_total_amount) {
            $('.bill_promotion_add_money_li').css('display','none');
        }
        var addMoney = (params.addMoney*this.alreadyBuy[params.postID+''+bargainID+'9']).toFixed(2);
        //修改换购商品数组
        bonus_array[params.postID+''+bargainID+'9'] = {
            total: this.alreadyBuy[params.postID+''+bargainID+'9'],
            postID: params.postID,
            bargainID: bargainID
        }
        if(buyTotal == 1){
            var giftHtml = "<tr class='thead'><td width='20px'></td><td width='100'>赠品</td><td colspan='8' ></td></tr>";
        }else{
            var giftHtml = '';
        }
        if(this.alreadyBuy[params.postID+''+bargainID+'9'] > 1){
            giftHtml = (params.addMoney*this.alreadyBuy[params.postID+''+bargainID+'9']).toFixed(2)+'元';
            $("#price_"+params.postID+bargainID).text(giftHtml);
            $("#number_"+params.postID+bargainID).text(this.alreadyBuy[params.postID+''+bargainID+'9']);
        }else{
            giftHtml += "<tr id='"+params.postID+bargainID+"'>";
            giftHtml += '<td></td>';
            giftHtml += '<td height="30">'+params.product_code+'</td>';
            giftHtml += '<td width=160px>'+params.goodsName+'</td>';
            giftHtml += '<td>'+params.spec+'</td>';
            giftHtml += "<td id='number_"+params.postID+bargainID+"'>"+this.alreadyBuy[params.postID+''+bargainID+'9']+'</td>';
            giftHtml += '<td>'+params.addMoney+'元</td>';
            giftHtml += '<td>'+spreadMoney+'元</td>';
            giftHtml += "<td id='price_"+params.postID+bargainID+"'>"+(params.addMoney*this.alreadyBuy[params.postID+''+bargainID+'9']).toFixed(2)+'元</td>';
            giftHtml += '<td><a class="cursorPointer" onclick="promotion.delGift('+params.postID+','+bargainID+');">删除</a></td>';
            giftHtml += '</tr>';
            $('#tbody_add_buy_gift').append(giftHtml);	//显示换购商品列表
        }
        this.addMoney += parseFloat(params.addMoney);
        $('#add_total_contain').removeClass('hide').html(' + 换购金额：<font id="add_total_money">'+this.addMoney.toFixed(2)+'</font>元');
        //bill.total += parseFloat(params.addMoney);	//实付总金额+1
        var isPay = bill.total + this.addMoney - goldCard.goldCard_total  + bill.freight;
        if(isPay <= 0){
            isPay = 0;
        }
        $('#font_total_amount').text(isPay.toFixed(2));//改变实付金额
    },
    //删除换购商品
    delGift: function (postID,bargainID) {
        $("#"+postID+bargainID).remove();
        this.addMoney -= this.addTotalMoney[postID+''+bargainID+'9'];
        var isPay = bill.total + bill.freight + this.addMoney - goldCard.goldCard_total;
        this.addTotalMoney[postID+''+bargainID+'9'] = 0;
        this.alreadyBuy[postID+''+bargainID+'9'] = 0;
        if(isPay < 0){
            isPay = 0;
        }
        $('#font_total_amount').text(isPay.toFixed(2));//改变实付金额
        $('.bill_promotion_add_money_li').css('display','block');
        var num=0;//已换购的数量
        var totalMoney=0;
        for(key in this.alreadyBuy){
            num += this.alreadyBuy[key];
        }
        totalMoney = totalMoney.toFixed(2);
        if(num == 0){
            $("#tbody_add_buy_gift").html("");
            $('#add_total_contain').addClass('hide').html('');
        }else{

            $("#add_total_money").text(this.addMoney.toFixed(2));
        }
        //换购商品数组删除
        delete(bonus_array[postID+''+bargainID+'9']);
    }
};

/**时间改变方法
 confirm	确定时间调用方法
 edit 修改时间方法
 **/
var time={
    confirm : function(){
        //editby LFL 2014.11.19 合并时间地址确认按钮
        var date = $('#send_date').val(); //选择日期
        var send_start_time = Utils.trim($('#send_start_time').find("option:selected").val());//Utils.trim($('#send_start_time').val());
        var send_end_time = Utils.trim($('#send_end_time').find("option:selected").val());//Utils.trim($("#send_end_time").val());
        send_start_time = date +' '+send_start_time.substring(0, 2) + ":" + send_start_time.substring(2,4) + ":00 - " + send_end_time.substring(0, 2) +':'+ send_end_time.substring(2, 4)+':00';
        $('#confirm_time').text(send_start_time);
        $("#time_list").hide();
        payQuick.timeFlg = 1;
    },
    edit : function(){
        payQuick.timeFlg = 0;	//配送时间修改
        $("#time_list").show();
        $("#confirm_time").html('');
    }
}
//配件分配
$("input[id^=access_allot_]").live(
    'blur', function() {
        var access_postID = $(this).attr('access_postID');
        var access_name = $(this).attr('goods_name');
        var distribute_index = $(this).attr('distribute_index');
        cart_operate.accessAllot(access_postID,access_name,distribute_index);
    }
);

//批量删除购物车商品
var cart_operate = {

    //删除的商品号
    params:"",

    //批量删除
    del: function () {
        var temp_arr = [];
        var i = 0;
        $('input[id^=goods_del_]').each(function(){
            if ($(this).attr('checked') == 'checked') {
                temp_arr[i] = $(this).attr('value');
                i++;
            }
        });

        if (temp_arr.length == 0) {
            comm_alert('你没有勾选任何商品');
            return false;
        }

        this.params = temp_arr;
        comm_box.confirm_open('你确认从购物车中删除选中商品吗？','cart_operate.confirmDel');
    },

    //单个删除
    delOne: function (postID) {
        if (!Utils.isDigital(postID)) {
            comm_alert('参数错误');
            return false;
        }
        var temp_arr = [];
        temp_arr[0] = postID;
        this.params = temp_arr;
        comm_box.confirm_open('你确认删除该商品吗？','cart_operate.confirmDel');
    },
    //确认删除zz
    confirmDel: function () {
        xajax_do_req_cart(this.params,20);
    },

    //当前特殊配件的名称
    accessName:'',

    //未分配特殊配件数量
    remaindNum:0,

    //特殊配件分配 accessName配件商品名称; accessPostID：当前特殊配件的postID
    accessAllot: function (accessPostID,accessName,current_distribute_index) {
        var accessTotalNum = parseInt($('#buy_'+accessPostID).text());		//当前特殊配件的数量
        var allotTotal = 0;													//分配的配件总数
        var accessAllotArr = [];
        var tempArr = [];
        $('input[id^=access_allot_'+accessPostID+'_]').each(function(){
            var main_distribute_index = $(this).attr('main_distribute_index');
            var distribute_index = $(this).attr('distribute_index');
            var num = parseInt($(this).val());										//分配的数量
            accessAllotArr[distribute_index] = num;
            allotTotal += num;
        });
        if (accessTotalNum >= allotTotal) {
            this.accessName = accessName;
            this.remaindNum = accessTotalNum - allotTotal;
            xajax_do_req_cart([accessAllotArr,accessPostID],23);
        } else {
            $('input[id=access_allot_'+accessPostID+'_'+current_distribute_index+']').val(0);
            comm_alert('【'+accessName+'】 分配有误');
        }
    },
    //分配特殊配件成功提示
    allotSuccess: function () {
        if (this.remaindNum > 0) {
            comm_alert('剩余 <span style="color:red; font-weight:bold;">'+this.remaindNum+'</span> 个【'+this.accessName+'】 未分配',3);
        } else {
            comm_alert('【'+this.accessName+'】 已分配',3);
        }
    }
};

//getPayTypeID(1);//默认货到付款支付方式


function checkdate(){
    var ship_flg = false;
    if(bill.shipID > 0){
        var date = $('#send_date').val(); //选择日期
        var ship_date_start = $("#ship_date_start_"+bill.shipID).html();
        var ship_date_end   = $("#ship_date_end_"+bill.shipID).html();
        if(ship_date_start){
            if(date < ship_date_start){
                ship_flg = true;
            }
        }
        if(ship_date_end){
            if(date > ship_date_end){
                ship_flg = true;
            }
        }
        if(ship_flg){
            return "您选择的配送日期不在自提点的配送日起范围<br>";
        }
    }
    return '';
}

//日期匹配
function dateCheck(s){
    var   reg=  /^\d{4}-\d{2}-\d{2}$|^\d{4}-\d{2}-\d{2} \d{1,2}:\d{1,2}:\d{1,2}$/;
    return reg.exec(s);
}
