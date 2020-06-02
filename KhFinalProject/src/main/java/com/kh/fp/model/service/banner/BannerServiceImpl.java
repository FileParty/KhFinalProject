package com.kh.fp.model.service.banner;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.model.dao.banner.BannerDao;

@Service
public class BannerServiceImpl implements BannerService {
	
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private BannerDao dao;

	@Override
	public int insertCoupon(Map<String,Integer> cp) {
		int result = dao.insertCoupon(session,cp);
		result = dao.insertCouponCheck(session,cp);
		return result;
	}

	@Override
	public int selectCoupon(int m_No) {
		return dao.selectCouponCheck(session,m_No);
	}

}
