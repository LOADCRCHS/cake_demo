package com.cakesale.service.impl;

import com.cakesale.dao.ProductSpecDAO;
import com.cakesale.enums.ResultEnum;
import com.cakesale.exceptions.OrderException;
import com.cakesale.pojo.ProductSpec;
import com.cakesale.service.ProductSpecService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductSpecServiceImpl implements ProductSpecService {

    @Autowired
    private ProductSpecDAO productSpecDAO;

    @Override
    public void checkStock(Integer productId, Integer num) throws OrderException {
        if (productSpecDAO.selStock(productId)<num) {
            throw new OrderException(ResultEnum.PRODUCT_STOCK_ERROR);
        }
    }

    @Override
    public ProductSpec getProductSpecBySpecId(Integer specId) {
        return productSpecDAO.getProductSpecBySpecId(specId);
    }
}
