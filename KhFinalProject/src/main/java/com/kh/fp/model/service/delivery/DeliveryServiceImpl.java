package com.kh.fp.model.service.delivery;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.delivery.DeliveryDao;
import com.kh.fp.model.vo.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int updateDelivery(Delivery d) {
		// TODO Auto-generated method stub
		return dao.updateDelivery(session, d);
	}

	@Override
	public int updateDeliveryComplete(Delivery d) {
		// TODO Auto-generated method stub
		return dao.updateDeliveryComplete(session, d);
	}

	
}
