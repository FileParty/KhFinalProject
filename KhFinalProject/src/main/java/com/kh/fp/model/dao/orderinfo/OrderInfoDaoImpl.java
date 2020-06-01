package com.kh.fp.model.dao.orderinfo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderInfoDaoImpl implements OrderInfoDao{

	@Override
	public int updateOrderState(SqlSessionTemplate session, int orderNo) {
		// TODO Auto-generated method stub
		return session.update("orderInfo.updateState", orderNo);
	}

	@Override
	public int updateOrderStateComplete(SqlSessionTemplate session, int orderNo) {
		// TODO Auto-generated method stub
		return session.update("orderInfo.updateStateComplete", orderNo);
	}

	@Override
	public String selectOrderInfoAddress(SqlSessionTemplate session, int orderNo) {
		// TODO Auto-generated method stub
		return session.selectOne("orderInfo.selectOrderInfoAddress", orderNo);
	}

	
	
}
