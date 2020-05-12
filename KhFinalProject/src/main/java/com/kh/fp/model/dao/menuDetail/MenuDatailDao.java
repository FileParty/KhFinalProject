package com.kh.fp.model.dao.menuDetail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.StoreMenuSide;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreDetailInfo;
import com.kh.fp.model.vo.StoreCategory;

public interface MenuDatailDao {

	StoreDetailInfo selectStroeDetailInfo(SqlSessionTemplate session, int no);

	List<StoreCategory> selectStoreDetailCategory(SqlSessionTemplate session, int no);

	List<StoreMenu> selectStoreDetailBestMenu(SqlSessionTemplate session, int no);

	List<StoreMenuSide> selectMenuSides(SqlSessionTemplate session, StoreMenu sm);

}
