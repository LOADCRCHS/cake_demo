package com.cakesale.pojo;



import java.util.Date;

public class VercodeTO {
    private Integer id;
     private User user;
    private String mobile;
    private String code;
    private Date createdDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public void setUser(User user) {
        this.user = user;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
