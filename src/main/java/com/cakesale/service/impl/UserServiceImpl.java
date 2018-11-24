package com.cakesale.service.impl;

import com.cakesale.dao.UserDAO;
import com.cakesale.dao.VerCodeDAO;
import com.cakesale.pojo.User;
import com.cakesale.pojo.VercodeTO;
import com.cakesale.service.UserService;
import com.cakesale.util.SmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
     @Autowired
     private UserDAO userDAO;
    @Autowired
    private VerCodeDAO verCodeDAO;

    @Override
    public User getUserById(Integer userId) {
        return userDAO.getUserById(userId);
    }

    @Override
    public void editUserById(User user) {
        userDAO.editUserById(user);
    }



    //吴

    @Override
    public void register(User user) {
        userDAO.register(user);
    }
    @Override
    public User getUserByPhoneNum(User user){
        return userDAO.getUserByPhoneNum(user);
    }

    @Override
    public User getUserByAccount(User user) {
        return userDAO.getUserByAccount(user);
    }

    @Override
    public String doSendVercode(String mobile) {
        //清空数据库之前的验证码

        verCodeDAO.deleteCodeByMobile(mobile);
        String randomCode= SmsUtil.getRandomCode(4);//得到随机的四位数
        VercodeTO vercode=new VercodeTO();
        vercode.setMobile(mobile);
        vercode.setCode(randomCode);
        verCodeDAO.addCode(vercode);
        boolean success= SmsUtil.send(mobile,randomCode);
        if(!success){
            return null;
        }
        return randomCode;
    }

    @Override
    public VercodeTO getCodeByMobile(String mobile) {
        return verCodeDAO.getCodeByMobile(mobile);
    }

    @Override
    public void editUserPasswordById(User user) {
        userDAO.editUserPasswordById(user);
    }


}
