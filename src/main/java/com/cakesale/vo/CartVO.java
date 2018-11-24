package com.cakesale.vo;

import com.cakesale.pojo.BirthDayCard;
import com.cakesale.pojo.CartTO;

import java.util.List;

public class CartVO {
    private Integer count;
    private Integer type = 2;
    private String owner = "110";
    private List<CartTO> buy_list;
    private double totalPrice;
    private Integer selectedItemCount;
    private double discountsPrice;
    private List<BirthDayCard> birthDayCardList;


    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public List<BirthDayCard> getBirthDayCardList() {
        return birthDayCardList;
    }

    public void setBirthDayCardList(List<BirthDayCard> birthDayCardList) {
        this.birthDayCardList = birthDayCardList;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public double getDiscountsPrice() {
        return discountsPrice;
    }

    public void setDiscountsPrice(double discountsPrice) {
        this.discountsPrice = discountsPrice;
    }

    public List<CartTO> getBuy_list() {
        return buy_list;
    }

    public void setBuy_list(List<CartTO> buy_list) {
        this.buy_list = buy_list;
    }
}
