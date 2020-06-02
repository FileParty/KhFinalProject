package com.kh.fp.model.dao.banner;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface BannerDao {

	int insertCoupon(SqlSessionTemplate session, Map<String,Integer> cp);

	int insertCouponCheck(SqlSessionTemplate session, Map<String, Integer> cp);

	int selectCouponCheck(SqlSessionTemplate session, int m_No);

}
