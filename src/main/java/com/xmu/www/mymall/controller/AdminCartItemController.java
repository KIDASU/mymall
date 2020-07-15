package com.xmu.www.mymall.controller;

import com.xmu.www.mymall.domain.CartItem;

import com.xmu.www.mymall.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

public class AdminCartItemController {
    @Autowired
    CartService cartItemService;


    @RequestMapping("showcartitems")
    public String showCartItem(Model model){
        List<CartItem> list = cartItemService.findAll();
        model.addAttribute("list", list);
        return "cartItem";
    }

    @RequestMapping("showcartitem")
    public CartItem showCartItem(int cid){
        return cartItemService.findByCid(cid);
    }

    @RequestMapping("addcartitem")
    public String addCartItem(CartItem cartItem){
        cartItemService.doAdd(cartItem);
        return "redirect:showcartitem";
    }


    @RequestMapping("removecartitem")
    public String removeCartItem(int cid){
        cartItemService.doRemove(cid);
        return "forward:showcartitem.do";
    }
}
