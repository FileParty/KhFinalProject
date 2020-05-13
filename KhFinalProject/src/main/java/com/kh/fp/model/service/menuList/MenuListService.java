package com.kh.fp.model.service.menuList;

import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.Store;

public interface MenuListService {

	//페이지 전환
	public List<Store> selectMenuList(int cPage, int numperPage, Map map);
	
	//filter
	public List<Store> selectMenuListFilter(int cPage, int numperPage, Map map);
	
	//totaldata
	public int selectMenuCount(Map map);
		
	public Review selectReview(int s_no);
	
	//검색
	public List<Store> selectMenuList(Map map);
	
	
}
