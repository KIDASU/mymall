package com.xmu.www.mymall.controller;

import com.xmu.www.mymall.domain.User;
import com.xmu.www.mymall.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("**.do")
public class AdminUserController {

    private AdminUserService adminUserService;
    public AdminUserService getAdminUserService() {
        return adminUserService;
    }
    @Autowired
    public void setAdminUserService(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }

    @RequestMapping("showuser")
    public String showUser(Model model){
        List<User> list = adminUserService.findAll();
        model.addAttribute("list", list);
        return "user";
    }

    @RequestMapping("adduser")
    public String addUser(User user){
        adminUserService.doAdd(user);
        return "redirect:showuser.do";
    }

    @RequestMapping("modifyuser")
    public String modifyUser(User user){
        adminUserService.doModify(user);
        return "forward:showuser.do";
    }

    @RequestMapping("removeuser")
    public String removeUser(long userId){
        adminUserService.doRemove(userId);
        return "forward:showuser.do";
    }
}
