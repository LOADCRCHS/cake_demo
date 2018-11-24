package com.cakesale.pojo;

import java.util.List;

public class Product { //商品实体类
    private Integer id;                  //商品ID
    private String name;                 //名称
    private String taste;                //口味
    private Integer sweet;               //甜度(1,2,3,4) 默认2
    private String imgUrl;              //商品显示图片地址
    private String remark;               //备注

    //后加
    private double default_price;
    private double price;
    private String tage;
    private Integer type;
    private Integer ps_id;
    private List<ProductDetailImgs> imgsList;
    private List<ProductValue> productValueList;

    public double getDefault_price() {
        return default_price;
    }

    public void setDefault_price(double default_price) {
        this.default_price = default_price;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTage() {
        return tage;
    }

    public void setTage(String tage) {
        this.tage = tage;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getPs_id() {
        return ps_id;
    }

    public void setPs_id(Integer ps_id) {
        this.ps_id = ps_id;
    }

    public List<ProductDetailImgs> getImgsList() {
        return imgsList;
    }

    public void setImgsList(List<ProductDetailImgs> imgsList) {
        this.imgsList = imgsList;
    }

    public List<ProductValue> getProductValueList() {
        return productValueList;
    }

    public void setProductValueList(List<ProductValue> productValueList) {
        this.productValueList = productValueList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTaste() {
        return taste;
    }

    public void setTaste(String taste) {
        this.taste = taste;
    }

    public Integer getSweet() {
        return sweet;
    }

    public void setSweet(Integer sweet) {
        this.sweet = sweet;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
