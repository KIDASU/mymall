package com.xmu.www.mymall.service.impl;

import com.xmu.www.mymall.dao.RelationMapper;
import com.xmu.www.mymall.dao.UserMapper;
import com.xmu.www.mymall.domain.User;
import com.xmu.www.mymall.domain.UserExample;
import com.xmu.www.mymall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-09 16:27
 **/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RelationMapper relationMapper;

    @Override
    public List<Map<String, Object>> selectComment(Long goodsId) {
        return relationMapper.selectComment(goodsId);
    }

    @Override
    public List<Map<String, Object>> selectCartItem(Long userId) {
        List<Map<String, Object>> cartItems = relationMapper.selectCartItem(userId);

        return cartItems;
    }

    @Override
    public User findByName(String name) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(name);
        List<User> users = userMapper.selectByExample(userExample);
        if(users.size()!=1){
            return null;
        }else{
            return users.get(0);
        }
    }

    @Override
    public boolean update(User user) {
        int i = userMapper.updateByPrimaryKeySelective(user);
        return i==1;
    }

    @Override
    public User findByNameAndPassword(String name, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(name).andUserPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(userExample);

        if(users.size()!=1){
            return null;
        }else{
            return users.get(0);
        }

    }

    @Override
    public boolean checkUserName(String username) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(username);
        List<User> users = userMapper.selectByExample(userExample);
        System.out.println(users);
        if(users.size()!=1){
            System.out.println("空");

            return true;
        }else {
            System.out.println("有");
            return false;
        }

    }

    @Override
    public boolean save(User user) {
        int i = userMapper.insertSelective(user);
        return i==1;
    }
}
