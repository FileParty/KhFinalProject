package com.kh.fp.model.dao.delivery;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Delivery;

@Repository
public class DeliveryDaoImpl implements DeliveryDao{

	@Override
	public int updateDelivery(SqlSessionTemplate session, Delivery d) {
		// TODO Auto-generated method stub
		return session.update("delivery.updateDelivery", d);
	}

	@Override
	public int updateDeliveryComplete(SqlSessionTemplate session, Delivery d) {
		// TODO Auto-generated method stub
		return session.update("delivery.updateDeliveryComplete",d);
	}

	@Override
	public Map<String, String> selectDeliveryxy(SqlSessionTemplate session, int orderNo) {
		// TODO Auto-generated method stub
		return session.selectOne("delivery.selectDeliveryxy", orderNo);
	}

	
}
