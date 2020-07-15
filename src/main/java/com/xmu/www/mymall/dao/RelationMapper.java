package com.xmu.www.mymall.dao;

import com.xmu.www.mymall.domain.Order;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RelationMapper {
    List<Map<String,Object>> selectCartItem(Long userId);
    List<Map<String,Object>> selectComment(Long goodsId);
    List<Map<String,Object>> selectOrderItem(Long orderId);

}
