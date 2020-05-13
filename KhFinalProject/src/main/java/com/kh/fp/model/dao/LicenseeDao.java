package com.kh.fp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Side;

public interface LicenseeDao {
	
	int insertSide(SqlSessionTemplate session,Map<String,Object> map);
	List<Side> selectOption(SqlSessionTemplate session,int sNo);
}
