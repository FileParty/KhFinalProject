package com.kh.fp.controller.business.service;


import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.Menu;
import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.MenuSide;
import com.kh.fp.model.vo.Side;
import com.kh.fp.model.vo.SideAll;
import com.kh.fp.model.vo.Store;


public interface LicenseeService {

	List<Map<String, Object>> getOrderInfo(int no,int cPage,int numPerpage);
	int getOrderInfoAll(int no);
	List<Map<String, Object>> getDetailOrder(int no);
	
	int insertSide(Map<String,Object> map);
	List<Side> selectOption(int s_no);
	int insertCategory(Map<String,Object> map);
	List<MenuCategory> selectCategory(int s_no);
	int insertMenu(Menu m,List<MenuSide> list);
	List<Store> selectStore(int bNo);
	List<Store> selectStoreList(int b_no);
	List<Menu> selectMenuList(int s_no);
	List<SideAll> selectMenuSide(Map<String,Object> map);
	List<Store> storesNo(int no);
	int menuUpdate(Map<String,Object> map,int me_no);
	int menuSideUpdate(List<MenuSide> list);

}
