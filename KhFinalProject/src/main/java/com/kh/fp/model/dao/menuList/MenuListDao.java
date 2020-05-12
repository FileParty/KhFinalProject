package com.kh.fp.model.dao.menuList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.MenuList;

public interface MenuListDao {

	List<MenuList> selectMenuList(SqlSessionTemplate session);
	List<MenuList> selectMenuList(SqlSessionTemplate session, String category);
}
