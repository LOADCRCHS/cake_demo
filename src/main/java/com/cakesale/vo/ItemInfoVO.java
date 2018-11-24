package com.cakesale.vo;

import com.cakesale.pojo.Attributes;

public class ItemInfoVO {
    private String sku_id;
    private Integer amount;
    private Integer checked;
    private Integer use_bargain_id;
    private Attributes attributes;

    @Override
    public String toString() {
        return "ItemInfoVO{" +
                "sku_id='" + sku_id + '\'' +
                ", amount=" + amount +
                ", checked=" + checked +
                ", use_bargain_id=" + use_bargain_id +
                ", attributes=" + attributes +
                '}';
    }

    public String getSku_id() {
        return sku_id;
    }

    public void setSku_id(String sku_id) {
        this.sku_id = sku_id;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getChecked() {
        return checked;
    }

    public void setChecked(Integer checked) {
        this.checked = checked;
    }

    public Integer getUse_bargain_id() {
        return use_bargain_id;
    }

    public void setUse_bargain_id(Integer use_bargain_id) {
        this.use_bargain_id = use_bargain_id;
    }

    public Attributes getAttributes() {
        return attributes;
    }

    public void setAttributes(Attributes attributes) {
        this.attributes = attributes;
    }
}
