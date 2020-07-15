package com.xmu.www.mymall.controller;


import com.xmu.www.mymall.domain.Comment;
import com.xmu.www.mymall.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

public class AdminCommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("showcomment")
    public String showComment(Model model){
        List<Comment> list = commentService.findAll();
        model.addAttribute("list", list);
        return "comment";
    }

    @RequestMapping("addcomment")
    public String addComment(Comment comment){
        commentService.doAdd(comment);
        return "redirect:showcomment";
    }

    @RequestMapping("removecomment")
    public String removeGoods(int cid){
        commentService.doRemove(cid);
        return "forward:showcomment.do";
    }
}
