package com.cakesale.dao;

import com.cakesale.pojo.User;

public interface UserDAO {
    User getUserById(Integer userId);

    void editUserById(User user);

    //吴
    void register(User user);
    User getUserByPhoneNum(User user);
    User getUserByAccount(User user);

    /**
     * 根据用户ID修改用户密码
     * @param user
     */
    void editUserPasswordById(User user);
}
