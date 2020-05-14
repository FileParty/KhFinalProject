package com.kh.fp.controller.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.StoreEnroll;

public interface StoreDao {

	int insertStore(SqlSessionTemplate session,StoreEnroll s);
	int insertStoreCategory(SqlSessionTemplate session, Map<String, Object> map);
	int insertStoreImage(SqlSessionTemplate session,Map<String, Object> map);
}