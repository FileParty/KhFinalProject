package com.kh.fp.model.dao.banner;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BannerDaoImpl implements BannerDao {

	@Override
	public int insertCoupon(SqlSessionTemplate session, Map<String,Integer> cp) {
		return session.insert("banner.couponInsert",cp);
	}

	@Override
	public int insertCouponCheck(SqlSessionTemplate session, Map<String, Integer> cp) {
		return session.insert("banner.couponInsertCheck",cp);
	}

	@Override
	public int selectCouponCheck(SqlSessionTemplate session, int m_No) {
		return session.selectOne("banner.couponSelectCheck",m_No);
	}

}
