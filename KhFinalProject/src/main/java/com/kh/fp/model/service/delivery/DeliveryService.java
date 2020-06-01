package com.kh.fp.model.service.delivery;

import java.util.Map;

import com.kh.fp.model.vo.Delivery;

public interface DeliveryService {

	public int updateDelivery(Delivery d);
	public int updateDeliveryComplete(Delivery d); 
	public Map<String, String> selectDeliveryxy(int orderNo);
	public int updateDeliveryPosition(Delivery d);
}
