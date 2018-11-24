package com.cakesale.pojo;

public class Express {  //快递实体类
    private Integer id;      //快递ID
    private String name;     //名称
    private Double price;    //运费

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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
