package com.kh.fp.controller.business.model.dao;

import java.util.List;
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

	@Override
	public List<Map<String, Object>> getStoresDetail(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("store.getStoresDetail",no);
	}

	@Override
	public List<Map<String, Object>> getStoresDetailcategory(SqlSessionTemplate session, Object no) {
		// TODO Auto-generated method stub
		return session.selectList("store.getStoresDetailcategory",no);
	}

	@Override
	public List<Map<String, Object>> getStoresDetailfiles(SqlSessionTemplate session, Object no) {
		// TODO Auto-generated method stub
		return session.selectList("store.getStoresDetailfiles",no);
	}
	
	
	
	
	
	
}
