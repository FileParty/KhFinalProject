package com.kh.fp.model.dao.admin;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;
import com.kh.fp.model.vo.Review;

public interface AdminDao {

	List<AdminApplyStore> selectApplyStoreList(SqlSessionTemplate session);

	List<String> selectApplyStoreCategory(SqlSessionTemplate session, int s_No);

	AdminApplyStoreInfo selectApplyStoreInfo(SqlSessionTemplate session, int s_no);
	
	int updateStoreStatus(SqlSessionTemplate session, int s_no);
	
	List<AdminApplyStore> selectStore(SqlSessionTemplate session);
	
	int deleteStoreStatus(SqlSessionTemplate session, int s_no);
	
	List<Map<String, String>> selectReport(SqlSessionTemplate session);
	
	int updateReportY(SqlSessionTemplate session, int re_no);
	
	int updateReportM(SqlSessionTemplate session, int re_no);
	
	int updateReviewStatus(SqlSessionTemplate session, int r_no);
	
	Review reviewDetail(SqlSessionTemplate session, int r_no);

}
