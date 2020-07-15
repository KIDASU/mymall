package com.xmu.www.mymall.service.impl;

import com.xmu.www.mymall.dao.CommentMapper;
import com.xmu.www.mymall.dao.OrderItemMapper;
import com.xmu.www.mymall.dao.OrderMapper;
import com.xmu.www.mymall.dao.RelationMapper;
import com.xmu.www.mymall.domain.*;
import com.xmu.www.mymall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-10 19:04
 **/
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public boolean updateOrderItem(OrderItem orderItem) {
        int i = orderItemMapper.updateByPrimaryKeySelective(orderItem);
        return i==1;
    }

    @Override
    public List<OrderItem> findOrderItemByOrderId(Long orderId) {
        OrderItemExample orderItemExample = new OrderItemExample();
        orderItemExample.createCriteria().andOrderIdEqualTo(orderId);
        List<OrderItem> orderItems = orderItemMapper.selectByExample(orderItemExample);
        return orderItems;
    }

    @Override
    public OrderItem findOrderItemById(Long orderItemId) {
        return orderItemMapper.selectByPrimaryKey(orderItemId);
    }

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private RelationMapper relationMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public boolean update(Order order) {
        int i = orderMapper.updateByPrimaryKeySelective(order);
        return i==1;
    }

    @Override
    public Order findOrderById(Long orderId) {
        return orderMapper.selectByPrimaryKey(orderId);
    }

    @Override
    public boolean saveItem(OrderItem orderItem) {
        int insertSelective = orderItemMapper.insertSelective(orderItem);
        return insertSelective==1;
    }

    @Override
    public Order findOrderId(Order order) {
        OrderExample orderExample = new OrderExample();
        orderExample.createCriteria().andUserIdEqualTo(order.getUserId()).andTotalPriceEqualTo(order.getTotalPrice());
        List<Order> orders = orderMapper.selectByExample(orderExample);
        return orders.get(0);
    }

    @Override
    public boolean save(Order order) {
        int i = orderMapper.insertSelective(order);
        return i==1;
    }

    @Override
    public List<Order> findOrderByUserId(Long userId) {
        OrderExample orderExample = new OrderExample();
        orderExample.createCriteria().andUserIdEqualTo(userId);
        List<Order> orders = orderMapper.selectByExample(orderExample);
        return orders;
    }

    @Override
    public boolean saveComment(Comment comment) {
        int i = commentMapper.insertSelective(comment);

        return i==1;
    }
    @Override
    public List<Map<String, Object>> findOrder() {
        return orderMapper.selectOrder();
    }

    @Override
    public List<Map<String, Object>> findOrderItem(Long oid) {
        return orderItemMapper.selectOrderItem(oid);
    }

    @Override
    public void doRemove(Long oid) {
        orderMapper.deleteByPrimaryKey(oid);
    }

    @Override
    public void doAdd(Order order) {
        orderMapper.insertSelective(order);
    }

    @Override
    public void doModify(Order order) {
        orderMapper.updateByPrimaryKeySelective(order);
    }
    @Override
    public List<Map<String, Object>> showDetail(Long orderId) {
        return relationMapper.selectOrderItem(orderId);
    }
}
