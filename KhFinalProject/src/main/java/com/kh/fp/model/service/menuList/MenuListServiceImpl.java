package com.kh.fp.model.service.menuList;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.menuList.MenuListDao;
import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.Store;

@Service
public class MenuListServiceImpl implements MenuListService {

	@Autowired
	private MenuListDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	//페이지 전환
	@Override
	public List<Store> selectMenuList(int cPage, int numperPage, Map map) {
		// TODO Auto-generated method stub
		return dao.selectMenuList(session, cPage, numperPage, map);
	}
	
	//filter
	@Override
	public List<Store> selectMenuListFilter(int cPage, int numperPage, Map map) {
		// TODO Auto-generated method stub
		return dao.selectMenuListFilter(session, cPage, numperPage, map);
	}

	//totalData
	@Override
	public int selectMenuCount(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMenuCount(session, map);
	}
	
	@Override
	public Review selectReview(int s_no) {
		// TODO Auto-generated method stub
		return dao.selectReview(session, s_no);
	}

	//검색
	@Override
	public List<Store> selectMenuList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMenuList(session, map);
	}

	

	
	
	
}
