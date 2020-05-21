package com.kh.fp.model.servier.menuDetail;

import java.util.List;

import com.kh.fp.model.vo.StoreDetailInfo;
import com.kh.fp.model.vo.StoreDetailReview;
import com.kh.fp.model.vo.StoreMenu;

public interface MenuDatailService {

	StoreDetailInfo selectStroeDetailInfo(int no);

	List<StoreMenu> selectCategoryMenu(int no);

	StoreMenu selectMenuDetail(int no);

	List<StoreDetailReview> selectStoreDetailReview(int no, String searchType, int cPage);

}
