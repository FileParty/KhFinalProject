package com.kh.fp.controller.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.Menu;
import com.kh.fp.model.vo.MenuCategory;
import com.kh.fp.model.vo.MenuSide;
import com.kh.fp.model.vo.Review;
import com.kh.fp.model.vo.ReviewAll;
import com.kh.fp.model.vo.ReviewImg;
import com.kh.fp.model.vo.Side;
import com.kh.fp.model.vo.SideAll;
import com.kh.fp.model.vo.Store;

@Repository
public class LicenseeDaoImpl implements LicenseeDao {

	@Override
	public List<Map<String, Object>> getOrderInfo(SqlSessionTemplate session, int no,int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		RowBounds row =new  RowBounds((cPage-1)*numPerpage, numPerpage);
		return session.selectList("licensee.getOrderInfo",no,row);
	}

	@Override
	public int getOrderInfoAll(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("licensee.getOrderInfoAll",no);
	}

	@Override
	public List<Map<String, Object>> getDetailOrder(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.getDetailOrder",no);
	}
	
	@Override
	public int insertSide(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("licensee.insertSide",map);
	}

	@Override
	public List<Side> selectOption(SqlSessionTemplate session,int s_no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectOption",s_no);
	}

	@Override
	public int insertCategory(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("licensee.insertCategory",map);
	}

	@Override
	public List<MenuCategory> selectCategory(SqlSessionTemplate session,int s_no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectCategory",s_no);
	}

	@Override
	public int insertMenu(SqlSessionTemplate session, Menu m) {
		// TODO Auto-generated method stub
		return session.insert("licensee.insertMenu",m);
	}

	@Override
	public int selectMenu(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("licensee.selectMenu");
	}

	@Override
	public int insertMenuSide(SqlSessionTemplate session, MenuSide ms) {
		// TODO Auto-generated method stub
		return session.insert("licensee.insertMenuSide",ms);
	}

	@Override
	public List<Store> selectStore(SqlSessionTemplate session, int bNo) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectStoreNo",bNo);
	}

	@Override
	public List<Store> selectStoreList(SqlSessionTemplate session, int b_no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectStoreList",b_no);
	}

	@Override
	public List<Menu> selectMenuList(SqlSessionTemplate session, int s_no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectMenuList",s_no);
	}

	@Override
	public List<SideAll> selectMenuSide(SqlSession session,Map<String,Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectMenuSide",map);
	}

	@Override
	public List<Store> storesNo(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.storesNo",no);
	}

	public int menuUpdate(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("licensee.menuUpdate",map);
	}

	@Override
	public int menuSideDelete(SqlSessionTemplate session, int me_no) {
		// TODO Auto-generated method stub
		return session.delete("licensee.menuSideDelete",me_no);
	}

	@Override
	public int menuSideUpdate(SqlSessionTemplate session, MenuSide ms) {
		// TODO Auto-generated method stub
		return session.insert("licensee.menuSideUpdate",ms);
	}

	@Override
	public List<ReviewAll> selectReview(SqlSessionTemplate session, int s_no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectReview",s_no);
	}
	
	

	@Override
	public List<ReviewImg> selectReviewImg(SqlSessionTemplate session, int s_no) {
		// TODO Auto-generated method stub
		return session.selectList("licensee.selectReviewImg",s_no);
	}

	@Override
	public int updateReviewReply(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.update("licensee.updateReviewReply",map);
	}

	@Override
	public Review selectReviewReply(SqlSessionTemplate session,Map<String,Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("licensee.selectReviewReply",map);
	}

	@Override
	public int menuSideAdd(SqlSessionTemplate session, MenuSide ms) {
		// TODO Auto-generated method stub
		return session.insert("licensee.insertMenuSide",ms);
	}
	
	

	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	
	

	
	

	

	
	
	
	
	
	
	
}
