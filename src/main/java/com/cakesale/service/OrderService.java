package com.cakesale.service;

import com.cakesale.exceptions.OrderException;
import com.cakesale.pojo.Order;

import java.util.List;

public interface OrderService {
    void addOrder(Order order) throws OrderException;

    Order getOrderByOrderId(Integer orderId);


    /**
     * 通过用户ID查找订单详请
     * @param userId
     * @return
     */
    List<Order> getOrderByUserId(Integer userId);

    /**
     * 通过订单ID查找订单详请
     * @param OrderId
     * @return
     */
    Order getOrderById(Integer OrderId);


    /**
     * 通过订单ID查找订单详情中订单数量
     * @param order_id
     * @return
     */
    Order getOrderitemByOrderId(Integer order_id);

    /**
     * 通过订单ID查找用户地址信息
     * @param order_id
     * @return
     */
    Order getAddressByOrderId(Integer order_id);

    /**
     * 通过订单ID查找商品信息
     * @param order_id
     * @return
     */
    Order getProductByOrderId(Integer order_id);

    /**
     * 通过用户ID查找积分，商品名称
     * @param userId
     * @return
     */
    List<Order> getProductByUserId(Integer userId);
}
