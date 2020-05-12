package com.kh.fp.model.service.menuList;

import java.util.List;

import com.kh.fp.model.vo.MenuList;

public interface MenuListService {

	public List<MenuList> selectMenuList();
	public List<MenuList> selectMenuList(String category);
}
