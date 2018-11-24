package com.cakesale.dao;

import com.cakesale.pojo.OrderItem;
import com.cakesale.pojo.ProductSpec;

public interface ProductSpecDAO {
    int decreaseStock(OrderItem orderItem);

    int increaseStock(OrderItem orderItem);

    int selStock(int productSpecId);

    ProductSpec getProductSpecBySpecId(Integer specId);
}
