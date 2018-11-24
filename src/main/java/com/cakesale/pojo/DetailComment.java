package com.cakesale.pojo;

public class DetailComment {
    private Integer id;
    private String comment;
    private String comment_date;
    private String phone_num;
    private String number_of_eat;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getNumber_of_eat() {
        return number_of_eat;
    }

    public void setNumber_of_eat(String number_of_eat) {
        this.number_of_eat = number_of_eat;
    }
}
