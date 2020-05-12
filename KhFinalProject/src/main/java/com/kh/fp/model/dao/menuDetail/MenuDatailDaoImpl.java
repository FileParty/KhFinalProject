package com.kh.fp.model.dao.menuDetail;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fp.model.vo.StoreMenuSide;
import com.kh.fp.model.vo.StoreMenu;
import com.kh.fp.model.vo.StoreMenuDetail;
import com.kh.fp.model.vo.StroeCategory;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MenuDatailDaoImpl implements MenuDatailDao {
	
	@Override
	public StoreMenuDetail selectStoreInfo(SqlSessionTemplate session, int no) {
		// 임시 반환
		
		StoreMenuDetail smd = new StoreMenuDetail();
		smd.setB_no(no);
		smd.setS_name("인계동 페리카나");
		smd.setS_addr("경기도 수원시 인계동");
		smd.setS_limitprice(15000);
		smd.setS_payopt("카드,현금");
		smd.setS_text("페리카나에 치킨이 찾아왔어요 정말로 맛있는 치킨이 찾아왔어요");
		smd.setS_phone("0321234567");
		smd.setS_status("Y");
		smd.setS_oriFood("국내산,중국산");
		smd.setS_logimg("test.jpg");
		smd.setS_x("012");
		smd.setS_y("012");
		smd.setS_score(4.5);
		smd.setS_time("40분");
		smd.setS_reviewcount(20);
		smd.setB_no(1);
		smd.setS_holiday("금");
		smd.setS_cupone("Y");
		smd.setS_startTime(10);
		smd.setS_endTime(2);
		return smd;
		//return session.selectOne("storeMenuDetail.selectStoreInfo",no);
	}

	@Override
	public List<StroeCategory> selectStroeCategoy(SqlSessionTemplate session, int no) {
		
		// 임시
		List<StroeCategory> list = new ArrayList<StroeCategory>();
		for(int i=0;i<5;i++) {
			StroeCategory sc = new StroeCategory();
			sc.setMt_no(i);
			sc.setMt_name("카테고리"+i);
			sc.setS_no(no);
			list.add(sc);
		}
		return list;
		//return session.selectList("storeMenuDetail.selectStoreCategoy",no);
	}

	@Override
	public List<StoreMenu> selectStoreMenus(SqlSessionTemplate session, int no) {
		
		// 임시
		List<StoreMenu> list = new ArrayList<StoreMenu>();
		for(int i=0;i<5;i++) {
			StoreMenu sm = new StoreMenu();
			sm.setMe_name("메뉴"+i);
			sm.setMe_price(10000+(i*1000));
			sm.setMe_logimg("test.jpg");
			sm.setMe_cateogry(i);
			if(i>3) {
				sm.setMe_text("테스트"+i);
			}
			sm.setS_no(no);
			list.add(sm);
		}
		return list;
		//return session.selectList("storeMenuDetail.selectStoreMenus",no);
	}

	@Override
	public List<StoreMenuSide> selectMenuSides(SqlSessionTemplate session, StoreMenu sm) {
		
		// 임시
		List<StoreMenuSide> list = new ArrayList<StoreMenuSide>();
		for(int i=0;i<4;i++) {
			StoreMenuSide sms = new StoreMenuSide();
			sms.setS_no(sm.getS_no());
			sms.setSd_name("사이드"+i);
			sms.setSd_price(1000+(i*200));
			if(i<=1) {
				sms.setSd_division("Y");
			} else {
				sms.setSd_division("N");
			}
			list.add(sms);
		}
		
		return list;
	}
	
	

}
