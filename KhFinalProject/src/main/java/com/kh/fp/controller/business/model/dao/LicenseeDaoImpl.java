package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LicenseeDaoImpl implements LicenseeDao {

	@Override
	public List<Map<String, Object>> getOrderInfo(SqlSessionTemplate session, int no,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		RowBounds row =new  RowBounds((cPage-1)*numPerpage, numPerpage);
		return session.selectList("licensee.getOrderInfo",no,row);
	}

	@Override
	public int getOrderInfoAll(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("licensee.getOrderInfoAll",no);
	}
	
	
	
	
	
}
