package com.kh.fp.common.dao.scheduler;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface CouponSchedulerDao {

	void checkCouponDate(SqlSessionTemplate session);

	void deleteCouponCheck(SqlSessionTemplate session);

	void deleteAttendance(SqlSessionTemplate session);
	
	
	
	
	
}
