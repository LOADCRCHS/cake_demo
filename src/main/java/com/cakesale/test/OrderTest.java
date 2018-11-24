package com.cakesale.test;

import com.cakesale.dao.OrderDAO;
import com.cakesale.pojo.Order;
import com.cakesale.pojo.ProductSpec;
import com.cakesale.service.OrderService;
import com.cakesale.service.ProductSpecService;
import com.cakesale.util.OrderConstants;
import com.cakesale.vo.ProvinceVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

public class OrderTest {


    @Test
    public void testJsonObject() throws IOException {
        String site = OrderConstants.site;
        ObjectMapper objectMapper = new ObjectMapper();
        CollectionType listType = objectMapper.getTypeFactory().constructCollectionType(ArrayList.class, ProvinceVO.class);
        List<ProvinceVO> provinceVOs = objectMapper.readValue("site", listType);
        System.out.println(provinceVOs.size());

    }

    @Test
    public void testSelOrder() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-config.xml");
        OrderDAO orderDAO = (OrderDAO) applicationContext.getBean("orderDAO");
//        Order order = orderDAO.getOrderByOrderId(1);
        List<Order> order = orderDAO.getOrderByUserId(1);
        System.out.println(order);

    }

    @Test
    public void httpTest() throws UnsupportedEncodingException {
        System.out.println(URLDecoder.decode("params%5B0%5D%5Bamount%5D=1&params%5B0%5D%5Bchecked%5D=1", "utf-8"));
    }

    @Test
    public void testAnnotation() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-config.xml");
        OrderService orderService = (OrderService) applicationContext.getBean("orderServiceImpl");
        System.out.println("==================");
        ProductSpecService productSpecService = (ProductSpecService) applicationContext.getBean("productSpecService");
        ProductSpec productSpecBySpecId = productSpecService.getProductSpecBySpecId(1);
        System.out.println(productSpecBySpecId);
        System.out.println("===========");
    }
}
