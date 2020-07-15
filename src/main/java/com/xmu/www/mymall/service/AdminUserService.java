package com.xmu.www.mymall.service;

import com.xmu.www.mymall.domain.User;

import java.util.List;

public interface AdminUserService {
    void doAdd(User user);
    void doRemove(long userId);
    void doModify(User user);
    List<User> findAll();
}
