package com.kh.fp.controller.business.service;


import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.Menu;
import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.MenuSide;
import com.kh.fp.model.vo.Side;


public interface LicenseeService {

	List<Map<String, Object>> getOrderInfo(int no,int cPage,int numPerpage);
	int getOrderInfoAll(int no);
	List<Map<String, Object>> getDetailOrder(int no);
	
	int insertSide(Map<String,Object> map);
	List<Side> selectOption(int sNo);
	int insertCategory(Map<String,Object> map);
	List<MenuCategory> selectCategory();
	int insertMenu(Menu m,List<MenuSide> list);
	
}
