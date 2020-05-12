package com.kh.fp.service.buniness;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.LicenseeDao;

@Service
public class LicenseeServiceImpl implements LicenseeService {

	@Autowired
	private LicenseeDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Override
	public int insertSide(List<Map<String,Object>> map) {
		// TODO Auto-generated method stub
		return dao.insertSide(session,map);
	}
	
	
}
