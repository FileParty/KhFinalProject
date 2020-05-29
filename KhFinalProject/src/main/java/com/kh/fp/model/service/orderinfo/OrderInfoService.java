package com.kh.fp.model.service.orderinfo;

public interface OrderInfoService {

	public int updateOrderState(int orderNo);
	
	public int updateOrderStateComplete(int orderNo);
}
