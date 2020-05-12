package com.kh.fp.controller.business.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


public interface LicenseeService {

	List<Map<String, Object>> getOrderInfo(int no,int cPage,int numPerpage);
	int getOrderInfoAll(int no);
	List<Map<String, Object>> getDetailOrder(int no);
}
