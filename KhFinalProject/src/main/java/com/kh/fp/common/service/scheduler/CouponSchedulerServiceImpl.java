package com.kh.fp.common.service.scheduler;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fp.common.dao.scheduler.CouponSchedulerDao;

@Service
public class CouponSchedulerServiceImpl implements CouponSchedulerService{
	
	@Autowired
	private CouponSchedulerDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void checkCouponDate() {
		dao.checkCouponDate(session);
	}

	@Override
	public void deleteCouponCheck() {
		dao.deleteCouponCheck(session);
	}

}
