package com.cakesale.service;

import com.cakesale.pojo.Comment;
import com.cakesale.pojo.Product;
import com.cakesale.pojo.ProductSpec;
import com.cakesale.pojo.User;

import java.util.List;

public interface ProductService {

    List<ProductSpec> getAllproducts();

    List<User> getAllComments();
    //商品
    Product getProductByProductId(Integer productId);
}
