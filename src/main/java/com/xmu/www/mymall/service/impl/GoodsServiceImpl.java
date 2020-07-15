package com.xmu.www.mymall.service.impl;

import com.xmu.www.mymall.dao.GoodsMapper;
import com.xmu.www.mymall.domain.Goods;
import com.xmu.www.mymall.domain.GoodsExample;
import com.xmu.www.mymall.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: mymall
 * @description:
 * @version：
 * @author: Mr.Wang
 * @create: 2020-07-08 20:22
 **/
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Override
    public void doAdd(Goods goods) {
        goodsMapper.insertSelective(goods);

    }

    @Override
    public void doRemove(int gid) {
        goodsMapper.deleteByPrimaryKey(gid);

    }

    @Override
    public void doModify(Goods goods) {
        goodsMapper.updateByPrimaryKeySelective(goods);

    }

    @Override
    public Goods findByGid(int gid) {

        return goodsMapper.selectByPrimaryKey(gid);
    }

    @Override
    public List<Goods> findAll() {

        return goodsMapper.selectByExample(null);
    }

    @Override
    public List<Goods> findByCondition(GoodsExample ge) {
        return goodsMapper.selectByExample(ge);
    }
}
