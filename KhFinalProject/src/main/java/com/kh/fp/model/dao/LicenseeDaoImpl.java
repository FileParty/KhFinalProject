package com.kh.fp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LicenseeDaoImpl implements LicenseeDao {

	@Override
	public int insertSide(SqlSessionTemplate session,List<Map<String,Object>> map) {
		// TODO Auto-generated method stub
		return session.insert("business.insertSide",map);
	}
	
	

}
