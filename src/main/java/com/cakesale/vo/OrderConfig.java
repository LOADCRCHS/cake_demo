package com.cakesale.vo;

public class OrderConfig {
    private String bill_no;
    private CashPay cash_pay;

    public String getBill_no() {
        return bill_no;
    }

    public void setBill_no(String bill_no) {
        this.bill_no = bill_no;
    }

    public CashPay getCash_pay() {
        return cash_pay;
    }

    public void setCash_pay(CashPay cash_pay) {
        this.cash_pay = cash_pay;
    }
}
