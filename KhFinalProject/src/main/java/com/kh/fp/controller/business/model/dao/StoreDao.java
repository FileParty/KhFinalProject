package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.StoreEnroll;

public interface StoreDao {

	int insertStore(SqlSessionTemplate session,StoreEnroll s);
	int insertStoreCategory(SqlSessionTemplate session, Map<String, Object> map);
	int insertStoreImage(SqlSessionTemplate session,Map<String, Object> map);
	List<Map<String, Object>> getStoresDetail(SqlSessionTemplate session,int no);
	List<Map<String, Object>> getStoresDetailcategory(SqlSessionTemplate session,int no);
	List<Map<String, Object>> getStoresDetailfiles(SqlSessionTemplate session,int no);
}
