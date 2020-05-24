package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.OrderInfo;
import com.kh.fp.model.vo.OrderMenu;
import com.kh.fp.model.vo.Sales;
import com.kh.fp.model.vo.StoreEnroll;

public interface StoreDao {

	int insertStore(SqlSessionTemplate session,StoreEnroll s);
	int insertStoreCategory(SqlSessionTemplate session, Map<String, Object> map);
	int insertStoreImage(SqlSessionTemplate session,Map<String, Object> map);
	List<Map<String, Object>> getStoresDetail(SqlSessionTemplate session,int no);
	List<Map<String, Object>> getStoresDetailcategory(SqlSessionTemplate session,Object no);
	List<Map<String, Object>> getStoresDetailfiles(SqlSessionTemplate session,Object no);
	Map<String, Object> getStoresUpdate(SqlSessionTemplate session, int no);
	int storeUpdate(SqlSessionTemplate session,StoreEnroll s);
	int deleteCategory(SqlSessionTemplate session,int no);
	OrderInfo orderDetail(SqlSessionTemplate session,int no);
	int insertBestCategory(SqlSessionTemplate session,int no);
	List<Map<String, Object>> getStoresInfo(SqlSessionTemplate session,int no);
	List<Sales> getSales(SqlSessionTemplate session, Object no);
	List<Map<String, Object>> getOrderInfo(SqlSessionTemplate session, Object no);
	List<Map<String, Object>> getSaleMonth(SqlSessionTemplate session,Object no);
	List<OrderMenu> orderMenu(SqlSessionTemplate session,int no);
}
