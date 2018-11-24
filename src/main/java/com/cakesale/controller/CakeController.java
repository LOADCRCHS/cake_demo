package com.cakesale.controller;

import com.cakesale.pojo.DetailComment;
import com.cakesale.pojo.IndexComment;
import com.cakesale.pojo.Product;
import com.cakesale.pojo.ProductSpec;
import com.cakesale.service.CommentService;
import com.cakesale.service.ProductDetailService;
import com.cakesale.service.ProductService;
import com.cakesale.service.SpecificationService;
import com.cakesale.util.HidePhoneNum;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 主要用于首页列表页，详情页，以及头部，底部的页面跳转
 */
@Controller
public class CakeController {

    @RequestMapping("/shop/companyPurchase.html")
    public String companyPurchase(){
        return "shop/companyPurchase";
    }

    @RequestMapping("/shop/ncompany/nlogin.html")
    public String nlogin() {
        return "shop/nlogin";
    }

    @RequestMapping("/company/welfare.html")
    public String welfare() {
        return "company/welfare";
    }

    @RequestMapping("/shop/bank_list.html")
    public String bank_list() {
        return "shop/bank_list";
    }

    @RequestMapping("/about/notice.html")
    public String notice() {
        return "about/notice";
    }

    @RequestMapping("/shop/help-637.html")
    public String help_637() {
        return "shop/help-637";
    }

    @RequestMapping("/shop/help-1.html")
    public String help_1() {
        return "shop/help-1";
    }

    @RequestMapping("/shop/help-80.html")
    public String help_80() {
        return "shop/help-80";
    }

    @RequestMapping("/shop/help-106.html")
    public String help_106() {
        return "shop/help-106";
    }

    @RequestMapping("/shop/help-668.html")
    public String help_668() {
        return "shop/help-668";
    }
}
