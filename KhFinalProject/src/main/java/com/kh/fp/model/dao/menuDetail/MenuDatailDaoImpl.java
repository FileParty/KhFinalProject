package com.kh.fp.model.dao.menuDetail;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.StoreMenuSide;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreDetailInfo;
import com.kh.fp.model.vo.StoreDetailReview;
import com.kh.fp.model.vo.StoreCategory;

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
	public List<StoreDetailReview> selectStoreDetailReview(SqlSessionTemplate session, int no, String searchType,
			int cPage) {
		return session.selectList("storeMenuDetail.selectStoreReview",no,new RowBounds((cPage-1)*5,5));
	}

	@Override
	public List<String> selectStroeDetailReviewImg(SqlSessionTemplate session, int r_no) {
		return session.selectList("storeMenuDetail.selectStoreReviewImg",r_no);
	}
	
	

}
