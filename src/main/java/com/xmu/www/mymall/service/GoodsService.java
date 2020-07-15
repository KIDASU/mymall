package com.xmu.www.mymall.service;

import com.xmu.www.mymall.domain.Goods;
import com.xmu.www.mymall.domain.GoodsExample;

import java.util.List;

public interface GoodsService {
    void doAdd(Goods goods);
    void doRemove(int gid);
    void doModify(Goods goods);
    Goods findByGid(int gid);
    List<Goods> findAll();
    List<Goods> findByCondition(GoodsExample ge);
}
