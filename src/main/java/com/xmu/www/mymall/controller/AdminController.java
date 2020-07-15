package com.xmu.www.mymall.controller;

import com.xmu.www.mymall.domain.Admin;
import com.xmu.www.mymall.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-08 16:25
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("")
    public String find(){
        return "admin/adminLogin";

    }
    @RequestMapping("/login")
    public String doLogin(String adminName, String adminPassword, HttpServletRequest request){
        System.out.println("123");
        Admin admin = adminService.findByNameAndPassword(adminName, adminPassword);
        if(admin==null){
            System.out.println("321");
            request.setAttribute("msg", "用户名或密码有误！请重新输入");
            return "admin/adminLogin";
        }else{
            System.out.println("666");
            request.getSession().setAttribute("admin", admin);
            return "redirect:/showgoods.do";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.setAttribute("msg", "您已安全退出系统！");
        request.getSession().invalidate();
        return "admin/adminLogin";
    }
}
