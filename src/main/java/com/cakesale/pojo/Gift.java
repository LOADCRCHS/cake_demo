package com.cakesale.pojo;

public class Gift {     //礼品实体类
    private Integer id;          //礼品ID
    private String name;         //礼品名称
    private String price;        //礼品价格
    private String spec;         //礼品规格

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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }
}
