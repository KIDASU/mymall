package com.xmu.www.mymall.service;

import com.xmu.www.mymall.domain.CartItem;

import java.util.List;

public interface CartService {
    public boolean save(CartItem cartItem);
    public boolean remove(Long cartId);
    public CartItem findCartById(Long cartId);
    public boolean update(CartItem cartItem);
    void doAdd(CartItem cartItem);
    void doRemove(int cartItemId);
    CartItem findByCid(int cid);
    List<CartItem> findAll();
}
