package com.cakesale.pojo;

import java.util.List;

public class ProductDetailImgs {
    private Integer id;
    private Integer product_id;
    private String name;
    private String detail_img_url;
    private String sweet;
    private String remark;
    private Integer sort;

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
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

    public String getDetail_img_url() {
        return detail_img_url;
    }

    public void setDetail_img_url(String detail_img_url) {
        this.detail_img_url = detail_img_url;
    }

    public String getSweet() {
        return sweet;
    }

    public void setSweet(String sweet) {
        this.sweet = sweet;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
