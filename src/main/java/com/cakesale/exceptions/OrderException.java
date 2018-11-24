package com.cakesale.exceptions;

import com.cakesale.enums.ResultEnum;

public class OrderException extends Exception{

    private Integer code;

    public OrderException(ResultEnum resultEnum) {
        super(resultEnum.getMessage());

        this.code = resultEnum.getCode();
    }

    public OrderException(Integer code,String message) {
        super(message);
        this.code = code;
    }
}
