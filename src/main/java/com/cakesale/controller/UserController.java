package com.cakesale.controller;


import com.cakesale.pojo.Order;
import com.cakesale.pojo.User;
import com.cakesale.pojo.VercodeTO;
import com.cakesale.service.OrderService;
import com.cakesale.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class UserController {
    @Autowired
   private UserService userService;
    @Autowired
    private OrderService orderService;

    /**
     * 注册
     * @param phoneNum
     * @param code
     * @param password
     * @return
     * @throws Exception
     */
    @RequestMapping("register.html")//注册 电话号码，验证码，密码

    public String  register(String phoneNum,String code,String password)throws Exception{
        try {
            User user=new User();
            user.setPhoneNum(phoneNum);
            user.setPassword(password);
            //User user1=userService.getUserByPhoneNum(user);
            VercodeTO vercode= userService.getCodeByMobile(user.getPhoneNum());
            User user1=userService.getUserByPhoneNum(user);//号码是否注册过
            if(user1==null){//没有注册
                if(vercode.getCode().equals(code)){
                    userService.register(user);
                    //return "";
                }else{
                    return "";//验证码错误
                }
            }else{
                return "";
            }


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

          return "/customer/login";
    }


    /**
     * 登陆
     * @param num
     * @return
     */
    @RequestMapping("login.html")//登陆
    public String  login(String phoneNum, String code, String num, String account, String password, HttpSession session){
          User user1=new User();
          user1.setPhoneNum(phoneNum);

        if(num.equals("0")){//电话号码登陆
            VercodeTO vercode=userService.getCodeByMobile(phoneNum);//电话号码
            System.out.println(vercode.getCode());
            User user=userService.getUserByPhoneNum(user1);
            List<Order> orders=orderService.getOrderByUserId(user1.getId());
            if(!vercode.getCode().equals(code)){
                session.setAttribute("message","验证码错误");
                return "forword:/customer/login";//验证码错误
            }else{
                session.setAttribute("user1",user);
                session.setAttribute("num",1);
                session.setAttribute("order",orders);
                Double integarl=0.0;
                for (Order order : orders) {
                    integarl+=order.getIntegral();
                }
                session.setAttribute("integarl",integarl);
                return "/customer/index";
            }
        }else{//账号密码登陆
            System.out.println(account);
            System.out.println(password);
            User user=new User();
            user.setAccount(account);
            user.setPassword(password);
            User user2=userService.getUserByAccount(user);

            if(user2!=null){
                List<Order> orders=orderService.getOrderByUserId(user2.getId());
                session.setAttribute("num",2);
                session.setAttribute("user2",user2);
                session.setAttribute("order",orders);
                Double integarl=0.0;
                for (Order order : orders) {
                     integarl+=order.getIntegral();
                }
                //积分
                session.setAttribute("integarl",integarl);
                return "/customer/index";
            }
            session.setAttribute("message","错误");
            return "/customer/register";//账号没有注册
        }



    }

    /**
     * 验证码
     * @param phoneNum
     * @return
     */
   @RequestMapping("getCode.html")
    @ResponseBody
   public String getCode(String phoneNum){

       String code=null;
       if(phoneNum==null){
           return null;//号码不能为空
       }else{
//           VercodeTO vercode=userService.getCodeByMobile(phoneNum);
            code=userService.doSendVercode(phoneNum);

       }

       return code;
   }


}
