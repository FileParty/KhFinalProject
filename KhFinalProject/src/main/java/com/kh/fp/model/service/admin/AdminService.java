package com.kh.fp.model.service.admin;

import java.util.List;

import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;

public interface AdminService {

	List<AdminApplyStore> selectApplyStoreList();

	AdminApplyStoreInfo selectApplyStoreInfo(int s_no);

}