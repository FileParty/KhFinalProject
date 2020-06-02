package com.kh.fp.model.dao.admin;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;
import com.kh.fp.model.vo.Review;

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

	@Override
	public List<AdminApplyStore> selectStore(SqlSessionTemplate session) {
		return session.selectList("admin.selectStore");
	}

	@Override
	public int deleteStoreStatus(SqlSessionTemplate session, int s_no) {
		return session.update("admin.deleteStoreStatus", s_no);
	}

	@Override
	public List<Map<String, String>> selectReport(SqlSessionTemplate session) {
		return session.selectList("admin.selectReport");
	}

	@Override
	public int updateReportY(SqlSessionTemplate session, int re_no) {
		return session.update("admin.updateReportY", re_no);
	}

	@Override
	public int updateReportM(SqlSessionTemplate session, int re_no) {
		return session.update("admin.updateReportM", re_no);
	}

	@Override
	public int updateReviewStatus(SqlSessionTemplate session, int r_no) {
		return session.update("admin.updateReviewStatus", r_no);
	}

	@Override
	public Review reviewDetail(SqlSessionTemplate session, int r_no) {
		return session.selectOne("admin.reviewDetail", r_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
