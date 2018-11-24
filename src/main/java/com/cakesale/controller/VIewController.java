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
import java.util.*;

@Controller
public class VIewController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    private SpecificationService specificationService;

    //首页
    @RequestMapping("index.html")
    public String index(HttpServletRequest request) {
        List<ProductSpec> products = productService.getAllproducts();
        List list = new ArrayList();
        for (int i = 0; i < 2; i++) {
            PageInfo<IndexComment> allComments = commentService.getAllComments(i + 1);
            HidePhoneNum hidePhoneNum = new HidePhoneNum();//调用自定义类--隐藏手机号
            list.add(hidePhoneNum.HidePhoneNum(allComments));
        }
        List<ProductSpec> productList = new ArrayList<>();
        List<ProductSpec> giftList = new ArrayList<>();
        //蛋糕和礼品
        for (ProductSpec product : products) {
            if (product.getType() == 1) {
                if (productList.size() == 8) {
                    continue;
                }
                productList.add(product);
                request.setAttribute("products", productList);
            } else {
                if (giftList.size() == 4) {
                    continue;
                }
                giftList.add(product);
                request.setAttribute("gifts", giftList);
            }
        }
        //评论
        request.setAttribute("list", list);
        return "index";
    }

    //蛋糕页
    @RequestMapping("category-0-1.html")
    public String categoru_0_1(HttpServletRequest request) {
        List<ProductSpec> products = productService.getAllproducts();
        List<ProductSpec> productList = new ArrayList<>();
        for (ProductSpec product : products) {
            if (product.getType() == 1) {
                productList.add(product);
            }
        }
        request.setAttribute("products", productList);
        return "category-0-1";
    }

    //礼品页
    @RequestMapping("category-1000-1.html")
    public String category_1000_1(HttpServletRequest request) {
        List<ProductSpec> products = productService.getAllproducts();
        List<ProductSpec> gifts = new ArrayList<>();
        for (ProductSpec product : products) {
            if (product.getType() == 2) {
                gifts.add(product);
            }
        }
        request.setAttribute("gifts", gifts);
        return "category-1000-1";
    }

    @RequestMapping("category-10-1.html")
    public String categoru_10_1() {
        return "category-10-1";
    }

    //商品详情页
    @RequestMapping("/shop/goods-{goodsId}.html")
    public String good_detail(@PathVariable Integer goodsId, HttpServletRequest request) {

        Product productDetail = productDetailService.getAllProductDetailByProductId(goodsId);
        Double price = productDetailService.getPriceByGoodsId(goodsId);
        request.setAttribute("price", price);
        List<DetailComment> detailComments = commentService.getDetailCommentByProductId(goodsId);
        List<ProductSpec> products = productService.getAllproducts();
        int size = products.size();

        Set<ProductSpec> productSpecSet = new HashSet<>();
        Random random = new Random();
        while (productSpecSet.size() < 4) {
            productSpecSet.add(products.get(random.nextInt(size)));
        }

        //隐藏评论手机号
        HidePhoneNum hidePhoneNum = new HidePhoneNum();
        List details = hidePhoneNum.HidePhoneDetailNum(detailComments);
        request.setAttribute("sp_id", goodsId);
        request.setAttribute("productList", productSpecSet);
        request.setAttribute("productDetail", productDetail);
        request.setAttribute("detailComments", details);
        return "goods/goods-detail";
    }

    //help-770页面
    @RequestMapping("/shop/help-770.html")
    public String help_770() {
        return "/shop/help-770";
    }

    //help-770页面
    @RequestMapping("/shop/help-771.html")
    public String help_771() {
        return "/shop/help-771";
    }

    //help-770页面
    @RequestMapping("/shop/help-788.html")
    public String help_788() {
        return "/shop/help-788";
    }

    //help-770页面
    @RequestMapping("/shop/help-766.html")
    public String help_766() {
        return "/shop/help-766";
    }

    //help-770页面
    @RequestMapping("/shop/help-791.html")
    public String help_791() {
        return "/shop/help-791";
    }

}

