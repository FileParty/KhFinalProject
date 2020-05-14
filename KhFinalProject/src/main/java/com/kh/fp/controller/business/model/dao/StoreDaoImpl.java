package com.kh.fp.controller.business.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.StoreEnroll;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	Logger logger;

	@Override
	public int insertStore(SqlSessionTemplate session, StoreEnroll s) {
		// TODO Auto-generated method stub
		return session.insert("store.insertStore",s);
	}

	@Override
	public int insertStoreCategory(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("store.insertStoreCategory",map);
	}

	@Override
	public int insertStoreImage(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("store.insertStoreImage",map);
	}
	
	
	
	
	
}
