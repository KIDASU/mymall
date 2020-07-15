package com.xmu.www.mymall.controller;

import com.xmu.www.mymall.domain.Order;
import com.xmu.www.mymall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller

@RequestMapping("**.do")
public class AdminOrderController {

	private OrderService orderService;

	public OrderService getOrderService() {
		return orderService;
	}
	@Autowired
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@RequestMapping("showorder")
	public String showOrder(Model model){
		List<Map<String,Object>> list = orderService.findOrder();
		model.addAttribute("list", list);
		return "order";
	}
	
	@RequestMapping("adminshowdetail")
	@ResponseBody
	public List<Map<String,Object>> showDetail(Long oid){
		return orderService.findOrderItem(oid);
	}
	
	@RequestMapping("removeorder")
	public String removeOrder(Long oid){
		orderService.doRemove(oid);
		return "forward:showorder.do";
	}
	@RequestMapping("addorder")
	public String addOrder(Order order){
		orderService.doAdd(order);
		return "redirect:showorder.do";
	}
	
    @RequestMapping("modifyorder")
    public String modifyOrder(Order order){
        orderService.doModify(order);
        return "forward:showorder.do";
    }
	
}
