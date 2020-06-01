package com.kh.fp.model.service.admin;

import java.util.List;
import java.util.Map;

import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;

public interface AdminService {

	List<AdminApplyStore> selectApplyStoreList();

	AdminApplyStoreInfo selectApplyStoreInfo(int s_no);
	
	int updateStoreStatus(int s_no);
	
	List<AdminApplyStore> selectStore();
	
	int deleteStoreStatus(int s_no);
	
	List<Map<String, String>> selectReport();
	
	int updateReportY(int re_no);
	
	int updateReportM(int re_no);
	
	int updateReviewStatus(int r_no);

}
