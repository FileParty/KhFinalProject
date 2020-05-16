package com.kh.fp.controller.business.service;


import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.StoreEnroll;

public interface StoreService {

	int insertStore(StoreEnroll s,List<String> files);
	List<Map<String, Object>> getStoresDetail(int no);
	List<Map<String, Object>> getStoresDetailcategory(int no);
	List<Map<String, Object>> getStoresDetailfiles(int no);
	Map<String, Object> getStoresUpdate(int no);
	
}
