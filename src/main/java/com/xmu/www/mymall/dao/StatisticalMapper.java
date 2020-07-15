package com.xmu.www.mymall.dao;

import java.util.List;
import java.util.Map;

public interface StatisticalMapper {

   List<Map<String,Object>> groupByGender();
   List<Map<String,Object>> groupByDate();
   List<Map<String,Object>> groupByAge();

}
