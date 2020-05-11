package com.kh.fp.model.dao.menuDetail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.fp.model.vo.StoreMenuSide;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreMenuDetail;
import com.kh.fp.model.vo.StroeCategory;

public interface MenuDatailDao {

	StoreMenuDetail selectStoreInfo(SqlSessionTemplate session, int no);

	List<StroeCategory> selectStroeCategoy(SqlSessionTemplate session, int no);

	List<StoreMenu> selectStoreMenus(SqlSessionTemplate session, int no);

	List<StoreMenuSide> selectMenuSides(SqlSessionTemplate session, StoreMenu sm);

}
