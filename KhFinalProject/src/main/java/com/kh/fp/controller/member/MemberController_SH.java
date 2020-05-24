package com.kh.fp.controller.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.servier.member.MemberService_SH;
import com.kh.fp.model.vo.Coupon_SH;
import com.kh.fp.model.vo.Member;




@Controller
public class MemberController_SH {

	@Autowired   //bean으로 등록해야함.
	MemberService_SH service;
	
	//쿠폰 가져오기
	@RequestMapping("/pay/paylist.do")
	public String payList(ModelAndView mv,Model m,HttpSession session) {
		List<Coupon_SH> list=service.selectCoupon();
		//쿠폰갯수 가져오기
		
		Member member=(Member)session.getAttribute("loginMember");
		
//		List<Map> neworder=(List<Map>) session.getAttribute("orderList");
//		for(Map mo : neworder) {
//            System.out.println(""+mo);
//            System.out.println(""+mo.get("reqOp"));
//            System.out.println(""+mo.get("unReqOp"));
//         }
		
		int m_no=member.getM_No();
		int totalData=service.selectCouponCount(m_no);
		session.getAttribute("newOrder");
		
		m.addAttribute("list",list);
		m.addAttribute("total",totalData);
	
	
		return ("/SANGHAK/sh");
	}
	@RequestMapping("/pay/paylist2.do")
	public String payList2() {
		return ("/SANGHAK/sh2");
	}
	
	//결제 db에넣기 
		@RequestMapping("/pay/payment.do")
		public ModelAndView insertOrderInfo(ModelAndView mv,@RequestParam Map<String,String> map) {
			
			
			
			int result = service.insertOrderInfo(map);			//order_info  insert문
			System.out.println("첫번쨰"+map);
			int ordermenu = service.insertOrderMenu(map);		//order_menu insert문
			
			int resultPoint = service.updateMemberPoint(map);
			
		
			mv.setViewName("redirect:/mypage/mypage.do");  //redirect로 보내면 맵핑값적어줘야함.
			return mv;
		}
}
