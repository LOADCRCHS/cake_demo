package com.cakesale.pojo;

import com.cakesale.pojo.OrderItem;

import java.util.Date;
import java.util.List;

public class Order {   //订单实体类
    private Integer id;                        //订单ID
    private Integer userId;                   //用户ID
    private Integer addrId;                   //收货地址ID
    private Double payAmount;                 //商品金额
    private String payChannel;                //支付方式
    private Integer expressId;                //快递id
    private Date createTime;                  //下单时间
    private Date deliveryTime;                //配送时间
    private String receiptInformation;        //发票信息
    private Integer status;                   //订单状态
    private Integer payStatus;                //订单支付状态
    private Integer receiveStatus;            //订单配送状态
    private String expressName;
    private List<OrderItem> orderItems;             //订单详情

    private Integer orderItemId;             //
    private Double integral;                  //积分    多少钱积多少分
    private User user;                      //用户实体类
    private OrderItem orderitem;            //订单详情实体类
    private Express express;                 //快递实体
    private Address address;                 //地址

    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Double getIntegral() {
        return integral;
    }

    public void setIntegral(Double integral) {
        this.integral = integral;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public OrderItem getOrderitem() {
        return orderitem;
    }

    public void setOrderitem(OrderItem orderitem) {
        this.orderitem = orderitem;
    }

    public Express getExpress() {
        return express;
    }

    public void setExpress(Express express) {
        this.express = express;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAddrId() {
        return addrId;
    }

    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
    }

    public Double getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(Double payAmount) {
        this.payAmount = payAmount;
    }

    public String getPayChannel() {
        return payChannel;
    }

    public void setPayChannel(String payChannel) {
        this.payChannel = payChannel;
    }

    public Integer getExpressId() {
        return expressId;
    }

    public void setExpressId(Integer expressId) {
        this.expressId = expressId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getReceiptInformation() {
        return receiptInformation;
    }

    public void setReceiptInformation(String receiptInformation) {
        this.receiptInformation = receiptInformation;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }

    public Integer getReceiveStatus() {
        return receiveStatus;
    }

    public void setReceiveStatus(Integer receiveStatus) {
        this.receiveStatus = receiveStatus;
    }

    public String getExpressName() {
        return expressName;
    }

    public void setExpressName(String expressName) {
        this.expressName = expressName;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}