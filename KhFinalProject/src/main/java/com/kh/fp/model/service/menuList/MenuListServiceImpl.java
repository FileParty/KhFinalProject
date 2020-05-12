package com.kh.fp.model.service.menuList;

import java.util.List;

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
	
	@Override
	public List<Store> selectMenuList() {
		// TODO Auto-generated method stub
		return dao.selectMenuList(session);
	}

	@Override
	public List<Store> selectMenuList(String category) {
		// TODO Auto-generated method stub
		return dao.selectMenuList(session, category);
	}

	@Override
	public Review selectReview(int s_no) {
		// TODO Auto-generated method stub
		return dao.selectReview(session, s_no);
	}

	
}
