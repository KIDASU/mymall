package com.xmu.www.mymall.service;

import com.xmu.www.mymall.domain.Admin;

public interface AdminService {

    Admin findByNameAndPassword(String aname, String password);
}
