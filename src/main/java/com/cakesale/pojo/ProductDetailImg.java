package com.cakesale.pojo;

public class ProductDetailImg {  //详情图片
    private Integer id;                  //
    private Integer productId;         //商品ID
    private String detailImgUrl;      //商品详情图片地址

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

    public String getDetailImgUrl() {
        return detailImgUrl;
    }

    public void setDetailImgUrl(String detailImgUrl) {
        this.detailImgUrl = detailImgUrl;
    }
}
