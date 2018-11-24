package com.cakesale.service;

import com.cakesale.pojo.User;
import com.cakesale.pojo.VercodeTO;

public interface UserService {
    /**
     * 通过用户ID查找用户信息
     * @param userId
     * @return
     */
    User getUserById(Integer userId);

    /**
     * 通过用户ID修改用户信息
     * @param user
     */
    void editUserById(User user);


   //吴
    void register(User user);
    User getUserByPhoneNum(User user);
    User getUserByAccount(User user);
    String doSendVercode(String mobile);
    VercodeTO getCodeByMobile(String mobile);

    /**
     * 根据用户ID修改用户密码
     * @param user
     */
    void editUserPasswordById(User user);
}
