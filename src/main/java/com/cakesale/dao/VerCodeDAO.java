package com.cakesale.dao;


import com.cakesale.pojo.VercodeTO;

public interface VerCodeDAO {
    void addCode(VercodeTO vercode);
    VercodeTO getCodeByMobile(String mobile);
    void deleteCodeByMobile(String mobile);


}
