package com.xmu.www.mymall.service;

import com.xmu.www.mymall.domain.Comment;
import com.xmu.www.mymall.domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public boolean save(User user);
    public boolean checkUserName(String username);
    public User findByNameAndPassword(String name,String password);
    public boolean update(User user);
    public User findByName(String name);
    public List<Map<String,Object>> selectCartItem(Long userId);
    public List<Map<String,Object>> selectComment(Long goodsId);
}
