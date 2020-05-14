package com.kh.fp.service.buniness;

import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.Side;

public interface LicenseeService {
	
	int insertSide(Map<String,Object> map);
	List<Side> selectOption(int sNo);
	int insertCategory(Map<String,Object> map);
	List<MenuCategory> selectCategory();
}
