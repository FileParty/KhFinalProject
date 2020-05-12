package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface LicenseeDao {

	List<Map<String, Object>> getOrderInfo(SqlSessionTemplate session,int no,int cPage,int numPerpage);
	int getOrderInfoAll(SqlSessionTemplate session,int no);
	
}
