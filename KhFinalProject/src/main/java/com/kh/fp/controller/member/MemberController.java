package com.kh.fp.controller.member;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.model.servier.member.MemberService;
import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" })
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	//일반 회원가입 페이지 화면 전환용
	@RequestMapping("/member/enroll.do")
	public String enroll() {
		return "member/enroll";
	}
	
	//사업자 회원가입 페이지 전환용
	@RequestMapping("/member/businessEnroll.do")
	public String businessEnroll() {
		return "member/businessEnroll";
	}
	
	
	//일반 회원가입 인서트용
	@RequestMapping("/member/enrollEnd.do")
	public String enrollEnd(Member m,Model md) {
		
		m.setM_pw(encoder.encode(m.getM_pw()));
		
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
	
	//사업자 회원가입 인서트용
	@RequestMapping("/member/businessEnrollEnd.do")
	public String businessEnrollEnd(Business b,Model md) {
		
		b.setB_pw(encoder.encode(b.getB_pw()));
		
		int result=service.insertBusiness(b);
		
		String page="";
		
		if(result==0) {
			page="common/msg";
			md.addAttribute("msg","회원가입 실패");
			md.addAttribute("loc","/member/businessEnroll.do");
		}else {
			page="redirect:/";
		}
		
		return page;
	}
	
	//일반 아이디 아이디 체크용
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
	
	//사업자 아이디 아이디 체크용
	@RequestMapping("/member/checkIdB")
	public void checkIdB(String userId,ServletOutputStream out) {
		Business b = service.selectBusiness(userId);
		boolean flag=b!=null?false:true;
		try {
			out.print(flag);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//일반 아이디 닉네임 체크용
	@RequestMapping("/member/checkName")
	public void checkName(String name,ServletOutputStream out) {
		Member m = service.selectMemberName(name);
		boolean flag=m!=null?false:true;
		try {
			out.print(flag);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//로그인 페이지 화면 전환
	@RequestMapping("/member/login.do")
	public String login() {
		return "member/login";
	}
	
	//일반 아이디 로그인
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(String userId,String userPw,Model md,HttpSession session) {
		
		Member m =service.selectMember(userId);
		
		//로그인여부 확인하기
		if(m!=null&&encoder.matches(userPw, m.getM_pw())) {
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
	
	//사업자 아이디 로그인
	@RequestMapping("/member/businessLogin.do")
	public String businessLogin(String userId,String userPw,Model md,HttpSession session) {
		
		Business b =service.selectBusiness(userId);
		
		//로그인여부 확인하기
		if(b!=null&&encoder.matches(userPw, b.getB_pw())) {
			//로그인성공
			md.addAttribute("msg","로그인성공");
			md.addAttribute("loginMember",b);
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