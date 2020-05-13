package com.kh.fp.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.servier.member.MemberService_SH;
import com.kh.fp.model.vo.Member_SH;



@Controller
public class MemberController_SH {

	@Autowired   //bean으로 등록해야함.
	MemberService_SH service;
	
	@RequestMapping("/pay/paylist.do")
	public ModelAndView payList(ModelAndView mv,@RequestParam(defaultValue="1") int m_no) {
		mv.addObject("list",service.selectMemberPay(m_no));
		mv.setViewName("/SANGHAK/sh");
		return mv;
	}
}
