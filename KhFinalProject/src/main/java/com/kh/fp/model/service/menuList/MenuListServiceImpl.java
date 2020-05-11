package com.kh.fp.model.service.menuList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.menuList.MenuListDao;
import com.kh.fp.model.vo.MenuList;

@Service
public class MenuListServiceImpl implements MenuListService {

	@Autowired
	private MenuListDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<MenuList> selectMenuList() {
		// TODO Auto-generated method stub
		return dao.selectMenuList(session);
	}

	@Override
	public List<MenuList> selectMenuList(String category) {
		// TODO Auto-generated method stub
		return dao.selectMenuList(session, category);
	}

	
}
