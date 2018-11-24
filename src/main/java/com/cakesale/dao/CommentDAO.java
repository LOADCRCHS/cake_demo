package com.cakesale.dao;

import com.cakesale.pojo.Comment;
import com.cakesale.pojo.CommentTO;
import com.cakesale.pojo.DetailComment;
import com.cakesale.pojo.IndexComment;

import java.util.List;

public interface CommentDAO {
    List<IndexComment> getAllComments();
    List<DetailComment> getDetailCommentByProductId(Integer goodsId);

    List<CommentTO> getCommentByUserId(Integer userId);
}
