package com.kh.fp.model.service.menuList;

import java.util.List;

import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.Store;

public interface MenuListService {

	public List<Store> selectMenuList();
	public List<Store> selectMenuList(String category);
	
	public Review selectReview(int s_no);
}
