package com.cakesale.service.impl;

import com.cakesale.dao.ProductDetailDAO;
import com.cakesale.pojo.Product;
import com.cakesale.pojo.ProductDetailImgs;
import com.cakesale.pojo.ProductSpec;
import com.cakesale.service.ProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductDetailServiceImpl implements ProductDetailService {
    @Autowired
    private ProductDetailDAO productDetailDAO;
    @Override
    public Product getAllProductDetailByProductId(Integer productId) {
        System.out.println("===================================");
        System.out.println("productId:"+productId);
        System.out.println("===================================");

        Integer ps_product_id = productDetailDAO.getProduct_id(productId);

        System.out.println("===================================");
        System.out.println("ps_product_id:"+ps_product_id);
        System.out.println("===================================");
        return productDetailDAO.getAllProductDetailByProductId(ps_product_id);
    }

    @Override
    public Double getPriceByGoodsId(Integer goodsId) {
        return productDetailDAO.getPriceByGoodsId(goodsId);
    }

}
