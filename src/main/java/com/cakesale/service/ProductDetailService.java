package com.cakesale.service;

import com.cakesale.pojo.Product;
import com.cakesale.pojo.ProductDetailImgs;
import com.cakesale.pojo.ProductSpec;

import java.util.List;

public interface ProductDetailService {
    Product getAllProductDetailByProductId(Integer productId);

    Double getPriceByGoodsId(Integer goodsId);
}
