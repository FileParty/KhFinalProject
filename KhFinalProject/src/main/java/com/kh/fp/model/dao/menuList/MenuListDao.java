package com.kh.fp.model.dao.menuList;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.Store;

public interface MenuListDao {
	
	//페이지 전환
	public List<Store> selectMenuList(SqlSessionTemplate session, int cPage, int numperPage, Map map);
	
	//filter
	public List<Store> selectMenuListFilter(SqlSessionTemplate session, int cPage, int numperPage, Map map);
	
	//totalData
	public int selectMenuCount(SqlSessionTemplate session, Map map);
		
	public Review selectReview(SqlSessionTemplate session, int s_no);
	
	//검색
	public List<Store> selectMenuList(SqlSessionTemplate session, Map map);
	
	
}
