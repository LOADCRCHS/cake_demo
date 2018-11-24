package com.cakesale.service.impl;

import com.cakesale.dao.ProductDAO;
import com.cakesale.pojo.Comment;
import com.cakesale.pojo.Product;
import com.cakesale.pojo.ProductSpec;
import com.cakesale.pojo.User;
import com.cakesale.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDAO productDAO;
    @Override
    public List<ProductSpec> getAllproducts() {
        return productDAO.getAllproducts();
    }

    @Override
    public List<User> getAllComments() {
        return productDAO.getAllComments();
    }

    @Override
    public Product getProductByProductId(Integer productId) {
        return productDAO.getProductByProductId(productId);
    }
}
