
package com.cakesale.vo;

import java.util.List;
import java.util.Map;

//结算页配置
public class CheckoutConfig {

    private String buy_id;
    private int bill_source;
    private int send_interval;
    private String channel;
    private boolean thirdFreight;
    private boolean coldFreight;
    private int thirdType;
    private String cake_music;
    private int deliver_type;
    private int site_id;
    private String haveValidOrder;
    private String thirdText;
    private List<String> customText;
    private String activity;
    private Map<String, String> supportList; //393,蛋糕
    private List<PayList> payList;
    private String payment_id;
    private boolean getLastInvoice;

    public String getBuy_id() {
        return buy_id;
    }

    public void setBuy_id(String buy_id) {
        this.buy_id = buy_id;
    }

    public int getBill_source() {
        return bill_source;
    }

    public void setBill_source(int bill_source) {
        this.bill_source = bill_source;
    }

    public int getSend_interval() {
        return send_interval;
    }

    public void setSend_interval(int send_interval) {
        this.send_interval = send_interval;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public boolean isThirdFreight() {
        return thirdFreight;
    }

    public void setThirdFreight(boolean thirdFreight) {
        this.thirdFreight = thirdFreight;
    }

    public boolean isColdFreight() {
        return coldFreight;
    }

    public void setColdFreight(boolean coldFreight) {
        this.coldFreight = coldFreight;
    }

    public int getThirdType() {
        return thirdType;
    }

    public void setThirdType(int thirdType) {
        this.thirdType = thirdType;
    }

    public String getCake_music() {
        return cake_music;
    }

    public void setCake_music(String cake_music) {
        this.cake_music = cake_music;
    }

    public int getDeliver_type() {
        return deliver_type;
    }

    public void setDeliver_type(int deliver_type) {
        this.deliver_type = deliver_type;
    }

    public int getSite_id() {
        return site_id;
    }

    public void setSite_id(int site_id) {
        this.site_id = site_id;
    }

    public String getHaveValidOrder() {
        return haveValidOrder;
    }

    public void setHaveValidOrder(String haveValidOrder) {
        this.haveValidOrder = haveValidOrder;
    }

    public String getThirdText() {
        return thirdText;
    }

    public void setThirdText(String thirdText) {
        this.thirdText = thirdText;
    }

    public List<String> getCustomText() {
        return customText;
    }

    public void setCustomText(List<String> customText) {
        this.customText = customText;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public Map<String, String> getSupportList() {
        return supportList;
    }

    public void setSupportList(Map<String, String> supportList) {
        this.supportList = supportList;
    }

    public List<PayList> getPayList() {
        return payList;
    }

    public void setPayList(List<PayList> payList) {
        this.payList = payList;
    }

    public String getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(String payment_id) {
        this.payment_id = payment_id;
    }

    public boolean isGetLastInvoice() {
        return getLastInvoice;
    }

    public void setGetLastInvoice(boolean getLastInvoice) {
        this.getLastInvoice = getLastInvoice;
    }
}