package com.kh.fp.model.dao.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<AdminApplyStore> selectApplyStoreList(SqlSessionTemplate session) {
		return session.selectList("admin.selectApplyStoreList");
	}

	@Override
	public List<String> selectApplyStoreCategory(SqlSessionTemplate session, int s_No) {
		return session.selectList("admin.selectApplyStoreCategory",s_No);
	}

	@Override
	public AdminApplyStoreInfo selectApplyStoreInfo(SqlSessionTemplate session, int s_no) {
		return session.selectOne("admin.selectApplyStoreInfo",s_no);
	}

	@Override
	public int updateStoreStatus(SqlSessionTemplate session, int s_no) {
		return session.update("admin.updateStoreStatus", s_no);
	}
	
	

}
