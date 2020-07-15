package com.xmu.www.mymall.controller;

import com.xmu.www.mymall.domain.Goods;
import com.xmu.www.mymall.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-08 20:21
 **/

@Controller
@RequestMapping("**.do")
public class AdminGoodsController {

    private GoodsService goodsService;
    public GoodsService getGoodsService() {
        return goodsService;
    }
    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @RequestMapping("showgoods")
    public String showGoods(Model model){
        List<Goods> list = goodsService.findAll();
        model.addAttribute("list", list);
        return "goods";
    }

    @RequestMapping("addgoods")
    public String addGoods(Goods goods){
        goodsService.doAdd(goods);
        return "redirect:showgoods.do";
    }

    @RequestMapping("modifygoods")
    public String modifyGoods(Goods goods){
        goodsService.doModify(goods);
        return "forward:showgoods.do";
    }

    @RequestMapping("removegoods")
    public String removeGoods(int goodsId){
        goodsService.doRemove(goodsId);
        return "forward:showgoods.do";
    }
}
