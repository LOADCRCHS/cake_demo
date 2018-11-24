package com.cakesale.util;

import com.cakesale.dao.ProductDetailDAO;
import com.cakesale.dao.SpecificationDAO;
import com.cakesale.pojo.Specification;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMapper {
    public static void main(String[] args) {
    /*   *//* ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-config.xml");
        ProductDetailDAO productDetailDAO = (ProductDetailDAO)applicationContext.getBean("productDetailDAO");
        for (Specification specification : productDetailDAO.getAllProductDetailByProductId(1).getSpecificationList()) {
            System.out.println(specification.getNumber_of_eat());
        }*//*
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-config.xml");
        SpecificationDAO specificationDAO = (SpecificationDAO)applicationContext.getBean("specificationDAO");
        System.out.println(specificationDAO.getSpecificationBySpec_Id(1, 1).getSpecificationList());
        for (Specification specification : specificationDAO.getSpecificationBySpec_Id(1, 1).getSpecificationList()) {
            System.out.println(specification.getTablewareNum());
        }*/
    }
}
