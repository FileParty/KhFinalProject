package com.kh.fp.model.servier.menuDetail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.menuDetail.MenuDatailDao;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreDetailInfo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MenuDatailServiceImpl implements MenuDatailService {
	
	@Autowired
	private MenuDatailDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public StoreDetailInfo selectStroeDetailInfo(int no) {
		StoreDetailInfo smd = dao.selectStroeDetailInfo(session,no);
		smd.setStoreCategory(dao.selectStoreDetailCategory(session, no));
		smd.setBestMenu(dao.selectStoreDetailBestMenu(session, no));
		return smd;
	}
	
	

}
