package com.kh.fp.common.dao.scheduler;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CouponSchedulerDaoImpl implements CouponSchedulerDao {

	@Override
	public void checkCouponDate(SqlSessionTemplate session) {
		session.delete("couponScheduler.couponScheduler");
	}

	@Override
	public void deleteCouponCheck(SqlSessionTemplate session) {
		session.delete("couponScheduler.deleteCouponCheck");
	}

	@Override
	public void deleteAttendance(SqlSessionTemplate session) {
		session.delete("couponScheduler.deleteAttendance");
	}
	
	

}
