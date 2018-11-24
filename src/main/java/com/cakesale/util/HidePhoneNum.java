package com.cakesale.util;

import com.cakesale.pojo.DetailComment;
import com.cakesale.pojo.IndexComment;
import com.github.pagehelper.PageInfo;

import java.util.List;

public class HidePhoneNum {
    public PageInfo HidePhoneNum(PageInfo<IndexComment> allComments) {
        for (int j = 0; j < allComments.getSize(); j++) {
            String phone_num = allComments.getList().get(j).getPhone_num();
            if (phone_num != null) {
                String replace = phone_num.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");
                allComments.getList().get(j).setPhone_num(replace);
            }
        }
        return allComments;
    }

    public List HidePhoneDetailNum(List<DetailComment> comments){
        for (DetailComment comment : comments) {
            String phone_num = comment.getPhone_num();
            if (phone_num != null) {
                String replace = phone_num.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");
                comment.setPhone_num(replace);
            }
        }
        return comments;

    }
}
