package com.kh.fp.controller.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fp.model.service.mypage.MypageService;

@Controller
public class UserMypage {
	
	@Autowired
	private MypageService service;
	
	@RequestMapping("/mypage/mypage.do")
	public String mypage() {
		return "mypage/userMypage";
	}
	
	@RequestMapping("/mypage/orderHistory.do")
	public String orderHistory() {
		return "mypage/mypage_orderHistory";
	}
	
	@RequestMapping("/mypage/review.do")
	public String review() {
		return "mypage/mypage_review";
	}
	
	@RequestMapping("/mypage/watchList.do")
	public String watchList() {
		return "mypage/mypage_watchList";
	}
	
	@RequestMapping("/mypage/couponAndPoint.do")
	public String couponAndPoint() {
		return "mypage/mypage_couponAndPoint";
	}
	
	@RequestMapping("/mypage/accountEdit.do")
	public String accountEdit() {
		return "mypage/mypage_accountEdit";
	}
	
	@RequestMapping("/mypage/cardManagement.do")
	public String cardManagement() {
		return "mypage/mypage_cardManagement";
	}
	
	@RequestMapping("/mypage/deleteMember.do")
	public String deleteMember() {
		return "mypage/mypage_deleteMember";
	}
	
	

}
