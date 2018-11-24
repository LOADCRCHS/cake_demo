package com.cakesale.service;

import com.cakesale.exceptions.OrderException;
import com.cakesale.pojo.ProductSpec;

public interface ProductSpecService {
    void checkStock(Integer productId, Integer num) throws OrderException;

    ProductSpec getProductSpecBySpecId(Integer specId);
}
