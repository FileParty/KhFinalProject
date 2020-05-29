package com.kh.fp.model.service.orderinfo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.orderinfo.OrderInfoDao;

@Service
public class OrderInfoServiceImpl implements OrderInfoService{
	@Autowired
	private OrderInfoDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int updateOrderState(int orderNo) {
		// TODO Auto-generated method stub
		return dao.updateOrderState(session, orderNo);
	}

	@Override
	public int updateOrderStateComplete(int orderNo) {
		// TODO Auto-generated method stub
		return dao.updateOrderStateComplete(session, orderNo);
	}
	
	
}
