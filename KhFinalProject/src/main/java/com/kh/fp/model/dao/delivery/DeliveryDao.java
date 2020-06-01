package com.kh.fp.model.dao.delivery;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Delivery;

public interface DeliveryDao {

	public int updateDelivery(SqlSessionTemplate session, Delivery d);
	public int updateDeliveryComplete(SqlSessionTemplate session, Delivery d);
	public Map<String, String> selectDeliveryxy(SqlSessionTemplate session, int orderNo);
}
