package com.cakesale.dao;

import com.cakesale.pojo.Product;
import com.cakesale.pojo.Specification;
import org.apache.ibatis.annotations.Param;

public interface SpecificationDAO {
    Product getSpecificationBySpec_Id(@Param("specificationID") int specificationID, @Param("productId") int productId);
}
