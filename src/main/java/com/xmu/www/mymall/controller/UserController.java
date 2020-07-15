package com.xmu.www.mymall.controller;

import com.xmu.www.mymall.domain.*;
import com.xmu.www.mymall.service.CartService;
import com.xmu.www.mymall.service.GoodsService;
import com.xmu.www.mymall.service.OrderService;
import com.xmu.www.mymall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-09 13:47
 **/
@Controller
@RequestMapping(value = "**.do",produces = "application/json;charset=UTF-8")

public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;
    @RequestMapping("/toregister")
    public String toRegist(){
        return "user/register";
    }

    @RequestMapping("register")
    public String register(User user, HttpServletRequest request){
        boolean isok = userService.checkUserName(user.getUserName());
        System.out.println("检查完毕"+isok);
        if(isok){
            userService.save(user);
            System.out.println("插入完毕");
            request.setAttribute("msg","注册成功,请重新登陆");
            return "../../login";
        }else {
            request.setAttribute("msg","注册失败,用户名已存在");
            return "user/register";
        }
    }

    @RequestMapping("userlogin")
    public String login(User user,HttpServletRequest request){
        User newUser = userService.findByNameAndPassword(user.getUserName(), user.getUserPassword());
        if(newUser==null){
            request.setAttribute("msg", "用户名或密码有误！请重新输入");
            return "../../login";
        }else{
            request.getSession().setAttribute("user", newUser);
            return "redirect:/showinfo.do";
        }
    }
    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.setAttribute("msg", "您已安全退出系统！");
        request.getSession().invalidate();
        return "../../login";
    }

    @RequestMapping("showinfo")
    public String showInfo(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        return "user/myinfo";
    }

    @RequestMapping("userupdate")
    public String userUpdate(User user,HttpServletRequest request){
        boolean update = userService.update(user);
        User byName = userService.findByName(user.getUserName());
        request.getSession().invalidate();
        request.getSession().setAttribute("user", byName);

        if(update){
            request.setAttribute("msg","更新成功");
            return "redirect:/showinfo.do";
        }else {
            request.setAttribute("msg","更新失败,存在非法数据");
            return "redirect:/showinfo.do";
        }
    }

    @RequestMapping("shopmall")
    public String shopMall(Model model){
        List<Goods> list = goodsService.findAll();
        model.addAttribute("list", list);

        return "user/shopmall";
    }

    @RequestMapping("addcart")
    public String addCart(Long goodsId,Integer num,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");

        CartItem cartItem = new CartItem();
        cartItem.setGoodsId(goodsId);
        cartItem.setNumber(num);
        cartItem.setUserId(user.getUserId());
        cartItem.setIsCheck(new Byte("1"));
        boolean save = cartService.save(cartItem);
        if(save){
            request.setAttribute("msg","加入购物车成功");
            return "redirect:/mycart.do";
        }else {
            request.setAttribute("msg","加入购物车失败,存在非法数据");
            return "redirect:/shopmall.do";
        }

    }

    @RequestMapping("mycart")
    public String myCart(Model model,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        List<Map<String, Object>> cartItems = userService.selectCartItem(user.getUserId());

        model.addAttribute("carItem",cartItems);
        return "user/mycart";
    }



    @RequestMapping("removeCart")
    public String removeCart(Long cartId , HttpServletRequest request){
        boolean remove = cartService.remove(cartId);
        if(remove){
            request.setAttribute("msg","删除购物车成功");
        }else {
            request.setAttribute("msg","删除失败,存在非法数据");
        }
        return "redirect:/mycart.do";

    }
    @RequestMapping("addManyOrders")
    public String addManyOrders(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        String[] idList = request.getParameterValues("idList");
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setStatus(new Byte("1"));
        order.setConsignee(user.getUserNickname());
        order.setMobile(user.getUserMobile());
        order.setAddress(user.getUserAddress());
        order.setCreatDate(new Date());
        BigDecimal totalPrice = new BigDecimal(0);

        for(String id:idList){
            long cartId = Long.parseLong(id);
            CartItem cartItem = cartService.findCartById(cartId);
            cartItem.setIsCheck(new Byte("2"));
            Goods goods = goodsService.findByGid(cartItem.getGoodsId().intValue());
            boolean update = cartService.update(cartItem);
            BigDecimal bigDecimal = new BigDecimal(cartItem.getNumber());
            totalPrice = totalPrice.add(bigDecimal.multiply(goods.getGoodsPrice()));
        }
        order.setTotalPrice(totalPrice);
        boolean save = orderService.save(order);
        Order newOrder = orderService.findOrderId(order);
        for(String id:idList){
            long cartId = Long.parseLong(id);
            CartItem cartItem = cartService.findCartById(cartId);
            Goods goods = goodsService.findByGid(cartItem.getGoodsId().intValue());
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(newOrder.getOrderId());
            orderItem.setStatus(new Byte("1"));
            orderItem.setNumber(cartItem.getNumber());
            orderItem.setPrice(goods.getGoodsPrice());
            BigDecimal bigDecimal = new BigDecimal(cartItem.getNumber());
            orderItem.setDealPrice(goods.getGoodsPrice().multiply(bigDecimal));
            orderItem.setGmtCreate(new Date());
            orderItem.setIsDelete(new Byte("1"));
            orderItem.setGoodsId(goods.getGoodsId().longValue());
            boolean saveItem = orderService.saveItem(orderItem);
        }
        if(save){
            request.setAttribute("msg","加入订单成功");
            util(request);
            return "redirect:/myorder.do";
        }else {
            request.setAttribute("msg","加入订单失败,存在非法数据");
            return "redirect:/mycart.do";
        }
    }


    @RequestMapping("addOrder")
    public String addOrder(Long cartId,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        CartItem cartItem = cartService.findCartById(cartId);
        cartItem.setIsCheck(new Byte("2"));
        Goods goods = goodsService.findByGid(cartItem.getGoodsId().intValue());
        boolean update = cartService.update(cartItem);
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setStatus(new Byte("1"));
        order.setConsignee(user.getUserNickname());
        order.setMobile(user.getUserMobile());
        BigDecimal bigDecimal = new BigDecimal(cartItem.getNumber());
        order.setTotalPrice(bigDecimal.multiply(goods.getGoodsPrice()));
        order.setAddress(user.getUserAddress());
        order.setCreatDate(new Date());
        boolean save = orderService.save(order);
        Order orderId = orderService.findOrderId(order);
        OrderItem orderItem = new OrderItem();
        orderItem.setStatus(new Byte("1"));
        orderItem.setGoodsId(goods.getGoodsId().longValue());
        orderItem.setGmtCreate(new Date());
        orderItem.setNumber(cartItem.getNumber());
        orderItem.setPrice(goods.getGoodsPrice());
        BigDecimal bigDecimal1 = new BigDecimal(cartItem.getNumber());
        orderItem.setDealPrice(goods.getGoodsPrice().multiply(bigDecimal1));
        orderItem.setOrderId(orderId.getOrderId());
        orderItem.setIsDelete(new Byte("1"));
        boolean b = orderService.saveItem(orderItem);

        if(save){
            request.setAttribute("msg","加入订单成功");
            util(request);
            return "redirect:/myorder.do";
        }else {
            request.setAttribute("msg","加入订单失败,存在非法数据");
            return "redirect:/mycart.do";
        }


    }

    @RequestMapping("myorder")
    public String myOrder(Model model,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        List<Order> orders = orderService.findOrderByUserId(user.getUserId());
        model.addAttribute("order",orders);

        return "user/myorder";
    }

    @RequestMapping("pay")
    public String pay(Integer orderId,HttpServletRequest request){
        Order orderById = orderService.findOrderById(orderId.longValue());
        orderById.setStatus(new Byte("2"));
        boolean update = orderService.update(orderById);
        util(request);
        return "redirect:myorder.do";
    }

    @RequestMapping("goodsDetail")
    public String goodsDetail(Integer goodsId, Model model,HttpServletRequest request){
        Goods goods = goodsService.findByGid(goodsId);
        List<Map<String, Object>> comments = userService.selectComment(goodsId.longValue());
        model.addAttribute("goodsdetail",goods);
        model.addAttribute("comments",comments);
        return "user/goodsdetail";
    }

    @RequestMapping("addComment")
    public String addComment(Integer goodsId, Integer orderItemId,Integer inlineRadioOptions,String commentDetail,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        Comment comment = new Comment();
        comment.setGoodsId(goodsId.longValue());
        comment.setUserId(user.getUserId());
        comment.setStar(new Byte(String.valueOf(inlineRadioOptions)));
        comment.setContent(commentDetail);
        comment.setGmtCreate(new Date());
        OrderItem orderItem = orderService.findOrderItemById(orderItemId.longValue());
        orderItem.setStatus(new Byte("2"));
        orderService.updateOrderItem(orderItem);
        boolean save = orderService.saveComment(comment);
        if(save){
            request.setAttribute("msg","添加评价成功");
            util(request);
            return "redirect:/myorder.do";
        }else {
            request.setAttribute("msg","添加评价失败,存在非法数据");
            return "redirect:myorder.do";
        }


    }

    @RequestMapping("showdetail")
    @ResponseBody
    public List<Map<String,Object>> showDetail(Integer orderId){
        System.out.println(orderId);
        Long oid = orderId.longValue();
        return orderService.showDetail(oid);
    }


    @RequestMapping("mycomment")
    public String myComment( Integer orderId,Model model){
        List<Map<String, Object>> list = orderService.showDetail(orderId.longValue());
        model.addAttribute("list",list);
        System.out.println(list);
        return "user/mycomment";
    }

    public void util(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        List<Order> orders = orderService.findOrderByUserId(user.getUserId());
        for(Order order : orders){
            List<OrderItem> orderItemList = orderService.findOrderItemByOrderId(order.getOrderId());
            boolean isCommented = true;
            for(OrderItem orderItem : orderItemList){
                if(orderItem.getStatus()==1){
                    isCommented=false;
                }
            }
            if(isCommented==true){
                order.setStatus(new Byte("3"));
                orderService.update(order);
            }

        }
    }
}
