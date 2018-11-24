package com.cakesale.service.impl;

import com.cakesale.dao.OrderDAO;
import com.cakesale.dao.OrderItemDAO;
import com.cakesale.dao.ProductSpecDAO;
import com.cakesale.enums.ResultEnum;
import com.cakesale.exceptions.OrderException;
import com.cakesale.pojo.Order;
import com.cakesale.pojo.OrderItem;
import com.cakesale.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private OrderItemDAO orderItemDAO;
    @Autowired
    private ProductSpecDAO productSpecDAO;

    @Override
    public void addOrder(Order order) throws OrderException {
        if(order==null||order.getOrderItems()==null){
            throw new OrderException(ResultEnum.PARAM_ERROR);
        }
        List<OrderItem> orderItems = order.getOrderItems();
        for (OrderItem orderItem : orderItems) {
            //1.检查库存
            if (productSpecDAO.selStock(orderItem.getProductSpecId())<orderItem.getProductNum()) {
                throw new OrderException(ResultEnum.PRODUCT_STOCK_ERROR);
            }
            //2.将订单详情入库
            orderItemDAO.addOrderItem(orderItem);
            //2.改变商品库存
            productSpecDAO.decreaseStock(orderItem);
        }
        //3.将订单存入数据库
        orderDAO.addOrder(order);
    }

    @Override
    public Order getOrderByOrderId(Integer orderId) {
        return orderDAO.getOrderByOrderId(orderId);
    }


    @Override
    public Order getOrderById(Integer OrderId) {
        return orderDAO.getOrderById(OrderId);
    }

    @Override
    public List<Order> getOrderByUserId(Integer userId) {
        return orderDAO.getOrderByUserId(userId);
    }

    @Override
    public Order getOrderitemByOrderId(Integer order_id) {
        return orderDAO.getOrderitemByOrderId(order_id);
    }

    @Override
    public Order getAddressByOrderId(Integer order_id) {
        return orderDAO.getAddressByOrderId(order_id);
    }

    @Override
    public Order getProductByOrderId(Integer order_id) {
        return orderDAO.getProductByOrderId(order_id);
    }

    @Override
    public List<Order> getProductByUserId(Integer userId) {
        return orderDAO.getProductByUserId(userId);
    }

}
