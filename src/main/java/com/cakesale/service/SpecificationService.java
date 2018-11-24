package com.cakesale.service;

import com.cakesale.pojo.Product;
import com.cakesale.pojo.Specification;

public interface SpecificationService {
    Product getSpecificationBySpec_Id(int specificationID, int productId);
}
