package com.xmu.www.mymall.controller;


import com.xmu.www.mymall.dao.StatisticalMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("**.do")
public class StatisticalController {
    private StatisticalMapper statisticalMapper;

    public StatisticalMapper getStatisticalMapper() {
        return statisticalMapper;
    }

    @Autowired
    public void setStatisticalMapper(StatisticalMapper statisticalMapper){
        this.statisticalMapper=statisticalMapper;
    }

    @RequestMapping("statistical")
    public String statistical(){
        return "admin/statistical";
    }

    @RequestMapping("showchart1")
    @ResponseBody
    public List<Map<String,Object>> showChart1(){
        List<Map<String,Object>> data = statisticalMapper.groupByGender();
        return data;

    }
    @RequestMapping("showchart2")
    @ResponseBody
    public List<Map<String,Object>> showChart2(){
        List<Map<String,Object>> data = statisticalMapper.groupByAge();
        return data;

    }
    @RequestMapping("showchart3")
    @ResponseBody
    public List<Map<String,Object>> showChart3(){
        List<Map<String,Object>> data = statisticalMapper.groupByDate();
        return data;

    }

}

