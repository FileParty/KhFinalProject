package com.kh.fp.controller.member;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.fp.model.servier.member.MemberService;
import com.kh.fp.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	//회원가입 페이지 화면 전환용
	@RequestMapping("/member/enroll.do")
	public String enroll() {
		return "member/enroll";
	}
	
	//회원가입 인서트용
	@RequestMapping("/member/enrollEnd.do")
	public String enrollEnd(Member m,Model md) {
		
		m.setPw(encoder.encode(m.getPw()));
		
		int result=service.insertMember(m);
		
		String page="";
		
		if(result==0) {
			page="common/msg";
			md.addAttribute("msg","회원가입 실패");
			md.addAttribute("loc","/member/enroll.do");
		}else {
			page="redirect:/";
		}
		
		return page;
	}
	
	//아이디 체크용
	@RequestMapping("/member/checkId")
	public void checkId(String userId,ServletOutputStream out) {
		Member m = service.selectMember(userId);
		boolean flag=m!=null?false:true;
		try {
			out.print(flag);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//일반 아이디 로그인
	@RequestMapping("/member/memberLogin.do")
	public String login(String userId,String password,Model md,HttpSession session) {
		
		Member m =service.selectMember(userId);
		
		//로그인여부 확인하기
		if(m!=null&&encoder.matches(password, m.getPw())) {
			//로그인성공
			md.addAttribute("msg","로그인성공");	
		
			md.addAttribute("loginMember",m);
		}else {
			//로그인실패
			md.addAttribute("msg","로그인실패");
		}
		md.addAttribute("loc","/");		
	
		return "common/msg";

	}
	
	//로그아웃
	@RequestMapping("member/logout.do")
	public String logout(SessionStatus status,HttpSession session) {
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		return "redirect:/";
	}

}
