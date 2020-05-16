package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.Side;

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

	@Override
	public List<Map<String, Object>> getDetailOrder(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.getDetailOrder",no);
	}
	
	@Override
	public int insertSide(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("licensee.insertSide",map);
	}

	@Override
	public List<Side> selectOption(SqlSessionTemplate session,int sNo) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectOption",sNo);
	}

	@Override
	public int insertCategory(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("licensee.insertCategory",map);
	}

	@Override
	public List<MenuCategory> selectCategory(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectCategory");
	}
	
	
	
	
	
}
