package com.kh.fp.controller.business.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.controller.business.model.dao.LicenseeDao;

@Service
public class LicenseeServiceImpl implements LicenseeService {

	
	@Autowired
	LicenseeDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, Object>> getOrderInfo(int no,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.getOrderInfo(session,no,cPage,numPerpage);
	}

	@Override
	public int getOrderInfoAll(int no) {
		// TODO Auto-generated method stub
		return dao.getOrderInfoAll(session,no);
	}

	@Override
	public List<Map<String, Object>> getDetailOrder(int no) {
		// TODO Auto-generated method stub
		return dao.getDetailOrder(session,no);
	}
	
	
	
	
	
	
	
	
	
}
