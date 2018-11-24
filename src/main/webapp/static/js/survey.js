/**
	问券调查类
	check:问券调查校验
	success:问券调查保存成功
	faile:问券调查包存失败
**/
var survey={
	advID : '',
	getAdvID : function(adv){
		if(adv == ''){
			comm_alert('问券调查未填写');
		}else{
			this.advID = adv;
		}
	},
	check : function(bill_no,pcustID){
		if(this.advID == ''){
			comm_alert('问券调查未填写');
		}else{
			comm_box.loadding();
			var params={
				'bill_no' : bill_no,
				'pcustID' : pcustID,
				'advID' : this.advID
			}
			xajax_do_req_bill(params,10);
		}
	},
	
	success : function(msg){
		comm_box.loadding_close();
		comm_alert(msg,3);
	},
	
	fail : function(msg){
		comm_box.loadding_close();
		comm_alert(msg);
	},
	cancel : function(){
		location.href='shop/index.php';
	}
}
// add by becky 20130607 订单分享活动
var payment_hdfk={
    saveShareInfo: function(){
        var error='';
        var bill_no = $("#bill_no").val();
        var consignee = $("#consignee").val();
        var consigneemobile = $("#consigneemobile").val();
        if (consignee == "") {
            error += '请填写收货人姓名<br />';
        }
        if (consigneemobile == "") {
            error += '请填写收货人手机号码<br />';
        }
        if (consigneemobile != "" && !Utils.isMobile(consigneemobile)) {
            error += '手机号码格式有误<br />';
        }
        if (error != '') {
            comm_alert(error);
        } else {
            var params={
                'consignee' : consignee,
                'consigneemobile' : consigneemobile,
                'bill_no' : bill_no
            }
            xajax_do_req_bill(params,17);
        }
    }
}