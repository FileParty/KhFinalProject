package com.kh.fp.common.controller.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.fp.common.service.scheduler.CouponSchedulerService;

@Component
public class CouponSchedulerController {
	
	@Autowired
	private CouponSchedulerService service;
	
	@Scheduled(fixedDelay=10000)
	public void couponDateCheck() {
		service.checkCouponDate();
	}
	
	@Scheduled(cron = "0-1 59 23 * * *")
	public void couponDayCheck() {
		System.out.println("요릭장인 김인술");
		service.deleteCouponCheck();
		service.deleteAttendance();
	}
	
	

}
