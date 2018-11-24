package com.cakesale.vo;

public class User {
    private int privilege;
    private Balance balance;

    public int getPrivilege() {
        return privilege;
    }

    public void setPrivilege(int privilege) {
        this.privilege = privilege;
    }

    public Balance getBalance() {
        return balance;
    }

    public void setBalance(Balance balance) {
        this.balance = balance;
    }
}
