package com.cakesale.pojo;

import java.util.List;

public class ProductValue {
    private Integer id;                //
    private Integer productId;        //商品ID
    private Double price;              //价格
    private String stocks;              //库存
//    private List<Specification> specificationList;  //规格
private Integer sp_id;                //规格id
    private String tablewareNum;      //餐具数
    private Double length;             //长度
    private Double width;              //宽度
    private Double height;             //高度
    private Double weight;             //重量
    private String number_of_eat;       //食用人数

    public String getNumber_of_eat() {
        return number_of_eat;
    }

    public void setNumber_of_eat(String number_of_eat) {
        this.number_of_eat = number_of_eat;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getStocks() {
        return stocks;
    }

    public void setStocks(String stocks) {
        this.stocks = stocks;
    }

    public Integer getSp_id() {
        return sp_id;
    }

    public void setSp_id(Integer sp_id) {
        this.sp_id = sp_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTablewareNum() {
        return tablewareNum;
    }

    public void setTablewareNum(String tablewareNum) {
        this.tablewareNum = tablewareNum;
    }

    public Double getLength() {
        return length;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    public Double getWidth() {
        return width;
    }

    public void setWidth(Double width) {
        this.width = width;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

}
