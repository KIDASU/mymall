package com.xmu.www.mymall.service;

import com.xmu.www.mymall.domain.Comment;
import com.xmu.www.mymall.domain.Order;
import com.xmu.www.mymall.domain.OrderItem;

import java.util.List;
import java.util.Map;

public interface OrderService {
    public List<Order> findOrderByUserId(Long userId);
    public boolean save(Order order);
    public Order findOrderId(Order order);
    public boolean saveItem(OrderItem orderItem);
    public Order findOrderById(Long orderId);
    public boolean update(Order order);
    public List<Map<String,Object>> showDetail(Long orderId);
    public boolean saveComment(Comment comment);
    public OrderItem findOrderItemById(Long orderItemId);
    public boolean updateOrderItem(OrderItem orderItem);
    public List<OrderItem> findOrderItemByOrderId(Long orderId);
    List<Map<String,Object>> findOrder();
    List<Map<String,Object>> findOrderItem(Long oid);
    void doRemove(Long oid);
    void doAdd(Order order);
    void doModify(Order order);
}
