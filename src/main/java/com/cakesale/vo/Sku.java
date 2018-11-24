package com.cakesale.vo;

import com.cakesale.pojo.Attributes;
import com.cakesale.pojo.Standard_fitting;

public class Sku {
    private String sku_id;
    private int amount;
    private int seqno;
    private int checked;
    private Attributes attributes;
    private String goods_name;
    private String english_name;
    private String spec;
    private String display_spec;
    private int market_price;
    private int goods_type;
    private double sale_price;
    private int need_points;
    private int birthday_flag;
    private int goodscut_flag;
    private Standard_fitting standard_fitting;
    private String main_pic;
    private String loukou_pic;
    private int buy_price;
    private String specialDinnerware;

    public String getSku_id() {
        return sku_id;
    }

    public void setSku_id(String sku_id) {
        this.sku_id = sku_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSeqno() {
        return seqno;
    }

    public void setSeqno(int seqno) {
        this.seqno = seqno;
    }

    public int getChecked() {
        return checked;
    }

    public void setChecked(int checked) {
        this.checked = checked;
    }

    public Attributes getAttributes() {
        return attributes;
    }

    public void setAttributes(Attributes attributes) {
        this.attributes = attributes;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getEnglish_name() {
        return english_name;
    }

    public void setEnglish_name(String english_name) {
        this.english_name = english_name;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public String getDisplay_spec() {
        return display_spec;
    }

    public void setDisplay_spec(String display_spec) {
        this.display_spec = display_spec;
    }

    public int getMarket_price() {
        return market_price;
    }

    public void setMarket_price(int market_price) {
        this.market_price = market_price;
    }

    public int getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(int goods_type) {
        this.goods_type = goods_type;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public int getNeed_points() {
        return need_points;
    }

    public void setNeed_points(int need_points) {
        this.need_points = need_points;
    }

    public int getBirthday_flag() {
        return birthday_flag;
    }

    public void setBirthday_flag(int birthday_flag) {
        this.birthday_flag = birthday_flag;
    }

    public int getGoodscut_flag() {
        return goodscut_flag;
    }

    public void setGoodscut_flag(int goodscut_flag) {
        this.goodscut_flag = goodscut_flag;
    }

    public Standard_fitting getStandard_fitting() {
        return standard_fitting;
    }

    public void setStandard_fitting(Standard_fitting standard_fitting) {
        this.standard_fitting = standard_fitting;
    }

    public String getMain_pic() {
        return main_pic;
    }

    public void setMain_pic(String main_pic) {
        this.main_pic = main_pic;
    }

    public String getLoukou_pic() {
        return loukou_pic;
    }

    public void setLoukou_pic(String loukou_pic) {
        this.loukou_pic = loukou_pic;
    }

    public int getBuy_price() {
        return buy_price;
    }

    public void setBuy_price(int buy_price) {
        this.buy_price = buy_price;
    }

    public String getSpecialDinnerware() {
        return specialDinnerware;
    }

    public void setSpecialDinnerware(String specialDinnerware) {
        this.specialDinnerware = specialDinnerware;
    }
}
