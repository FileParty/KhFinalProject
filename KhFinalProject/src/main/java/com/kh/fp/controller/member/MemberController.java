package com.kh.fp.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		m.setM_pw(encoder.encode(m.getM_pw()));
		
		int result=service.insertMember(m);
		
		String page="";
		
		if(result==0) {
			page="common/msg";
			md.addAttribute("msg","회원가입 실패");
			md.addAttribute("loc","/member/memberEnroll.do");
		}else {
			page="common/msg";
			md.addAttribute("msg","회원가입 성공");
			md.addAttribute("loc","/");
			
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
	
	// mailSending 코드
    @RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST )
    public ModelAndView mailSending(HttpServletRequest request, String m_email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("m_email"); // 받는 사람 이메일
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
        mv.addObject("m_email", m_email);
        
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
	public ModelAndView join_injeung(String email_injeung, String m_email, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	
	    
	    
	    
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
	        mv.addObject("m_email", m_email);
	        
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
    public ModelAndView mailSendingB(HttpServletRequest request, String b_email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("b_email"); // 받는 사람 이메일
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
        mv.addObject("b_email", b_email);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }

	//사업자 인증번호 확인 
	@RequestMapping(value = "/member/join_injeungB.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeungB(String email_injeung, String b_email, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	
	    
	    
	    
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
	        mv.addObject("b_email", b_email);
	        
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
    public ModelAndView findMemberId(HttpServletRequest request, String m_email, HttpServletResponse response_email) throws IOException {
    	
    	Member m =service.selectMemberId(m_email);
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("m_email"); // 받는 사람 이메일
        String title = "대한민국 No.1 배달킹! 아이디 찾기 인증 이메일 입니다!"; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 회원님의 아이디는 " +m.getM_id()+ " 입니다. ";
        
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
        mv.addObject("m_email", m_email);
        
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

        " 회원님의 아이디는 " +b.getB_id()+ " 입니다. ";
        
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
    public ModelAndView findMemberPw(HttpServletRequest request, String id,String m_email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("m_email"); // 받는 사람 이메일
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
        mv.addObject("m_email", m_email);
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
    public ModelAndView findBusinessPw(HttpServletRequest request, String id,String b_email, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "hyeon9782@gamil.com";
        String tomail = request.getParameter("b_email"); // 받는 사람 이메일
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
        mv.addObject("b_email", b_email);
        mv.addObject("b_id",id);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }
    
    //일반인 비밀번호 찾기 인증번호 확인 
  	@RequestMapping(value = "/member/join_injeungPw.do{dice}", method = RequestMethod.POST)
  	public ModelAndView join_injeungPw(String email_injeung, String m_email ,String m_id, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
  	    
  	    System.out.println("마지막 : email_injeung : "+email_injeung);
  	    
  	    System.out.println("마지막 : dice : "+dice);
  	    
  	    
  	    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
  	     
  	    ModelAndView mv = new ModelAndView();
  	    
  	    mv.setViewName("/member/businessEnroll3.do");
  	    
  	    mv.addObject("email",email_injeung);
  	    
  	    if (email_injeung.equals(dice)) {
  	        
  	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
  	        
  	        
  	        
  	        mv.setViewName("member/updatePwM");
  	        
  	        mv.addObject("email",email_injeung);
  	        mv.addObject("m_email", m_email);
  	        mv.addObject("m_id", m_id);
  	        
  	        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
  	        //한번더 입력할 필요가 없게 한다.
  	        
  	        response_equals.setContentType("text/html; charset=UTF-8");
  	        PrintWriter out_equals = response_equals.getWriter();
  	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 찾기 페이지로 이동합니다.');</script>");
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
  	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
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
		
		m.setM_pw(encoder.encode(m.getM_pw()));
		
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
		
		Business b = new Business (0,null,b_id,b_pw,null,'N',null);
		
		b.setB_pw(encoder.encode(b.getB_pw()));
		
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
	

	
	
	
	

	

	
	
	

}
