package com.cakesale.service.impl;

import com.cakesale.dao.SpecificationDAO;
import com.cakesale.pojo.Product;
import com.cakesale.pojo.Specification;
import com.cakesale.service.SpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpecificationServiceImpl implements SpecificationService {
    @Autowired
    private SpecificationDAO specificationDAO;
    @Override
    public Product getSpecificationBySpec_Id(int specificationID, int productId) {
        return specificationDAO.getSpecificationBySpec_Id(specificationID,productId);
    }
}
