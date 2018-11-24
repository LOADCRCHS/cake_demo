package com.cakesale.controller;

import com.cakesale.pojo.*;
import com.cakesale.service.AddressService;
import com.cakesale.service.OrderService;
import com.cakesale.service.ProductSpecService;
import com.cakesale.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 主要用于登陆注册，以及购物车，订单中的页面跳转
 */
@Controller
public class IndexController {

    @Autowired
    private AddressService addressService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;




    //用户登录个人中心首页
    @RequestMapping("/customer/index.html")
    public String customerindex(){
        //todo 判断是否登陆

        return "/customer/index";
    }

    @RequestMapping("/shop/member_user.html")
    public String memberUser() {
        return "/customer/index";
    }
//    //用户发票管理
//    @RequestMapping("/customer/invoice.html")
//    public String invoice(){
//        return "/customer/invoice";
//    }

    //用户地址管理
    @RequestMapping("/shop/member_consignee.html")
    public String member_consignee(Integer userId, HttpServletRequest request){
        List<Address> address=addressService.getAddressListByUserId(userId);
        request.setAttribute("address",address);
        return "/shop/member_consignee";
    }

    //跳转添加收货地址页面
    @RequestMapping("/shop/member_consignee_add.html")
    @ResponseBody
    public List<Province> member_consignee_add(HttpServletRequest request){
        List<Province> provinces=addressService.getProvince();
        return provinces;
    }

    @RequestMapping("/shop/member_consignee_add_city.html")
    @ResponseBody
    public  List<City> member_consignee_add_city(Integer pid){
        List<City> citys=addressService.getCity(pid);
        return citys;
    }

    //添加收货地址
    @RequestMapping("/shop/member_consignee_addAddress.html")
    public String member_consignee_addAddress(Address address){
        addressService.addAddress(address);
        return "forward:/shop/member_consignee.html";
    }

    //收货地址编辑
    @RequestMapping("/shop/member_consignee_edit.html")
    public String member_consignee_edit(Integer addressId,HttpServletRequest request){
        Address address=addressService.getAddressListByOrderId(addressId);
        request.setAttribute("address",address);
        return "/shop/member_consignee_add";
    }

    //根据收货地址ID删除收货地址
    @RequestMapping("/shop/member_consignee_del.html")
    public String member_consignee_del(Integer addressId,Integer userId){
        addressService.delAddressById(addressId);
        return "forward:/shop/member_consignee.html?userId="+userId;
    }


    //我的积分
    @RequestMapping("/shop/member_account")
    public String member_account(Integer userId,HttpServletRequest request){
        List<Order> orders=orderService.getProductByUserId(userId);
        request.setAttribute("order",orders);
        return "/shop/member_account";
    }

//    //我的LE家族
//    @RequestMapping("/shop/member_user_profile.html")
//    public String member_user_profile(){
//        return "/shop/member_user_profile";
//    }

    //跳转到修改密码页面
    @RequestMapping("/customer/edit-password.html")
    public String edit_password(){
        return "/customer/edit-password";
    }

    //修改密码提交
    @RequestMapping("/customer/edit-password-go.html")
    public String edit_password_go(Integer userId,String password){
        User user=new User();
        user.setId(userId);
        user.setPassword(password);
        userService.editUserPasswordById(user);
        return "/customer/login";
    }

    //订单管理
    @RequestMapping("/customer/order-list.html")
    public String order_list(Integer userId,HttpServletRequest request ){
        List<Order> orders=orderService.getOrderByUserId(userId);
        request.setAttribute("order",orders);
        return "/customer/order-list";
    }

//    //优惠券
//    @RequestMapping("/customer/coupon.html")
//    public String customer_coupon(){
//        return "/customer/coupon";
//    }
//
//    //蛋糕卡
//    @RequestMapping("/customer/cake-coupon.html")
//    public String cake_coupon(){
//        return "/customer/cake-coupon";
//    }
//
//    //储值卡
//    @RequestMapping("/customer/stored-card.html")
//    public String stored_card(){
//        return "/customer/stored-card";
//    }

    @RequestMapping("/customer/login.html")
    public String customer_login() {
        return "customer/login";
    }


//    @RequestMapping("login.html")
//    public String login(){
//        return "/customer/login";
//    }

    @RequestMapping("/customer/register.html")
    public String customer_register() {
        return "customer/register";
    }
//    @RequestMapping("register.html")
//    public String register(){
//        return "/customer/register";
//    }

    //帮助中心
    @RequestMapping("/shop/help-55.html")
    public String help_55(){
        return "/shop/help-55";
    }

    //个人资料
    @RequestMapping("/shop/member_editUser.html")
    public String member_editUser(Integer userId,HttpServletRequest request){
        User user=userService.getUserById(userId);
        request.setAttribute("user",user);
        return "/shop/member_editUser";
    }

    //个人资料更新
    @RequestMapping("/shop/member_go_editUser.html")
    public String member_go_editUser(User user){
        userService.editUserById(user);
        return "forward:/shop/member_editUser.html";
    }

    //购物车
    @RequestMapping("/shop/cartindex.html")
    public String cartindex(){
        return "/shop/cartindex";
    }


    //用户登陆后进入页面中，查看订单详情
    @RequestMapping("/shop/member_order_detail.html")
    public String member_order_detail(Integer order_id, HttpServletRequest request){
        Order order=orderService.getOrderById(order_id);
        Order order1=orderService.getOrderitemByOrderId(order_id);
        Order order2=orderService.getAddressByOrderId(order_id);
        Order order3=orderService.getProductByOrderId(order_id);
        Address address=addressService.getAddressListByOrderId(order_id);
        request.setAttribute("order",order);
        request.setAttribute("order1",order1);
        request.setAttribute("order2",order2);
        request.setAttribute("order3",order3);
        request.setAttribute("address",address);
        return "/shop/member_order_detail";
    }


    @RequestMapping("/shop/member_consignee_add_add.html")
    public String add_add(){
        return "/shop/member_consignee_add";
    }



}
