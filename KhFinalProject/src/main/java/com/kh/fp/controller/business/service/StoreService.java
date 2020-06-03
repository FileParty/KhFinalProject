package com.kh.fp.controller.business.service;


import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.OrderInfo;
import com.kh.fp.model.vo.Sales;
import com.kh.fp.model.vo.Store;
import com.kh.fp.model.vo.StoreEnroll;

public interface StoreService {

   int insertStore(StoreEnroll s,List<String> files);
   List<Map<String, Object>> getStoresDetail(int no);
   List<Map<String, Object>> getStoresDetailcategory(int no);
   List<Map<String, Object>> getStoresDetailfiles(int no);
   Map<String, Object> getStoresUpdate(int no);
   int storeUpdate(StoreEnroll s);
   OrderInfo orderDetail(int no);
   List<Map<String, Object>> getStoresInfo(int no);
   List<Sales> getSales(Object no);
   List<Map<String,Object>> getOrderInfo(Object no);
   List<Map<String, Object>> getSaleMonth(Object no);
   int orderSelectOk(int no);
   int orderSelectReject(int no);
   StoreEnroll getStore(int no);
}