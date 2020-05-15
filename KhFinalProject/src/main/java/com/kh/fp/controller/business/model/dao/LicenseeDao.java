package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.Side;

public interface LicenseeDao {

	List<Map<String, Object>> getOrderInfo(SqlSessionTemplate session,int no,int cPage,int numPerpage);
	int getOrderInfoAll(SqlSessionTemplate session,int no);
	List<Map<String, Object>> getDetailOrder(SqlSessionTemplate session,int no);
	int insertSide(SqlSessionTemplate session,Map<String,Object> map);
	List<Side> selectOption(SqlSessionTemplate session,int sNo);
	int insertCategory(SqlSessionTemplate session,Map<String,Object> map);
	List<MenuCategory> selectCategory(SqlSessionTemplate session);
}
