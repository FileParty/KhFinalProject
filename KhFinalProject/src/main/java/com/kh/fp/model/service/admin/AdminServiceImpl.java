package com.kh.fp.model.service.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.admin.AdminDao;
import com.kh.fp.model.vo.AdminApplyStore;
import com.kh.fp.model.vo.AdminApplyStoreInfo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private AdminDao dao;

	@Override
	public List<AdminApplyStore> selectApplyStoreList() {
		List<AdminApplyStore> rList = dao.selectApplyStoreList(session);
		for(AdminApplyStore aas : rList) {
			aas.setS_category(dao.selectApplyStoreCategory(session,aas.getS_No()));
		}
		return rList;
	}

	@Override
	public AdminApplyStoreInfo selectApplyStoreInfo(int s_no) {
		AdminApplyStoreInfo aasi = dao.selectApplyStoreInfo(session,s_no);
		aasi.setS_category(dao.selectApplyStoreCategory(session, s_no));
		return aasi;
	}

	@Override
	public int updateStoreStatus(int s_no) {
		return dao.updateStoreStatus(session, s_no);
	}

	@Override
	public List<AdminApplyStore> selectStore() {
		List<AdminApplyStore> rList = dao.selectStore(session);
		for(AdminApplyStore aas : rList) {
			aas.setS_category(dao.selectApplyStoreCategory(session,aas.getS_No()));
		}
		return rList;
	}

	@Override
	public int deleteStoreStatus(int s_no) {
		return dao.deleteStoreStatus(session, s_no);
	}
	
	
	
	
	
	

}
