package com.cakesale.service.impl;

import com.cakesale.dao.CommentDAO;
import com.cakesale.pojo.Comment;
import com.cakesale.pojo.CommentTO;
import com.cakesale.pojo.DetailComment;
import com.cakesale.pojo.IndexComment;
import com.cakesale.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDAO commentDAO;
    @Override
    public PageInfo<IndexComment> getAllComments(Integer pageNum) {
        PageHelper.startPage(pageNum,3);
        return new PageInfo<>(commentDAO.getAllComments());
    }

    @Override
    public List<DetailComment> getDetailCommentByProductId(Integer goodsId) {
        return commentDAO.getDetailCommentByProductId(goodsId);
    }

    @Override
    public List<CommentTO> getCommentByUserId(Integer userId) {
        return commentDAO.getCommentByUserId(userId);
    }
}
