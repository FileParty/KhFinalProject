package com.kh.fp.model.dao.orderinfo;

import org.mybatis.spring.SqlSessionTemplate;

public interface OrderInfoDao {

	public int updateOrderState(SqlSessionTemplate session, int orderNo);
	
}
