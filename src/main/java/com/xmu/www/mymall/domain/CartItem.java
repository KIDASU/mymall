package com.xmu.www.mymall.domain;

public class CartItem {
    private Long cartItemId;

    private Long goodsId;

    private Long userId;

    private Byte isCheck;

    private Integer number;

    public Long getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(Long cartItemId) {
        this.cartItemId = cartItemId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Byte getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(Byte isCheck) {
        this.isCheck = isCheck;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}