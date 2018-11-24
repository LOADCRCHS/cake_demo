package com.cakesale.pojo;

public class CartSkuPromotion {
    private String id;
    private String brief;
    private String tips;
    private Integer mode;
    private String type;
    private String amount;
    private Boolean selected;
    private Boolean canChangeSelected;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    public Integer getMode() {
        return mode;
    }

    public void setMode(Integer mode) {
        this.mode = mode;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public Boolean getSelected() {
        return selected;
    }

    public void setSelected(Boolean selected) {
        this.selected = selected;
    }

    public Boolean getCanChangeSelected() {
        return canChangeSelected;
    }

    public void setCanChangeSelected(Boolean canChangeSelected) {
        this.canChangeSelected = canChangeSelected;
    }
}
