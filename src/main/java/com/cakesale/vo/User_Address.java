package com.cakesale.vo;

import jdk.internal.util.xml.impl.Attrs;

import java.util.HashMap;
import java.util.Map;

public class User_Address {


    private String deliver_id;
    private String province;
    private String city;
    private String county;
    private String town;
    private String address;
    private String room_no;
    private String receiver_name;
    private String mobile;
    private String phone;
    private String route_code;
    private String fee_code;
    private int level;
    private int deliver_fee;
    private String postal_code;
    private Map<String, String> attrs; // is_default,false

    public Map<String, String> getAttrs() {
        return attrs;
    }

    public void setAttrs(String attrs) {
        Map<String, String> map = new HashMap<>();
        map.put("is_default", attrs);
        this.attrs = map;
    }

    public void setDeliver_id(String deliver_id) {
        this.deliver_id = deliver_id;
    }

    public String getDeliver_id() {
        return deliver_id;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvince() {
        return province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getCounty() {
        return county;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getTown() {
        return town;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setRoom_no(String room_no) {
        this.room_no = room_no;
    }

    public String getRoom_no() {
        return room_no;
    }

    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
    }

    public String getReceiver_name() {
        return receiver_name;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setRoute_code(String route_code) {
        this.route_code = route_code;
    }

    public String getRoute_code() {
        return route_code;
    }

    public void setFee_code(String fee_code) {
        this.fee_code = fee_code;
    }

    public String getFee_code() {
        return fee_code;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getLevel() {
        return level;
    }

    public void setDeliver_fee(int deliver_fee) {
        this.deliver_fee = deliver_fee;
    }

    public int getDeliver_fee() {
        return deliver_fee;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getPostal_code() {
        return postal_code;
    }

}
