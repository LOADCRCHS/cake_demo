package com.cakesale.dao;

import com.cakesale.pojo.*;

import java.util.List;

public interface ProductDAO {


    List<ProductSpec> getAllproducts();


    List<User> getAllComments();
    //商品
    Product getProductByProductId(Integer productId);
}
