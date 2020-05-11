package com.kh.fp.model.dao.menuList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.MenuList;

@Repository
public class MenuListDaoImpl implements MenuListDao {

	@Override
	public List<MenuList> selectMenuList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("menuList.selectMenuList");
	}

	@Override
	public List<MenuList> selectMenuList(SqlSessionTemplate session, String category) {
		// TODO Auto-generated method stub
		return session.selectList("menuList.selectMenuListCategory", category);
	}

	
}
