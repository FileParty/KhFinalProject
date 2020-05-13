package com.kh.fp.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Side;

@Repository
public class LicenseeDaoImpl implements LicenseeDao {

	@Override
	public int insertSide(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("business.insertSide",map);
	}

	@Override
	public List<Side> selectOption(SqlSessionTemplate session,int sNo) {
		// TODO Auto-generated method stub
		return session.selectList("business.selectOption",sNo);
	}
	
	

	

}
