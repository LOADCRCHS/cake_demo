<!--
DHUtil = {};
DHUtil.user = {};
DHUtil.user.onclick = function() {
	location.reload();
};

DHUtil.user.showNotice = function(opt) {
	opt = opt || {};
	iUtil.loader.doShow();
	$.ajax({
		"url": iUtil.siteUrl('/user/ajaxNotice'),
		"data": opt.data,
		"dataType": "json",
		"success": function(json) {
			iUtil.loader.doHide();
			var self = $('<div>');
			self.append(json.data.content);
			$('.x-close', self).bind('click', function() {
				location.reload();
			});
			
			if (typeof opt.init == 'function') {
				opt.init.call(self);
			}
			self.appendTo(document.body);
		}
	});
};

DHUtil.sign = function(theform) {
	$(':submit', theform).attr('disabled', true);
	iUtil.loader.doShow();
	$.ajax({
		"type": "POST",
		"url": $(theform).attr('action'),
		"data": $(theform).serialize(),
		"dataType": "json",
		"cache": false,
		"success": function(json) {
			$(':submit', theform).attr('disabled', false);
			iUtil.loader.doHide();
			if (json.stat < 1) {
				alert(json.msg);
				if (json.data.field) {
					$(':input[name="'+ json.data.field +'"]', theform).focus();
				}
				return;
			}
			
			try {
				customer.last_url = null;
				customer.login_succeed(json.data.custID);
			} catch(e) {}
			
			if (json.data.showNotice) {
				var _box = $('<div>');
				_box.append(json.data.content);
				$('.x-close', _box).bind('click', function() {
					location.reload();
				});
				_box.appendTo(document.body);
				return;
			}
			
			location.reload();
		}
	});
	
	return false;
};


DHUtil.exchange = {};
DHUtil.exchange.showNotice = function(opt) {
	opt = opt || {};
	iUtil.loader.doShow();
	$.ajax({
		"url": iUtil.siteUrl('/user/ajaxNoticeExchange'),
		"data": opt.data,
		"dataType": "json",
		"success": function(json) {
			iUtil.loader.doHide();
			var self = $('<div>');
			self.append(json.data.content);
			$('.x-close', self).bind('click', function() {
				self.remove();
			});
			
			$('.x-buttons a', self).eq(1).bind('click', function() {
				self.remove();
			});
			
			if (typeof opt.init == 'function') {
				opt.init.call(self);
			}
			self.appendTo(document.body);
		}
	});
};

DHUtil.exchange.addToCart = function(ev, postID) {
	var self = this;
	var _submit = function() {
		iUtil.loader.doShow();
		$.ajax({
			"url": iUtil.siteUrl('/duihuan/index/addToCart'),
			"type": "POST",
			"data": {"postID": postID},
			"dataType": "json",
			"success": function(json) {
				$(ev).removeAttr('disabled');
				iUtil.loader.doHide();
				if (json.stat < 1) {
					switch(json.stat) {
						case -3:
							xPopup.create({
								"message": json.msg,
								"yes": {
									"name": "买蛋糕,加积分",
									"callback": function() {location.href = json.data.url;}
								}
							});
						break;
						
						default:
							xPopup.create({
								"message": json.msg
							});
					}
					return;
				}
				
				try {
					general_cart.success(json.data[0], json.data[1], true);
				} catch(e) {
					alert(e.name+':'+e.description);
				}
				
			}
			
		});
	};
	
	var _callback = function(data) {
		if (data.showNotice) {
			self.showNotice({
				"data": {"module": "goods", "id": postID},
				"init": function() {
					$('.x-buttons a', this).eq(1).bind('click', function() {
						_submit();
					});
				}
			});
			return;
		}
		_submit();
	};
	iUtil.singed(_callback);
};

DHUtil.exchange.mobile_addToCart = function(ev, postID) {
	var self = this;
	var _submit = function() {
		$.ajax({
			"url": '/i/duihuan/index/addToCart',
			"type": "POST",
			"data": {"postID": postID},
			"dataType": "json",
			"success": function(json) {
					switch(json.stat) {
						case 1:
							$('#leclub-dialog').addClass('show');
						break;
						case -3:
							Utils.displayNotice('亲，您的积分不足，<a href="/shop/wechat/category.php">赶紧加积分吧 </a>。');
						break;
						default:
							Utils.displayNotice(json.msg);
					}
					return;
			}
			
		});
	};
	_submit();
};

DHUtil.exchange.doSubmit = function(ev, couponId, func, _confirm) {
	_confirm = _confirm || false;
	var self = this;
	var coupon_data = _confirm ? {couponId:couponId} : {couponId:couponId, operation:1};
	var _submit = function(data) {
		iUtil.loader.doShow();
		$.ajax({
			"type": "POST",
			"url": iUtil.siteUrl('/duihuan/index/exchangeSubmit'),
			"data": coupon_data,
			"dataType": "json",
			"success": function(json) {
				$(ev).removeAttr('disabled');
				iUtil.loader.doHide();
				switch(json.stat) {
					case -3:
						xPopup.create({
							"message": json.msg,
							"yes": {
								"name": "买蛋糕,加积分",
								"callback": function() {location.href = json.data.url;}
							}
						});
					break;

					case 2:
						xPopup.create({
							"message": "确定兑换优惠券？",
							"yes": {
								"name": "确定",
								"callback": function() { DHUtil.exchange.doSubmit(ev, couponId, func, true) }
							}
						});
					break;

					case 1:
						xPopup.create({
							"message": "兑换成功！",
							"yes": {
								"name": "去购物",
								"callback": function() { location.href = "/shop/category.php" }
							},
							"no": {
								"name": "查看优惠券",
								"callback": function() { location.href = "/shop/member_coupons.php" }
							}
						});
					break;
					
					default:
						xPopup.create({
							"message": json.msg,
							"no": {
								"name": "关闭",
								"callback": function() {}
							}
						});
				}
				
				if (json.stat > 0 && typeof func == 'function') {
					func.call();
				}
			}
		});
	};
	
	var _callback = function(data) {
		if (data.showNotice) {
			self.showNotice({
				"data": {"module": "coupon", "id": couponId},
				"init": function() {
					$('.x-buttons a', this).eq(1).bind('click', function() {
						_submit();
					});
				}
			});
			return;
		}
		_submit();
	};
	
	iUtil.singed(_callback);
}

DHUtil.exchange.mobile_doSubmit = function(ev, couponId, func) {
	var self = this;
	var _submit = function(data) {
		$.ajax({
			"type": "POST",
			"url": '/i/duihuan/index/exchangeSubmit',
			"data": {"couponId": couponId},
			"dataType": "json",
			"success": function(json) {
					switch(json.stat) {
						case 1:
							$('#leclub-dialog').addClass('show');
						break;
						case -3:
							Utils.displayNotice('亲，您的积分不足，<a href="/shop/wechat/category.php">赶紧加积分吧 </a>。');
						break;
						default:
							Utils.displayNotice(json.msg);
					}
			}
		});
	};
	
	_submit();
}

DHUtil.goods = {};
DHUtil.goods.query = {};
DHUtil.goods.clickCategory = function(cid) {
	this.query = {"cid": cid};
	DHUtil.goods.pager.clickPage(1);
};

DHUtil.goods.pager = {};
DHUtil.goods.pager.clickPage = function(page, query) {
	query = query || DHUtil.goods.query;
	iUtil.loader.doShow();
	$.ajax({
		"url": iUtil.siteUrl('/duihuan/index/ajaxGoods'),
		"data": $.extend(query, {"page": page}),
		"dataType": "json",
		"success": function(result) {
			iUtil.loader.doHide();
			$('#goodsbox').html(result.data.content);
			$('#goodspage').html(result.data.pager);
			$('.goodsbox li').hover(function(){
				$('.rank', this).show();
			}, function() {
				$('.rank', this).hide();
			});
		}
	});
};

DHUtil.goods.submitForm = function(theform) {
	this.query = $(theform).serializeArray();
	iUtil.loader.doShow();
	$(theform).ajaxSubmit({
		"url": iUtil.siteUrl('/duihuan/index/ajaxGoods'),
		"dataType": "json",
		"success": function(result) {
			iUtil.loader.doHide();
			$('#goodsbox').html(result.data.content);
			$('#goodspage').html(result.data.pager);
			$('.goodsbox li').hover(function(){
				$('.rank', this).show();
			}, function() {
				$('.rank', this).hide();
			});
		}
	});
	return false;
};

DHUtil.coupon = {};
DHUtil.coupon.pager = {};
DHUtil.coupon.pager.clickPage = function(page, query) {
	query = query || {};
	iUtil.loader.doShow();
	$.ajax({
		"url": iUtil.siteUrl('/duihuan/index/ajaxCoupon'),
		"data": $.extend(query, {"page": page}),
		"dataType": "json",
		"success": function(result) {
			iUtil.loader.doHide();
			$('#bonusbox').html(result.data.content);
			$('#bonuspage').html(result.data.pager);
			$('.bonusbox li').hover(function(){
				$('.rank', this).show();
			}, function() {
				$('.rank', this).hide();
			});
		}
	});
};
//-->