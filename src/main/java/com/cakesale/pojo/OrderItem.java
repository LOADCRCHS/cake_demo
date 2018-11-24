package com.cakesale.pojo;

public class OrderItem {   //订单详情实体类
    private Integer id;                 //订单详情ID
    private Integer orderId;            //订单id
    private Integer productSpecId;         //商品ID
    private Integer productNum;        //商品数量
    private String productName;
    private String productImg;
    private Specification specification;

    private Integer productId;         //商品ID
    private Product product;         //商品实体类

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getProductSpecId() {
        return productSpecId;
    }

    public void setProductSpecId(Integer productSpecId) {
        this.productSpecId = productSpecId;
    }

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
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

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }
}
