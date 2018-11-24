package com.cakesale.vo;

import com.cakesale.pojo.CartTO;

import java.util.List;

public class OrderInfoVO {
    private String buy_id;
    private String agent_id;
    private long uid;
    private String channel;
    private int site_id;
    private int bill_type;
    private int bill_source;
    private int payment_id;
    private int extend_flag;
    private Invoice invoice;
    private int promo_use_type;
    private Stock_config stock_config;
    private Time_config time_config;
    private double total_sale_price;
    private double total_buy_price;
    private int total_need_points;
    private int total_cards_paid;
    private int total_balance_paid;
    private double total_cash_pay;
    private int give_cashback;
    private double give_points;
    private int deliver_fee;
    private int freight_coupon_paid;
    private int deliver_coupon_flag;
    private long promo_flag; //是否支持各种优惠
    private int deliver_type;
    private User user;
    private int max_pay_cashback;
    private double max_invoice_amount;
    private List<CartTO> sku_list;
    private int bit_map_or;
    private List<String> buyLimit;
    private User_Address user_address;
    private String send_date;
    private String send_end_time;
    private String send_start_time;

    public String getSend_date() {
        return send_date;
    }

    public void setSend_date(String send_date) {
        this.send_date = send_date;
    }

    public String getSend_end_time() {
        return send_end_time;
    }

    public void setSend_end_time(String send_end_time) {
        this.send_end_time = send_end_time;
    }

    public String getSend_start_time() {
        return send_start_time;
    }

    public void setSend_start_time(String send_start_time) {
        this.send_start_time = send_start_time;
    }

    public String getBuy_id() {
        return buy_id;
    }

    public void setBuy_id(String buy_id) {
        this.buy_id = buy_id;
    }

    public String getAgent_id() {
        return agent_id;
    }

    public void setAgent_id(String agent_id) {
        this.agent_id = agent_id;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public int getSite_id() {
        return site_id;
    }

    public void setSite_id(int site_id) {
        this.site_id = site_id;
    }

    public int getBill_type() {
        return bill_type;
    }

    public void setBill_type(int bill_type) {
        this.bill_type = bill_type;
    }

    public int getBill_source() {
        return bill_source;
    }

    public void setBill_source(int bill_source) {
        this.bill_source = bill_source;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public int getExtend_flag() {
        return extend_flag;
    }

    public void setExtend_flag(int extend_flag) {
        this.extend_flag = extend_flag;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public int getPromo_use_type() {
        return promo_use_type;
    }

    public void setPromo_use_type(int promo_use_type) {
        this.promo_use_type = promo_use_type;
    }

    public Stock_config getStock_config() {
        return stock_config;
    }

    public void setStock_config(Stock_config stock_config) {
        this.stock_config = stock_config;
    }

    public Time_config getTime_config() {
        return time_config;
    }

    public void setTime_config(Time_config time_config) {
        this.time_config = time_config;
    }

    public double getTotal_sale_price() {
        return total_sale_price;
    }

    public void setTotal_sale_price(double total_sale_price) {
        this.total_sale_price = total_sale_price;
    }

    public double getTotal_buy_price() {
        return total_buy_price;
    }

    public void setTotal_buy_price(double total_buy_price) {
        this.total_buy_price = total_buy_price;
    }

    public int getTotal_need_points() {
        return total_need_points;
    }

    public void setTotal_need_points(int total_need_points) {
        this.total_need_points = total_need_points;
    }

    public int getTotal_cards_paid() {
        return total_cards_paid;
    }

    public void setTotal_cards_paid(int total_cards_paid) {
        this.total_cards_paid = total_cards_paid;
    }

    public int getTotal_balance_paid() {
        return total_balance_paid;
    }

    public void setTotal_balance_paid(int total_balance_paid) {
        this.total_balance_paid = total_balance_paid;
    }

    public double getTotal_cash_pay() {
        return total_cash_pay;
    }

    public void setTotal_cash_pay(double total_cash_pay) {
        this.total_cash_pay = total_cash_pay;
    }

    public int getGive_cashback() {
        return give_cashback;
    }

    public void setGive_cashback(int give_cashback) {
        this.give_cashback = give_cashback;
    }

    public double getGive_points() {
        return give_points;
    }

    public void setGive_points(double give_points) {
        this.give_points = give_points;
    }

    public int getDeliver_fee() {
        return deliver_fee;
    }

    public void setDeliver_fee(int deliver_fee) {
        this.deliver_fee = deliver_fee;
    }

    public int getFreight_coupon_paid() {
        return freight_coupon_paid;
    }

    public void setFreight_coupon_paid(int freight_coupon_paid) {
        this.freight_coupon_paid = freight_coupon_paid;
    }

    public int getDeliver_coupon_flag() {
        return deliver_coupon_flag;
    }

    public void setDeliver_coupon_flag(int deliver_coupon_flag) {
        this.deliver_coupon_flag = deliver_coupon_flag;
    }

    public long getPromo_flag() {
        return promo_flag;
    }

    public void setPromo_flag(long promo_flag) {
        this.promo_flag = promo_flag;
    }

    public int getDeliver_type() {
        return deliver_type;
    }

    public void setDeliver_type(int deliver_type) {
        this.deliver_type = deliver_type;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getMax_pay_cashback() {
        return max_pay_cashback;
    }

    public void setMax_pay_cashback(int max_pay_cashback) {
        this.max_pay_cashback = max_pay_cashback;
    }

    public double getMax_invoice_amount() {
        return max_invoice_amount;
    }

    public void setMax_invoice_amount(double max_invoice_amount) {
        this.max_invoice_amount = max_invoice_amount;
    }

    public List<CartTO> getSku_list() {
        return sku_list;
    }

    public void setSku_list(List<CartTO> sku_list) {
        this.sku_list = sku_list;
    }

    public int getBit_map_or() {
        return bit_map_or;
    }

    public void setBit_map_or(int bit_map_or) {
        this.bit_map_or = bit_map_or;
    }

    public List<String> getBuyLimit() {
        return buyLimit;
    }

    public void setBuyLimit(List<String> buyLimit) {
        this.buyLimit = buyLimit;
    }

    public User_Address getUser_address() {
        return user_address;
    }

    public void setUser_address(User_Address user_address) {
        this.user_address = user_address;
    }
}
