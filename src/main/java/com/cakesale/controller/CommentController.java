package com.cakesale.controller;

import com.cakesale.pojo.CommentTO;
import com.cakesale.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 商品评论
 */
@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @RequestMapping("/shop/getComment.html")
    public String getComment(Integer userId, HttpServletRequest request){

        List<CommentTO> list=commentService.getCommentByUserId(userId);
        if(list==null){
            return "/customer/member_comments";
        }
        for (CommentTO commentTO : list) {
            System.out.println(commentTO.getProduct().getName());

        }
        request.setAttribute("list",list);

        return "/customer/member_comments";

    }
}
