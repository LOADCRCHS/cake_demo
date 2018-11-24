package com.cakesale.pojo;

import java.util.Date;

public class Address { //地址实体类

    private Integer id;                     //地址ID
    private Integer userId;                //用户ID
    private String receiveName;        //收货人姓名
    private Integer proId;                 //省份ID
    private Integer cityId;                //城市ID
    private String homeNum;            //门牌号
    private String detailAddr;        //详细地址
    private String phoneNum;          //手机号
    private String email;              //邮箱
    private Date bestReceiveTime;    // 最佳收货时间

    private City city;                    //城市
    private Province province;          //省份

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

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

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName;
    }

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getHomeNum() {
        return homeNum;
    }

    public void setHomeNum(String homeNum) {
        this.homeNum = homeNum;
    }

    public String getDetailAddr() {
        return detailAddr;
    }

    public void setDetailAddr(String detailAddr) {
        this.detailAddr = detailAddr;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBestReceiveTime() {
        return bestReceiveTime;
    }

    public void setBestReceiveTime(Date bestReceiveTime) {
        this.bestReceiveTime = bestReceiveTime;
    }
}
