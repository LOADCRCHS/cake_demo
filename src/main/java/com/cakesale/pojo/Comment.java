package com.cakesale.pojo;

public class Comment {  //评论实体类
    private Integer id;                      //评论ID
    private Integer userId;                 //用户ID
    private Integer productId;              //商品ID
    private String comment;              //评论内容

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
