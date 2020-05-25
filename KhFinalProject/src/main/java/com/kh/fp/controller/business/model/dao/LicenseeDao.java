package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.Menu;
import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.MenuSide;
import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.ReviewAll;
import com.kh.fp.model.vo.ReviewImg;
import com.kh.fp.model.vo.Side;
import com.kh.fp.model.vo.SideAll;
import com.kh.fp.model.vo.Store;

public interface LicenseeDao {

	List<Map<String, Object>> getOrderInfo(SqlSessionTemplate session,int no,int cPage,int numPerpage);
	int getOrderInfoAll(SqlSessionTemplate session,int no);
	List<Map<String, Object>> getDetailOrder(SqlSessionTemplate session,int no);
	int insertSide(SqlSessionTemplate session,Map<String,Object> map);
	List<Side> selectOption(SqlSessionTemplate session,int s_no);
	int insertCategory(SqlSessionTemplate session,Map<String,Object> map);
	List<MenuCategory> selectCategory(SqlSessionTemplate session,int s_no);
	int insertMenu(SqlSessionTemplate session,Menu m);
	int selectMenu(SqlSessionTemplate session);
	int insertMenuSide(SqlSessionTemplate session,MenuSide ms);
	List<Store> selectStore(SqlSessionTemplate session,int bNo);
	List<Store> selectStoreList(SqlSessionTemplate session,int b_no);
	List<Menu> selectMenuList(SqlSessionTemplate session,int s_no);
	List<SideAll> selectMenuSide(SqlSession session,Map<String,Object> map);
	List<Store> storesNo(SqlSessionTemplate session,int no);
	int menuUpdate(SqlSessionTemplate session,Map<String,Object> map);
	int menuSideDelete(SqlSessionTemplate session,int me_no);
	int menuSideUpdate(SqlSessionTemplate session,MenuSide ms);
	List<ReviewAll> selectReview(SqlSessionTemplate session,int s_no);
	int updateReviewReply(SqlSessionTemplate session,Map<String,Object> map);
	Review selectReviewReply(SqlSessionTemplate session,Map<String,Object> map);
	int menuSideAdd(SqlSessionTemplate session,MenuSide ms); 
	List<ReviewImg> selectReviewImg(SqlSessionTemplate session,int s_no);
}
