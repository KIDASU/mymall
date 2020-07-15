package com.xmu.www.mymall.service.impl;

import com.xmu.www.mymall.dao.CartItemMapper;
import com.xmu.www.mymall.domain.CartItem;
import com.xmu.www.mymall.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-10 23:02
 **/
@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartItemMapper cartItemMapper;

    @Override
    public boolean remove(Long cartId) {
        int i = cartItemMapper.deleteByPrimaryKey(cartId);
        return i==1;
    }

    @Override
    public CartItem findCartById(Long cartId) {
        return cartItemMapper.selectByPrimaryKey(cartId);
    }

    @Override
    public boolean update(CartItem cartItem) {
        int i = cartItemMapper.updateByPrimaryKeySelective(cartItem);
        return i==0;
    }

    @Override
    public boolean save(CartItem cartItem) {
        int i = cartItemMapper.insertSelective(cartItem);
        return i==1;
    }
    @Override
    public void doAdd(CartItem cartItem) {
        cartItemMapper.insertSelective(cartItem) ;
    }

    @Override
    public void doRemove(int cartItemId) {
        cartItemMapper.deleteByPrimaryKey((long) cartItemId);
    }

    @Override
    public CartItem findByCid(int cid) {
        return cartItemMapper.selectByPrimaryKey((long) cid);
    }

    @Override
    public List<CartItem> findAll() {
        return cartItemMapper.selectByExample(null);
    }
}
