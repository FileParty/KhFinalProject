package com.kh.fp.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.fp.common.KakaoApi;
import com.kh.fp.common.NaverLoginBO;
import com.kh.fp.model.servier.member.MemberService;
import com.kh.fp.model.vo.Business;
import com.kh.fp.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" , "flag"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Autowired
	JavaMailSender mailSender;
	
	//일반인 아이디 이용약관 페이지 화면 전환
	@RequestMapping("/member/memberEnroll1.do")
	public String memberEnroll1() {
		return "member/memberEnroll1";
	}
	
	//사업자 아이디 이용약관 페이지 화면 전환
	@RequestMapping("/member/businessEnroll1.do")
	public String businessEnroll1() {
		return "member/businessEnroll1";
	}
	
	//일반인 아이디 이메일 인증 페이지 화면 전환
	@RequestMapping("/member/memberEnroll2.do")
	public String memberEnroll2() {
	    return "member/memberEnroll2";
	}
	
	//사업자 아이디 이메일 인증 페이지 화면 전환
	@RequestMapping("/member/businessEnroll2.do")
	public String businessEnroll2() {
	    return "member/businessEnroll2";
	}
	
	//일반 회원가입 인서트용
	@RequestMapping("/member/enrollEnd.do")
	public String enrollEnd(Member m,Model md) {
		
		m.setM_Pw(encoder.encode(m.getM_Pw()));
		
		int result=service.insertMember(m);
		
		String page="";
		
		int result1=0;
		
		
		
		if(m.getM_Level()==2) {
			
			Member mb = service.selectDelivery(m);
			
			result1=service.insertDelivery(mb);
			
			if(result==0) {
				page="common/msg";
				md.addAttribute("msg","회원가입 실패");
				md.addAttribute("loc","/member/memberEnroll.do");
			}else {
				page="common/msg";
				md.addAttribute("msg","회원가입 성공");
				md.addAttribute("loc","/");	
			}
			
		}else {
			
			if(result==0) {
				page="common/msg";
				md.addAttribute("msg","회원가입 실패");
				md.addAttribute("loc","/member/memberEnroll.do");
			}else {
				page="common/msg";
				md.addAttribute("msg","회원가입 성공");
				md.addAttribute("loc","/");	
			}
		}
		
		return page;
	}
	
	//사업자 회원가입 인서트용
	@RequestMapping("/member/businessEnrollEnd.do")
	public String businessEnrollEnd(Business b,Model md) {
		
		b.setB_Pw(encoder.encode(b.getB_Pw()));
		
		int result=service.insertBusiness(b);
		
		String page="";
		
		if(result==0) {
			page="common/msg";
			md.addAttribute("msg","회원가입 실패");
			md.addAttribute("loc","/member/businessEnroll.do");
		}else {
			page="common/msg";
			md.addAttribute("msg","회원가입 성공");
			md.addAttribute("loc","/");
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
	
	//일반 아이디 email 체크용
	@RequestMapping("/member/checkEmailM")
	public void checkEmailM(String m_email,ServletOutputStream out) {
		Member m = service.selectMemberId(m_email);
		boolean flag=m!=null?false:true;
		try {
			out.print(flag);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//사업자 아이디 email 체크용
	@RequestMapping("/member/checkEmailB")
	public void checkEmailB(String b_email,ServletOutputStream out) {
		Business m = service.selectBusinessId(b_email);
		boolean flag=m!=null?false:true;
		try {
			out.print(flag);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//일반 아이디 로그인
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(String userId,String userPw,Model md,HttpSession session) {
		
		Member m =service.selectMember(userId);
		
		if(m==null) {
			md.addAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
			md.addAttribute("loc","/member/login.do");
		}
		
		
		
		if(m.getM_Level()==2) {
			
			
			
			//로그인여부 확인하기
			if(m!=null&&encoder.matches(userPw, m.getM_Pw())) {
				//로그인성공
				md.addAttribute("msg","로그인성공");
				md.addAttribute("loginMember",m);
				md.addAttribute("loc","/delivery/deliveryView.do");
			}else {
				//로그인실패
				md.addAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
				md.addAttribute("loc","/member/login.do");
			}
			
			
		}else {
			
			//로그인여부 확인하기
			if(m!=null&&encoder.matches(userPw, m.getM_Pw())) {
				//로그인성공
				md.addAttribute("msg","로그인성공");
				md.addAttribute("loginMember",m);
				md.addAttribute("loc","/");
				
			}else {
				//로그인실패
				md.addAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
				md.addAttribute("loc","/member/login.do");
			}
					
		}
		
	
		return "common/msg";

	}
	
	@RequestMapping("/delivery/deliveryView.do")
	public String deliveryView() {
		return "delivery/deliveryView";
	}
	
	//사업자 아이디 로그인
	@RequestMapping("/member/businessLogin.do")
	public String businessLogin(String userId,String userPw,Model md,HttpSession session,HttpServletRequest request) {
		
		Business b =service.selectBusiness(userId);
		
		
		String flag="1";
		

		
		//로그인여부 확인하기
		if(b!=null&&encoder.matches(userPw, b.getB_Pw())) {
			//로그인성공
			md.addAttribute("msg","로그인성공");
			md.addAttribute("loginMember",b);
			md.addAttribute("flag",flag);
			md.addAttribute("loc","/");
			
		}else {
			//로그인실패
			md.addAttribute("msg","로그인실패");
			md.addAttribute("loc","/member/login.do");
		}
				
		
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
	
	// mailSending 코드
    @RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST )
    public ModelAndView mailSending(HttpServletRequest request, String m_Email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("m_Email"); // 받는 사람 이메일
        String title = "대한민국 No.1 배달킹! 회원가입 인증 이메일 입니다!"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/memberEnroll2");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("m_Email", m_Email);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }




	//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	//틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/member/join_injeung.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeung(String email_injeung, String m_Email, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	
	    
	    
	    
	    System.out.println("마지막 : email_injeung : "+email_injeung);
	    
	    System.out.println("마지막 : dice : "+dice);
	    
	    
	    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
	     
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("/member/enroll.do");
	    
	    mv.addObject("email",email_injeung);
	    
	    if (email_injeung.equals(dice)) {
	        
	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
	        
	        
	        
	        mv.setViewName("member/memberEnroll3");
	        
	        mv.addObject("email",email_injeung);
	        mv.addObject("m_Email", m_Email);
	        
	        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
	        //한번더 입력할 필요가 없게 한다.
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
	        out_equals.flush();
	
	        return mv;
	        
	        
	    }else if (email_injeung != dice) {
	        
	        
	        ModelAndView mv2 = new ModelAndView(); 
	        
	        mv2.setViewName("member/memberEnroll2");
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	        out_equals.flush();
	        
	
	        return mv2;
	        
	    }    
	
	    return mv;
	    
	}
	
	// 사업자 mailSending 코드
    @RequestMapping( value = "/member/authB.do" , method=RequestMethod.POST )
    public ModelAndView mailSendingB(HttpServletRequest request, String b_Email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("b_Email"); // 받는 사람 이메일
        String title = "대한민국 No.1 배달킹! 회원가입 인증 이메일 입니다!"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/businessEnroll2");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("b_Email", b_Email);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }

	//사업자 인증번호 확인 
	@RequestMapping(value = "/member/join_injeungB.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeungB(String email_injeung, String b_Email, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	
	    
	    
	    
	    System.out.println("마지막 : email_injeung : "+email_injeung);
	    
	    System.out.println("마지막 : dice : "+dice);
	    
	    
	    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
	     
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("/member/businessEnroll3.do");
	    
	    mv.addObject("email",email_injeung);
	    
	    if (email_injeung.equals(dice)) {
	        
	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
	        
	        
	        
	        mv.setViewName("member/businessEnroll3");
	        
	        mv.addObject("email",email_injeung);
	        mv.addObject("b_Email", b_Email);
	        
	        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
	        //한번더 입력할 필요가 없게 한다.
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
	        out_equals.flush();
	
	        return mv;
	        
	        
	    }else if (email_injeung != dice) {
	        
	        
	        ModelAndView mv2 = new ModelAndView(); 
	        
	        mv2.setViewName("member/businessEnroll2");
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	        out_equals.flush();
	        
	
	        return mv2;
	        
	    }    
	
	    return mv;
	    
	}
	
	//일반 아이디 & 비밀번호 찾기 페이지 화면 전환
	@RequestMapping("/member/findIdPwM.do")
	public String findIdPwM() {
		return "member/findIdPwM";
	}
	
	//사업자 아이디 & 비밀번호 찾기 페이지 화면 전환
	@RequestMapping("/member/findIdPwB.do")
	public String findIdPwB() {
		return "member/findIdPwB";
	}
	
	// 일반인 아이디 찾기 mailSending 코드
    @RequestMapping( value = "/member/findMemberId.do" , method=RequestMethod.POST )
    public ModelAndView findMemberId(HttpServletRequest request, String m_Email, HttpServletResponse response_email) throws IOException {
    	
    	Member m =service.selectMemberId(m_Email);
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("m_Email"); // 받는 사람 이메일
        String title = "대한민국 No.1 배달킹! 아이디 찾기 인증 이메일 입니다!"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 회원님의 아이디는 " +m.getM_Id()+ " 입니다. ";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/findIdPwM");     //뷰의이름
        mv.addObject("m_Email", m_Email);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 아이디를 확인해 주세요.');</script>");
        out_email.flush();
         
        return mv;
        
    }
    
    //사업자 아이디 찾기 mailSending 코드
    @RequestMapping( value = "/member/findBusinessId.do" , method=RequestMethod.POST )
    public ModelAndView findBusinessId(HttpServletRequest request, String b_email, HttpServletResponse response_email) throws IOException {
    	
    	Business b =service.selectBusinessId(b_email);
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("b_email"); // 받는 사람 이메일
        String title = "대한민국 No.1 배달킹! 아이디 찾기 인증 이메일 입니다!"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 회원님의 아이디는 " +b.getB_Id()+ " 입니다. ";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/findIdPwB");     //뷰의이름
        mv.addObject("b_email", b_email);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
         
        return mv;
        
    }
    
    // 일반인 비밀번호 찾기 mailSending 코드
    @RequestMapping( value = "/member/findMemberPw.do" , method=RequestMethod.POST )
    public ModelAndView findMemberPw(HttpServletRequest request, String id,String m_Email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("m_Email"); // 받는 사람 이메일
        String title = "대한민국 No.1 배달킹! 비밀번호 찾기 인증 이메일 입니다!"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/findIdPwM");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("m_Email", m_Email);
        mv.addObject("m_id",id);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }
    
    // 사업자 비밀번호 찾기 mailSending 코드
    @RequestMapping( value = "/member/findBusinessPw.do" , method=RequestMethod.POST )
    public ModelAndView findBusinessPw(HttpServletRequest request, String id,String b_Email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("b_Email"); // 받는 사람 이메일
        String title = "대한민국 No.1 배달킹! 비밀번호 찾기 인증 이메일 입니다!"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/findIdPwB");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("b_Email", b_Email);
        mv.addObject("b_id",id);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }
    
    //일반인 비밀번호 찾기 인증번호 확인 
  	@RequestMapping(value = "/member/join_injeungPwM.do{dice}", method = RequestMethod.POST)
  	public ModelAndView join_injeungPw(String email_injeung, String m_email ,String m_id, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
  	    
  	    System.out.println("마지막 : email_injeung : "+email_injeung);
  	    
  	    System.out.println("마지막 : dice : "+dice);
  	    
  	    
  	    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
  	     
  	    ModelAndView mv = new ModelAndView();
  	    
  	    mv.setViewName("/member/businessEnroll3.do");
  	    
  	    mv.addObject("email",email_injeung);
  	    
  	    if (email_injeung.equals(dice)) {
  	        
  	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경 페이지로 이동
  	        
  	        
  	        
  	        mv.setViewName("member/updatePwM");
  	        
  	        mv.addObject("email",email_injeung);
  	        mv.addObject("m_email", m_email);
  	        mv.addObject("m_id", m_id);
  	        
  	        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
  	        //한번더 입력할 필요가 없게 한다.
  	        
  	        response_equals.setContentType("text/html; charset=UTF-8");
  	        PrintWriter out_equals = response_equals.getWriter();
  	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경 페이지로 이동합니다.');</script>");
  	        out_equals.flush();
  	
  	        return mv;
  	        
  	        
  	    }else if (email_injeung != dice) {
  	        
  	        
  	        ModelAndView mv2 = new ModelAndView(); 
  	        
  	        mv2.setViewName("member/findIdPwM");
  	        mv2.addObject("m_id", m_id);
  	        
  	        response_equals.setContentType("text/html; charset=UTF-8");
  	        PrintWriter out_equals = response_equals.getWriter();
  	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
  	        out_equals.flush();
  	        
  	
  	        return mv2;
  	        
  	    }    
  	
  	    return mv;
  	    
  	}
  	
    //사업자 비밀번호 찾기 인증번호 확인 
  	@RequestMapping(value = "/member/join_injeungPwB.do{dice}", method = RequestMethod.POST)
  	public ModelAndView join_injeungPwB(String email_injeung, String b_email ,String b_id, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
  	    
  	    System.out.println("마지막 : email_injeung : "+email_injeung);
  	    
  	    System.out.println("마지막 : dice : "+dice);
  	    
  	    
  	    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
  	     
  	    ModelAndView mv = new ModelAndView();
  	    
  	    mv.setViewName("/member/businessEnroll3.do");
  	    
  	    mv.addObject("email",email_injeung);
  	    
  	    if (email_injeung.equals(dice)) {
  	        
  	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
  	        
  	        
  	        
  	        mv.setViewName("member/updatePwB");
  	        
  	        mv.addObject("email",email_injeung);
  	        mv.addObject("b_email", b_email);
  	        mv.addObject("b_id", b_id);
  	        
  	        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
  	        //한번더 입력할 필요가 없게 한다.
  	        
  	        response_equals.setContentType("text/html; charset=UTF-8");
  	        PrintWriter out_equals = response_equals.getWriter();
  	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경 페이지로 이동합니다.');</script>");
  	        out_equals.flush();
  	
  	        return mv;
  	        
  	        
  	    }else if (email_injeung != dice) {
  	        
  	        
  	        ModelAndView mv2 = new ModelAndView(); 
  	        
  	        mv2.setViewName("member/findIdPwB");
  	        mv2.addObject("b_id", b_id);
  	        
  	        response_equals.setContentType("text/html; charset=UTF-8");
  	        PrintWriter out_equals = response_equals.getWriter();
  	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
  	        out_equals.flush();
  	        
  	
  	        return mv2;
  	        
  	    }    
  	
  	    return mv;
  	    
  	}
	
	//일반인 비밀번호 변경
	@RequestMapping("/member/updateMemberPwEnd.do")
	public String updateMemberPwEnd(String m_id,String m_pw , Model md) {
		
		Member m = new Member (0,m_id,m_pw,null,null,null,0,1,null,null,null);
		
		m.setM_Pw(encoder.encode(m.getM_Pw()));
		
		int result = service.updateMemberPw(m);
		
		if(result>0) {
			md.addAttribute("msg","비밀번호 변경 성공");
			md.addAttribute("loc","/");
		}else {
			md.addAttribute("msg","비밀번호 변경 실패");
			md.addAttribute("loc","/");
		}
		return "common/msg";
	}
	
	//사업자 비밀번호 변경
	@RequestMapping("/member/updateBusinessPwEnd.do")
	public String updateBusinessPwEnd(String b_id,String b_pw , Model md) {
		
		Business b = new Business (0,null,b_id,b_pw,null,'N',null,null);
		
		b.setB_Pw(encoder.encode(b.getB_Pw()));
		
		int result = service.updateBusinessPw(b);
		
		if(result>0) {
			md.addAttribute("msg","비밀번호 변경 성공");
			md.addAttribute("loc","/");
		}else {
			md.addAttribute("msg","비밀번호 변경 실패");
			md.addAttribute("loc","/");
		}
		return "common/msg";
	}
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "member/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
	System.out.println("네이버:" + naverAuthUrl);
	//네이버
	String kakaoUrl = KakaoController.getAuthorizationUrl(session);

	
	model.addAttribute("url", naverAuthUrl);
	
	model.addAttribute("kakao_url", kakaoUrl);

	
	return "member/login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/member/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String nickname = (String)response_obj.get("nickname");
	String email = (String)response_obj.get("email");
	System.out.println("컨트롤로 닉네임"+nickname);
	System.out.println("컨트롤로 이메일"+email);
	//4.파싱 닉네임 세션으로 저장

	
	
	Member m = service.selectNaverM(email);
	
	if(m!=null) {
		session.setAttribute("loginMember",m);
		model.addAttribute("result", apiResult);
		return "member/naverSuccess";
	}else {
		session.setAttribute("nickname",nickname); //세션 생성
		session.setAttribute("email",email);
		session.setAttribute("name",nickname);
		model.addAttribute("result", apiResult);
		return "member/naverEnroll";
	}
	
	
	
	
	}
	
	//카카오 로그인
	@RequestMapping(value = "/member/kakaoLogin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception { 
		System.out.println("카카오로그인 메소드 들어옴");
		
		ModelAndView mav = new ModelAndView(); // 결과값을 node에 담아줌 
		JsonNode node = KakaoController.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음 
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보 
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken); 
		String kemail = null; 
		String kname = null; 
		String kgender = null; 
		String kbirthday = null; 
		String kage = null; 
		String kimage = null; // 유저정보 카카오에서 가져오기 Get properties 
		JsonNode properties = userInfo.path("properties"); 
		JsonNode kakao_account = userInfo.path("kakao_account"); 
		kemail = kakao_account.path("email").asText(); 
		kname = properties.path("nickname").asText(); 
		kimage = properties.path("profile_image").asText(); 
		kgender = kakao_account.path("gender").asText(); 
		kbirthday = kakao_account.path("birthday").asText(); 
		kage = kakao_account.path("age_range").asText(); 
		
		session.setAttribute("kemail", kemail); 
		session.setAttribute("kname", kname); 
		session.setAttribute("kimage", kimage); 
		session.setAttribute("kgender", kgender); 
		session.setAttribute("kbirthday", kbirthday); 
		session.setAttribute("kage", kage); 
		
		System.out.println("카카오 로그인 메소드 이메일 : "+kemail);
		System.out.println("카카오 로그인 메소드 이메일 : "+kname);
		System.out.println("카카오 로그인 메소드 이메일 : "+kimage);
		System.out.println("카카오 로그인 메소드 이메일 : "+kgender);
		System.out.println("카카오 로그인 메소드 이메일 : "+kbirthday);
		System.out.println("카카오 로그인 메소드 이메일 : "+kage);
		
		
		Member m = service.selectKakao(kname);
		
		if(m!=null) {
			session.setAttribute("loginMember", m);
			mav.setViewName("redirect:/");
		}else {
			session.setAttribute("kname", kname); 
			mav.setViewName("member/kakaoEnroll");
		}
		
		
		
		
		
		
		return mav; 
		
		
		
		}// end kakaoLogin()
	
	//카카오 추가 회원가입
	@RequestMapping("member/kakaoEnroll.do")
	public String kakaoEnroll(Member m,Model md) {
		
		m.setM_Pw(encoder.encode(m.getM_Pw()));
		
		int result=service.insertMember(m);
		
		String page="";
		
		if(result==0) {
			page="common/msg";
			md.addAttribute("msg","회원가입 실패");
			md.addAttribute("loc","/");
		}else {
			page="common/msg";
			md.addAttribute("msg","회원가입 성공");
			md.addAttribute("loc","/");
			
		}
		
		return page;
	}
	
	//네이버 추가 회원가입
	@RequestMapping("member/naverEnroll.do")
	public String naverEnroll(Member m,Model md) {
		
		m.setM_Pw(encoder.encode(m.getM_Pw()));
		
		int result=service.insertMember(m);
		
		String page="";
		
		if(result==0) {
			page="common/msg";
			md.addAttribute("msg","회원가입 실패");
			md.addAttribute("loc","/");
		}else {
			page="common/msg";
			md.addAttribute("msg","회원가입 성공");
			md.addAttribute("loc","/");
			
		}
		
		return page;
	}
	
	
	
}
