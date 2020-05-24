package com.kh.fp.model.servier.menuDetail;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.menuDetail.MenuDatailDao;
import com.kh.fp.model.vo.Report;
import com.kh.fp.model.vo.StoreDetailInfo;
import com.kh.fp.model.vo.StoreDetailReview;
import com.kh.fp.model.vo.StoreMenu;

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

	@Override
	public List<StoreMenu> selectCategoryMenu(int no) {
		return dao.selectCategoryMenu(session,no);
	}

	@Override
	public StoreMenu selectMenuDetail(int no) {
		StoreMenu selectMenu = dao.selectMenuDetail(session,no);
		selectMenu.setSide(dao.selectMenuDetailSide(session,no));
		return selectMenu;
	}

	@Override
	public List selectStoreDetailReview(Map que, int cPage) {
		List rList = dao.selectStoreDetailReview(session,que,cPage);
		for(StoreDetailReview sdr : (List<StoreDetailReview>)rList) {
			sdr.setR_imgs(dao.selectStroeDetailReviewImg(session,sdr.getR_no()));
		}
		rList.add(dao.selectStoreDetailReviewCount(session,que));
		return rList;
	}

	@Override
	public int insertReport(Report report) {
		return dao.insertReport(session,report);
	}
	
	

}
