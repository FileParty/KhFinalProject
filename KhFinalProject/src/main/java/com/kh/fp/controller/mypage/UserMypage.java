package com.kh.fp.controller.mypage;

import static com.kh.fp.common.PageingFactory.PageBarFactory;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fp.controller.member.MemberController;
import com.kh.fp.model.service.mypage.MypageService;
import com.kh.fp.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserMypage {
	
	@Autowired
	private MemberController mc;
	
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@RequestMapping("/mypage/mypage.do")
	public String mypage() {
		return "mypage/userMypage";
	}
	
	@RequestMapping("/mypage/orderHistory.do")
	public String orderHistory(@RequestParam Map map, HttpSession session, Model m, HttpServletRequest req) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		
		int cPage;
		
		try {
			cPage = Integer.parseInt(req.getParameter("cPage"));
		}catch(Exception e) {
			cPage = 1;
		}
		int numPerPage = 5;
		
		int totalData = service.getTotalCount(loginMember.getM_No());
		String url = "/spring/mypage/orderHistory.do";
		
		
		List<Map<String, String>> list = service.selectOrder(loginMember.getM_No(), cPage, numPerPage);
		
		String pageBar = PageBarFactory(cPage, numPerPage, totalData, url);
		
		System.out.println(totalData);
		
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);
		
		
				
		return "mypage/mypage_orderHistory";
	}
	
	@RequestMapping("/mypage/orderMenu.do")
	@ResponseBody
	public List<Map<String, String>> selectOrderMenu(int o_no) {
		
		List<Map<String, String>> list = service.selectOrderMenu(o_no);
		
		/*
		 * Map<String, String> map1 = new HashMap<String, String>(); Map<String, String>
		 * map2 = new HashMap<String, String>(); map1.put("1_1", "11"); map1.put("1_2",
		 * "12"); map1.put("1_3", "13");
		 * 
		 * map2.put("2_1", "21"); map2.put("2_2", "22"); map2.put("2_3", "23");
		 * map2.put("2_4", "24");
		 * 
		 * list.add(map1); list.add(map2);
		 */
		
		return list;
	}
	
	
	  @RequestMapping("/mypage/insertReview.do")
//	  @ResponseBody
	  public ModelAndView insertReview(@RequestParam Map<String, String> map, ModelAndView mv, MultipartFile[] upload, HttpSession session, Model mo, HttpServletRequest req) {
		  
			// 파일 저장 경로 가져오기
			String path = session.getServletContext().getRealPath("/resources/img/mypage/review");
			
			List<Map<String, String>> files = new ArrayList<Map<String, String>>();
			
			File f = new File(path);
			
			// 폴더가 없을경우 생성
			if(!f.exists())
				f.mkdirs();
			
			// 파일저장 로직 구현
			// fileRename 구성하기
			for(MultipartFile mf : upload) {
				if(!mf.isEmpty()) {
					// 파일명 생성하기
					String ori = mf.getOriginalFilename();
					String ext = ori.substring(ori.lastIndexOf("."));
					// 파일이름 리네임
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rnd = (int)(Math.random()*1000);
					String rename = sdf.format(System.currentTimeMillis()) + "_" + rnd + ext;
					
					// rename된 이름으로 파일 저장하기
					
					try {
						// 실제 파일을 저장하는 메소드
						mf.transferTo(new File(path+"/"+rename));
					}catch(IOException e) {
						e.printStackTrace();
					}
					
					Map<String, String> m = new HashMap<String, String>();
					m.put("r_img",rename);
					files.add(m);
					
				}
			}
			
			// board b객체, files list를 service에 전달
			
			int rNo = 0;
			int result = 0;
			try {
				rNo = service.insertReview(map);
				
				for(Map mm : files) {
					mm.put("r_no", map.get("no"));
					result = service.insertReviewImg(mm);
				}
				
			}catch (RuntimeException e) {
				for(Map mm : files) {
					File delF = new File(path+"/"+mm.get("r_img"));
					if(delF.exists()) {
						delF.delete();
					}
				}
			}		
			
			mv.setViewName("redirect:/mypage/review.do");
			
			// store 리뷰 점수 update
			service.updateReviewTaste(map);
			service.updateReviewAmount(map);
			service.updateReviewDelivery(map);
			
			// store 리뷰 count update
			service.updateReviewCount(map);
			
			// point 증가
			service.updatePoint(map);
			
		return mv;
	  
	  }
	

	 
	
	@RequestMapping("/mypage/review.do")
	public String review(HttpSession session, @RequestParam Map map, Model m, HttpServletRequest req) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		int cPage;
		
		try {
			cPage = Integer.parseInt(req.getParameter("cPage"));
		}catch(Exception e) {
			cPage = 1;
		}
		int numPerPage = 5;
		int totalData = service.reviewTotalCount(loginMember.getM_No());
		String url = "/spring/mypage/review.do";
		
		System.out.println("cPage: " + cPage);
		
		List<Map<String, String>> list = service.selectReview(loginMember.getM_No(), cPage, numPerPage);
		
		String pageBar = PageBarFactory(cPage, numPerPage, totalData, url);
		
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);
		
		return "mypage/mypage_review";
	}
	
	@RequestMapping("/mypage/reviewImg.do")
	@ResponseBody
	public List<String> reviewImg(@RequestParam Map<String, String> map) {
		return service.selectReviewImg(map);
	}
	
	@RequestMapping("/mypage/watchList.do")
	public String watchList(HttpSession session, Model m) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		List<Map<String, String>> list = service.selectPrefer(loginMember.getM_No());
		
		m.addAttribute("list", list);
		
		return "mypage/mypage_watchList";
	}
	
	@RequestMapping("/mypage/delectWatchList.do")
	@ResponseBody
	public int delectWatchList(@RequestParam Map<String, String> map) {
		return service.delectWatchList(map);
	}
	
	@RequestMapping("/mypage/couponAndPoint.do")
	public String couponAndPoint(HttpSession session, Model m) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		
		List<Map<String, String>> list = service.selectCoupon(loginMember.getM_No());
		
		m.addAttribute("list", list);
		
		return "mypage/mypage_couponAndPoint";
	}
	
	@RequestMapping("/mypage/accountEdit.do")
	public String accountEdit() {
		return "mypage/mypage_accountEdit";
	}
	
	@RequestMapping("/mypage/memberUpdate.do")
	@ResponseBody
	public boolean memberUpdate(@RequestParam Map<String, String> map, HttpSession session){
		
		map.put("m_pw", encoder.encode(map.get("m_pw")));
		
		int result = service.memberUpdate(map);
		
		if(result>0) {			
			Member m = service.memberSelect(Integer.parseInt(map.get("m_no")));
			
			session.removeAttribute("loginMember");
			session.setAttribute("loginMember", m);
			
			
			return true;
		}
		else
			return false;
		
	}
	
	@RequestMapping("/mypage/cardManagement.do")
	public String cardManagement() {
		return "mypage/mypage_cardManagement";
	}
	
	@RequestMapping("/mypage/deleteMember.do")
	public String deleteMember() {
		return "mypage/mypage_deleteMember";
	}
	
	@RequestMapping("/mypage/memberDelete.do")
	@ResponseBody
	public boolean memberDelete(@RequestParam Map<String, String> map, HttpSession session) {
		int result = service.memberDelete(Integer.parseInt(map.get("m_no")));
		
		if(result>0) {
			session.removeAttribute("loginMember");
			return true;
		}
		else {
			return false;
		}
		
	}
	
	

}
