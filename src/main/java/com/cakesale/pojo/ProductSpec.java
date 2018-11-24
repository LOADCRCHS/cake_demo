package com.cakesale.pojo;

import java.util.List;
import java.util.Objects;

public class ProductSpec {  //商品-食用人数
    private Integer id;                //商品-规格id
    private Integer productId;        //商品ID
    private Integer specId;           //食用规格ID
    private Double price;              //价格
    private Integer stock;
    private String productName;
    private String productImg;
    private String tablewareNum;

    //后加
    private Integer p_id;                  //商品ID
    private String name;                 //名称
    private String taste;                //口味
    private Integer sweet;               //甜度(1,2,3,4) 默认2
    private String imgUrl;              //商品显示图片地址
    private String remark;               //备注

    private double default_price;        //商品默认价格
    private String tage;
    private Integer type;
    private Integer ps_id;
    private List<ProductDetailImgs> imgsList;
    private List<Specification> specificationList;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductSpec that = (ProductSpec) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(p_id, that.p_id) &&
                Objects.equals(ps_id, that.ps_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, p_id, ps_id);
    }

    public Integer getP_id() {
        return p_id;
    }

    public void setP_id(Integer p_id) {
        this.p_id = p_id;
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

    public double getDefault_price() {
        return default_price;
    }

    public void setDefault_price(double default_price) {
        this.default_price = default_price;
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

    public List<Specification> getSpecificationList() {
        return specificationList;
    }

    public void setSpecificationList(List<Specification> specificationList) {
        this.specificationList = specificationList;
    }

    public String getTablewareNum() {
        return tablewareNum;
    }

    public void setTablewareNum(String tablewareNum) {
        this.tablewareNum = tablewareNum;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getSpecId() {
        return specId;
    }

    public void setSpecId(Integer specId) {
        this.specId = specId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
