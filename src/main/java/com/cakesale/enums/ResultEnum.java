package com.cakesale.enums;

public enum ResultEnum {
	PARAM_ERROR(1,"参数不正确"),
	PRODUCT_NOT_EXIST(10,"商品不存在"),
	PRODUCT_STOCK_ERROR(11,"库存不正确"),
	ORDER_NOT_EXIST(12,"订单不存在"),
	ORDERDETAILS_NOT_EXIST(13,"订单详情不存在"),
	ORDER_STATUS_ERROR(14,"订单状态错误"),
	ORDER_UPDATE_FAIL(15,"订单更新失败"),
	ORDER_DETIAL_EMPTY(16,"订单详情为空"),
	PAY_STATUS_ERROR(17,"订单支付状态错误"),
	CART_EMPTY(18,"购物车不能为空"),
	ORDER_OWNER_ERROR(19,"该订单不属于当前用户"),
	WX_MP_ERROR(20,"微信公众账号方面错误"),
	USER_EXIST(21,"用户名已存在"),
	USER_NOT_EXIST(22,"用户名不存在"),
	;
	
	private Integer code;
	private String message;
	
	ResultEnum(Integer code, String message) {
		this.code = code;
		this.message = message;
	}

	public String getMessage() {
		return message;
	}
	public Integer getCode() {
		return code;
	}

}
