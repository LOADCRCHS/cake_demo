package com.cakesale.dao;

import com.cakesale.pojo.Product;
import com.cakesale.pojo.ProductDetailImgs;
import com.cakesale.pojo.ProductSpec;

import java.util.List;

public interface ProductDetailDAO {
//    Product getAllProductDetailByProductId(Integer productId);
    Product getAllProductDetailByProductId(Integer productId);

    Integer getProduct_id(Integer ps_id);

    Double getPriceByGoodsId(Integer goodsId);
}
