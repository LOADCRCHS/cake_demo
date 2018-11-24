package com.cakesale.util;


import com.cakesale.vo.ResponseTO;

public class ResponseTOUtil {

    public static ResponseTO getSuccessResult(Object data, String msg) {

        ResponseTO resp = new ResponseTO();
        resp.setError(0);
        resp.setData(data);
        resp.setMsg(msg);
        return resp;
    }

    public static ResponseTO getErrorResult(Object data,String msg) {
        ResponseTO resp = new ResponseTO();
        resp.setError(1);
        resp.setData(data);
        resp.setMsg(msg);
        return resp;
    }
}
