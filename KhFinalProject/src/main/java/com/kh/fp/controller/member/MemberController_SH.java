package com.kh.fp.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fp.model.servier.member.MemberService_SH;
import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member;



@Controller
public class MemberController_SH {

	@Autowired   //bean으로 등록해야함.
	MemberService_SH service;
	
	//쿠폰 가져오기
	@RequestMapping("/pay/paylist.do")
	public String payList(Model m,HttpSession session) {
		List<Coupon_SH> list=service.selectCoupon();
		//쿠폰갯수 가져오기
		
		Member member=(Member)session.getAttribute("loginMember");
		int m_no=member.getM_no();
		int totalData=service.selectCouponCount(m_no);
		
		m.addAttribute("list",list);
		m.addAttribute("total",totalData);
		
		return ("/SANGHAK/sh");
	}
	@RequestMapping("/pay/paylist2.do")
	public String payList2() {
		return ("/SANGHAK/sh2");
	}
	
}
