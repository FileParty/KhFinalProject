package com.kh.fp.controller.business.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.fp.controller.business.model.dao.LicenseeDao;
import com.kh.fp.model.vo.Menu;
import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.MenuSide;
import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.ReviewAll;
import com.kh.fp.model.vo.Side;
import com.kh.fp.model.vo.SideAll;
import com.kh.fp.model.vo.Store;

@Service
@Transactional
public class LicenseeServiceImpl implements LicenseeService {

	
	@Autowired
	LicenseeDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, Object>> getOrderInfo(int no,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.getOrderInfo(session,no,cPage,numPerpage);
	}

	@Override
	public int getOrderInfoAll(int no) {
		// TODO Auto-generated method stub
		return dao.getOrderInfoAll(session,no);
	}

	@Override
	public List<Map<String, Object>> getDetailOrder(int no) {
		// TODO Auto-generated method stub
		return dao.getDetailOrder(session,no);
	}
	
	@Override
	public int insertSide(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertSide(session, map);
	}
	@Override
	public List<Side> selectOption(int s_no) {
		// TODO Auto-generated method stub
		
		return dao.selectOption(session,s_no);
	}
	@Override
	public int insertCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertCategory(session,map);
	}
	@Override
	public List<MenuCategory> selectCategory(int s_no) {
		// TODO Auto-generated method stub
		return dao.selectCategory(session, s_no);
	}

	@Override
	
	public int insertMenu(Menu m,List<MenuSide> list) {
		// TODO Auto-generated method stub
		int result = 0;
		int meNo =0;
		
		
		result = dao.insertMenu(session,m);
		
			if(result>0) {
				 meNo = dao.selectMenu(session);
				
				for(MenuSide ms : list) {		
					ms.setMe_no(meNo);
					System.out.println("서비스에요"+ms.getSd_no());
				result = dao.insertMenuSide(session,ms);
				}
			
			}

		return result;
		}

	@Override
	public List<Store> selectStore(int bNo) {
		// TODO Auto-generated method stub
		return dao.selectStore(session,bNo);
	}

	@Override
	public List<Store> selectStoreList(int b_no) {
		// TODO Auto-generated method stub
		//메뉴관리
		return dao.selectStoreList(session,b_no);
	}

	@Override
	public List<Menu> selectMenuList(int s_no) {
		// TODO Auto-generated method stub
		//메뉴상세
		return dao.selectMenuList(session,s_no);
	}

	@Override
	public List<SideAll> selectMenuSide(Map<String,Object> map) {
		// TODO Auto-generated method stub
		//메뉴사이드 조회
		return dao.selectMenuSide(session,map);
	}

	@Override
	public List<Store> storesNo(int no) {
		// TODO Auto-generated method stub
		return dao.storesNo(session,no);
	}

	public int menuUpdate(Map<String, Object> map,int me_no) {
		int result = 0;
		
		result = dao.menuUpdate(session,map);
		if(result>0) {
			result = dao.menuSideDelete(session, me_no);
			}
		
		return result;
	}

	@Override
	public int menuSideUpdate(List<MenuSide> list) {
		// TODO Auto-generated method stub
		int result = 0;
		for(MenuSide ms : list) {
			result = dao.menuSideUpdate(session,ms);
		}
		return result;
	}

	@Override
	public List<ReviewAll> selectReview(int s_no) {
		// TODO Auto-generated method stub
		return dao.selectReview(session,s_no);
	}

	@Override
	public Review updateReviewReply(Map<String,Object> map) {
		// TODO Auto-generated method stub
		int result = 0;
		Review r = new Review();
		result = dao.updateReviewReply(session, map);
		if(result>0) {
			r = dao.selectReviewReply(session,map);
		}
		return r;
	}

	

	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	

	}
	
	
	
	
	
	
	
	
	
	
	

