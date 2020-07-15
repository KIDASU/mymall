package com.xmu.www.mymall.service.impl;

import com.xmu.www.mymall.dao.CommentMapper;
import com.xmu.www.mymall.domain.Comment;
import com.xmu.www.mymall.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
    @Override
    public void doAdd(Comment comment) {
        commentMapper.insertSelective(comment);
    }

    @Override
    public void doRemove(long cid) {
        commentMapper.deleteByPrimaryKey(cid);
    }

    @Override
    public List<Comment> findAll() {
        return commentMapper.selectByExample(null);
    }


}
