package com.cakesale.pojo;

public class Attributes {
    private String goods_cut;
    private String goods_birthday;

    @Override
    public String toString() {
        return "Attributes{" +
                "goods_cut='" + goods_cut + '\'' +
                ", goods_birthday='" + goods_birthday + '\'' +
                '}';
    }

    public String getGoods_cut() {
        return goods_cut;
    }

    public void setGoods_cut(String goods_cut) {
        this.goods_cut = goods_cut;
    }

    public String getGoods_birthday() {
        return goods_birthday;
    }

    public void setGoods_birthday(String goods_birthday) {
        this.goods_birthday = goods_birthday;
    }
}
