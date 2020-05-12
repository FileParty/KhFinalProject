package com.kh.fp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface LicenseeDao {
	
	int insertSide(SqlSessionTemplate session,List<Map<String,Object>> map);

}
