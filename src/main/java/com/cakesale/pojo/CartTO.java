package com.cakesale.pojo;

import java.util.List;

public class CartTO {
    private int amount;
    private Integer checked;
    private String use_bargain_id;
    private Attributes attributes;
    private String sku_id;
    private String spec;
    private String display_spec;
    private double market_price;
    private double sale_price;
    private int need_points;
    private int goodscut_flag;
    private String goodscut_num;
    private Standard_fitting standard_fitting;
    private String goods_name;
    private String english_name;
    private Integer goods_type;
    private String main_pic;
    private String loukou_pic;
    private int birthday_flag=1;
    private int has_passcard;
    private String passcard_card;
    private boolean alone;
    private double preferentialPrice;
    private List<CartSkuPromotion> cartSkuPromotionList;
    private String discountsPromotionPrice;
    private double totalPrice;
    private int preferentialNum;
    private int thirdPartyDelivery;
    private boolean preferential;
    private int seqno;
    private String specialDinnerware;

    public int getSeqno() {
        return seqno;
    }

    public void setSeqno(int seqno) {
        this.seqno = seqno;
    }

    public String getSpecialDinnerware() {
        return specialDinnerware;
    }

    public void setSpecialDinnerware(String specialDinnerware) {
        this.specialDinnerware = specialDinnerware;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Integer getChecked() {
        return checked;
    }

    public void setChecked(Integer checked) {
        this.checked = checked;
    }

    public String getUse_bargain_id() {
        return use_bargain_id;
    }

    public void setUse_bargain_id(String use_bargain_id) {
        this.use_bargain_id = use_bargain_id;
    }

    public Attributes getAttributes() {
        return attributes;
    }

    public void setAttributes(Attributes attributes) {
        this.attributes = attributes;
    }

    public String getSku_id() {
        return sku_id;
    }

    public void setSku_id(String sku_id) {
        this.sku_id = sku_id;
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

    public double getMarket_price() {
        return market_price;
    }

    public void setMarket_price(double market_price) {
        this.market_price = market_price;
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

    public int getGoodscut_flag() {
        return goodscut_flag;
    }

    public void setGoodscut_flag(int goodscut_flag) {
        this.goodscut_flag = goodscut_flag;
    }

    public String getGoodscut_num() {
        return goodscut_num;
    }

    public void setGoodscut_num(String goodscut_num) {
        this.goodscut_num = goodscut_num;
    }

    public Standard_fitting getStandard_fitting() {
        return standard_fitting;
    }

    public void setStandard_fitting(Standard_fitting standard_fitting) {
        this.standard_fitting = standard_fitting;
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

    public Integer getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(Integer goods_type) {
        this.goods_type = goods_type;
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

    public int getBirthday_flag() {
        return birthday_flag;
    }

    public void setBirthday_flag(int birthday_flag) {
        this.birthday_flag = birthday_flag;
    }

    public int getHas_passcard() {
        return has_passcard;
    }

    public void setHas_passcard(int has_passcard) {
        this.has_passcard = has_passcard;
    }

    public String getPasscard_card() {
        return passcard_card;
    }

    public void setPasscard_card(String passcard_card) {
        this.passcard_card = passcard_card;
    }

    public boolean isAlone() {
        return alone;
    }

    public void setAlone(boolean alone) {
        this.alone = alone;
    }

    public double getPreferentialPrice() {
        return preferentialPrice;
    }

    public void setPreferentialPrice(double preferentialPrice) {
        this.preferentialPrice = preferentialPrice;
    }

    public List<CartSkuPromotion> getCartSkuPromotionList() {
        return cartSkuPromotionList;
    }

    public void setCartSkuPromotionList(List<CartSkuPromotion> cartSkuPromotionList) {
        this.cartSkuPromotionList = cartSkuPromotionList;
    }

    public String getDiscountsPromotionPrice() {
        return discountsPromotionPrice;
    }

    public void setDiscountsPromotionPrice(String discountsPromotionPrice) {
        this.discountsPromotionPrice = discountsPromotionPrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getPreferentialNum() {
        return preferentialNum;
    }

    public void setPreferentialNum(int preferentialNum) {
        this.preferentialNum = preferentialNum;
    }

    public int getThirdPartyDelivery() {
        return thirdPartyDelivery;
    }

    public void setThirdPartyDelivery(int thirdPartyDelivery) {
        this.thirdPartyDelivery = thirdPartyDelivery;
    }

    public boolean isPreferential() {
        return preferential;
    }

    public void setPreferential(boolean preferential) {
        this.preferential = preferential;
    }
}
