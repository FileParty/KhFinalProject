package com.kh.fp.model.dao.orderinfo;

import org.mybatis.spring.SqlSessionTemplate;

public interface OrderInfoDao {

	public int updateOrderState(SqlSessionTemplate session, int orderNo);
	
	public int updateOrderStateComplete(SqlSessionTemplate session, int orderNo);

	public String selectOrderInfoAddress(SqlSessionTemplate session, int orderNo);
}
