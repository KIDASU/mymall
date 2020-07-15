package com.xmu.www.mymall.service;

import com.xmu.www.mymall.domain.Comment;

import java.util.List;

public interface CommentService {
    void doAdd(Comment comment);
    void doRemove(long cid);
    List<Comment> findAll();

}
