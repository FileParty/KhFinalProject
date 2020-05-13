package com.kh.fp.model.dao.menuList;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.Store;

public interface MenuListDao {

	List<Store> selectMenuList(SqlSessionTemplate session);
	List<Store> selectMenuList(SqlSessionTemplate session, String category);
	
	Review selectReview(SqlSessionTemplate session, int s_no);
	
	//검색
	List<Store> selectMenuList(SqlSessionTemplate session, Map map);
}
