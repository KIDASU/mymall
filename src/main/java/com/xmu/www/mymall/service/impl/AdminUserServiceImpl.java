package com.xmu.www.mymall.service.impl;

import com.xmu.www.mymall.dao.UserMapper;
import com.xmu.www.mymall.domain.User;
import com.xmu.www.mymall.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public void doAdd(User user) {
        userMapper.insertSelective(user);
    }

    @Override
    public void doRemove(long userId) {
        userMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public void doModify(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> findAll() {
        return userMapper.selectByExample(null);
    }
}
