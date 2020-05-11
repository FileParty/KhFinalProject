package com.kh.fp.model.servier.menuDetail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.menuDetail.MenuDatailDao;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreMenuDetail;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MenuDatailServiceImpl implements MenuDatailService {
	
	@Autowired
	private MenuDatailDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public StoreMenuDetail selectStroeInfo(int no) {
		StoreMenuDetail smd = dao.selectStoreInfo(session,no);
		smd.setScList(dao.selectStroeCategoy(session,no));
		List<StoreMenu> smList = dao.selectStoreMenus(session,no);
		for(StoreMenu sm : smList) {
			sm.setSides(dao.selectMenuSides(session,sm));
		}
		smd.setSmList(smList);
		return smd;
	}
	
	

}
