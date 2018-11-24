function Utils(){
	 
}
Utils.trim = function(str){
	return $.trim(str);
}
Utils.isEmpty = function(val){
  switch (typeof(val)){
    case "string":
      return Utils.trim(val).length == 0 ? true : false;
      break;
    case "number":
      return val == 0;
      break;
    case "object":
      return val == null;
      break;
    case "array":
      return val.length == 0;
      break;
    default:
      return true;
  }
}

Utils.parseJSON = function(str){
	var json = ('undefined' !== typeof JSON)
			 ? JSON.parse(str)
			 : (new Function("return " + str))();
	return json; 
}

Utils.isDigital = function(val) {
	var reg = /^\d+$/;
  	return reg.exec(val);	
}
Utils.isChinese = function(val) {
	var reg = /^[\u4e00-\u9fa5]+$/;
  	return reg.exec(val) ;
}
Utils.isCharacter = function(val) {
	var reg = /^[a-zA-Z][a-zA-Z\s]*[a-zA-Z]$/;
  	return reg.exec(val) ;
}
Utils.isNumber = function(val){
  var number;
     if (val==null) return false;
     if (val=="") return false;
     number = new Number(val);
   	 if (!isNaN(number) && val == number.toString())
   	 	return true;
   	 return false;
}

Utils.isInt = function(val){
  if (this.trim(val) == "")
    return false;
  var reg = /\D+/;
  if (!reg.test(val)){
  	var i = parseInt(val);
  	return i.toString() == val;
  }else
  	return false;
}

Utils.isMoney = function(val) {
	var reg = /^(([0-9]\d*))(\.(\d{1,2}))?$/;
	if (!reg.test(val)) {
		return false;
	} else {
		return true;
	}
}

Utils.isUserName = function(val) {
	var reg1 = /(^[a-zA-Z0-9][a-zA-Z0-9_\-\.]*\@[a-zA-Z0-9]+$)|(^[A-Za-z0-9_\-\.]*\@+$)|(^[a-zA-Z0-9][a-zA-Z0-9_\-\.]+$)/;
	return reg1.test( val );
}

Utils.isEmail = function(email){
  var reg1 = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
  return reg1.test( email );
}

Utils.isMobile = function(val) {
	var reg = /^1\d{10}$/;
    //var reg= /^0?(13|15|18|14)[0-9]{9}$/;
	return reg.test( val );
}

Utils.isTel = function (tel){
  var reg = /^(0[0-9]{2,3}-)?([2-9][0-9]{6,7})+(-[0-9]{1,6})?$/; //只允许使用数字-空格等
  return reg.test( tel );
}
Utils.urlencode = function (str){
    str = str.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < str.length; n++) {
 
			var c = str.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return utftext;
}

Utils.urldecode = function (utftext){
	var str = "";
	var i = 0;
	var c = c1 = c2 = 0;

	while ( i < utftext.length ) {

		c = utftext.charCodeAt(i);

		if (c < 128) {
		    str += String.fromCharCode(c);
			i++;
		}
		else if((c > 191) && (c < 224)) {
			c2 = utftext.charCodeAt(i+1);
			str += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
			i += 2;
		}
		else {
			c2 = utftext.charCodeAt(i+1);
			c3 = utftext.charCodeAt(i+2);
			str += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
			i += 3;
		}

	}

	return str;
}

Utils.len = function(val) {
    var l = 0;
    var a = val.split("");
    for (var i=0;i<a.length;i++) {
        if (a[i].charCodeAt(0)<299) {
            l++;
        } else {
            l+=2;
        }
    }
    return l;
}

Utils.sb_substr = function(str, startp, endp) {

    var i=0; c = 0; unicode=0; rstr = '';
    var len = str.length;
    var sblen = this.len(str);
    if (startp < 0) {
        startp = sblen + startp;
    }
    if (endp < 1) {
        endp = sblen + endp;// - ((str.charCodeAt(len-1) < 127) ? 1 : 2);
    }
    for(i = 0; i < len; i++) {
        if (c >= startp) {
            break;
        }
        var unicode = str.charCodeAt(i);
        if (unicode < 127) {
            c += 1;
        } else {
            c += 2;
        }
    }
    for(i = i; i < len; i++) {
        var unicode = str.charCodeAt(i);
        if (unicode < 127) {
            c += 1;
        } else {
            c += 2;
        }
        rstr += str.charAt(i);

        if (c >= endp) {
            break;
        }
    }
    return rstr;
}

//文字、字母、数字、- 、_ 、空格、括号
Utils.checkAddress = function (str, min, max) {
    if(str.length < min || str.length > max) {
        return false;
    }
    if(/[~!@#$%^&*\\|"']/.test(str)){
        return false;
    }
    return true;
};

/** ********************************************************************************************** */

/**
 * ********************************************* 搜索
 * ******************************************
 */
var G_SEARCH_READY = 1;
var G_LAST_SEARCH_KEYWORDS = "";
var G_RESULT_COUNT = 0;
var G_SUGGESTION_CURSOR = 0;
var G_SEARCH_TYPE = 0;
var G_TRACTOR_HANDLE = 0;
var trigerObj;

function suggestRegTracker(){
	var vv = Utils.trim(trigerObj.value);
	if (vv == ""){
		G_LAST_SEARCH_KEYWORDS = "";
		close_suggestions();
		return false;
	}
	if (vv == G_LAST_SEARCH_KEYWORDS){
		if (document.getElementById("suggestion_containter").style.display == "none")
			document.getElementById("suggestion_containter").style.display = "block";
		return false;
	}
	
	if (G_SEARCH_READY == 0)
		return false;
	suggestSearch(vv);
}

function init_search_suggestion(triger,searchType,flg){
	trigerObj = triger;
	G_SEARCH_TYPE = searchType;
	var parent = trigerObj.offsetParent;
	var x,y;
	x = trigerObj.offsetLeft;
	y = trigerObj.offsetTop;
	var cnt = 0;
	while (parent){
		cnt++;
		x += parent.offsetLeft;
		y += parent.offsetTop;
		parent = parent.offsetParent;
	}
	y += 25;
	x += "px";
	y += "px";
	var suggestion_containter = document.getElementById("suggestion_containter");
	suggestion_containter.style.left = x;
	suggestion_containter.style.top = y;
	
	trigerObj.onfocus = function (){
		G_TRACTOR_HANDLE = setInterval("suggestRegTracker()",200);
		if (this.value =="输入关键词") {
			this.value ="";
		} else {
			var reg = new RegExp("-","g");   
			$("#keywords").val(this.value.replace(reg, "++"));
		}
	}
	trigerObj.onblur = function (){
		setTimeout("close_suggestions()", 500);
		if (this.value ==""){
			this.value ="输入关键词";
		} else {
			var reg = new RegExp("-","g");   
			$("#keywords").val(this.value.replace(reg, "++"));
		}
	}
	trigerObj.onkeyup = function (event){
		event = window.event || event;
		switch(event.keyCode){
			case 13: // enter
				if (G_SEARCH_TYPE == 1){
					if (G_SUGGESTION_CURSOR > 0){
						G_SEARCH_READY = 0;
						var searchValue = document.getElementById("_ak_" + G_SUGGESTION_CURSOR.toString()).value;
						trigerObj.value = searchValue;
						var reg = new RegExp("-","g");   
						$("#keywords").val(searchValue.replace(reg, "++"));
					} else {
						var searchValue = $("#searchTemp").val();
						var reg = new RegExp("-","g");   
						$("#keywords").val(searchValue.replace(reg, "++"));
					}
					keywords =  estr(searchValue);
					url = '/shop/searchkey-'+keywords+'-0.html';
					$("#search_form").attr('action',url);
					document.forms.search_form.submit();
				}else if (G_SEARCH_TYPE == 2){
					if (G_SUGGESTION_CURSOR > 0){
						var searchValue = document.getElementById("_ak_" + G_SUGGESTION_CURSOR.toString()).value;
						trigerObj.value = searchValue;
						var reg = new RegExp("-","g");   
						$("#keywords").val(searchValue.replace(reg, "++"));
						close_suggestions();
					}else
						document.forms.search_form.submit();
				}
				return;
				break;
			case 27: // esc
				close_suggestions();
				return;
				break;
			case 37: // left
				return;
				break;
			case 39: // right
				return;
				break;
			case 38: // up
				var next_cursor;
				if (G_RESULT_COUNT > 0){
					if (G_SUGGESTION_CURSOR > 1){
						next_cursor = G_SUGGESTION_CURSOR - 1;
					}else if (G_SUGGESTION_CURSOR == 1 && G_RESULT_COUNT > 1){
						next_cursor = G_RESULT_COUNT;
					}else{
						break;
						return;
					}
					var next_sugg = document.getElementById("_ds_" + next_cursor.toString());
					if (next_sugg != null){
						if (G_SUGGESTION_CURSOR > 0){
		    				var current_sugg = document.getElementById("_ds_" + G_SUGGESTION_CURSOR.toString());
		    				current_sugg.style.backgroundColor = "";
							current_sugg.style.color="#000000";
						}
						next_sugg.style.backgroundColor="#3399FF";
						next_sugg.style.color="#ffffff";
					}
					G_SUGGESTION_CURSOR = next_cursor;
				}
				break;
			case 40: // down
				var next_cursor;
				if (G_RESULT_COUNT > 0){
					if (G_SUGGESTION_CURSOR < G_RESULT_COUNT){
						next_cursor = G_SUGGESTION_CURSOR + 1;
					}else if (G_SUGGESTION_CURSOR == G_RESULT_COUNT && G_RESULT_COUNT > 1){
						next_cursor = 1;
					}else{
						return;
						break;
					}
						
					var next_sugg = document.getElementById("_ds_" + next_cursor.toString());
					if (next_sugg != null){
						if (G_SUGGESTION_CURSOR > 0){
		    				var current_sugg = document.getElementById("_ds_" + G_SUGGESTION_CURSOR.toString());
		    				current_sugg.style.backgroundColor = "";
							current_sugg.style.color="#000000";
						}
						next_sugg.style.backgroundColor="#3399FF";
						next_sugg.style.color="#ffffff";
					}
					G_SUGGESTION_CURSOR = next_cursor;
				}
				break;
			default:
				if (G_TRACTOR_HANDLE == 0)
					G_TRACTOR_HANDLE = setInterval("suggestRegTracker()",200);
				break;
		}
	}
}

function suggestSearch(v){
	G_SEARCH_READY = 0;
	G_LAST_SEARCH_KEYWORDS = v;
	var query_arr = new Array(estr(v),G_SEARCH_TYPE);
	xajax_do_req_header(query_arr,1);
}
function close_suggestions(){
	window.clearInterval(G_TRACTOR_HANDLE);
	G_TRACTOR_HANDLE = 0;
	G_SEARCH_READY = 1;
	G_RESULT_COUNT = 0;
	G_SUGGESTION_CURSOR = 0;
	//G_LAST_SEARCH_KEYWORDS = "";
	//document.getElementById("search_suggestion").innerHTML = "";
	document.getElementById("suggestion_containter").style.display = "none";
}
function assign_keywords(id){
	trigerObj.value = document.getElementById("_ak_" + id.toString()).value;
	close_suggestions();
}
function suggestion_moveover(obj){
	if (G_SUGGESTION_CURSOR > 0){
		var last_obj = document.getElementById("_ds_" + G_SUGGESTION_CURSOR.toString());
		suggestion_moveout(last_obj);
		var reg = new RegExp("-","g");   
		$("#searchTemp").val(obj.innerHTML.replace(reg, "++"));
	}
	var reg = new RegExp("-","g");  
	$("#keywords").val(obj.innerHTML.replace(reg, "++"));
	obj.style.backgroundColor="#3399FF";
	obj.style.color="#ffffff";
	obj.style.cursor="pointer";
	
//	G_SUGGESTION_CURSOR = parseInt(obj.id.replace("_ds_",""));
}
function suggestion_moveout(obj){
	obj.style.backgroundColor = "";
	obj.style.color="#000000";
}

/** ******************************************************************************************* */


/*************************************** cookie *****************************************/
// 获得cookie
function get_COOKIE_INFO(cookie_name){
	var strCookie = document.cookie;
	var arrCookie = strCookie.split("; ");
	var arrCookieCount = arrCookie.length;
	var arr,identifyContent = null;
	for(var i = 0; i < arrCookie.length ; i++){
		arr = arrCookie[i].split("=");
		if(cookie_name == arr[0]){
			var arrStr = document.cookie.split("; ");
			identifyContent = decodeURIComponent(decodeURIComponent(arr[1]));
			break;
		}
	}
	arrCookie = null;
	if (identifyContent == null) 
		return null;
	else
		return identifyContent;
}
//设置cookie 默认cookie时效24小时
function set_COOKIE_INFO(cookie_name,cookie_value,cookie_time) {
	var exp = new Date();
	exp.setTime(exp.getTime() + cookie_time * 1000);
	if (cookie_time == 0)
		document.cookie = cookie_name + "=" + encodeURI(cookie_value) + ";path=/;domain=" + global.cookie_domain + ";";
	else
		document.cookie = cookie_name + "=" + encodeURI(cookie_value) + ";expires=" + exp.toGMTString() + ";path=/;domain=" + global.cookie_domain + ";";
}

/*************************************** cookie *****************************************/


//公共的方法
var common = {
	
	/*
		获得验证码
		flg 1：得到4位验证码 2：得到2位验证码
		id: img标签的id名称
		span: 是否生成img标签
	*/
	captcha: function(flg, id, span) {
            if (flg == 1)
                var img = "/core/yzm.php?code=" + Math.ceil(Math.random() * 10000);
            else
                var img = "/core/yzm.php?len=2&code=" + Math.ceil(Math.random() * 10000);
	    if (span) {
	    	$("#" + span).html("<img onclick=\"common.captcha(" + flg + ", '" + id + "')\" title=\"看不到验证码？点击重新换一个\" style=\"cursor:pointer;\" id=\"" + id + "\" src=\"" + img + "\" />&nbsp;");
	    } else {
	    	$("#" + id).attr("src", img);
	    }
	    
	},
	
	//刷新页面
	refresh: function() {
		window.location.reload();
	}, 
	
	userBrowser: function(){
	    var browserName=navigator.userAgent.toLowerCase();
	    if(/msie/i.test(browserName) && !/opera/.test(browserName)){
	        return "IE";
	    }else if(/firefox/i.test(browserName)){
	        return "Firefox";
	    }else if(/chrome/i.test(browserName) && /webkit/i.test(browserName) && /mozilla/i.test(browserName)){
	        return "Chrome";
	    }else if(/opera/i.test(browserName)){
	        return "Opera";
	    }else if(/webkit/i.test(browserName) &&!(/chrome/i.test(browserName) && /webkit/i.test(browserName) && /mozilla/i.test(browserName))){
	        return "Safari";
	    }else{
	        return "unKnow";
	    }
	}
};

var city = {
	
	city_alias_id:'',
	city_alias:'',
	
	//网站头部城市选择
	set_city: function(id,cityName,alias){
		var cart = $('#js_cart_goods_number').text();
		if (Utils.isDigital(cart) && cart != 0) {
			$('#select_city_list').addClass('displayNone');
			var click_alias = get_COOKIE_INFO('CITY_ALIAS');
			if (alias == click_alias) {	//城市同样则不清空购物车
				return false;
			}
			this.city_alias_id = alias+'_'+id;
			this.city_alias = alias;
			comm_box.confirm_open('切换城市您的购物车将被清空！','cart.city_change_empty');
		} else {
			$('#select_city_list').addClass('displayNone');
			this.chang_city(alias,id,true);
		}
		return false;
	},
	
	//没有设置COOKIE弹出城市选择层
	no_cookie_select_city: function () {
		$("#city_pop_mask,#city_login_main").removeClass("hide");
	},
	
	//弹出城市选择层
	select_city: function (id,cityName,alias) {
		$("#city_pop_mask,#city_login_main").addClass("hide");
		this.chang_city(alias,id);
	},
	
	//切换城市成功
	chang_city: function (alias,id,flag) {
		var jumpURL = "";
		if (!alias && !id) {
			jumpURL = '/' + this.city_alias + '/index.html';
		} else {
            if(flag){
            	jumpURL = '/' + alias + '/index.html';
            }
		}
		var siteId = this.city_alias_id;
		if(id) {
			siteId = id;
		}
		var pos = siteId.indexOf('_');
		if(pos > 0) {
			siteId = siteId.substring(pos+1);
		}
		$.get('/mobile/action/WeApi.ChangeSite?change_site_id='+siteId+"&v="+Math.random(), function() {
			if(jumpURL != "") {
				window.location.href=jumpURL;
			}
		});

	},
	
	//根据用户ip信息选择城市
	getInfoByRemoteIp: function (remoteInfo) {
		var alias = '';
		var id = '';
		$.each(site_obj, function(k, v) {

			if(v.siteName.indexOf(remoteInfo.city)>=0 || remoteInfo.city.indexOf(v.siteName)>=0){
				alias = v.alias;
                id = k;
			}
			
			if (id == "") {
                alias = v.alias;
                id = k;
            }
			/*
            if(remoteInfo.city == v.){}
            if (v.siteName.indexOf(remoteInfo.city) != -1 && remoteInfo.city != '无锡') {
                alias = v.alias;
                id = k;
            }
            */
        });
		this.chang_city(alias,id);
	}
};

//没有设置COOKIE弹出城市选择层
if (!get_COOKIE_INFO('CITY_ID')) { 		//判断是否选择城市		SH_2
	//var remote_ip_info = {"ret":1,"start":"115.192.0.0","end":"115.192.168.255","country":"\u4e2d\u56fd","province":"\u6d59\u6c5f","city":"\u676d\u5dde","district":"","isp":"\u7535\u4fe1","type":"","desc":""};
//	if (remote_ip_info) {
//		city.getInfoByRemoteIp(remote_ip_info);
//	} else {
		var alias = '';
		var id = '';
		$.each(site_obj, function(k, v) {
            if (id == "") {
                alias = v.alias;
                id = k;
            }
		});
		city.chang_city(alias,id);
//	}
}

//设置公共头部当前选择城市
if (get_COOKIE_INFO('CITY_ALIAS') && get_COOKIE_INFO('CITY_ID')) {
	var city_alias = get_COOKIE_INFO('CITY_ALIAS');
	var city_alias_id = get_COOKIE_INFO('CITY_ID').split('_');
	$('#g_now_city').html(site_obj[city_alias_id[1]].siteName);
	var serviceHtml = '<div class="city_' + city_alias + '_bg"></div>';
	$('.service_city_zone').html(serviceHtml);
} else {
	$('#g_now_city').html('上海市');
	$('.service_city_zone').html('<div class="city_SH_bg"></div>');
}

$('.menu_button').mouseover(function(){
	$(this).find('.inner_list').removeClass('displayNone')
	 .end().siblings().find('.inner_list').addClass('displayNone');
}).mouseout(function(){
	$('.menu_button').find('.inner_list').addClass('displayNone');
});

var allOperate = {

	//addby LFL 购物车连接跳转
    getPointsHref: function(){
        var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
        var href = '/SH/pointsArea--0-0-1.html';
        if (site_id != null){
            var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
            href = '/' + params[0] + '/pointsArea--0-0-1.html';
        }
        var a = document.createElement("a");
        a.setAttribute("href", href);
        a.setAttribute("target", "_blank");
        document.body.appendChild(a);
        a.click();
    },
	
	//积分专区
	pointsArea: function(){
		var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
		if (site_id == null){
			self.location = '/SH/pointsArea--0-0-1.html';
		} else {
			var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
			self.location = '/' + params[0] + '/pointsArea--0-0-1.html';
		}
	},
	
	//网站列表页分站
	getGoodsCate: function (cate){
		var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
		if (site_id == null) {
			self.location = '/SH/category-' + cate + '-1.html';
		} else {
			var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
			self.location = '/' + params[0] + '/category-' + cate + '-1.html';
		}
	},
    //闪购
    getGoodsCate_lightning: function (cate){
        var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
        if (site_id == null) {
            self.location = '/SH/category-lightning-' + cate + '-1.html';
        } else {
            var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
            self.location = '/' + params[0] + '/category-lightning-' + cate + '-1.html';
        }
    },

	//获取新闻动态
	getLecakeNews: function () {
		var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
		if (site_id == null) {
			self.location = '/SH/siteNews.html';
		} else {
			var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
			self.location = '/' + params[0] + '/siteNews.html';
		}
	},
	//网站尾部文章分站
	footContent: function (article_id) {
		var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
		if (site_id == null) {
			window.open('/SH/help-' + article_id + '.html');
		} else {
			var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
			window.open('/' + params[0] + '/help-' + article_id + '.html');
		}
	},
	//获取蛋糕卡专区
	getActivityArea: function () {
		var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
		if (site_id == null) {
			self.location = '/SH/activityArea.html';
		} else {
			var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
			self.location = '/' + params[0] + '/activityArea.html';
		}
	},
	//获取配件
	getAccessories: function () {
		var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
		if (site_id == null) {
			window.open('/SH/goodsAccessories.html');
		} else {
			var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
			window.open('/' + params[0] + '/goodsAccessories.html');
		}
	},
    //获取配件  闪电购
    getAccessories_lightning: function () {
        var site_id = get_COOKIE_INFO('CITY_ID');			//获取COOKIE中 site_id = SH_2
        if (site_id == null) {
            window.open('/SH/goodsAccessories-lightning.html');
        } else {
            var params = site_id.split('_');				//tempArr[0] = SH ; tempArr[1] = 2
            window.open('/' + params[0] + '/goodsAccessories-lightning.html');
        }
    },
	getArticle : function(){//获取文章页
		var site_id = get_COOKIE_INFO('CITY_ID');
		var params = site_id.split('_');
		if (params[1] == 83) {
			self.location = '/shop/help-53.html';
		} else {
			self.location = '/shop/help-54.html';
		}
	},
	getBuyHelp: function () {
		var site_id = get_COOKIE_INFO('CITY_ID');
		var params = site_id.split('_');
		if (params[1] == 83) { //杭州
			window.open('/shop/help-42.html');
		}else if (params[1] == 228) { //苏州
            window.open('/shop/help-73.html');
        }else if (params[1] == 261) { //无锡
            window.open('/shop/help-83.html');
        }else if (params[1] == 287) { //北京 20130910
            window.open('/shop/help-106.html');
        }else if (params[1] == 334) { //天津 add by sun 20131218
            window.open('/shop/help-112.html');
        }else if (params[1] == 356) { //宁波 add by sun 20140312
            window.open('/shop/help-118.html');        
		}else if (params[1] == 386) { //深圳 add by LFL 20140729
            window.open('/shop/help-136.html');
		}else if (params[1] == 355) { //南京 add by LFL 20150408
            window.open('/shop/help-203.html');
        }else if (params[1] == 420) { //广州 add by LFL 20150408
            window.open('/shop/help-204.html');
        }else if (params[1] == 447) { //嘉兴 add by LFL 20150515
            window.open('/shop/help-231.html');
        }else if (params[1] == 446) { //绍兴 add by LFL 20150515
            window.open('/shop/help-230.html');
        }else if (params[1] == 449) { //成都 add by LFL 20150515
            window.open('/shop/help-258.html');
        }else if (params[1] == 499) { //成都 add by LFL 20150515
            window.open('/shop/help-259.html');
        }


        else { //默认上海站
			window.open('/shop/help-36.html');
		}
	}
};

/*诺心首页城市选择js脚本   2012-10-25*/
$('.select_city_icon').click(function(){
	if ($('#select_city_list').hasClass('displayNone')) {
		$('#select_city_list').removeClass('displayNone');
		$(this).removeClass('icon_out').addClass('icon_over');
	} else {
		$('#select_city_list').addClass('displayNone');
		$(this).addClass('icon_out').removeClass('icon_over');
	}
});
$('.delivery_city').click(function(){
	if ($('#select_city_list').hasClass('displayNone')) {
		$('.select_city_icon').removeClass('icon_out').addClass('icon_over');
		$('#select_city_list').removeClass('displayNone');
	} else {
		$('#select_city_list').addClass('displayNone');
		$('.select_city_icon').addClass('icon_out').removeClass('icon_over');
	}
});

//头部城市切换背景改变
$('#select_city_list .cityContent').mouseover(function(){
	$('#select_city_list .cityContent').removeClass('lecakeColor');
	$(this).addClass('lecakeColor');
}).mouseout(function(){
	$('#select_city_list .cityContent').removeClass('lecakeColor');
});


//用户
var customer = {
	
	//用户名
	cust_id: get_COOKIE_INFO("WANSONSHOP_IDENTIFIER"),
	
	//内购用户规则
	internalRule: ['li-ning.com.cn'],
	
	//用户注册成功返回指定的url
	register_back_url: '/',
	
	//内购用户标识 0:非内购用户; 1:内购用户;
	internal_flg: 0,
	
	//设置用户cookie
	set_cookie: function(val) {
        set_COOKIE_INFO("WANSONSHOP_IDENTIFIER", val, 0);
        set_COOKIE_INFO("WANSONSHOP_IDENTIFIER1", val, 0);
        this.cust_id = val;
	},
	
	//显示欢迎项
	show_IDENTIFIER: function() {
		if (this.cust_id == null) {
			var rem_user = get_COOKIE_INFO('REMEMBER_USERNAME');
			if (rem_user) {
				$("#welcome").html("<a>欢迎您 "+rem_user+"</a><a href=\"/customer/login.html\" onclick=\"_statLog.logClick('top_login', '登录')\">登录</a><span class=\"TN_st\">|</span><a href=\"/customer/register.html\" onclick=\"_statLog.logClick('top_register', '注册')\">注册</a><span class=\"TN_st\">|</span>");
			} else {
				$("#welcome").html("<a href=\"/customer/login.html\" onclick=\"_statLog.logClick('top_login', '登录')\">登录</a><span class=\"TN_st\">|</span><a href=\"/customer/register.html\" onclick=\"_statLog.logClick('top_register', '注册')\">注册</a><span class=\"TN_st\">|</span>");
			}
		} else {
            if (Utils.len(this.cust_id) > 12)
                this.cust_id = Utils.sb_substr(this.cust_id, 0, 11) + '...';
			$("#welcome").html("<a id=\"TN_usenane\" >欢迎您，" + this.cust_id + "</a><a href=\"/shop/logout.php\">退出</a><span class=\"TN_st\">|</span>");
			unread.get_timestamp();
		}
	},
	
	//登录/注册弹出层切换 1:登录 2：注册
	switchover: function(obj, flg) {
		$("#h3_open_reglogin").find("span").removeClass("now").eq($(obj).index()).addClass("now");
		if (flg == 1) {
			$("#span_open_login").removeClass("hide");
			$("#span_open_reg").addClass("hide");
			$("#a_triangle_l").removeClass("hide").addClass("a_triangle_l");
			$("#a_triangle_r").addClass("hide").removeClass("a_triangle_r");
			common.captcha(1, "login_yzm_img", "login_yzm_span");
		} else {
			$("#span_open_login").addClass("hide");
			$("#span_open_reg").removeClass("hide");
			$("#a_triangle_l").addClass("hide").removeClass("a_triangle_l");
			$("#a_triangle_r").addClass("a_triangle_r").removeClass("hide");
			common.captcha(1, "reg_yzm_img", "reg_yzm_span");
		}
		$(".pspt_msg").text("");
	},
	
	//打开登录/注册弹出层
	open_login: function(success_func) {
		
		if (this.cust_id == null) {
			$("#login_userName").focus();
		} else {
			$("#login_userName").val(this.cust_id);
			$("#login_pwd").focus();
		}
		
		$(".span_open_login").trigger("click");

		if (/msie 6/i.test(navigator.userAgent) && !$.support.style) {
			$("#login_main").css("top", parseInt($(document).scrollTop()) + 200 + "px");
		}
		
		this.success_func = success_func;

		getsize();
		$("#pop_mask").removeClass("hide");
		$('#login_main').removeClass("hide");
		
	},
	
	//关闭登录/注册弹出层
	close_login: function() {
		
		$("#login_main").addClass("hide");
		$("#pop_mask").addClass("hide");
		$(".pspt_msg").text("");
		if ($("#extend_main").css("display") == "block") {
			$("#extend_main").hide();
			$(".comm_pop .eb_div").css("width", "430px");
		}
		
	},

	userName_empty: "请输入手机号码",
	userName_error: "请输入正确的手机号码",
	userName_exist: "该手机号码已被使用，请使用其它手机号码注册",
	pwd_empty: "请输入密码",
	pwd_error: "密码只能是6-30位英文、数字及“_”、“-”组成",
	pwd2_error: "您两次输入的密码不一致",
	yzm_empty: "请输入验证码",
	mobile_empty: "请输入手机号码",
	mobile_error: "请输入正确的手机号码",
	yzm_error: "输入的验证码错误",
	agreement_error: "用户服务协议未勾选",
	vcode_empty: "请输入手机验证码",
	vcode_error: "输入的手机验证码错误",
	flg: 1,//1：正常登录页登录 2：弹出层登录
	prefix: "",

	//客户登录
	login: function(flg,op) {
		op = op || 0;

		if (flg == 1) {
			this.prefix = "#";
		} else {
			this.prefix = "#login_";
		}
		
		var rem_user = 0;
		if (flg) {
			var rem_val = $('input[name=remember_username]:checked').val();
			rem_user = rem_val? rem_val : 0;
		}

		this.flg = flg;
		var error_arr = {},error_msg = true;

		if (op == 0) {
			var params = {
				userName: Utils.trim($(this.prefix + "userName").val()),
				pwd: Utils.trim($(this.prefix + "pwd").val()),
				yzm: Utils.trim($(this.prefix + "yzm").val()),
				rem_user: rem_user
			};
			var reg = /^[A-Za-z0-9_-]{6,30}$/;

			if (Utils.isEmpty(params.userName)) {
				error_arr[this.prefix + "userName_error"] = this.userName_empty;
			} else if (!Utils.isEmail(params.userName) && !Utils.isMobile(params.userName)) {
				error_arr[this.prefix + "userName_error"] = this.userName_error;
			}
			if (Utils.isEmpty(params.pwd)) {
				error_arr[this.prefix + "pwd_error"] = this.pwd_empty;
			} else if (!reg.test(params.pwd)) {
				error_arr[this.prefix + "pwd_error"] = this.pwd_error;
			}
			if (Utils.isEmpty(params.yzm)) {
				error_arr[this.prefix + "yzm_error"] = this.yzm_empty;
			} else if (params.yzm.length != 4) {
				error_arr[this.prefix + "yzm_error"] = this.yzm_error;
			}
		}

		if (op == 1) {
			var params = {
					mobile: Utils.trim($(this.prefix + "mobileNum").val()),
					yzm: Utils.trim($(this.prefix + "yzm").val()),
					vcode: Utils.trim($(this.prefix + "m_vcode").val())
				};
			if (Utils.isEmpty(params.mobile)) {
				error_arr[this.prefix + "mobileNum_error"] = this.mobile_empty;
			} else if (!/1{1}\d{10}/.test(params.mobile)) {
				error_arr[this.prefix + "mobileNum_error"] = this.mobile_error;
			}
			if (Utils.isEmpty(params.yzm)) {
				error_arr[this.prefix + "yzm_error"] = this.yzm_empty;
			} else if (params.yzm.length != 4) {
				error_arr[this.prefix + "yzm_error"] = this.yzm_error;
			}
			if (Utils.isEmpty(params.vcode)) {
				error_arr[this.prefix + "mobile_vcode_error"] = this.vcode_empty;
			} else if (params.yzm.length != 4) {
				error_arr[this.prefix + "mobile_vcode_error"] = this.vcode_error;
			}
		}

		$.each(error_arr,function(k, v) {
			$(k).addClass("note").text(v);
			error_msg = false;
		});
		
		if (error_msg) {
			$(this.prefix + "userName_error").removeClass("note").text("");
			$(this.prefix + "pwd_error").removeClass("note").text("");
			$(this.prefix + "yzm_error").removeClass("note").text("");
            if(op == 0){
                $(this.prefix + "login_error").text("正在登录，请稍候...").show();
                if (flg == 1)
                    comm_box.loadding();
                xajax_do_req_user(params, 3);
            }else{
                $(this.prefix + "login_error").text("正在验证，请稍候...").show();
                if (flg == 1)
                    comm_box.loadding();
					xajax_do_req_user(params, 16);
            }

		}
	},
	check_ok:function(code){
		self.location = "/shop/cake_coupon_bind.php";
	},
	//登录失败
	login_fail: function(code) {
		if(code <0){
			comm_box.loadding_close();
		}
		if (code == -1) {
			$(this.prefix + "userName_error").addClass("note").text(this.userName_error);
		} else if (code == -2) {
			$(this.prefix + "pwd_error").addClass("note").text(this.userName_error);
		} else if (code == -3 || code == -4) {
			$(this.prefix + "pwd_error").addClass("note").text("用户名与密码不匹配");
		} else if (code == -5) {
			$(this.prefix + "userName_error").addClass("note").text('您的帐户已被禁用，请联系网站客服');
		} else if (code == -6) {
			$(this.prefix + "userName_error").addClass("note").text("用户名不存在");
		} else if (code == -100 || code == -101) {
			$(this.prefix + "login_error").text("参数错误，请重试或联系网站客服").show();
		} else if (code == -102 || code == -103) {
			$(this.prefix + "yzm_error").addClass("note").text(this.yzm_error);
		} else if (code == -105) {
			$(this.prefix + "login_error").text("网络链接超时，请重试登录").show();
		} else if(code == -106){
			$(this.prefix + "mobile_vcode_error").addClass("note").text('您输入的验证码错误');
		}
		if (code != -105 && code != -100 && code != -101)
			$(this.prefix + "login_error").text("").hide();
		$(this.prefix + "yzm").val("");
		common.captcha(1, this.prefix.substring(1) + "yzm_img");
	},

	//登录成功islevelUp老会员等级需要升级判断0：不要升级1：需要升级
	login_succeed: function(userName) {
		customer.set_cookie(userName);

		if (this.flg == 1) {
			if (common.userBrowser() == "Safari"){
                location.replace(customer.last_url);
            }else{
                //edit by becky 20130508 访客找回密码登陆时跳转到首页
                var url=customer.last_url;
                var num = url.indexOf("getpwd.php");
                if(num >= 0){
                    var urls = url.substring(num);
                    var newlast_url = url.replace(urls,"member_user.php");
                    self.location = newlast_url;
                }else{
                    self.location = customer.last_url;
                }
            }
		} else {
			this.close_login();
			customer.show_IDENTIFIER();
			eval(this.success_func + "()");
		}
	},
    //需要绑定手机号
    login_succeed_other: function(userName) {
        //customer.set_cookie(userName);
		if(customer.last_url){
			self.location = '/customer/login.html?flag=1&requri=' + customer.last_url;
		}else{
			self.location = '/customer/login.html?flag=1';
		}
		return
    },
	joinClub :function(){
		var params={};
		var mobile = Utils.trim($("#mobile").val());
		if(mobile != ''){
			if(!Utils.isMobile(mobile)){
				$('#send_span').html('<span><font color="red">请填写正确的手机号</font></span>');
				return false;
			}
		}
		var birthYear = Utils.trim($("#birthYear").val());
		var birthMonth = Utils.trim($("#birthMonth").val());
		var birthDay = Utils.trim($("#birthDay").val());
		if(birthYear == '' || birthMonth=='' || birthDay==''){
			$('.birthRes').html('<span><font color="red">请填写生日</font></span>');
			return false;
		}
		var birth=birthYear+'-'+birthMonth+"-"+birthDay;//出生年月日

		if($(".desicion:checked").length == 0){
			$('.applyRes').html('<span><font color="red">未加入宁盟俱乐部</font></span>');
			return false;
		}
		params['mobile'] = mobile;
		params['birth'] = birth;
		params['isChk'] = sms.isChk;
		xajax_do_req_user(params,7);
	},
	joinResult : function(code){
		if(code == -1){
			$(".lastRes").html('<span><font color="red">参数错误，请联系网站客服!</font></span>');
		}else if(code == -2){
			$(".lastRes").html('<span><font color="red">请填写正确的手机号!</font></span>');
		}else if(code == -3){
			$(".lastRes").html('<span><font color="red">参数错误，用户不存在!</font></span>');
		}else if(code == -4){
			$(".lastRes").html('<span><font color="red">优惠券信息未找到!</font></span>');
		}else if(code == 1){
			cancel_join();
		}else{
			$(".lastRes").html('<span><font color="red">'+code+'</font></span>');
		}
	},
	userNameExist: false,
	
	//用户注册
	register: function(flg,step) {
		if (flg == 1) {
			this.prefix = "#";
		} else {
			this.prefix = "#reg_";
		}
		this.flg = flg;
		var params = {
			userName: Utils.trim($(this.prefix + "userName").val()),
			pwd: Utils.trim($(this.prefix + "pwd").val()),
			pwd2: Utils.trim($(this.prefix + "pwd2").val()),
			yzm: Utils.trim($(this.prefix + "yzm").val()),
			mobile: Utils.trim($(this.prefix + "mobile").val()),
			vcode: Utils.trim($(this.prefix + "m_vcode").val())

		};

		var reg = /^[A-Za-z0-9_-]{6,30}$/;
		var error_arr = {},error_msg = true;
		
		if (Utils.isEmpty(params.userName)) {
			error_arr[this.prefix + "userName_error"] = this.userName_empty;
		} else if (!Utils.isMobile(params.userName)) {
			error_arr[this.prefix + "userName_error"] = this.userName_error;
		}else if(params.userName.length>50){
			error_arr[this.prefix + "userName_error"] = '会员名不能超过50个字符';
		}
		
		if (Utils.isEmpty(params.pwd)) {
			error_arr[this.prefix + "pwd_error"] = this.pwd_empty;
		} else if (!reg.test(params.pwd)) {
			error_arr[this.prefix + "pwd_error"] = this.pwd_error;
		} else if (params.pwd != params.pwd2) {
			error_arr[this.prefix + "pwd2_error"] = this.pwd2_error;
		}

		//如果用户名是手机号则把使用此手机号
		if (Utils.isMobile(params.userName)) {
			params.mobile = params.userName;
		}

		//手机号码校验
		if (Utils.isEmpty(params.mobile)) {
			error_arr[this.prefix + "mobile_error"] = this.mobile_empty;
		} else if (!Utils.isMobile(params.mobile)) {
			error_arr[this.prefix + "mobile_error"] = this.mobile_error;
		}

		//验证码输入校验
		if (Utils.isEmpty(params.yzm)) {
			error_arr[this.prefix + "yzm_error"] = this.yzm_empty;
		} else if (params.yzm.length != 4) {
			error_arr[this.prefix + "yzm_error"] = this.yzm_error;
		}

		//手机验证码输入校验
		if ($(this.prefix + "m_vcode")[0]) {
			params.vcode = Utils.trim($(this.prefix + "m_vcode").val());
			if (Utils.isEmpty(params.vcode)) {
				error_arr[this.prefix + "mobile_vcode_error"] = this.vcode_empty;
			} else if (params.yzm.length != 4) {
				error_arr[this.prefix + "mobile_vcode_error"] = this.vcode_error;
			}
		}

		if($('#lecake_agreement:checked').length == 0 && flg == 1){
			error_arr[this.prefix + "agreement_error"] = this.agreement_error;
		}
		
		$.each(error_arr,function(k,v) {
			$(k).addClass("note").text(v);
			error_msg = false;
		});
		
		if(step == 1){
			params['step'] = 1;
			this.register_back_url = $('#register_backurl').val();
			if(error_msg){
				xajax_do_req_user(params,2);//注册用户第一步
                //dspTest
                var _mvq = window._mvq || [];window._mvq = _mvq;
                _mvq.push(['$setAccount', 'm-23911-1']);
                _mvq.push(['$setGeneral', 'register', '', /*用户名*/ '', /*用户id*/ '']);
                _mvq.push(['$logConversion']);
                _mvq.push(['$logAction', 'regbtnclick']);
                _mvq.push(['$logData']);
			}
			return false;
		}
		//var mobile = Utils.trim($("#mobile").val());
		if(flg == 1){
			if(mobile != ''){
				if(!Utils.isMobile(mobile)){
					comm_alert('请填写正确的手机号!');
					return false;
				}
			}
			params['mobile'] = mobile;
		}
		
//		if(flg == 2){
//			var birthYear = Utils.trim($("#birthyear_reg").val());
//			var birthMonth = Utils.trim($("#birthMonth_reg").val());
//			var birthDay = Utils.trim($("#birthDay_reg").val());
//		}else{
		if(flg == 1){
			var birthYear = Utils.trim($("#birthYear").val());
			var birthMonth = Utils.trim($("#birthMonth").val());
			var birthDay = Utils.trim($("#birthDay").val());
			
			if(birthYear == '' || birthMonth=='' || birthDay==''){
				comm_alert('请填写完整的出生年月!');
				return false;
			}
			var birth=birthYear+'-'+birthMonth+"-"+birthDay;//出生年月日
			params['birth'] = birth;
		}

		params['step'] = 2;

		if (error_msg && !customer.userNameExist) {
			$(this.prefix + "userName_error").removeClass("note").text("");
			$(this.prefix + "pwd_error").removeClass("note").text("");
			$(this.prefix + "pwd2_error").removeClass("note").text("");
			$(this.prefix + "yzm_error").removeClass("note").text("");
			$(this.prefix + "mobile_vcode_error").removeClass("note").text("");
           	$(this.prefix + "fatal_error").text("正在注册，请稍候...").show();
           	comm_box.loadding();
           	params['step'] = 2;
           	params['isChk'] = sms.isChk;
           	params['register_flg'] = flg;
			xajax_do_req_user(params, 2);//注册用户第二部
            //dspTest
            var _mvq = window._mvq || [];window._mvq = _mvq;
            _mvq.push(['$setAccount', 'm-23911-1']);
            _mvq.push(['$setGeneral', 'register', '', /*用户名*/ '', /*用户id*/ '']);
            _mvq.push(['$logConversion']);
            _mvq.push(['$logAction', 'regbtnclick']);
            _mvq.push(['$logData']);
		}
		
	},
	
	//用户注册失败
	register_fail: function(code) {
		
		if(code < 0){
			comm_box.loadding_close();
		}
		if (code == -1) {
			$(this.prefix + "userName_error").addClass("note").text(this.userName_error);
		}else if (code == -2) {
			$(this.prefix + "pwd_error").addClass("note").text(this.pwd_error);
		} else if (code == -3) {
			$(this.prefix + "pwd2_error").addClass("note").text(this.pwd2_error);
		} else if (code == -4) {
			$(this.prefix + "userName_error").addClass("note").text(this.userName_exist);
		}else if(code == -5){
			comm_alert('请填写正确的手机格式!');
		}else if(code == -6){
			comm_alert('您的手机号已被绑定!');
		}else if (code == -7) {
			$(this.prefix + "mobile_error").addClass("note").text(this.mobile_empty);
		}else if (code == -8) {
			$(this.prefix + "mobile_error").addClass("note").text(this.mobile_error);
		}else if (code == -102 || code == -103) {
			$(this.prefix + "yzm_error").addClass("note").text(this.yzm_error);
		} else if (code == -100 || code == -101) {
			comm_alert('参数错误，请联系网站客服!');
		} else if (code == -105) {
			$(this.prefix + "fatal_error").text("网络链接超时，请重试").show();
		} else if (code == -106) {
            $(this.prefix + "fatal_error").text("您已登录，无法注册新用户").show();
        }else if(code == -107){
        	comm_alert(this.userName_exist);
        }else if(code == -108){
			$(this.prefix + "mobile_vcode_error").addClass("note").text('手机验证码输入错误!');
		}
		if (code != -105 && code != -100 && code != -101 && code != -106)
			$(this.prefix + "fatal_error").text("").hide();
		$(this.prefix + "yzm").val("");
		common.captcha(1, this.prefix.substring(1) + "yzm_img");
	},
	
	//用户注册第一步成功
	register_first :function(){
		$("#regist_1").css('display','none');
		$("#regist_2").css('display','block');
	},
	//用户注册成功
	register_success: function(userName,cardFlg) {
		set_COOKIE_INFO('REGISTER_SUCCESS_BACKURL',this.register_back_url,1200);
		customer.set_cookie(userName);
		customer.show_IDENTIFIER();
		comm_box.loadding_close();
		//检测是否为内购用户
		for(var i=0;i<this.internalRule.length;i++){
			if(userName.indexOf(this.internalRule[i],0)>0){
				this.internal_flg = 1;
				break;
			}
		}
		//礼品券赠送成功
		var cardContent = '<p>亲爱的会员,注册送券</p>';
			cardContent += '<p>已将20元现金抵用券放至您的帐号，请至“我的李宁-礼品券”进行查询。祝您购物愉快！</p>';
		if (this.flg == 1) {
			if(this.internal_flg ==1){
				if(cardFlg == 0){
					if (common.userBrowser() == "Safari")
						location.replace("/shop/register_success.php");
					else
						self.location = "/shop/register_success.php";
				}else{
					comm_alert("内购用户注册成功,请注意查收邮件", 1, "/shop/register_success.php");
				}
			}else{
				if(cardFlg == 0){
					comm_alert(cardContent,1, "/shop/register_success.php");
				}else{
					if (common.userBrowser() == "Safari")
						location.replace("/shop/register_success.php");
					else
						self.location = "/shop/register_success.php";
				}
			}
		} else {
			this.close_login();
			if(this.internal_flg == 1){
				if(cardFlg == 0){
					comm_alert(cardContent,3);
				}else{
					comm_alert("内购用户注册成功,请注意查收邮件", 3);
				}
			}else{
				if(cardFlg == 0){
					comm_alert(cardContent,3);
				}else{
					comm_alert("用户注册成功", 3);
				}
			}
		}
	}
	
};

$(document).ready(function() {
	//检查用户名
	var userNameValue = "";
	$("#reg_userName").blur(function() {
		var userName = Utils.trim($(this).val());
		if (Utils.isEmpty(userName)) {
			$("#reg_userName_error").addClass("note").text(customer.userName_empty);	
		}else if(userName.length>50){ 
			$("#reg_userName_error").addClass("note").text('邮箱名不能超过50个字符');
		}else if (!Utils.isMobile(userName)) {
			$("#reg_userName_error").addClass("note").text(customer.userName_error);
		} else if (userName != userNameValue) {
			$("#reg_userName_error").addClass("note").text("检查中...");
			xajax_do_req_user(userName, 1);
			userNameValue = userName;
			$("#reg_userName_error").addClass("note").text("");
		} else if (!customer.userNameExist) {
			$("#reg_userName_error").removeClass("note").text("");
		}
		
		//如果用户名是手机号则把使用此手机号
		if (Utils.isMobile(userName)) {
			var telephone = $('#reg_mobile').val();
			if (Utils.isEmpty(telephone)) {
				$('#reg_mobile').val(userName);
			}
		}
		
	});
	//检查手机号
	$("#reg_mobile").blur(function() {
		var mobile = Utils.trim($(this).val());
		if (Utils.isEmpty(mobile)) {
			$("#reg_mobile_error").addClass("note").text(customer.mobile_empty);
		} else if (!Utils.isMobile(mobile)) {
			$("#reg_mobile_error").addClass("note").text(customer.mobile_error);
		} else {
			$("#reg_mobile_error").removeClass("note").text("");
		}
	});
	
	//检查确认密码
	$("#reg_pwd2").blur(function() {
		var pwd = Utils.trim($("#reg_pwd").val());
		var pwd2 = Utils.trim($("#reg_pwd2").val());
		if (pwd != pwd2) {
			$("#reg_pwd2_error").addClass("note").text(customer.pwd2_error);
		} else {
			$("#reg_pwd2_error").removeClass("note").text("");
		}
	});
	
});

//检查email返回值
function result_email_error (result_code) {
	if (result_code == 1) {
		//add by becky 20130507 访客注册找回密码
		//$("#userName_error").addClass("note").text(customer.userName_exist);
		var name=$('#reg_userName').val();
		var text = '手机号码已存在，可点击 <a style="color: #970527;text-decoration: underline;" href="/shop/getpwd.php?&username='+name+'"> 找回密码>><a>';
		$("#reg_userName_error").addClass("note").html(text);
		customer.userNameExist = true;
	} else if (result_code == 2) {
		$("#reg_userName_error").removeClass("note").text("");
		customer.userNameExist = false;
	} else if (result_code == 3) {
		$("#reg_userName_error").text("网络链接超时");
		customer.userNameExist = true;
	} else {
		$("#reg_userName_error").text("参数错误，请联系网站客服");
		customer.userNameExist = true;
	}
}

//未读信息
var unread = {
	
	//打开页面时的时间戳
	open_page_timestamp: "",
	
	//setInterval函数的ID
	unread_id: "",
	
	//获得打开页面时的时间戳
	get_timestamp: function() {
		var exp = new Date();
		this.open_page_timestamp = exp.getTime();
		set_COOKIE_INFO("OPEN_PAGE_TIMESTAMP", this.open_page_timestamp, 86400);
		if (this.unread_id != "")
			clearInterval(this.unread_id);
		this.search();
		this.unread_id = setInterval("unread.search()",30000);
	},
	
	//查询未读信息
	search: function() {
		if (this.open_page_timestamp == get_COOKIE_INFO("OPEN_PAGE_TIMESTAMP") && get_COOKIE_INFO("G_QUERY_UNREAD") != 0 && get_COOKIE_INFO("G_QUERY_UNREAD") != null) {
			xajax_do_req_header("", 4);
		}
	},
	
	//关闭未读信息
	close: function() {
		xajax_do_req_header("", 5);
	},
	
	clear: function(str) {
		switch (str) {
			case "unread_consultation":
				$("#unread_consultation").hide();
				break;
			case "unread_ask":
				$("#unread_ask").hide();
				break;
		}
		if ($("#unread_consultation").css("display") == "none" && $("#unread_ask").css("display") == "none") {
			$("#unread_yellowtip").hide();
		}
	}
	
};

//购物车
var cart = {
	
	//统计购物车商品数量
	goods_amount: function() {
		
		var cart_amount = get_COOKIE_INFO("CARTAMOUNT");
        var cart_amount_lightning = get_COOKIE_INFO("CARTAMOUNT_lightning");//edit by pifei
		
		if (cart_amount == null){
			$("#js_cart_goods_number").text(0);
        }else{
			$("#js_cart_goods_number").text(parseInt(Number(cart_amount)) + parseInt(Number(cart_amount_lightning))); //edit by pifei
        }
	},
	
	//清空购物车
	empty: function() {
		comm_box.confirm_open("您确定清空购物车里面的所有商品吗？", "cart.confirm_empty");
	},
	
	city_change_empty: function () {
        //add by Jerry 2013-03-11 5. 清空购物车商品
        //_trackData.push(['emptycart']);
		xajax_do_req_header('', 22);
	},
	
	
	//确认清空购物车
	confirm_empty: function() {
		xajax_do_req_cart('', 16);
	},
	
	//添加到购物车成功后，关闭弹出层，继续购物
	successClose: function() {
		$("#add_cart_success").hide();
        allOperate.getGoodsCate(0);
        return false;
	},

    //添加到购物车成功后，关闭弹出层，继续购物
    successClose_lightning: function() {
        $("#add_cart_success").hide();
        allOperate.getGoodsCate_lightning(0);
        return false;
    },


	
	//添加到购物车成功后，转跳到购物车页面
	successCart: function() {
		this.successClose();
		comm_box.loadding();
		if (common.userBrowser() == "Safari")
			location.replace("/shop/cart.php");
		else
			self.location = "/shop/cart.php?" + Math.random();
	},
    //添加到购物车成功后，转跳到购物车页面
    successCart_lightning: function() {
        this.successClose_lightning();
        comm_box.loadding();
        if (common.userBrowser() == "Safari")
            location.replace("/shop/cart_lightning.php");
        else
            self.location = "/shop/cart_lightning.php?" + Math.random();
    }
	
};


//普通商品购物车
var general_cart = {
	
	amount: 1,
	flg: 1,
	
	//添加普通商品
	add: function(postID, input_id, type) {
        //add by yangjie
        var city='';
        if (get_COOKIE_INFO('CITY_ID')) {
            var site_id = get_COOKIE_INFO('CITY_ID');
            var yangjiecity = site_id.split('_');
            city= yangjiecity[1];
        }
        //edit by yangjie 2013-10-10
        if(city==0){
            comm_alert("北京站仅限电话订购！");
            return false;
        };

		if (!Utils.isDigital(postID)) {
			postID = Utils.trim($("#postID_306687").val());
		}
		if (input_id) {
			this.amount = $("#" + input_id).val();
			if (!this.amount || this.amount <= 0 || !Utils.isInt(this.amount.toString()) || this.amount.length > 2) {
				comm_alert("输入的数量有误,应为[1-99]");
				$("#" + input_id).val(1);
				return false;
			}
		}
		comm_box.loadding();
        // add by Jerry 2013-03-06 phpstat 2. 添加购物车商品[商品ID*],[价格],[数量],[用户ID]
        //alert($("#goodsPrice").text());
        //_trackData.push(['addcartitem', postID,$("#goodsPrice").text(),this.amount,customer.cust_id]);

		xajax_do_req_cart( [postID, this.amount, type], 1 );
	},
	//购物车搭配购买配件添加到购物车
	accessoriesAdd: function (uid,amount,type) {
		if (!Utils.isDigital(uid) || amount!=1) {
			comm_alert('参数错误');
			return false;
		}
		comm_box.loadding();
		xajax_do_req_cart( [uid, amount, type], 1 );
	},

    //  闪购 购物车搭配购买配件添加到购物车
  accessoriesAdd_lightning: function (uid,amount,type) {
    if (!Utils.isDigital(uid) || amount!=1) {
        comm_alert('参数错误');
        return false;
    }
    comm_box.loadding();
    xajax_do_req_cart( [uid, amount, type],25);
},


	//添加或修改普通商品返回值（错误）
	fail: function (val, str) {
		comm_box.loadding_close();
		if (val == -1) {
			comm_alert("商品不存在或已下架");
		} else if (val == -2) {
			comm_alert("暂无库存，近期补货请及时关注");
		} else if (val == -3) {
			comm_alert("请选择收货区域",2);
		} else if (val == -4) {
			comm_alert("此商品为特价商品，只能购买" + str + "件");
		} else if (val == -5) {
			comm_alert("购买数量无效");
		}else if (val == -10) {
            comm_alert("心月·月光宝合定金券每日限购两张，若今日已购买两张，请明天再来哦");
        }else if (val == -11) {
            comm_alert("该商品不能与其他商品合买");
        }else if (val == -12) {
            comm_alert("购物车内含有不可合买的商品");
        }else if (val == -100) {
			comm_alert(str);
		}
		if (this.before_amount) {
			$("#buy_" + this.postID).val(this.before_amount);
		}
	},
	
	//添加普通商品返回值
	success: function(val, arr, flg) {
		comm_box.loadding_close();
		if (this.flg) {
			cart.goods_amount();
	    	$("#cp_title").html("&nbsp;&nbsp;" + this.amount + "件商品加入购物车");
	    	var listHtml = "<tr><td rowspan=\"4\"><div id=\"newweight\"><img class=\"goods_img\" src=\"" + arr[2] + "\"></div></td><td class=\"tal blod\">" + arr[1] + "</td></tr>";
	    	listHtml += "<tr><td class=\"tal\">加入数量：<span class=\"red\">" + this.amount + "</span></td></tr>";
	    	listHtml += "<tr><td class=\"tal\">";
            listHtml +="总计金额：<span class=\"red\">￥"+parseFloat(arr[0] * this.amount).toFixed(2)+"</span>";
            if(arr[3]) listHtml += "&nbsp;&nbsp;&nbsp;&nbsp; 积分：<span class=\"red\">"+ arr[3] +"</span>";
            listHtml +="</td></tr>";
	    	listHtml += "<tr><td class=\"tal\" style=\"height: 50px;\">";

            if(flg)
                listHtml += "<input type=\"button\" onclick=\"javascript:$('#add_cart_success').hide();\" value=\"继续购物\" class=\"input_action\">";
            else
                listHtml += "<input type=\"button\" onclick=\"cart.successClose();\" value=\"继续购物\" class=\"input_action\">";

            listHtml += "<input type=\"button\" onclick=\"cart.successCart();\" value=\"去结算\" class=\"input_action_off ml10\"></td></tr>";
	    	$("#success_html").html(listHtml);
            $("#add_cart_success").css('z-index','99999');
	    	$("#add_cart_success").show().css('margin-top','50px');
		} else {
			self.location = "/shop/cart.php";
		}
	},

    //添加普通商品返回值
    success_lightning: function(val, arr, flg) {
        comm_box.loadding_close();
        if (this.flg) {
            cart.goods_amount();
            $("#cp_title").html("&nbsp;&nbsp;" + this.amount + "件商品加入购物车");
            var listHtml = "<tr><td rowspan=\"4\"><div id=\"newweight\"><img class=\"goods_img\" src=\"" + arr[2] + "\"></div></td><td class=\"tal blod\">" + arr[1] + "</td></tr>";
            listHtml += "<tr><td class=\"tal\">加入数量：<span class=\"red\">" + this.amount + "</span></td></tr>";
            listHtml += "<tr><td class=\"tal\">";
            listHtml +="总计金额：<span class=\"red\">￥"+parseFloat(arr[0] * this.amount).toFixed(2)+"</span>";
            if(arr[3]) listHtml += "&nbsp;&nbsp;&nbsp;&nbsp; 积分：<span class=\"red\">"+ arr[3] +"</span>";
            listHtml +="</td></tr>";
            listHtml += "<tr><td class=\"tal\" style=\"height: 50px;\">";

            if(flg)
                listHtml += "<input type=\"button\" onclick=\"javascript:$('#add_cart_success').hide();\" value=\"继续购物\" class=\"input_action\">";
            else
                listHtml += "<input type=\"button\" onclick=\"cart.successClose_lightning();\" value=\"继续购物\" class=\"input_action\">";

            listHtml += "<input type=\"button\" onclick=\"cart.successCart_lightning();\" value=\"去结算\" class=\"input_action_off ml10\"></td></tr>";
            $("#success_html").html(listHtml);
            $("#add_cart_success").css('z-index','99999');
            $("#add_cart_success").show().css('margin-top','50px');
        } else {
            self.location = "/shop/cart_lightning.php";
        }
    },

	//蛋糕卡订购
	specialAdd: function (postID,uid) {
        //add by yangjie
        var city='';
        if (get_COOKIE_INFO('CITY_ID')) {
            var site_id = get_COOKIE_INFO('CITY_ID');
            var yangjiecity = site_id.split('_');
            city= yangjiecity[1];
        }
        //edit by yangjie 2013-10-10
        if(city==0){
            comm_alert("北京站仅限电话订购！");
            return false;
        };
		if (!Utils.isDigital(postID) || !Utils.isDigital(uid)) {
			comm_alert('参数错误');
			return false;
		}
		comm_box.loadding();
		xajax_do_req_goods( [postID,uid], 2 );
	},
	//快速购买详情显示
	speedDetailed: function () {
		comm_box.loadding_close();
		$('#city_pop_mask,#buy_high_speed').removeClass('hide');
	},
	//关闭快速购买详情
	detailedClose: function () {
		$('#city_pop_mask,#buy_high_speed').addClass('hide');
	},
	//点击快速购买
	speedBuy: function (product_code) {
        //yangjie add by
        var city='';
        if (get_COOKIE_INFO('CITY_ID')) {
            var site_id = get_COOKIE_INFO('CITY_ID');
            var yangjiecity = site_id.split('_');
            city= yangjiecity[1];
        }
        //edit by yangjie 2013-10-10
        if(city==0){
            comm_alert("北京站仅限电话订购！");
            return false;
        };

		if (Utils.isEmpty(product_code))  {
			comm_alert('参数错误');
			return false;
		}
		comm_box.loadding();
		xajax_do_req_goods(product_code,3);
	},

    //addBy LFL 2014.04.26  立即购买
    speedBuyNew: function (postID,MainNum) {
        if (parseInt(MainNum) <= 0) {
            comm_alert('购买数量必须大于0');
            return false;
        }else if (!Utils.isDigital(postID) || !Utils.isDigital(MainNum)) {
            comm_alert('购买数量必须为数字');
            return false;
        }
        if (Utils.isEmpty(postID))  {
            comm_alert('参数错误');
            return false;
        }
        comm_box.loadding();
        var goods = [];
        goods['flg'] = 1;
        goods['main'] = [postID, MainNum,1];
        goods['accessories'] = [];
        xajax_do_req_cart(goods,3);
    },

    //addBy pifei 2015.12.23  立即购买 闪购
    speedBuyNew_lightning: function (postID,MainNum) {
        if (parseInt(MainNum) <= 0) {
            comm_alert('购买数量必须大于0');
            return false;
        }else if (!Utils.isDigital(postID) || !Utils.isDigital(MainNum)) {
            comm_alert('购买数量必须为数字');
            return false;
        }
        if (Utils.isEmpty(postID))  {
            comm_alert('参数错误');
            return false;
        }
        comm_box.loadding();
        var goods = [];
        goods['flg'] = 1;
        goods['main'] = [postID, MainNum,1];
        goods['accessories'] = [];
        xajax_do_req_cart(goods,26);
    },

    new_speedBuyNew: function (postID,MainNum) {
        if (parseInt(MainNum) <= 0) {
            comm_alert('购买数量必须大于0');
            return false;
        }else if (!Utils.isDigital(postID) || !Utils.isDigital(MainNum)) {
            comm_alert('购买数量必须为数字');
            return false;
        }
        if (Utils.isEmpty(postID))  {
            comm_alert('参数错误');
            return false;
        }
        comm_box.loadding();
        var goods = [];
        goods['flg'] = 1;
        goods['main'] = [postID, MainNum,1];
        goods['accessories'] = [];
        xajax_do_req_cart(goods,24);
    },
	    //addBy lrj 2016.05.19  立即购买/带跳转url版本
		// 登录用户的结算页url login_url
		//非登录用户的结算页url url
    speedBuyNew_url: function (postID,MainNum,login_url,url) {
        if (parseInt(MainNum) <= 0) {
            comm_alert('购买数量必须大于0');
            return false;
        }else if (!Utils.isDigital(postID) || !Utils.isDigital(MainNum)) {
            comm_alert('购买数量必须为数字');
            return false;
        }
        if (Utils.isEmpty(postID))  {
            comm_alert('参数错误');
            return false;
        }
        comm_box.loadding();
        var goods = [];
        goods['flg'] = 1;
        goods['main'] = [postID, MainNum,1];
        goods['accessories'] = [];
		goods['login_url'] = login_url;
		goods['url'] = url;
        xajax_do_req_cart(goods,3);
    },
    //点击快速购买 --福利券专区使用
    speedBuy_welfare: function (product_code) {
        //yangjie add by
        var city='';
        if (get_COOKIE_INFO('CITY_ID')) {
            var site_id = get_COOKIE_INFO('CITY_ID');
            var yangjiecity = site_id.split('_');
            city= yangjiecity[1];
        }
        //edit by yangjie 2013-10-10
        if(city==0){
            comm_alert("北京站仅限电话订购！");
            return false;
        };

        if (Utils.isEmpty(product_code))  {
            comm_alert('参数错误');
            return false;
        }
        comm_box.loadding();
        xajax_do_req_goods(product_code,12);
    },

    //addBy yangjie 2014.04.26  加入购物车
    addNew: function(postID,MainNum,sendDate) {
        sendDate = sendDate || '';
        if (parseInt(MainNum) <= 0) {
            comm_alert('购买数量必须大于0');
            return false;
        }else if (!Utils.isDigital(postID) || !Utils.isDigital(MainNum)) {
            comm_alert('购买数量必须为数字');
            return false;
        }
        if (Utils.isEmpty(postID))  {
            comm_alert('参数错误');
            return false;
        }
        this.amount =MainNum;
        comm_box.loadding();
        xajax_do_req_cart( [postID, this.amount, 1 , sendDate], 1 );
    },
    //addBy pifei 2015.12.23  加入闪购购物车
    addNew_lightning: function(postID,MainNum,sendDate) {
        sendDate = sendDate || '';
        if (parseInt(MainNum) <= 0) {
            comm_alert('购买数量必须大于0');
            return false;
        }else if (!Utils.isDigital(postID) || !Utils.isDigital(MainNum)) {
            comm_alert('购买数量必须为数字');
            return false;
        }
        if (Utils.isEmpty(postID))  {
            comm_alert('参数错误');
            return false;
        }
        this.amount =MainNum;
        comm_box.loadding();
        xajax_do_req_cart( [postID, this.amount, 1 , sendDate],25);
    },
	//加入购物车 flg: 1.快速订购，2.蛋糕卡订购
	speedAdd: function (flg) {
		if (flg != 1 && flg != 2) {
			comm_alert('参数错误');
			return false;
		}
		var goods = [];
		goods['flg'] = flg;
		//商品
		var MainPostID = $('input[name=buy_goods_306687]:checked').attr('postID'); //商品postID
		var MainNum = $('input[name=speed_num_306687]').val(); //商品数量
		if (parseInt(MainNum) <= 0) {
			comm_alert('购买数量必须大于0');
			return false;
		}else if (!Utils.isDigital(MainPostID) || !Utils.isDigital(MainNum)) {
			comm_alert('购买数量必须为数字');
			return false;
		}
		goods['main'] = [MainPostID, MainNum,1];
		//附件
		var postID = 0;
		var num = 0;
		var i = 0;
		goods['accessories'] = [];
		$('input[name=accessories_goods_306687]:checked').each(function(){
			postID = $(this).attr('postID');
			num = $('input[name=num_accessories_'+postID+']').val();
			if (!Utils.isDigital(MainPostID) || !Utils.isDigital(MainNum)) {
				comm_alert('参数错误');
				return false;
			}
			goods['accessories'][i] = [postID,num,1];
			i++;
		});
		xajax_do_req_cart(goods,3);
	},
	//快速购买失败
	speedBuyFail: function (msg) {
		comm_box.loadding_close();
		comm_alert(msg);
	},
	//购买数量增加或减少 flg:1.增加 0.减少 priceFlg: 1价格随数量改变 0价格不变
	buy: function(flg,id,priceFlg,money_id) {
		var buyAmount = $("#"+id).val();
		if (!buyAmount || !Utils.isInt(buyAmount)) {
			buyAmount = 1;
			$("#"+id).val(buyAmount);
		}
		buyAmount = parseInt(buyAmount);
		if (buyAmount <= 0) {
			comm_alert('购买数量必须大于0');
			return false;
		}
		if (flg) {
			if (buyAmount == 99)
				return false;
			buyAmount += 1;
		} else {
			if (buyAmount == 1)
				return false;
			buyAmount -= 1;
		}
        //add by Jerry 2013-04-02 购买配件总金额
        var sPrice = "buy-pop-pro-price_"+id.replace("goods_gift_","");

        var unPrice = "marktPrice_"+id.replace("goods_gift_","");

        $("#"+sPrice).text(buyAmount*$("#"+unPrice).text());
		$("#"+id).val(buyAmount);
		if (priceFlg == 1) {
			var price = $('input[name=buy_goods_306687]:checked').val();
			$('#'+money_id).html((price*buyAmount).toFixed(2));
		}
	},
	//改变商品规格
	changSpec: function (id,price_id,num_id) {
		var price = $(id).val();
		$('#'+price_id).html(price);
		$('#'+num_id).val(1);
	}
	
};
function FloatMul(arg1,arg2) {   
	var m=0,s1=arg1.toString(),s2=arg2.toString();   
	try{m+=s1.split(".")[1].length}catch(e){}
	try{m+=s2.split(".")[1].length}catch(e){}
	return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)   
}   
//商品收藏
var favorites = {
	
	postID: "",//商品网购号
	
	flg: 0,//1:购物车页面 2：商品收藏页面
	
	//收藏商品加入购物车
	cart: function(postID) {
		general_cart.flg = 0;
		general_cart.add(postID);
	},
	
	//添加商品收藏
	add: function(postID) {
		if (this.postID == "") {
			if (!Utils.isDigital(postID)) {
				comm_alert("参数错误");
				return false;
			}
			this.postID = postID;
		}
		if (customer.cust_id == null) {
			customer.open_login('favorites.add');
		} else {
			xajax_do_req_header(this.postID, 12);
		}
	},
	
	//删除商品收藏
	del: function(postID, flg) {
		this.postID = postID;
		this.flg = flg;
		xajax_do_req_header(postID, 13);
	},
	
	//商品收藏操作返回值
	result: function(result_code) {
		if (result_code == -1) {
			comm_alert("参数错误，请联系网站客服");
		} else if (result_code == -2) {
			comm_alert("该商品不存在");
		} else if (result_code == -3) {
			comm_alert("此商品已经被收藏");
		} else if (result_code == -4) {
			comm_alert("您要删除收藏商品不存在");
		} else if (result_code == -100) {
			comm_alert("系统错误，请联系网站客服");
		} else if (result_code == -101) {
			customer.open_login('favorites.add');
		} else if (result_code == 1) {
			comm_alert("商品已收藏", 3);
		} else if (result_code == 2) {
			if (this.flg == 1) {
				comm_alert("收藏商品已删除", 3);
				$("#favorites_" + this.postID).remove();
				this.postID = "";
			} else {
				window.location.reload();
			}
		}
	}
	
};

//公共的提示窗口
var COME_BACK_FLG = "";
var COMM_BACK_HREF = "";
/*
正确的操作  flg=1 提示成功信息（参数str），1.5秒后自动调用函数come_bcak_href（关闭提示层，根据href值跳转页面）。
           flg=3 提示成功信息（参数str），1.5秒后自动调用函数come_bcak_href（关闭提示层，但不跳转页面）。
           
错误的操作  flg=0 提示错误信息（参数str），点击提示层上的确定按钮函数come_bcak_href（关闭提示层）。
		   flg=2 提示错误信息（参数str），点击提示层上的确定按钮函数come_bcak_href（关闭提示层，调用其他函数）。
		   flg=4 提示错误信息（参数str），点击提示层上的确定按钮函数come_bcak_href（关闭提示层，根据href值跳转页面）。
*/
function comm_alert(str,flg,href) {
	COME_BACK_FLG = flg ? flg : 0;
	COMM_BACK_HREF = href ? href : "/shop/cart.php";
	if (flg == 1 || flg == 3) {
		setTimeout("come_bcak_href()",1500);
		$(".alert_img").addClass("alert_img2");
		$("#linkbox").hide();
	} else {
		$(".alert_img").removeClass("alert_img2");
		$("#linkbox").show();
	}
	if (/msie 6/i.test(navigator.userAgent) && !$.support.style) {
		$("#comm_alert").css("top", parseInt($(document).scrollTop()) + 200 + "px");
	}
	$("#comm_error").html(str);
	getsize();
	$("#mask").removeClass("hide");
	$("#comm_alert").removeClass("hide");
	$("#btnClose_dialog").focus();
}
//add by 2013-09-17 杨杰 对话框内容显示
function comm_alertwid(str,wid){
     $(".alert_img").removeClass("alert_img2");
    $("#linkbox").show();
    if (/msie 6/i.test(navigator.userAgent) && !$.support.style) {
        $("#comm_alert").css("top", parseInt($(document).scrollTop()) + 200 + "px");
    }
    $(".comm_layer table").css("width",wid+"px");
    $("#comm_error").html(str);
    getsize();
    $(".comm_alert").css("top","25px");
    $("#linkbox").css("display","none");
    $("#aClose_dialog").css("display","none");
    $(".pb-titleg").css("display","none");
    $(".alert_img").css("display","none");
    $(".pb-content").css("padding","0px");
    $("#mask").removeClass("hide");
    $("#comm_alert").removeClass("hide");
    $("#btnClose_dialog").focus();
}
//add by 2013-09-17 杨杰 对话框内容显示 
function comm_close(){
    $(".comm_layer table").css("width","300px");
    $(".comm_alert").css("top","200px");
    $("#linkbox").css("display","block");
    $("#aClose_dialog").css("display","block");
    $(".pb-titleg").css("display","block");
    $(".alert_img").css("display","block");
    $(".pb-content").css("padding","10px");
    come_bcak_href(0);
}

//回调函数
function come_bcak_href() {
	$("#comm_alert").addClass("hide");
	$("#mask").addClass("hide");
	if (COME_BACK_FLG == 1 || COME_BACK_FLG == 4) {
		self.location = COMM_BACK_HREF;
	} else if (COME_BACK_FLG == 2) {
		get_all_region();
	}
}

/**
 * 公共的提示层
 * cf_open 确认提示层
 */
var comm_box = {
	
	//确认时回调函数名称
	confirmFunc: "",
	
	//取消时回调的函数名称
	cancelFunc:"",
	
	//确认提示层长度
	width: 300,
	
	timeID: "",
	
	/*	
		打开确认提示层
	 	str 提示信息 
	 	confirmFunc 确认时回调函数名称 
	 	cancelFunc 取消时回调的函数名称 
	*/
	confirm_open: function(str, confirmFunc, cancelFunc) {
		this.confirmFunc = confirmFunc;
		if (cancelFunc)
			this.cancelFunc = cancelFunc;
		if (/msie 6/i.test(navigator.userAgent) && !$.support.style) {
			$("#comm_confirm").css("top", parseInt($(document).scrollTop()) + 200 + "px");
		}
		$("#confirm_msg").html(str);
		$("#comm_confirm .pb-content").css("min-width",this.width+"px");
		$("#mask").removeClass("hide");
		$("#comm_confirm").removeClass("hide");
	},
	
		/*修改提示层确认取消按钮标题*/
	revise_btn: function(ok_btn,cancel_btn) {
			$("#comm_confirm .link-button-green span").html(ok_btn);
			$("#comm_confirm .link-button span").html(cancel_btn);
    },
	
	/**
	 * 关闭确认提示层
	 * isConfirm 1：确认 0：取消 
	 */
	confirm_close: function(isConfirm) {
		$("#comm_confirm").addClass("hide");
		$("#mask").addClass("hide");
		if (isConfirm) {
			if (typeof this.confirmFunc == 'string')
				eval(this.confirmFunc + "()");			
			if (typeof this.confirmFunc == 'function')
				this.confirmFunc();
		} else {
			if (this.cancelFunc != "") {
				if (typeof this.cancelFunc == 'string')
					eval(this.cancelFunc + "()");
				if (typeof this.cancelFunc == 'function')
					this.cancelFunc();
			}
		}
	},
	
	loadding: function(str) {
		if (str) {
			$("#loadding").find(".loadding_str").text(str);
		}
		$("#mask").removeClass("hide");
		$("#loadding").removeClass("hide");
		this.timeID = setTimeout("comm_box.loadding_fail()", 30000);
	},
	
	loadding_fail: function() {
		alert("可能由于您的网络不太给力，页面加载出现异常，点击确定后重新加载！");
		common.refresh();
	},
	
	loadding_close: function() {
		clearTimeout(this.timeID);
		$("#loadding").addClass("hide");
		$("#mask").addClass("hide");
	}
	
};

//简单的确认层
function delete_pop(obj,str) {
	$(".relative .absolute").hide();
	$(obj).next("div").show();
	$(obj).next("div").children("p").html(str);
}
//关闭简单的确认层
function cancal_delete_pop() {
	$(".relative .absolute").hide();
}

//简单的确认层(右边)
function delete_pop_right(obj,str) {
	$(".relative .absolute_right").hide();
	$(obj).next("div").show();
	$(obj).next("div").children("p").html(str);
}
//关闭简单的确认层(右边)
function cancal_delete_pop_right() {
	$(".relative .absolute_right").hide();
}

//遮盖层高度和宽度
function getsize() {
	width = document.body.scrollWidth;
	height = document.body.scrollHeight;
	if(document.documentElement){
		width = Math.max(width, document.documentElement.scrollWidth);
		height = Math.max(height, document.documentElement.scrollHeight);
	}
	$(".mask").css("width",width).css("height",height);
}

//滚动条滚动
$(window).scroll(function() {
	
	//检查客户是否有未读信息
	if (customer.cust_id && unread.open_page_timestamp < get_COOKIE_INFO("OPEN_PAGE_TIMESTAMP")) {
		unread.get_timestamp();
	}
	
	//滚动条高度
	var t = $(document).scrollTop();
	
	//未读提示层位置
	if ($("#unread_yellowtip").css("display") == "block") {
		if (t > 26) {
			if (/msie 6/i.test(navigator.userAgent) && !$.support.style) {
				$("#unread_yellowtip").css("top", parseInt(t) + "px");
			} else {
				$("#unread_yellowtip").css("top", 0);
			}
		} else {
			$("#unread_yellowtip").css("top", "26px");
		}
	}
	
	//回顶部层位置
	
	if (t >= 200) {
		$("#go-top").css("display", "inline");
	} else if(t < 200){
		$("#go-top").css("display", "none");
	}
	
	//提示弹出层位置
	if (/msie 6/i.test(navigator.userAgent) && !$.support.style && !$("#comm_alert").hasClass("hide")) {
		$("#comm_alert").css("top", parseInt(t) + 200 + "px");
	}
	
	//登录层位置
	if (/msie 6/i.test(navigator.userAgent) && !$.support.style && !$("#login_main").hasClass("hide")) {
		$("#login_main").css("top", parseInt(t) + 200 + "px");
	}
	
	//提示弹出层位置(客服)
	if(/msie 6/i.test(navigator.userAgent) && !$.support.style){
		$("#onlinediv").css("top", parseInt(t) + 200 + "px");
	}
	
	//加载层
	if (/msie 6/i.test(navigator.userAgent) && !$.support.style && !$("#loadding").hasClass("hide")) {
		$("#loadding").css("top", parseInt(t) + 300 + "px");
	}
	
});

//公告滚动
function setScroll() {
    var c = 30;
    var d = document.getElementById("textScrollArea");
    var e = document.getElementById("textScrollCon");
    if (d == null || e == null) {
        return
    }
    var f = e.offsetWidth;
    function a() {
        if (f - d.scrollLeft <= 0) {
            d.scrollLeft = 0;
        } else {
            d.scrollLeft++;
        }
    }
    var b = setInterval(a, c);
    d.onmouseover = function() {
        clearInterval(b)
    };
    d.onmouseout = function() {
        b = setInterval(a, c)
    }
}
setScroll();



//查询
function do_search(keywords) {
	if (keywords) {
		var reg = new RegExp("-","g");
		$("#keywords").val(keywords.replace(reg, "++"));
		$("#searchTemp").val(keywords);
	} else {
		keywords = Utils.trim(document.getElementById("searchTemp").value);
		if (keywords == "输入关键词") {
			keywords =  '';
			document.getElementById("searchTemp").value = "";
		}
	}
	keywords =  estr(keywords);
	url = '/shop/searchkey-'+keywords+'-0.html';
	$("#search_form").attr('action',url);
	document.forms.search_form.submit();
}

//收藏网站
function addfavorite() { 
	if (document.all) { 
		window.external.addFavorite('http://www.lecake.com','诺心LECAKE官方网上商城'); 
	} else if (window.sidebar) { 
		window.sidebar.addPanel('诺心LECAKE官方网上商城', 'http://www.lecake.com', ""); 
	} 
} 

$(document).ready(function() {
	getsize();

    var shop_cart_flg = 0;
    var timer;
	//购物车下拉列表查询
	$("#shop_cart").mouseover(function() {
        if (shop_cart_flg != 0)
            return false;
        shop_cart_flg = 1;
		var listHtml = "<span class=\"blank10\"></span>";
		listHtml += "<img alt=\"购物车数据加载中\" src=\""+global.img_path+"/headfooter/loading.gif\" width=\"32px\" height=\"32px\" />";
		listHtml += "<span class=\"blank10\"></span>";
		$("#cart_list").html(listHtml).show();
		xajax_do_req_header(global.isSSL, 6);
		$(this).find(".cart_content").addClass("hover");
	}).mouseleave(function() {
        if(timer) {window.clearTimeout(timer);}
        timer = setTimeout(function(){cartmouseleave()},500);
    });

    $("#cart_list").mouseover(function() {if(timer){window.clearTimeout(timer);}}).mouseleave(function() {cartmouseleave();});

    function cartmouseleave(){
        shop_cart_flg = 0;
        $("#cart_list").html("").hide();
        $(this).find(".cart_content").removeClass("hover");
    }

    $(".menu-list li").mouseenter(function() {
        $(this).find(".title").addClass("hover");

        var div_num = $(this).find(".menu_item").length;
        if (div_num > 0) {
            var div_width = 109 * div_num;
            if (div_width > 654)
                div_width = 654;
            $(this).find(".menu_body").css("width", div_width + "px").show();
        }

    }).mouseleave(function() {
        $(this).find(".title").removeClass("hover");
        if ($(this).find(".menu_body"))
            $(this).find(".menu_body").css("width", "0px").hide();
    });
	
	$("#go-top").click(function() {
		$(document).scrollTop(0);
		return false;
	});
	
});

var GC_img_preload_gap = 500;
var GC_delay_todoload = 100;

var GF_img_index1 = true;
var GF_do_loading = false;
var GV_loadimg_handler = 0;
var GV_lazytype = 0;
var GV_img_indexs1 = new Array();
var GV_img_indexs2 = new Array();
var GV_img_loading = new Array();

function create_imgItem(index,top,bottom){
	var o = new Object();
	o.index = index;
	o.top = top;
	o.bottom = bottom;
	return o;
}

function get_visionBottom(){
	var t, h;
	t = document.documentElement.scrollTop || document.body.scrollTop;
	h = document.documentElement.clientHeight || document.body.clientHeight;
	return t + h;
}


function get_targetTop(p){
	var t = 0;
	while(p){
		if (p.offsetTop == undefined){
			return t;
		}
		t += p.offsetTop;
		p = p.offsetParent;
	}
	return t;
}

function do_loadimg(){
	if (GV_img_loading.length == 0){
	   GF_do_loading = false;
		return false;
	}
	
	var vision_top = 0;
	var vision_bottom = 0;
	
	if (GV_lazytype == 1){
		vision_top = document.documentElement.scrollTop || document.body.scrollTop;
		vision_bottom = get_visionBottom();
	}
	
	var img_count = GV_img_loading.length;
	var img_tmp = null;
	for (var i=0;i<img_count;i++){
		img_tmp = document.getElementById(GV_img_loading[i]);
		if (img_tmp == null)
		    continue;
		if (img_tmp.getAttribute("orginalsrc") != null)
			img_tmp.src = img_tmp.getAttribute("orginalsrc");
		else if (img_tmp.getAttribute("lazycall") != null)
			eval(img_tmp.getAttribute("lazycall"));
	}
	GV_img_loading.length = 0;
	GF_do_loading = false;
	return true;
}

function start_loadimg(){
	GF_do_loading = true;
	if (GV_lazytype == 0){
		GV_loadimg_handler = setTimeout("do_loadimg();",GC_delay_todoload);
	}else{
		do_loadimg();
	}
}

function clear_lazyloadimg(){
	if (GV_loadimg_handler > 0){
		clearTimeout(GV_loadimg_handler);
		GV_loadimg_handler = 0;
	}
}


function check_scroll(event){
	if (GF_do_loading){
		if (GV_lazytype == 0)
			clear_lazyloadimg();
		else
			return false;
	}

	var img_count = 0;
	var img_top = 0;
	var img_bottom = 0;
	var img_tmp = null;
	var loaded = false;
	
	var vision_top = document.documentElement.scrollTop || document.body.scrollTop;
	var vision_bottom = get_visionBottom();
	if (GF_img_index1){
		img_count = GV_img_indexs1.length;
		for (var i=0; i < img_count; i++){
			if (GV_lazytype == 0){
				img_top = GV_img_indexs1[i].top;
				img_bottom = GV_img_indexs1[i].bottom;
				loaded = img_top - vision_bottom <= GC_img_preload_gap && img_bottom > vision_top;
			}else{
				img_tmp = document.images[GV_img_indexs1[i].index];
				img_top = get_targetTop(img_tmp);
				loaded = img_top - vision_bottom <= GC_img_preload_gap;
			}
			if (loaded)
				GV_img_loading.push(GV_img_indexs1[i].index);
			else
				GV_img_indexs2.push(GV_img_indexs1[i]);
		}
		GV_img_indexs1.length = 0;
	}else{
		img_count = GV_img_indexs2.length;
		for (var i=0; i < img_count; i++){
			if (GV_lazytype == 0){
				img_top = GV_img_indexs2[i].top;
				img_bottom = GV_img_indexs2[i].bottom;
				loaded = img_top - vision_bottom <= GC_img_preload_gap && img_bottom > vision_top;
			}else{
				img_tmp = document.images[GV_img_indexs2[i].index];
				img_top = get_targetTop(img_tmp);
				loaded = img_top - vision_bottom <= GC_img_preload_gap;
			}
			if (loaded)
				GV_img_loading.push(GV_img_indexs2[i].index);
			else
				GV_img_indexs1.push(GV_img_indexs2[i]);
		}
		GV_img_indexs2.length = 0;
	}
	
	GF_img_index1 = !GF_img_index1;
	if (GV_img_loading.length > 0){
		start_loadimg();
	}
}

function wanson_init_lazy(){
	var img_count = document.images.length;
	if (img_count == 0)
		return false;
	
	var vision_top = document.documentElement.scrollTop || document.body.scrollTop;
	var vision_bottom = get_visionBottom();
	var img_top = 0;
	var img_bottom = 0;
	var img_tmp = null;
	for (var i=0;i<img_count;i++){
		img_tmp = document.images[i];
		if (img_tmp == undefined)
			continue;
		if (img_tmp.getAttribute("orginalsrc") == null && img_tmp.getAttribute("lazycall") == null)
			continue;

		img_top = get_targetTop(img_tmp);
		img_bottom = img_top + img_tmp.offsetHeight;
		
		img_tmp.id = (((1+Math.random())*0x10000)|0).toString(16).substring(1)+
                		(((1+Math.random())*0x10000)|0).toString(16).substring(1)+
                		(((1+Math.random())*0x10000)|0).toString(16).substring(1)+
                		(((1+Math.random())*0x10000)|0).toString(16).substring(1)+
                		(((1+Math.random())*0x10000)|0).toString(16).substring(1)+
                		(((1+Math.random())*0x10000)|0).toString(16).substring(1)+
                		(((1+Math.random())*0x10000)|0).toString(16).substring(1)+
                		(((1+Math.random())*0x10000)|0).toString(16).substring(1);
		if (img_top - vision_bottom <= GC_img_preload_gap && img_bottom > vision_top)
			GV_img_loading.push(img_tmp.id);
		else{
			GV_img_indexs1.push(create_imgItem(img_tmp.id,img_top,img_bottom));
		}
	}
	if (GV_img_loading.length == 0 && GV_img_indexs1.length == 0)
		return false;
	
	if (window.attachEvent){
		window.attachEvent("onscroll", check_scroll, false);
	}else{
		window.addEventListener("scroll", check_scroll, false);
	}
	window.onresize = check_scroll;
	
	if (GV_img_loading.length > 0){
		start_loadimg();
	}

	return true;
}


function init_lazy(){
	GV_lazytype = 0;
	setTimeout("wanson_init_lazy();",100);
}

function init_dynamic_lazy(){
	GV_lazytype = 1;
	setTimeout("wanson_init_lazy();",100);
}

//短信验证码验证
var sms={
	isChk:0,//是否进行了验证码验证 0:未验证 1：已验证
	sendSms:function(){//发送手机短信
		var phoneNum=Utils.trim($('#mobile').val());
		if(phoneNum != ''){
			if(!Utils.isMobile(phoneNum)){
				$('#send_span').html('<span><font color="red">手机号码格式不正确</font></span>');
				//comm_alert('手机号码格式不正确!');
				return false;
			}
		}
		xajax_member(phoneNum,10);		
	},
	sendResult:function(code){//手机短信发送结果
		if(code == -1){
			$('#send_span').html('<span><font color="red">手机号码参数错误</font></span>');
			return false;
		}else if(code == -2){
			$('#send_span').html('<span><font color="red">请填写正确的手机号码</font></span>');
		}else if(code == -3){
			$('#send_span').html('<span><font color="red">手机号已经被绑定</font></span>');
		}else if(code == -4){
			$('#send_span').html('<span><font color="red">生成短信验证码出错</font></span>');
		}else{
			$('#send_span').html('<span><font color="green">信息已发送</font></span>');
			$("#send_sms_btn").removeAttr('onclick');
		}
	},
	chkMsg:function(){//手机短信验证
		var checkCode=Utils.trim($('#code').val());
		if(!checkCode){
			comm_alert('请输入正确的验证码');
			return false;
		}
		xajax_member(checkCode,11);
	},
	chkResult:function(code){//手机短信验证结果
		if(code == -1){
			this.isChk = 0;
			$('#check_span').html('<span><font color="red">手机号验证参数有错误</font></span>');
		}else if(code == -2){
			this.isChk = 0;
			$('#check_span').html('<span><font color="red">短信验证码已失效！</font></span>');
		}else if(code == -3){
			this.isChk = 0;
			$('#check_span').html('<span><font color="red">短信验证码不正确!</font></span>');
		}else{
			this.isChk = 1;
			$('#check_span').html('<span><font color="green">短信验证成功!</font></span>');
			$("#chk_msg_btn").removeAttr('onclick');
		}
	}
}

//取消
//modified by yinfulin 2012-08-29 增加对url跳转的判断，如果没有last_url则不跳转
function cancel_join(){
	if (typeof(customer.last_url) == "undefined") {
	    $("#brg").hide();
		$("#registdiv").hide();
	}else{
		self.location = customer.last_url;
	}
}
function estr(kw) {
    if (!kw) {
        return ""
    }
    var c = "123456abcdefghijklmnopqrstuvwxyz";
    kw = u(kw).toLocaleLowerCase();
    var bstr = '';
    for (i = 0; i < kw.length; i++) {
        b8 = new String(kw.charCodeAt(i).toString(2));
        var x = b8.length;
        if (x < 8) {
            for (j = 0; j < 8 - x; j++) {
                b8 = '0' + b8
            }
        }
        bstr += b8
    }
    var l5 = 0;
    if (bstr.length % 5 == 0) {
        l5 = bstr.length / 5
    } else {
        l5 = parseInt(bstr.length / 5) + 1
    }
    var e = "";
    for (i = 0; i < l5; i++) {
        b5 = bstr.substring(i * 5, (i + 1) * 5);
        bit = '000' + b5;
        var y = bit.length;
        if (y < 8) {
            for (j = 0; j < 8 - y; j++) {
				for (j = 0; j < 8 - y; j++) {
					bit = bit + '0'
				}
			}
		}	
        var s = parseInt(parseInt(bit, 2).toString(10));
        e += c.substring(s, s + 1)
    }
    return e
}
function dstr(s) {
    if (!s) {
        return ""
    }
    var c = "123456abcdefghijklmnopqrstuvwxyz";
    var dstr = "";
    var bs = "";
    for (i = 0; i < s.length; i++) {
        var d = new String(c.indexOf(s[i]).toString(2));
        var x = d.length;
        if (x < 8) {
            for (j = 0; j < 8 - x; j++) {
                d = "0" + d
            }
        }
        bs += d
    }
    var b5s = "";
    for (i = 0; i < (bs.length / 8); i++) {
        var b8 = bs.substring(i * 8, (i + 1) * 8);
        var b5 = b8.substring(3, 8);
        b5s += b5
    }
    var l8 = parseInt(b5s.length / 8);
    for (i = 0; i < l8; i++) {
        var b8 = parseInt(b5s.substring(i * 8, (i + 1) * 8), 2).toString(10);
        dstr += String.fromCharCode(parseInt(b8))
    }
    return r(dstr)
}
function u(s) {
    return s.replace(/[^\u0000-\u00FF]/g, 
    function($0) {
        return escape($0).replace(/(%u)(\w{4})/gi, "\\u$2")
    })
}
function r(s) {
    s = s.replace(/(\\u)(\w{4})/gi, 
    function($0) {
        return (String.fromCharCode(parseInt((escape($0).replace(/(%5Cu)(\w{4})/g, "$2")), 16)))
    });
    return s
}


//生日日期变化
function birth_day_change(day){
	var str = "<select name='birthDay' id='birthDay'><option value=''>请选择</option>";
	for(var i=1;i<=day;i++){
		if(i<=9){
			var day_str='0'+i;
		}else{
			var day_str=i;
		}	
		str += "<option value='"+day_str+"'>"+day_str+"</option>";
	}
	str+='</select>';
	$("#birthday_span").html(str);	
}
function monthday_change(){
	$("#birthMonth").val("");
    $("#birthDay").val("");
}
function day_change(){
	$("#birthDay").val("");
	var nowMonth = $("#birthMonth").val();
   	if (nowMonth == 2) {
        var nowYear = $("#birthYear").val();
        if ((nowYear % 4) == 0) {
        	birth_day_change(29);
        } else {
        	birth_day_change(28);
        }
    } else if (nowMonth == 4 || nowMonth == 6 || nowMonth == 9 || nowMonth == 11) {
       birth_day_change(30);
    } else {
        birth_day_change(31);
    }
}
function aroundFrance_close(){
    $(".around_france_w").addClass('hide');
}

//日期格式化 addby LFL 2014.10.29
Date.prototype.format = function(format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
}