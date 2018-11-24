package com.cakesale.pojo;
//自建第三方类
public class IndexComment {
    private Integer id;
    private String account;
    private String product_name;
    private String product_img_url;
    private String product_com_img_url;
    private String comment;
    private String comment_date;
    private Integer product_id;
    private String phone_num;

    public String getProduct_com_img_url() {
        return product_com_img_url;
    }

    public void setProduct_com_img_url(String product_com_img_url) {
        this.product_com_img_url = product_com_img_url;
    }

    public static void main(String[] args) {
//        Integer i=new Integer(0);
//        Integer j = new Integer(0);
//        Integer j = new Integer(0);
        String i = "0";
        String j = new String("0");
        System.out.println(i==j);
        System.out.println(j.equals(i));
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_img_url() {
        return product_img_url;
    }

    public void setProduct_img_url(String product_img_url) {
        this.product_img_url = product_img_url;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }
}
