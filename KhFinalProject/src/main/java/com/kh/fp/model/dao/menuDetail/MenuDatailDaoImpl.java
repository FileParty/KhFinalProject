package com.kh.fp.model.dao.menuDetail;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.MenuDetailReviewMenu;
import com.kh.fp.model.vo.Report;
import com.kh.fp.model.vo.StoreCategory;
import com.kh.fp.model.vo.StoreDetailInfo;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreMenuSide;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MenuDatailDaoImpl implements MenuDatailDao {
	
	@Override
	public StoreDetailInfo selectStroeDetailInfo(SqlSessionTemplate session, int no) {
		return session.selectOne("storeMenuDetail.selectStoreDetailInfo",no);
	}

	@Override
	public List<StoreCategory> selectStoreDetailCategory(SqlSessionTemplate session, int no) {
		return session.selectList("storeMenuDetail.selectStoreDetailCategory",no);
	}

	@Override
	public List<StoreMenu> selectStoreDetailBestMenu(SqlSessionTemplate session, int no) {
		return session.selectList("storeMenuDetail.selectStoreDetailBestMenu",no);
	}

	@Override
	public List<StoreMenu> selectCategoryMenu(SqlSessionTemplate session, int no) {
		return session.selectList("storeMenuDetail.selectCategoryMenu",no);
	}

	@Override
	public StoreMenu selectMenuDetail(SqlSessionTemplate session, int no) {
		return session.selectOne("storeMenuDetail.selectMenuDetail",no);
	}

	@Override
	public List<StoreMenuSide> selectMenuDetailSide(SqlSessionTemplate session, int no) {
		log.debug(""+no);
		return session.selectList("storeMenuDetail.selectMenuDetailSide",no);
	}

	@Override
	public List selectStoreDetailReview(SqlSessionTemplate session, Map que, int cPage) {
		return session.selectList("storeMenuDetail.selectStoreReview",que,new RowBounds((cPage-1)*5,5));
	}

	@Override
	public List<String> selectStroeDetailReviewImg(SqlSessionTemplate session, int r_no) {
		return session.selectList("storeMenuDetail.selectStoreReviewImg",r_no);
	}

	@Override
	public int selectStoreDetailReviewCount(SqlSessionTemplate session, Map que) {
		return session.selectOne("storeMenuDetail.selectStoreReviewCount",que);
	}

	@Override
	public int insertReport(SqlSessionTemplate session, Report report) {
		return session.insert("storeMenuDetail.insertReport",report);
	}

	@Override
	public List<MenuDetailReviewMenu> selectStoreDetailReviewMenu(SqlSessionTemplate session, int o_no) {
		return session.selectList("storeMenuDetail.selectStoreDetailReviewMenu",o_no);
	}

	@Override
	public int selectBookMarkCheck(SqlSessionTemplate session, Map bmCheck) {
		return session.selectOne("storeMenuDetail.selectBookMarkCheck",bmCheck);
	}

	@Override
	public int insertBookMarking(SqlSessionTemplate session, Map<String, Integer> bm) {
		return session.insert("storeMenuDetail.insertBookMark",bm);
	}

	@Override
	public int deleteBookMarking(SqlSessionTemplate session, Map<String, Integer> bm) {
		return session.delete("storeMenuDetail.deleteBookMark",bm);
	}

	@Override
	public List<String> selectStoreDetailImgs(SqlSessionTemplate session, int no) {
		return session.selectList("storeMenuDetail.selectStoreDetailImgs",no);
	}
	
	

}
