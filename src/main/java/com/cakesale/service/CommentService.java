package com.cakesale.service;

import com.cakesale.pojo.Comment;
import com.cakesale.pojo.CommentTO;
import com.cakesale.pojo.DetailComment;
import com.cakesale.pojo.IndexComment;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CommentService {
    PageInfo<IndexComment> getAllComments(Integer pageNum);

    List<DetailComment> getDetailCommentByProductId(Integer goodsId);

    List<CommentTO> getCommentByUserId(Integer userId);
}
