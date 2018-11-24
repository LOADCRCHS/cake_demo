package com.cakesale.vo;


public class ResponseTO {
    private Integer error;
    private Object data;
    private String msg;

    public Integer getError() {
        return error;
    }

    public void setError(Integer error) {
        this.error = error;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
