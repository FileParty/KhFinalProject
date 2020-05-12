package com.kh.fp.model.dao.menuDetail;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.StoreMenuSide;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreDetailInfo;
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
	public List<StoreMenuSide> selectMenuSides(SqlSessionTemplate session, StoreMenu sm) {
		return session.selectList("storeMenuDetail.selectMenuSide",sm.getMe_no());
	}
	
	

}
