package com.xmu.www.mymall.service.impl;

import com.xmu.www.mymall.dao.AdminMapper;
import com.xmu.www.mymall.domain.Admin;
import com.xmu.www.mymall.domain.AdminExample;
import com.xmu.www.mymall.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-08 16:12
 **/
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin findByNameAndPassword(String adminName, String adminPassword) {
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andAdminNameEqualTo(adminName).andAdminPasswordEqualTo(adminPassword);
        List<Admin> admins = adminMapper.selectByExample(adminExample);
        if(admins.size()!=1){
            return null;
        }else{
            return admins.get(0);
        }
    }
}
